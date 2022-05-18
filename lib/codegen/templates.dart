// language=Handlebars
const clazzTpl = """
{{# renderClassComment }}{{/ renderClassComment }}
class {{ clazz }} {
  const {{ clazz }}({
    {{# renderConstructorFields }}{{/ renderConstructorFields }}
  });

  factory {{ clazz }}.fromMap(Map<dynamic, dynamic> map,) {
    return {{ clazz }}(
     {{# renderFromMapFields }}{{/ renderFromMapFields }}
    );
  }
  
  {{# renderFields }}{{/ renderFields }}
  
  {{# renderIDL }}{{/ renderIDL }}

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      {{# renderToJsonFields }}{{/ renderToJsonFields }}
    }
    ..removeWhere((String key, dynamic value){ 
      return value == null{{#variant}}|| value == false{{/variant}}; 
    })
    {{#variant}}
      ..updateAll((String key, dynamic value) {
        return value is bool ? null : value;
      })
    {{/variant}}
    ;
  }
  
  {{# renderCopy }}{{/ renderCopy }}

  {{# renderToString }}{{/ renderToString }}
  {{# renderEquals }}{{/ renderEquals }}
  {{# renderHashCode }}{{/ renderHashCode }}
}
""";

// language=Handlebars
const idlMethod = """
/// [{{ idlName }}] defined in Candid
/// {{ didText }}
{{ idlName }}: IDL.Func(
   <CType<dynamic>>[{{ idlReq }}],
   <CType<dynamic>>[{{ idlRep }}],
   <String>[{{ funcAnno }}],
),
""";

// language=Handlebars
const idlReqMethod = """
/// [{{ methodName }}] defined in Candid
/// {{ didText }}
/// 
/// Dart IDL
/// [{{ idlName }}.{{ methodName }}] : IDL.Func(
///    <CType<dynamic>>[{{ idlReq }}],
///    <CType<dynamic>>[{{ idlRep }}],
///    <String>[{{ funcAnno }}],
/// )
///
Future<{{ returnType }}> {{ methodName }}(
  CanisterActor actor,
 {{# renderParams }}{{/ renderParams }}
) async {
  final List<dynamic> dat = {{# renderParamsName }}{{/ renderParamsName }};
  {{#hasReturn}}final dynamic resp = {{/hasReturn}} await actor.getFunc({{ idlName }}.{{ methodName }})!(dat);
  {{# renderReturn }}{{/ renderReturn }}
}
""";

// language=Handlebars
const idlTpl = """
class {{ clazz }} {
  const {{ clazz }}._();
  
  {{ fields }}
  
  static final Service idl = IDL.Service(<String, FuncClass>{
    {{ pairs }}
  });
}
{{ methods }}
""";

// language=Handlebars
const fileTpl = """
// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: constant_identifier_names, camel_case_types, avoid_dynamic_calls, always_specify_types, unused_import, invalid_null_aware_operator, avoid_equals_and_hash_code_on_mutable_classes, prefer_const_declarations

import 'dart:typed_data';

import 'package:agent_dart/agent_dart.dart';
import 'package:collection/collection.dart';
import 'package:tuple/tuple.dart';

{{ idl }}

{{ classes }}
 """;
