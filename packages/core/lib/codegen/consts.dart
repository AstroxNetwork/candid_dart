const kPrimitiveTypeIDLMap = <String, String>{
  'empty': 'IDL.Empty',
  'reserved': 'IDL.Reserved',
  'bool': 'IDL.Bool',
  'null': 'IDL.Null',
  'text': 'IDL.Text',
  'int': 'IDL.Int',
  'int8': 'IDL.Int8',
  'int16': 'IDL.Int16',
  'int32': 'IDL.Int32',
  'int64': 'IDL.Int64',
  'nat': 'IDL.Nat',
  'nat8': 'IDL.Nat8',
  'nat16': 'IDL.Nat16',
  'nat32': 'IDL.Nat32',
  'nat64': 'IDL.Nat64',
  'float32': 'IDL.Float32',
  'float64': 'IDL.Float64',
  'principal': 'IDL.Principal',
  'blob': 'IDL.Vec(IDL.Nat8)',
};

const kPrimitiveTypeIDLClassMap = <String, String>{
  'empty': 'EmptyClass',
  'reserved': 'ReservedClass',
  'bool': 'BoolClass',
  'null': 'NullClass',
  'text': 'TextClass',
  'int': 'IntClass',
  'int8': 'FixedIntClass',
  'int16': 'FixedIntClass',
  'int32': 'FixedIntClass',
  'int64': 'FixedIntClass',
  'nat': 'NatClass',
  'nat8': 'FixedNatClass',
  'nat16': 'FixedNatClass',
  'nat32': 'FixedNatClass',
  'nat64': 'FixedNatClass',
  'float32': 'FloatClass',
  'float64': 'FloatClass',
  'principal': 'PrincipalClass',
  'blob': 'VecClass',
};

const kBigIntIDLTypes = <String>{'int', 'int64', 'nat', 'nat64'};

const kIntDartMap = <String, String>{
  'int': 'BigInt',
  'int8': 'int',
  'int16': 'int',
  'int32': 'int',
  'int64': 'BigInt',
  'nat': 'BigInt',
  'nat8': 'int',
  'nat16': 'int',
  'nat32': 'int',
  'nat64': 'BigInt',
};

const kPrimitiveTypeDartMap = <String, String>{
  ...kIntDartMap,
  'bool': 'bool',
  'text': 'String',
  'float32': 'double',
  'float64': 'double',
  'principal': 'Principal',
  'blob': 'Uint8List',
};
const kDartKeywordsAndInternalTypes = <String>{
  'int',
  'double',
  'bool',
  //////////
  'List',
  'BigInt',
  //////////
  'abstract',
  'else',
  'import',
  'show',
  'as',
  'enum',
  'in',
  'static',
  'assert',
  'export',
  'interface',
  'super',
  'async',
  'extends',
  'is',
  'switch',
  'await',
  'extension',
  'late',
  'sync',
  'break',
  'external',
  'library',
  'this',
  'case',
  'factory',
  'mixin',
  'throw',
  'catch',
  'false',
  'new',
  'true',
  'class',
  'final',
  'null',
  'try',
  'const',
  'finally',
  'on',
  'typedef',
  'continue',
  'for',
  'operator',
  'var',
  'covariant',
  'Function',
  'part',
  'void',
  'default',
  'get',
  'required',
  'while',
  'deferred',
  'hide',
  'rethrow',
  'with',
  'do',
  'if',
  'return',
  'yield',
  'dynamic',
  'implements',
  'set',
};

const serviceTpl = '''
class {{clazz}}Service {
  {{clazz}}Service({
    required String canisterId,
    required String url,
    required Service idl,
    Identity? identity,
    bool? debug = true,
  }) {
    factory = initAgentFactory(canisterId: canisterId, url: url, idl: idl);
  }

  late final AgentFactory factory;

  AgentFactory initAgentFactory({
    required String canisterId,
    required String url,
    required Service idl,
    Identity? identity,
    bool? debug = true,
  }) {
    return AgentFactory(
      canisterId: canisterId,
      identity: identity,
      url: url,
      idl: idl,
      debug: debug,
    );
  }

  FutureOr<void> callOnBeforeRequest(String method, List<dynamic> params) {}

  FutureOr<void> callOnAfterResponse(String method, List<dynamic> resp) {}
}
''';
