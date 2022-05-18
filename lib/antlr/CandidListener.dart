// Generated from antlr/Candid.g4 by ANTLR 4.10.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'CandidParser.dart';

/// This abstract class defines a complete listener for a parse tree produced by
/// [CandidParser].
abstract class CandidListener extends ParseTreeListener {
  /// Enter a parse tree produced by [CandidParser.null].
  /// [ctx] the parse tree
  void enterNull(NullContext ctx);
  /// Exit a parse tree produced by [CandidParser.null].
  /// [ctx] the parse tree
  void exitNull(NullContext ctx);

  /// Enter a parse tree produced by [CandidParser.natType].
  /// [ctx] the parse tree
  void enterNatType(NatTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.natType].
  /// [ctx] the parse tree
  void exitNatType(NatTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.intType].
  /// [ctx] the parse tree
  void enterIntType(IntTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.intType].
  /// [ctx] the parse tree
  void exitIntType(IntTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.floatType].
  /// [ctx] the parse tree
  void enterFloatType(FloatTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.floatType].
  /// [ctx] the parse tree
  void exitFloatType(FloatTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.blobType].
  /// [ctx] the parse tree
  void enterBlobType(BlobTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.blobType].
  /// [ctx] the parse tree
  void exitBlobType(BlobTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.numberType].
  /// [ctx] the parse tree
  void enterNumberType(NumberTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.numberType].
  /// [ctx] the parse tree
  void exitNumberType(NumberTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.boolType].
  /// [ctx] the parse tree
  void enterBoolType(BoolTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.boolType].
  /// [ctx] the parse tree
  void exitBoolType(BoolTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.textType].
  /// [ctx] the parse tree
  void enterTextType(TextTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.textType].
  /// [ctx] the parse tree
  void exitTextType(TextTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.principalType].
  /// [ctx] the parse tree
  void enterPrincipalType(PrincipalTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.principalType].
  /// [ctx] the parse tree
  void exitPrincipalType(PrincipalTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.reservedType].
  /// [ctx] the parse tree
  void enterReservedType(ReservedTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.reservedType].
  /// [ctx] the parse tree
  void exitReservedType(ReservedTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.emptyType].
  /// [ctx] the parse tree
  void enterEmptyType(EmptyTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.emptyType].
  /// [ctx] the parse tree
  void exitEmptyType(EmptyTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.primType].
  /// [ctx] the parse tree
  void enterPrimType(PrimTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.primType].
  /// [ctx] the parse tree
  void exitPrimType(PrimTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.idType].
  /// [ctx] the parse tree
  void enterIdType(IdTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.idType].
  /// [ctx] the parse tree
  void exitIdType(IdTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.funcAnn].
  /// [ctx] the parse tree
  void enterFuncAnn(FuncAnnContext ctx);
  /// Exit a parse tree produced by [CandidParser.funcAnn].
  /// [ctx] the parse tree
  void exitFuncAnn(FuncAnnContext ctx);

  /// Enter a parse tree produced by [CandidParser.funcType].
  /// [ctx] the parse tree
  void enterFuncType(FuncTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.funcType].
  /// [ctx] the parse tree
  void exitFuncType(FuncTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.methType].
  /// [ctx] the parse tree
  void enterMethType(MethTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.methType].
  /// [ctx] the parse tree
  void exitMethType(MethTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.optType].
  /// [ctx] the parse tree
  void enterOptType(OptTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.optType].
  /// [ctx] the parse tree
  void exitOptType(OptTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.vecType].
  /// [ctx] the parse tree
  void enterVecType(VecTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.vecType].
  /// [ctx] the parse tree
  void exitVecType(VecTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.pairType].
  /// [ctx] the parse tree
  void enterPairType(PairTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.pairType].
  /// [ctx] the parse tree
  void exitPairType(PairTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.exprType].
  /// [ctx] the parse tree
  void enterExprType(ExprTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.exprType].
  /// [ctx] the parse tree
  void exitExprType(ExprTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.recordType].
  /// [ctx] the parse tree
  void enterRecordType(RecordTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.recordType].
  /// [ctx] the parse tree
  void exitRecordType(RecordTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.variantType].
  /// [ctx] the parse tree
  void enterVariantType(VariantTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.variantType].
  /// [ctx] the parse tree
  void exitVariantType(VariantTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.tupleType].
  /// [ctx] the parse tree
  void enterTupleType(TupleTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.tupleType].
  /// [ctx] the parse tree
  void exitTupleType(TupleTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.refType].
  /// [ctx] the parse tree
  void enterRefType(RefTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.refType].
  /// [ctx] the parse tree
  void exitRefType(RefTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.actorType].
  /// [ctx] the parse tree
  void enterActorType(ActorTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.actorType].
  /// [ctx] the parse tree
  void exitActorType(ActorTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.dataType].
  /// [ctx] the parse tree
  void enterDataType(DataTypeContext ctx);
  /// Exit a parse tree produced by [CandidParser.dataType].
  /// [ctx] the parse tree
  void exitDataType(DataTypeContext ctx);

  /// Enter a parse tree produced by [CandidParser.prog].
  /// [ctx] the parse tree
  void enterProg(ProgContext ctx);
  /// Exit a parse tree produced by [CandidParser.prog].
  /// [ctx] the parse tree
  void exitProg(ProgContext ctx);

  /// Enter a parse tree produced by [CandidParser.imp].
  /// [ctx] the parse tree
  void enterImp(ImpContext ctx);
  /// Exit a parse tree produced by [CandidParser.imp].
  /// [ctx] the parse tree
  void exitImp(ImpContext ctx);

  /// Enter a parse tree produced by [CandidParser.def].
  /// [ctx] the parse tree
  void enterDef(DefContext ctx);
  /// Exit a parse tree produced by [CandidParser.def].
  /// [ctx] the parse tree
  void exitDef(DefContext ctx);

  /// Enter a parse tree produced by [CandidParser.actor].
  /// [ctx] the parse tree
  void enterActor(ActorContext ctx);
  /// Exit a parse tree produced by [CandidParser.actor].
  /// [ctx] the parse tree
  void exitActor(ActorContext ctx);

  /// Enter a parse tree produced by [CandidParser.id].
  /// [ctx] the parse tree
  void enterId(IdContext ctx);
  /// Exit a parse tree produced by [CandidParser.id].
  /// [ctx] the parse tree
  void exitId(IdContext ctx);

  /// Enter a parse tree produced by [CandidParser.importPart].
  /// [ctx] the parse tree
  void enterImportPart(ImportPartContext ctx);
  /// Exit a parse tree produced by [CandidParser.importPart].
  /// [ctx] the parse tree
  void exitImportPart(ImportPartContext ctx);
}