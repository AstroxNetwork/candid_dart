import 'dart:io' show Platform;

import 'package:antlr4/antlr4.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:recase/recase.dart';

import '../antlr/CandidLexer.dart';
import '../antlr/CandidParser.dart';
import '../core.dart';
import 'consts.dart';
import 'extension.dart';
import 'types.dart' as ts;
import 'visitor.dart';

late IDLVisitor _idlVisitor;

String did2dart(
  String fileName,
  String contents, [
  GenOption option = const GenOption(),
]) {
  fileName = fileName.replaceAllMapped(RegExp(r'[^\da-zA-Z_.]'), (_) => '_');
  final cdVisitor = PreVisitor();
  cdVisitor.visit(newParser(contents).prog());
  final deps = cdVisitor.deps;
  final idlVisitor = _idlVisitor = IDLVisitor();
  final prog = idlVisitor.visit(newParser(contents).prog()) as ts.Prog;
  final defs = prog.defs;
  final cdSb = StringBuffer();
  final idls = StringBuffer();
  for (final def in defs) {
    final id = '_${def.key.did.noDoubleQuotes}';
    final cd = deps[def.key.did]?.cd ?? false;
    final type = cd ? 'RecClass' : def.type;
    final idlType = cd ? 'IDL.Rec()' : def.idlType;
    idls.writeln('/// [$id] defined in Candid\n${def.doc}');
    if (def.body.child is ts.IdType) {
      idls.writeln('static final $id = $idlType;');
    } else {
      idls.writeln('static final $type $id = $idlType;');
    }
    if (cd) {
      idls.writeln('static final ${def.type} _$id = ${def.idlType};');
      cdSb.writeln('$id.fill(_$id);');
    }
  }
  final actors = StringBuffer();
  final actor = prog.actor;
  String? idlName;
  if (actor != null) {
    final ref = actor.isRef();
    final key = actor.key?.did.noDoubleQuotes;
    idlName = key == null ? 'idl' : '${key}Idl';
    if (ref) {
      actors.writeln(
        'static final $idlName = _${actor.body.did.noDoubleQuotes};',
      );
    } else {
      final cds = cdSb.toString();
      if (cds.isEmpty) {
        actors.writeln(
          'static final ${actor.type} $idlName = ${actor.body.idlType};',
        );
      } else {
        actors.writeln(
          'static final ${actor.type} $idlName = (){${cds}return ${actor.body.idlType};}();',
        );
      }
    }
    if (key != null) {
      actors.writeln('static final idl = $idlName;');
    }

    final init = actor.init;
    if (init != null && init.children.isNotEmpty) {
      actors.writeln(
        'static final List<CType> \$initIdl = <CType>[${init.idlType}];',
      );
    }
  }
  final split = fileName.split('.');
  split.removeLast();
  final clazz = split.join('_').pascalCase;
  final actorMethods = StringBuffer();
  final serviceMethods = StringBuffer();
  final entries = idlVisitor.methods.entries;
  for (final entry in entries) {
    final name = entry.value.name;
    final body = entry.value.body;
    if (body is ts.FuncType) {
      if (!body.args.serializable || !body.ret.serializable) {
        continue;
      }
      final argsType = body.args.dartType();
      final argsSer = body.args.serialize()!;
      final retType = body.ret.dartType();
      final noRet = body.ret.children.isEmpty;
      final noArgs = body.args.children.isEmpty;
      final retDeser = noRet ? '' : 'return ${body.ret.deserialize()};';
      final arg = noArgs
          ? ''
          : argsType.endsWith('?')
              ? '[$argsType arg,]'
              : '$argsType arg,';
      String methodName = name.did.noDoubleQuotes.camelCase;
      if (kDartKeywordsAndInternalTypes.contains(methodName)) {
        methodName = '${methodName}_';
      }
      final actorMethod = """
${entry.value.doc}
static Future<$retType> $methodName(CanisterActor actor, $arg) async {
  ${noArgs ? 'const' : 'final'} request = ${argsSer.replaceAll(ts.IDLType.ph, "arg")};
  const method = '${name.did.noDoubleQuotes}';${option.preActorCall?.trim() ?? ''}
  ${noRet && (option.postActorCall == null || option.postActorCall!.isEmpty) ? '' : 'final response ='} await actor.getFunc(method)!(request);${option.postActorCall?.trim() ?? ''}
  ${retDeser.replaceAll(ts.IDLType.ph, "response")}
}
      """;
      actorMethods.writeln(actorMethod);
      final serviceMethod = '''
${entry.value.doc}
Future<$retType> $methodName($arg) async {
  final actor = await getActor();
  return ${clazz}IDLActor.$methodName(actor, ${noArgs ? '' : 'arg,'});
}
      ''';
      serviceMethods.writeln(serviceMethod);
    }
  }
  final sameObjs = idlVisitor.sameObjs;
  final hasObj = idlVisitor.objs.isNotEmpty || idlVisitor.tuples.isNotEmpty;
  final imports = [
    Directive.import('dart:async'),
    Directive.import('package:agent_dart_base/agent_dart_base.dart'),
    ...idlVisitor.pkgs.map(Directive.import),
    if (hasObj) Directive.import('package:meta/meta.dart'),
    if (option.freezed && hasObj)
      Directive.import('package:freezed_annotation/freezed_annotation.dart'),
    ...?option.injectPackages?.map(Directive.import),
  ];
  imports.sort((a, b) => a.url.compareTo(b.url));
  if (option.freezed && hasObj) {
    imports.add(
      Directive.part(
        fileName.replaceAll(RegExp(r'.did$'), '.idl.freezed.dart'),
      ),
    );
  }
  final emitter = DartEmitter.scoped();
  final ignoredLintRules = [
    'type=lint',
    'depend_on_referenced_packages',
    'unnecessary_null_comparison',
    'unnecessary_non_null_assertion',
    'unused_field',
    'unused_import',
  ];
  final code = Library(
    (b) => b
      ..comments = ListBuilder([
        'coverage:ignore-file',
        'ignore_for_file: ${ignoredLintRules.join(', ')}',
        '======================================',
        'GENERATED CODE - DO NOT MODIFY BY HAND',
        '======================================',
      ])
      ..directives = ListBuilder(imports)
      ..body.addAll([
        Code(newActor(clazz, actorMethods.toString())),
        if (option.service) Code(newService(clazz, serviceMethods.toString())),
        Code('class ${clazz}IDL{\nconst ${clazz}IDL._();\n$idls\n$actors}'),
        ...idlVisitor.objs.entries.map((e) {
          final className = e.key;
          final type = e.value;
          final isTuple = type is ts.RecordType && type.isTupleValue;
          final Spec clazz;
          if (type.isEnum) {
            clazz = toEnum(className, type);
          } else if (option.freezed) {
            clazz = isTuple
                ? toFreezedTupleClass(className, type, option)
                : toFreezedClass(className, type, option);
          } else {
            clazz = isTuple
                ? toTupleClass(className, type, option)
                : toClass(className, type, option);
          }
          if (sameObjs.containsKey(type.did)) {
            final set = sameObjs[type.did]!;
            if (set.length > 1) {
              final ds = <Spec>[clazz];
              for (final value in set) {
                if (value != className) {
                  ds.add(
                    TypeDef(
                      (b) => b
                        ..name = value
                        ..definition = CodeExpression(Code(className))
                        ..docs = ListBuilder(
                          ['/// [$value] defined in Candid', type.doc],
                        ),
                    ),
                  );
                }
              }
              return ds;
            }
          }
          return [clazz];
        }).expand((e) => e),
        ...idlVisitor.tuples.entries.map(
          (e) => option.freezed
              ? toFreezedTupleClass(e.key, e.value, option)
              : toTupleClass(e.key, e.value, option),
        ),
        ...idlVisitor.typedefs.values.map(toTypeDef).whereType<TypeDef>(),
      ]),
  ).accept(emitter).toString();
  return DartFormatter(
    languageVersion: Version.parse(Platform.version.split(' ').first),
    fixes: StyleFix.all,
  ).format(code);
}

