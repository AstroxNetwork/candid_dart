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
