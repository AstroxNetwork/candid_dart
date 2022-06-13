grammar Candid;

null
  : 'null'
  ;

natType
  : 'nat'
  | 'nat8'
  | 'nat16'
  | 'nat32'
  | 'nat64'
  ;

intType
  : 'int'
  | 'int8'
  | 'int16'
  | 'int32'
  | 'int64'
  ;

floatType
  : 'float32'
  | 'float64'
  ;

blobType
  : 'blob'
  ;

numberType
  : natType
  | intType
  | floatType
  ;

boolType
  : 'bool'
  ;

textType
  : 'text'
  ;

principalType
  : 'principal'
  ;

reservedType
  : 'reserved'
  ;

emptyType
  : 'empty'
  ;

primType
  : numberType
  | boolType
  | textType
  | blobType
  | null
  | principalType
  | reservedType
  | emptyType
  ;

idType
  : id
  | primType
  ;

funcAnn
  : 'oneway'
  | 'query'
  ;

funcType
  : tupleType '->' tupleType funcAnn?
  ;

methType
  : idType ':' funcType
  | '"' idType '"' ':' funcType
  | idType ':' idType
  | '"' idType '"' ':' idType
  ;

optType
  : 'opt' dataType
  ;

vecType
  : 'vec' dataType
  ;

pairType
  : idType ':' dataType
  | '"' idType '"' ':' dataType
  ;

exprType
  : pairType
  | idType
  | vecType
  | optType
  | variantType
  | recordType
  | refType
  ;

recordType
  : 'record' '{' (exprType ';'*)* '}'
  ;

variantType
  : 'variant' '{' (exprType ';'*)* '}'
  ;

tupleType
  : '(' (exprType ','*)* ')'
  ;

refType
  : 'func' funcType
  | 'service' actorType
  ;

actorType
  : '{' (methType ';'*)* '}'
  ;

dataType
  : idType
  | vecType
  | optType
  | variantType
  | recordType
  | refType
  ;

prog
  : imp* def* actor?
  ;

imp
  : 'import' '"' importPart '"' ';'*
  ;

def
  : 'type' idType '=' dataType ';'*
  ;

actor
  : 'service' idType? ':' (tupleType '->')? actorType ';'*
  | 'service' idType? ':' (tupleType '->')? idType ';'*
  ;


id
  : IDENTIFIER
  ;

importPart
  : IMPORT_LETTER
  ;

IDENTIFIER
  : [a-zA-Z0-9_]+
  ;

IMPORT_LETTER
  : [a-zA-Z0-9_.]+
  ;

WHITESPACE
  : [ \t\r\n]+ -> skip
  ;

SINGLE_LINE_COMMENT
  : '//' ~[\r\n]* -> skip
  ;

MULTI_LINE_COMMENT
  : '/*' .*? '*/' -> skip
  ;