Spec toTupleClass(
  String className,
  ts.ObjectType obj,
  GenOption option,
) {
  final constructorParameters = <Parameter>[];
  final fromJson = StringBuffer();
  final toJson = StringBuffer();
  final toJsonFields = StringBuffer();
  final hashes = <String>[];
  final equals = <String>[];
  final fields = <Field>[];
  final copyWithParameters = <Parameter>[];
  final copyWithAssign = StringBuffer();
  obj.children.forEachIndexed((index, e) {
    final child = e.child;
    final fieldName = 'item${index + 1}';
    final isOpt = child is ts.OptType;
    var dartType = child.dartType();
    if (isOpt && !dartType.endsWith('?')) {
      dartType += '?';
    }
    final isList = dartType.startsWith('List<');
    if (isList) {
      hashes.add('const DeepCollectionEquality().hash($fieldName)');
      equals.add(
        'const DeepCollectionEquality().equals(other.$fieldName, $fieldName)',
      );
    } else {
      hashes.add(fieldName);
      equals.add(
        '(identical(other.$fieldName, $fieldName) || other.$fieldName == $fieldName)',
      );
    }
    final type = Reference(dartType);
    constructorParameters.add(
      Parameter(
        (b) => b
          ..toThis = true
          ..name = fieldName,
      ),
    );
    copyWithParameters.add(
      Parameter(
        (b) => b
          ..name = fieldName
          ..named = true
          ..type = Reference(dartType.endsWith('?') ? dartType : '$dartType?'),
      ),
    );
    copyWithAssign.writeln('$fieldName ?? this.$fieldName,');
    fields.add(
      Field(
        (b) => b
          ..name = fieldName
          ..type = type
          ..modifier = FieldModifier.final$
          ..docs = ListBuilder(
            ['/// [$fieldName] defined in Candid: `${child.did}`'],
          ),
      ),
    );
    var deserialize = child.deserialize();
    if (deserialize != null) {
      deserialize = deserialize.replaceAll(ts.IDLType.ph, 'tuple[$index]');
    } else {
      deserialize = 'tuple[$index]';
    }
    fromJson.writeln('$deserialize,');
    final ser = child.serialize();
    final arg =
        ser == null ? fieldName : ser.replaceAll(ts.IDLType.ph, fieldName);
    toJson.writeln('$arg,');
    final toJsonField = _typeToJsonField(obj, e, fieldName);
    toJsonFields.writeln('final $fieldName = this.$toJsonField;');
  });
  return Class(
    (b) => b
      ..name = className
      ..annotations = ListBuilder([const CodeExpression(Code('immutable'))])
      ..constructors = ListBuilder([
        Constructor(
          (b) => b
            ..requiredParameters = ListBuilder(constructorParameters)
            ..constant = true,
        ),
        Constructor(
          (b) => b
            ..name = 'fromJson'
            ..factory = true
            ..body = Code('return $className($fromJson);')
            ..requiredParameters = ListBuilder([
              Parameter(
                (b) => b
                  ..type = const Reference('List<dynamic>')
                  ..name = 'tuple',
              ),
            ]),
        ),
      ])
      ..fields = ListBuilder(fields)
      ..methods = ListBuilder([
        Method(
          (b) => b
            ..name = 'toJson'
            ..body = Code('${toJsonFields}return [$toJson];')
            ..returns = const Reference('List<dynamic>'),
        ),
        if (option.copyWith)
          Method(
            (b) => b
              ..name = 'copyWith'
              ..optionalParameters = ListBuilder(copyWithParameters)
              ..body = Code('return $className($copyWithAssign);')
              ..returns = Reference(className),
          ),
        if (option.equal) ...[
          Method(
            (b) => b
              ..name = 'operator =='
              ..returns = const Reference('bool')
              ..requiredParameters = ListBuilder([
                Parameter(
                  (b) => b
                    ..name = 'other'
                    ..type = const Reference('Object'),
                ),
              ])
              ..annotations =
                  ListBuilder([const CodeExpression(Code('override'))])
              ..body = Code(
                'return identical(this, other) '
                '|| (other.runtimeType == runtimeType && other is $className ${fields.isEmpty ? '' : '&&'} '
                '${equals.join("&&")});',
              ),
          ),
          Method(
            (b) => b
              ..type = MethodType.getter
              ..name = 'hashCode'
              ..returns = const Reference('int')
              ..lambda = true
              ..annotations =
                  ListBuilder([const CodeExpression(Code('override'))])
              ..body =
                  Code('Object.hashAll([runtimeType,${hashes.join(",")}])'),
          ),
        ],
        toStringMethod,
      ])
      ..docs = ListBuilder(['/// [$className] defined in Candid', obj.doc]),
  );
}

