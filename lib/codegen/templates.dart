// language=Handlebars
const clazzTpl = """
/// {{ origin }}
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
    ..removeWhere((String key, dynamic value) => value == null)
    {{#variant}}
    ..updateAll((String key, dynamic value) => value is bool ? null : value)
    {{/variant}}
    ;
  }
}
""";

// language=Handlebars
const idlMethod = """
{{ idlName }}: IDL.Func(
   <CType<dynamic>>[{{ idlReq }}],
   <CType<dynamic>>[{{ idlRep }}],
   <String>[{{ funcAnno }}],
),
""";

// language=Handlebars
const idlReqMethod = """
///
/// {{ idlName }}: IDL.Func(
///    <CType<dynamic>>[{{ idlReq }}],
///    <CType<dynamic>>[{{ idlRep }}],
///    <String>[{{ funcAnno }}],
/// )
///
static Future<{{ returnType }}> {{ methodName }}(
  CanisterActor actor,
 {{# renderParams }}{{/ renderParams }}
) async {
  {{#hasReturn}}final dynamic resp = {{/hasReturn}} await actor.getFunc({{ idlName }})!(
    {{# renderParamsName }}{{/ renderParamsName }},
  );
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
  
  {{ methods }}
}
""";

// language=Handlebars
const fileTpl = """
// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: constant_identifier_names, camel_case_types, avoid_dynamic_calls

import 'dart:typed_data';

import 'package:agent_dart/agent_dart.dart';
import 'package:tuple/tuple.dart';

{{ idl }}

{{ classes }}
 """;
