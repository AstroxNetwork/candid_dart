// Generated from ./antlr/Candid.g4 by ANTLR 4.10.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'CandidParser.dart';

/// This abstract class defines a complete generic visitor for a parse tree
/// produced by [CandidParser].
///
/// [T] is the eturn type of the visit operation. Use `void` for
/// operations with no return type.
abstract class CandidVisitor<T> extends ParseTreeVisitor<T> {
  /// Visit a parse tree produced by [CandidParser.null].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitNull(NullContext ctx);

  /// Visit a parse tree produced by [CandidParser.natType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitNatType(NatTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.intType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitIntType(IntTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.floatType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitFloatType(FloatTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.blobType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitBlobType(BlobTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.numberType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitNumberType(NumberTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.boolType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitBoolType(BoolTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.textType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTextType(TextTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.principalType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPrincipalType(PrincipalTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.reservedType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitReservedType(ReservedTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.emptyType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitEmptyType(EmptyTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.primType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPrimType(PrimTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.idType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitIdType(IdTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.funcAnn].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitFuncAnn(FuncAnnContext ctx);

  /// Visit a parse tree produced by [CandidParser.funcType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitFuncType(FuncTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.methType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitMethType(MethTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.optType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitOptType(OptTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.vecType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitVecType(VecTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.pairType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPairType(PairTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.exprType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitExprType(ExprTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.recordType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitRecordType(RecordTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.variantType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitVariantType(VariantTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.tupleType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTupleType(TupleTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.refType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitRefType(RefTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.actorType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitActorType(ActorTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.dataType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDataType(DataTypeContext ctx);

  /// Visit a parse tree produced by [CandidParser.prog].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitProg(ProgContext ctx);

  /// Visit a parse tree produced by [CandidParser.imp].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitImp(ImpContext ctx);

  /// Visit a parse tree produced by [CandidParser.def].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDef(DefContext ctx);

  /// Visit a parse tree produced by [CandidParser.actor].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitActor(ActorContext ctx);

  /// Visit a parse tree produced by [CandidParser.id].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitId(IdContext ctx);

  /// Visit a parse tree produced by [CandidParser.importPart].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitImportPart(ImportPartContext ctx);
}