Spec toFreezedTupleClass(
  String className,
  ts.ObjectType obj,
  GenOption option,
) {
  final requiredParameters = <Parameter>[];
  final fromJson = StringBuffer();
  final toJson = StringBuffer();
  final toJsonFields = StringBuffer();
  obj.children.forEachIndexed((index, e) {
    final child = e.child;
    final fieldName = 'item${index + 1}';
    final isOpt = child is ts.OptType;
    var dartType = child.dartType();
    if (isOpt && !dartType.endsWith('?')) {
      dartType += '?';
    }
    final type = Reference(dartType);
    requiredParameters.add(
      Parameter(
        (b) => b
          ..type = type
          ..docs = ListBuilder(
            ['/// [$fieldName] defined in Candid: `${child.did}`'],
          )
          ..name = fieldName,
      ),
    );
    var deserialize = child.deserialize();
    if (deserialize != null) {
      deserialize = deserialize.replaceAll(ts.IDLType.ph, 'tuple[$index]');
    } else {
      deserialize = 'tuple[$index]';
    }
    fromJson.writeln('$deserialize,');
    final ser = child.serialize();
    final arg =
        ser == null ? fieldName : ser.replaceAll(ts.IDLType.ph, fieldName);
    toJson.writeln('$arg,');
    final toJsonField = _typeToJsonField(obj, e, fieldName);
    toJsonFields.writeln('final $fieldName = this.$toJsonField;');
  });
  return Class(
    (b) => b
      ..name = className
      ..mixins = ListBuilder([Reference('_\$$className')])
      ..annotations = ListBuilder([CodeExpression(Code(option.annotation))])
      ..constructors = ListBuilder([
        Constructor(
          (b) => b
            ..name = '_'
            ..constant = true,
        ),
        Constructor(
          (b) => b
            ..requiredParameters = ListBuilder(requiredParameters)
            ..redirect = Reference('_$className')
            ..factory = true
            ..constant = true,
        ),
        Constructor(
          (b) => b
            ..name = 'fromJson'
            ..factory = true
            ..body = Code('return $className($fromJson);')
            ..requiredParameters = ListBuilder([
              Parameter(
                (b) => b
                  ..type = const Reference('List<dynamic>')
                  ..name = 'tuple',
              ),
            ]),
        ),
      ])
      ..methods = ListBuilder([
        Method(
          (b) => b
            ..name = 'toJson'
            ..body = Code('${toJsonFields}return [$toJson];')
            ..returns = const Reference('List<dynamic>'),
        ),
        toStringMethod,
      ])
      ..docs = ListBuilder(['/// [$className] defined in Candid', obj.doc]),
  );
}

Spec toClass(
  String className,
  ts.ObjectType obj,
  GenOption option,
) {
  final isVariant = obj.isVariant;
  final constructorParameters = <Parameter>[];
  final fromJson = StringBuffer();
  final toJson = StringBuffer();
  final toJsonFields = StringBuffer();
  final hashes = <String>[];
  final equals = <String>[];
  final fields = <Field>[];
  final copyWithParameters = <Parameter>[];
  final copyWithAssign = StringBuffer();
  for (final e in obj.children) {
    final child = e.child;
    final idlName = child.id!;
    var fieldName = idlName.camelCase;
    if (kDartKeywordsAndInternalTypes.contains(fieldName)) {
      fieldName += '_';
    }
    final isNumberKey = RegExp(r'^\d+$').hasMatch(fieldName);
    if (isNumberKey) {
      fieldName = '\$$fieldName';
    }
    final isIdType = child is ts.IdType;
    String dartType = child.dartType();
    final useBool = (isIdType && isVariant) || dartType == 'null';
    final isOpt = isIdType ||
        (child as ts.PairType).value.child is ts.OptType ||
        isVariant;
    if (isOpt && !dartType.endsWith('?')) {
      dartType += '?';
    }
    final isList = dartType.startsWith('List<');
    if (isList) {
      hashes.add('const DeepCollectionEquality().hash($fieldName)');
      equals.add(
        'const DeepCollectionEquality().equals(other.$fieldName, $fieldName)',
      );
    } else {
      hashes.add(fieldName);
      equals.add(
        '(identical(other.$fieldName, $fieldName) || other.$fieldName == $fieldName)',
      );
    }
    final type = Reference(useBool ? 'bool' : dartType);
    constructorParameters.add(
      Parameter(
        (b) => b
          ..named = true
          ..required = !isOpt
          ..defaultTo = useBool ? const Code('false') : null
          ..name = fieldName
          ..toThis = true,
      ),
    );
    copyWithParameters.add(
      Parameter(
        (b) => b
          ..name = fieldName
          ..named = true
          ..type = Reference(
            useBool
                ? 'bool?'
                : dartType.endsWith('?')
                    ? dartType
                    : '$dartType?',
          ),
      ),
    );
    copyWithAssign.writeln('$fieldName: $fieldName ?? this.$fieldName,');
    fields.add(
      Field(
        (b) => b
          ..name = fieldName
          ..type = type
          ..modifier = FieldModifier.final$
          ..docs = ListBuilder(
            ['/// [$fieldName] defined in Candid: `${child.did}`'],
          ),
      ),
    );
    if (useBool) {
      fromJson.writeln("$fieldName: json.containsKey('$idlName'),");
      toJson.writeln("if ($fieldName) '$idlName': null,");
    } else {
      var deser = child.deserialize(nullable: isOpt);
      if (deser != null) {
        if (isNumberKey) {
          deser = deser.replaceAll(ts.IDLType.ph, 'json[$idlName]');
        } else {
          deser = deser.replaceAll(ts.IDLType.ph, "json['$idlName']");
        }
      } else {
        if (isNumberKey) {
          deser = 'json[$idlName]';
        } else {
          deser = "json['$idlName']";
        }
      }
      fromJson.writeln('$fieldName: $deser,');
      final ser = child.serialize();
      final arg =
          ser == null ? fieldName : ser.replaceAll(ts.IDLType.ph, fieldName);
      var isOptChild = false;
      if (child is ts.PairType) {
        final value = child.value.child;
        isOptChild = value is ts.OptType ||
            (value is ts.IdType &&
                value.child is ts.Id &&
                (value.child as ts.Id).isOpt);
      }
      if ((!isVariant && isOptChild) || !isOpt) {
        if (isNumberKey) {
          toJson.writeln('$idlName: $arg,');
        } else {
          toJson.writeln("'$idlName': $arg,");
        }
      } else {
        if (isNumberKey) {
          toJson.writeln('if ($fieldName != null) $idlName: $arg,');
        } else {
          toJson.writeln("if ($fieldName != null) '$idlName': $arg,");
        }
      }
    }
    final toJsonField = _typeToJsonField(obj, e, fieldName);
    toJsonFields.writeln('final $fieldName = this.$toJsonField;');
  }
  return Class(
    (b) => b
      ..name = className
      ..annotations = ListBuilder([const CodeExpression(Code('immutable'))])
      ..constructors = ListBuilder([
        Constructor(
          (b) => b
            ..optionalParameters = ListBuilder(constructorParameters)
            ..constant = true,
        ),
        Constructor(
          (b) => b
            ..name = 'fromJson'
            ..factory = true
            ..body = Code('return ${obj.ctx.getClassName()}($fromJson);')
            ..requiredParameters = ListBuilder([
              Parameter(
                (b) => b
                  ..type = const Reference('Map')
                  ..name = 'json',
              ),
            ]),
        ),
      ])
      ..fields = ListBuilder(fields)
      ..methods = ListBuilder([
        Method(
          (b) => b
            ..name = 'toJson'
            ..body = Code('${toJsonFields}return { $toJson };')
            ..returns = const Reference('Map<String, dynamic>'),
        ),
        if (option.copyWith)
          Method(
            (b) => b
              ..name = 'copyWith'
              ..optionalParameters = ListBuilder(copyWithParameters)
              ..body = Code('return $className($copyWithAssign);')
              ..returns = Reference(className),
          ),
        if (option.equal) ...[
          Method(
            (b) => b
              ..name = 'operator =='
              ..returns = const Reference('bool')
              ..requiredParameters = ListBuilder([
                Parameter(
                  (b) => b
                    ..name = 'other'
                    ..type = const Reference('Object'),
                ),
              ])
              ..annotations =
                  ListBuilder([const CodeExpression(Code('override'))])
              ..body = Code(
                'return identical(this, other) || (other.runtimeType == runtimeType && other is $className ${fields.isEmpty ? '' : '&&'} ${equals.join("&&")});',
              ),
          ),
          Method(
            (b) => b
              ..type = MethodType.getter
              ..name = 'hashCode'
              ..returns = const Reference('int')
              ..lambda = true
              ..annotations =
                  ListBuilder([const CodeExpression(Code('override'))])
              ..body =
                  Code('Object.hashAll([runtimeType,${hashes.join(",")}])'),
          ),
        ],
        toStringMethod,
      ])
      ..docs = ListBuilder(['/// [$className] defined in Candid', obj.doc]),
  );
}

Spec toEnum(String className, ts.ObjectType obj) {
  final values = <EnumValue>[];
  final getters = <Method>[];
  for (final e in obj.children) {
    final child = e.child;
    final idlName = child.id!;
    var fieldName = idlName.camelCase;
    if (kDartKeywordsAndInternalTypes.contains(fieldName)) {
      fieldName += '_';
    }
    values.add(
      EnumValue(
        (b) => b
          ..name = fieldName
          ..arguments = ListBuilder([CodeExpression(Code("'$idlName'"))])
          ..docs = ListBuilder(
            ['/// [$fieldName] defined in Candid: `${child.did}`'],
          ),
      ),
    );
    getters.add(
      Method(
        (b) => b
          ..name = 'is_$fieldName'.camelCase
          ..lambda = true
          ..type = MethodType.getter
          ..returns = const Reference('\nbool')
          ..body = Code('this == $className.$fieldName'),
      ),
    );
  }

  return Enum(
    (b) => b
      ..name = className
      ..docs = ListBuilder(['/// [$className] defined in Candid', obj.doc])
      ..values = ListBuilder(values)
      ..fields = ListBuilder([
        Field(
          (b) => b
            ..name = 'name'
            ..modifier = FieldModifier.final$
            ..type = const Reference('String'),
        ),
      ])
      ..constructors = ListBuilder([
        Constructor(
          (b) => b
            ..constant = true
            ..requiredParameters = ListBuilder([
              Parameter(
                (p) => p
                  ..name = 'name'
                  ..toThis = true,
              ),
            ]),
        ),
        Constructor(
          (b) => b
            ..name = 'fromJson'
            ..factory = true
            ..body = Code(
              'final key = json.keys.first; return $className.values.firstWhere((e) => e.name == key);',
            )
            ..requiredParameters = ListBuilder([
              Parameter(
                (b) => b
                  ..type = const Reference('Map')
                  ..name = 'json',
              ),
            ]),
        ),
      ])
      ..methods = ListBuilder([
        ...getters,
        Method(
          (b) => b
            ..name = 'toJson'
            ..body = const Code('return {name: null};')
            ..returns = const Reference('\nMap<String, Null>'),
        ),
        toStringMethod,
      ]),
  );
}

Spec toFreezedClass(String className, ts.ObjectType obj, GenOption option) {
  final isVariant = obj.isVariant;
  final optionalParameters = <Parameter>[];
  final fromJson = StringBuffer();
  final toJson = StringBuffer();
  final toJsonFields = StringBuffer();
  for (final e in obj.children) {
    final child = e.child;
    final idlName = child.id!;
    var fieldName = idlName.camelCase;
    if (kDartKeywordsAndInternalTypes.contains(fieldName)) {
      fieldName += '_';
    }
    final isNumberKey = RegExp(r'^\d+$').hasMatch(fieldName);
    if (isNumberKey) {
      fieldName = '\$$fieldName';
    }
    final isIdType = child is ts.IdType;
    var dartType = child.dartType();
    final useBool = (isIdType && isVariant) || dartType == 'null';
    final isOpt = isIdType ||
        (child as ts.PairType).value.child is ts.OptType ||
        isVariant;
    if (isOpt && !dartType.endsWith('?')) {
      dartType += '?';
    }
    final refType = Reference(useBool ? 'bool' : dartType);
    final parameter = Parameter(
      (b) => b
        ..named = true
        ..type = refType
        ..required = !isOpt
        ..annotations = ListBuilder(
          useBool ? [const CodeExpression(Code('Default(false)'))] : [],
        )
        ..docs = ListBuilder(
          ['/// [$fieldName] defined in Candid: `${child.did}`'],
        )
        ..name = fieldName,
    );
    optionalParameters.add(parameter);
    if (useBool) {
      fromJson.writeln("$fieldName: json.containsKey('$idlName'),");
      toJson.writeln("if ($fieldName) '$idlName': null,");
    } else {
      var deser = child.deserialize(nullable: isOpt);
      if (deser != null) {
        if (isNumberKey) {
          deser = deser.replaceAll(ts.IDLType.ph, 'json[$idlName]');
        } else {
          deser = deser.replaceAll(ts.IDLType.ph, "json['$idlName']");
        }
      } else {
        if (isNumberKey) {
          deser = 'json[$idlName]';
        } else {
          deser = "json['$idlName']";
        }
      }
      fromJson.writeln('$fieldName: $deser,');
      final ser = child.serialize();
      final arg =
          ser == null ? fieldName : ser.replaceAll(ts.IDLType.ph, fieldName);
      var isOptChild = false;
      if (child is ts.PairType) {
        final value = child.value.child;
        isOptChild = value is ts.OptType ||
            (value is ts.IdType &&
                value.child is ts.Id &&
                (value.child as ts.Id).isOpt);
      }
      if ((!isVariant && isOptChild) || !isOpt) {
        if (isNumberKey) {
          toJson.writeln('$idlName: $arg,');
        } else {
          toJson.writeln("'$idlName': $arg,");
        }
      } else {
        if (isNumberKey) {
          toJson.writeln('if ($fieldName != null) $idlName: $arg,');
        } else {
          toJson.writeln("if ($fieldName != null) '$idlName': $arg,");
        }
      }
    }
    final toJsonField = _typeToJsonField(obj, e, fieldName);
    toJsonFields.writeln('final $fieldName = this.$toJsonField;');
  }
  return Class(
    (b) => b
      ..name = className
      ..mixins = ListBuilder([Reference('_\$$className')])
      ..annotations = ListBuilder([CodeExpression(Code(option.annotation))])
      ..constructors = ListBuilder([
        Constructor(
          (b) => b
            ..name = '_'
            ..constant = true,
        ),
        Constructor(
          (b) => b
            ..optionalParameters = ListBuilder(optionalParameters)
            ..redirect = Reference('_$className')
            ..factory = true
            ..constant = true,
        ),
        Constructor(
          (b) => b
            ..name = 'fromJson'
            ..factory = true
            ..body = Code('return ${obj.ctx.getClassName()}($fromJson);')
            ..requiredParameters = ListBuilder([
              Parameter(
                (b) => b
                  ..type = const Reference('Map')
                  ..name = 'json',
              ),
            ]),
        ),
      ])
      ..methods = ListBuilder([
        Method(
          (b) => b
            ..name = 'toJson'
            ..body = Code('${toJsonFields}return { $toJson };')
            ..returns = const Reference('Map<String, dynamic>'),
        ),
        toStringMethod,
      ])
      ..docs = ListBuilder(['/// [$className] defined in Candid', obj.doc]),
  );
}

TypeDef? toTypeDef(ts.Def def) {
  try {
    var name = def.key.dartType();
    if (kDartKeywordsAndInternalTypes.contains(name)) {
      name += '_';
    }
    return TypeDef(
      (b) => b
        ..name = name
        ..definition = CodeExpression(Code(def.dartType()))
        ..docs = ListBuilder(['/// [$name] defined in Candid', def.doc]),
    );
  } catch (e) {
    return null;
  }
}

final toStringMethod = Method(
  (b) => b
    ..name = 'toString'
    ..annotations = ListBuilder([const CodeExpression(Code('override'))])
    ..body = const Code('return toJson().toString();')
    ..returns = const Reference('String'),
);

CandidParser newParser(String contents) {
  final input = InputStream.fromString(contents);
  final lexer = CandidLexer(input);
  final tokens = CommonTokenStream(lexer);
  final parser = CandidParser(tokens);
  parser.addErrorListener(DiagnosticErrorListener());
  parser.buildParseTree = true;
  return parser;
}

String newService(String className, String methods) {
  return '''
class ${className}IDLService {
  ${className}IDLService({
    required this.canisterId,
    required this.uri,
    this.identity,
    this.createActorMethod,
    this.debug = true,
  }) : idl = ${className}IDL.idl;

  final String canisterId;
  final Uri uri;
  final Service idl;
  final Identity? identity;
  final bool debug;
  final CreateActorMethod? createActorMethod;

  Completer<CanisterActor>? _actor;

  Future<CanisterActor> getActor() {
    if (_actor != null) {
      return _actor!.future;
    }
    final completer = Completer<CanisterActor>();
    _actor = completer;
    Future(() async {
      final httpAgent = HttpAgent(
        defaultProtocol: uri.scheme,
        defaultHost: uri.host,
        defaultPort: uri.port,
        options: HttpAgentOptions(identity: identity),
      );
      if (debug) {
        await httpAgent.fetchRootKey();
      }
      httpAgent.addTransform(
        HttpAgentRequestTransformFn(call: makeNonceTransform()),
      );
      return CanisterActor(
        ActorConfig(
          canisterId: Principal.fromText(canisterId),
          agent: httpAgent,
        ),
        idl,
        createActorMethod: createActorMethod,
      );
    }).then(completer.complete).catchError((e, s) {
      completer.completeError(e, s);
      _actor = null;
    });
    return completer.future;
  }
  
  $methods
}
   ''';
}

String newActor(String className, String methods) {
  return '''
class ${className}IDLActor {
  const ${className}IDLActor._();
  $methods
}
   ''';
}

String _typeToJsonField(
  ts.ObjectType parent,
  ts.DelegateType type,
  String fieldName,
) {
  final child = type.child;
  final isOpt = child is ts.OptType;
  String dartType = child.dartType();

  // Handles type alias recursively.
  while (true) {
    final typedefType = _idlVisitor.typedefs.entries.firstWhereOrNull(
      (entry) => RegExp('^type $dartType = .*;\$').hasMatch(entry.key),
    );
    if (typedefType == null) {
      break;
    }
    final result = toTypeDef(typedefType.value);
    if (result == null) {
      break;
    }
    dartType = result.definition.code.toString();
  }

  final isBool = (child is ts.IdType && parent.isVariant) || dartType == 'null';
  // Put the nullable annotation if it's optional.
  if (isOpt && !dartType.endsWith('?')) {
    dartType += '?';
  }

  // Put extra method calls accordingly.
  String toJsonField = fieldName;
  final objectType = _idlVisitor.objs[dartType];
  final isEnum = objectType?.isEnum ?? false;
  final isRecordClass = objectType is ts.RecordType && !objectType.isTupleValue;
  if (!isBool && (isEnum || isRecordClass)) {
    if (isOpt || parent.isVariant) {
      toJsonField += '?';
    }
    toJsonField += '.toJson()';
  } else if (dartType == 'BigInt?') {
    toJsonField += '?.toString()';
  } else if (dartType == 'BigInt') {
    toJsonField += '.toString()';
  }
  return toJsonField;
}
