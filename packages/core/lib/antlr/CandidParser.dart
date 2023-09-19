// Generated from Candid.g4 by ANTLR 4.13.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'CandidVisitor.dart';
import 'CandidBaseVisitor.dart';
const int RULE_null = 0, RULE_natType = 1, RULE_intType = 2, RULE_floatType = 3, 
          RULE_blobType = 4, RULE_numberType = 5, RULE_boolType = 6, RULE_textType = 7, 
          RULE_principalType = 8, RULE_reservedType = 9, RULE_emptyType = 10, 
          RULE_primType = 11, RULE_idType = 12, RULE_funcAnn = 13, RULE_funcType = 14, 
          RULE_methType = 15, RULE_optType = 16, RULE_vecType = 17, RULE_pairType = 18, 
          RULE_exprType = 19, RULE_recordType = 20, RULE_variantType = 21, 
          RULE_tupleType = 22, RULE_refType = 23, RULE_actorType = 24, RULE_dataType = 25, 
          RULE_prog = 26, RULE_imp = 27, RULE_def = 28, RULE_actor = 29, 
          RULE_id = 30, RULE_importPart = 31;
class CandidParser extends Parser {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.13.1', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int TOKEN_T__0 = 1, TOKEN_T__1 = 2, TOKEN_T__2 = 3, TOKEN_T__3 = 4, 
                   TOKEN_T__4 = 5, TOKEN_T__5 = 6, TOKEN_T__6 = 7, TOKEN_T__7 = 8, 
                   TOKEN_T__8 = 9, TOKEN_T__9 = 10, TOKEN_T__10 = 11, TOKEN_T__11 = 12, 
                   TOKEN_T__12 = 13, TOKEN_T__13 = 14, TOKEN_T__14 = 15, 
                   TOKEN_T__15 = 16, TOKEN_T__16 = 17, TOKEN_T__17 = 18, 
                   TOKEN_T__18 = 19, TOKEN_T__19 = 20, TOKEN_T__20 = 21, 
                   TOKEN_T__21 = 22, TOKEN_T__22 = 23, TOKEN_T__23 = 24, 
                   TOKEN_T__24 = 25, TOKEN_T__25 = 26, TOKEN_T__26 = 27, 
                   TOKEN_T__27 = 28, TOKEN_T__28 = 29, TOKEN_T__29 = 30, 
                   TOKEN_T__30 = 31, TOKEN_T__31 = 32, TOKEN_T__32 = 33, 
                   TOKEN_T__33 = 34, TOKEN_T__34 = 35, TOKEN_T__35 = 36, 
                   TOKEN_T__36 = 37, TOKEN_T__37 = 38, TOKEN_T__38 = 39, 
                   TOKEN_T__39 = 40, TOKEN_IDENTIFIER = 41, TOKEN_IMPORT_LETTER = 42, 
                   TOKEN_WHITESPACE = 43, TOKEN_SINGLE_LINE_COMMENT = 44, 
                   TOKEN_MULTI_LINE_COMMENT = 45;

  @override
  final List<String> ruleNames = [
    'null', 'natType', 'intType', 'floatType', 'blobType', 'numberType', 
    'boolType', 'textType', 'principalType', 'reservedType', 'emptyType', 
    'primType', 'idType', 'funcAnn', 'funcType', 'methType', 'optType', 
    'vecType', 'pairType', 'exprType', 'recordType', 'variantType', 'tupleType', 
    'refType', 'actorType', 'dataType', 'prog', 'imp', 'def', 'actor', 'id', 
    'importPart'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "'null'", "'nat'", "'nat8'", "'nat16'", "'nat32'", "'nat64'", 
      "'int'", "'int8'", "'int16'", "'int32'", "'int64'", "'float32'", "'float64'", 
      "'blob'", "'bool'", "'text'", "'principal'", "'reserved'", "'empty'", 
      "'oneway'", "'query'", "'composite_query'", "'->'", "':'", "'opt'", 
      "'vec'", "'\"'", "'record'", "'{'", "';'", "'}'", "'variant'", "'('", 
      "','", "')'", "'func'", "'service'", "'import'", "'type'", "'='"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, null, null, null, null, null, null, null, null, null, null, 
      null, null, null, null, null, null, null, null, null, null, null, 
      null, null, null, null, null, null, null, null, null, null, null, 
      null, null, null, null, null, null, null, null, "IDENTIFIER", "IMPORT_LETTER", 
      "WHITESPACE", "SINGLE_LINE_COMMENT", "MULTI_LINE_COMMENT"
  ];
  static final Vocabulary VOCABULARY = VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }

  @override
  String get grammarFileName => 'Candid.g4';

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  ATN getATN() {
   return _ATN;
  }

  CandidParser(TokenStream input) : super(input) {
    interpreter = ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  NullContext null_() {
    dynamic _localctx = NullContext(context, state);
    enterRule(_localctx, 0, RULE_null);
    try {
      enterOuterAlt(_localctx, 1);
      state = 64;
      match(TOKEN_T__0);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  NatTypeContext natType() {
    dynamic _localctx = NatTypeContext(context, state);
    enterRule(_localctx, 2, RULE_natType);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 66;
      _la = tokenStream.LA(1)!;
      if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 124) != 0))) {
      errorHandler.recoverInline(this);
      } else {
        if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  IntTypeContext intType() {
    dynamic _localctx = IntTypeContext(context, state);
    enterRule(_localctx, 4, RULE_intType);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 68;
      _la = tokenStream.LA(1)!;
      if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 3968) != 0))) {
      errorHandler.recoverInline(this);
      } else {
        if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  FloatTypeContext floatType() {
    dynamic _localctx = FloatTypeContext(context, state);
    enterRule(_localctx, 6, RULE_floatType);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 70;
      _la = tokenStream.LA(1)!;
      if (!(_la == TOKEN_T__11 || _la == TOKEN_T__12)) {
      errorHandler.recoverInline(this);
      } else {
        if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  BlobTypeContext blobType() {
    dynamic _localctx = BlobTypeContext(context, state);
    enterRule(_localctx, 8, RULE_blobType);
    try {
      enterOuterAlt(_localctx, 1);
      state = 72;
      match(TOKEN_T__13);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  NumberTypeContext numberType() {
    dynamic _localctx = NumberTypeContext(context, state);
    enterRule(_localctx, 10, RULE_numberType);
    try {
      state = 77;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_T__1:
      case TOKEN_T__2:
      case TOKEN_T__3:
      case TOKEN_T__4:
      case TOKEN_T__5:
        enterOuterAlt(_localctx, 1);
        state = 74;
        natType();
        break;
      case TOKEN_T__6:
      case TOKEN_T__7:
      case TOKEN_T__8:
      case TOKEN_T__9:
      case TOKEN_T__10:
        enterOuterAlt(_localctx, 2);
        state = 75;
        intType();
        break;
      case TOKEN_T__11:
      case TOKEN_T__12:
        enterOuterAlt(_localctx, 3);
        state = 76;
        floatType();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  BoolTypeContext boolType() {
    dynamic _localctx = BoolTypeContext(context, state);
    enterRule(_localctx, 12, RULE_boolType);
    try {
      enterOuterAlt(_localctx, 1);
      state = 79;
      match(TOKEN_T__14);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  TextTypeContext textType() {
    dynamic _localctx = TextTypeContext(context, state);
    enterRule(_localctx, 14, RULE_textType);
    try {
      enterOuterAlt(_localctx, 1);
      state = 81;
      match(TOKEN_T__15);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  PrincipalTypeContext principalType() {
    dynamic _localctx = PrincipalTypeContext(context, state);
    enterRule(_localctx, 16, RULE_principalType);
    try {
      enterOuterAlt(_localctx, 1);
      state = 83;
      match(TOKEN_T__16);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ReservedTypeContext reservedType() {
    dynamic _localctx = ReservedTypeContext(context, state);
    enterRule(_localctx, 18, RULE_reservedType);
    try {
      enterOuterAlt(_localctx, 1);
      state = 85;
      match(TOKEN_T__17);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  EmptyTypeContext emptyType() {
    dynamic _localctx = EmptyTypeContext(context, state);
    enterRule(_localctx, 20, RULE_emptyType);
    try {
      enterOuterAlt(_localctx, 1);
      state = 87;
      match(TOKEN_T__18);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  PrimTypeContext primType() {
    dynamic _localctx = PrimTypeContext(context, state);
    enterRule(_localctx, 22, RULE_primType);
    try {
      state = 97;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_T__1:
      case TOKEN_T__2:
      case TOKEN_T__3:
      case TOKEN_T__4:
      case TOKEN_T__5:
      case TOKEN_T__6:
      case TOKEN_T__7:
      case TOKEN_T__8:
      case TOKEN_T__9:
      case TOKEN_T__10:
      case TOKEN_T__11:
      case TOKEN_T__12:
        enterOuterAlt(_localctx, 1);
        state = 89;
        numberType();
        break;
      case TOKEN_T__14:
        enterOuterAlt(_localctx, 2);
        state = 90;
        boolType();
        break;
      case TOKEN_T__15:
        enterOuterAlt(_localctx, 3);
        state = 91;
        textType();
        break;
      case TOKEN_T__13:
        enterOuterAlt(_localctx, 4);
        state = 92;
        blobType();
        break;
      case TOKEN_T__0:
        enterOuterAlt(_localctx, 5);
        state = 93;
        null_();
        break;
      case TOKEN_T__16:
        enterOuterAlt(_localctx, 6);
        state = 94;
        principalType();
        break;
      case TOKEN_T__17:
        enterOuterAlt(_localctx, 7);
        state = 95;
        reservedType();
        break;
      case TOKEN_T__18:
        enterOuterAlt(_localctx, 8);
        state = 96;
        emptyType();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  IdTypeContext idType() {
    dynamic _localctx = IdTypeContext(context, state);
    enterRule(_localctx, 24, RULE_idType);
    try {
      state = 101;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_T__26:
      case TOKEN_IDENTIFIER:
        enterOuterAlt(_localctx, 1);
        state = 99;
        id();
        break;
      case TOKEN_T__0:
      case TOKEN_T__1:
      case TOKEN_T__2:
      case TOKEN_T__3:
      case TOKEN_T__4:
      case TOKEN_T__5:
      case TOKEN_T__6:
      case TOKEN_T__7:
      case TOKEN_T__8:
      case TOKEN_T__9:
      case TOKEN_T__10:
      case TOKEN_T__11:
      case TOKEN_T__12:
      case TOKEN_T__13:
      case TOKEN_T__14:
      case TOKEN_T__15:
      case TOKEN_T__16:
      case TOKEN_T__17:
      case TOKEN_T__18:
        enterOuterAlt(_localctx, 2);
        state = 100;
        primType();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  FuncAnnContext funcAnn() {
    dynamic _localctx = FuncAnnContext(context, state);
    enterRule(_localctx, 26, RULE_funcAnn);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 103;
      _la = tokenStream.LA(1)!;
      if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 7340032) != 0))) {
      errorHandler.recoverInline(this);
      } else {
        if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  FuncTypeContext funcType() {
    dynamic _localctx = FuncTypeContext(context, state);
    enterRule(_localctx, 28, RULE_funcType);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 105;
      tupleType();
      state = 106;
      match(TOKEN_T__22);
      state = 107;
      tupleType();
      state = 109;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 7340032) != 0)) {
        state = 108;
        funcAnn();
      }

    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  MethTypeContext methType() {
    dynamic _localctx = MethTypeContext(context, state);
    enterRule(_localctx, 30, RULE_methType);
    try {
      state = 119;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 4, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 111;
        idType();
        state = 112;
        match(TOKEN_T__23);
        state = 113;
        funcType();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 115;
        idType();
        state = 116;
        match(TOKEN_T__23);
        state = 117;
        idType();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  OptTypeContext optType() {
    dynamic _localctx = OptTypeContext(context, state);
    enterRule(_localctx, 32, RULE_optType);
    try {
      enterOuterAlt(_localctx, 1);
      state = 121;
      match(TOKEN_T__24);
      state = 122;
      dataType();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  VecTypeContext vecType() {
    dynamic _localctx = VecTypeContext(context, state);
    enterRule(_localctx, 34, RULE_vecType);
    try {
      enterOuterAlt(_localctx, 1);
      state = 124;
      match(TOKEN_T__25);
      state = 125;
      dataType();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  PairTypeContext pairType() {
    dynamic _localctx = PairTypeContext(context, state);
    enterRule(_localctx, 36, RULE_pairType);
    try {
      state = 137;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 5, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 127;
        idType();
        state = 128;
        match(TOKEN_T__23);
        state = 129;
        dataType();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 131;
        match(TOKEN_T__26);
        state = 132;
        idType();
        state = 133;
        match(TOKEN_T__26);
        state = 134;
        match(TOKEN_T__23);
        state = 135;
        dataType();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ExprTypeContext exprType() {
    dynamic _localctx = ExprTypeContext(context, state);
    enterRule(_localctx, 38, RULE_exprType);
    try {
      state = 146;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 6, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 139;
        pairType();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 140;
        idType();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 141;
        vecType();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 142;
        optType();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 143;
        variantType();
        break;
      case 6:
        enterOuterAlt(_localctx, 6);
        state = 144;
        recordType();
        break;
      case 7:
        enterOuterAlt(_localctx, 7);
        state = 145;
        refType();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  RecordTypeContext recordType() {
    dynamic _localctx = RecordTypeContext(context, state);
    enterRule(_localctx, 40, RULE_recordType);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 148;
      match(TOKEN_T__27);
      state = 149;
      match(TOKEN_T__28);
      state = 159;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 2409981018110) != 0)) {
        state = 150;
        exprType();
        state = 154;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_T__29) {
          state = 151;
          match(TOKEN_T__29);
          state = 156;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 161;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 162;
      match(TOKEN_T__30);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  VariantTypeContext variantType() {
    dynamic _localctx = VariantTypeContext(context, state);
    enterRule(_localctx, 42, RULE_variantType);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 164;
      match(TOKEN_T__31);
      state = 165;
      match(TOKEN_T__28);
      state = 175;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 2409981018110) != 0)) {
        state = 166;
        exprType();
        state = 170;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_T__29) {
          state = 167;
          match(TOKEN_T__29);
          state = 172;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 177;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 178;
      match(TOKEN_T__30);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  TupleTypeContext tupleType() {
    dynamic _localctx = TupleTypeContext(context, state);
    enterRule(_localctx, 44, RULE_tupleType);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 180;
      match(TOKEN_T__32);
      state = 190;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 2409981018110) != 0)) {
        state = 181;
        exprType();
        state = 185;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_T__33) {
          state = 182;
          match(TOKEN_T__33);
          state = 187;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 192;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 193;
      match(TOKEN_T__34);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  RefTypeContext refType() {
    dynamic _localctx = RefTypeContext(context, state);
    enterRule(_localctx, 46, RULE_refType);
    try {
      state = 199;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_T__35:
        enterOuterAlt(_localctx, 1);
        state = 195;
        match(TOKEN_T__35);
        state = 196;
        funcType();
        break;
      case TOKEN_T__36:
        enterOuterAlt(_localctx, 2);
        state = 197;
        match(TOKEN_T__36);
        state = 198;
        actorType();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ActorTypeContext actorType() {
    dynamic _localctx = ActorTypeContext(context, state);
    enterRule(_localctx, 48, RULE_actorType);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 201;
      match(TOKEN_T__28);
      state = 211;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 2199158521854) != 0)) {
        state = 202;
        methType();
        state = 206;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_T__29) {
          state = 203;
          match(TOKEN_T__29);
          state = 208;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 213;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 214;
      match(TOKEN_T__30);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  DataTypeContext dataType() {
    dynamic _localctx = DataTypeContext(context, state);
    enterRule(_localctx, 50, RULE_dataType);
    try {
      state = 222;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_T__0:
      case TOKEN_T__1:
      case TOKEN_T__2:
      case TOKEN_T__3:
      case TOKEN_T__4:
      case TOKEN_T__5:
      case TOKEN_T__6:
      case TOKEN_T__7:
      case TOKEN_T__8:
      case TOKEN_T__9:
      case TOKEN_T__10:
      case TOKEN_T__11:
      case TOKEN_T__12:
      case TOKEN_T__13:
      case TOKEN_T__14:
      case TOKEN_T__15:
      case TOKEN_T__16:
      case TOKEN_T__17:
      case TOKEN_T__18:
      case TOKEN_T__26:
      case TOKEN_IDENTIFIER:
        enterOuterAlt(_localctx, 1);
        state = 216;
        idType();
        break;
      case TOKEN_T__25:
        enterOuterAlt(_localctx, 2);
        state = 217;
        vecType();
        break;
      case TOKEN_T__24:
        enterOuterAlt(_localctx, 3);
        state = 218;
        optType();
        break;
      case TOKEN_T__31:
        enterOuterAlt(_localctx, 4);
        state = 219;
        variantType();
        break;
      case TOKEN_T__27:
        enterOuterAlt(_localctx, 5);
        state = 220;
        recordType();
        break;
      case TOKEN_T__35:
      case TOKEN_T__36:
        enterOuterAlt(_localctx, 6);
        state = 221;
        refType();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ProgContext prog() {
    dynamic _localctx = ProgContext(context, state);
    enterRule(_localctx, 52, RULE_prog);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 227;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_T__37) {
        state = 224;
        imp();
        state = 229;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 233;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_T__38) {
        state = 230;
        def();
        state = 235;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 237;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_T__36) {
        state = 236;
        actor();
      }

    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ImpContext imp() {
    dynamic _localctx = ImpContext(context, state);
    enterRule(_localctx, 54, RULE_imp);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 239;
      match(TOKEN_T__37);
      state = 240;
      match(TOKEN_T__26);
      state = 241;
      importPart();
      state = 242;
      match(TOKEN_T__26);
      state = 246;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_T__29) {
        state = 243;
        match(TOKEN_T__29);
        state = 248;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  DefContext def() {
    dynamic _localctx = DefContext(context, state);
    enterRule(_localctx, 56, RULE_def);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 249;
      match(TOKEN_T__38);
      state = 250;
      idType();
      state = 251;
      match(TOKEN_T__39);
      state = 252;
      dataType();
      state = 256;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_T__29) {
        state = 253;
        match(TOKEN_T__29);
        state = 258;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ActorContext actor() {
    dynamic _localctx = ActorContext(context, state);
    enterRule(_localctx, 58, RULE_actor);
    int _la;
    try {
      state = 293;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 28, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 259;
        match(TOKEN_T__36);
        state = 261;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 2199158521854) != 0)) {
          state = 260;
          idType();
        }

        state = 263;
        match(TOKEN_T__23);
        state = 267;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_T__32) {
          state = 264;
          tupleType();
          state = 265;
          match(TOKEN_T__22);
        }

        state = 269;
        actorType();
        state = 273;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_T__29) {
          state = 270;
          match(TOKEN_T__29);
          state = 275;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 276;
        match(TOKEN_T__36);
        state = 278;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 2199158521854) != 0)) {
          state = 277;
          idType();
        }

        state = 280;
        match(TOKEN_T__23);
        state = 284;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_T__32) {
          state = 281;
          tupleType();
          state = 282;
          match(TOKEN_T__22);
        }

        state = 286;
        idType();
        state = 290;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_T__29) {
          state = 287;
          match(TOKEN_T__29);
          state = 292;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  IdContext id() {
    dynamic _localctx = IdContext(context, state);
    enterRule(_localctx, 60, RULE_id);
    try {
      state = 299;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_IDENTIFIER:
        enterOuterAlt(_localctx, 1);
        state = 295;
        match(TOKEN_IDENTIFIER);
        break;
      case TOKEN_T__26:
        enterOuterAlt(_localctx, 2);
        state = 296;
        match(TOKEN_T__26);
        state = 297;
        match(TOKEN_IDENTIFIER);
        state = 298;
        match(TOKEN_T__26);
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ImportPartContext importPart() {
    dynamic _localctx = ImportPartContext(context, state);
    enterRule(_localctx, 62, RULE_importPart);
    try {
      enterOuterAlt(_localctx, 1);
      state = 301;
      match(TOKEN_IMPORT_LETTER);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  static const List<int> _serializedATN = [
      4,1,45,304,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,
      2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,
      14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,
      2,21,7,21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,2,27,7,
      27,2,28,7,28,2,29,7,29,2,30,7,30,2,31,7,31,1,0,1,0,1,1,1,1,1,2,1,2,
      1,3,1,3,1,4,1,4,1,5,1,5,1,5,3,5,78,8,5,1,6,1,6,1,7,1,7,1,8,1,8,1,9,
      1,9,1,10,1,10,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,3,11,98,8,11,
      1,12,1,12,3,12,102,8,12,1,13,1,13,1,14,1,14,1,14,1,14,3,14,110,8,14,
      1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,3,15,120,8,15,1,16,1,16,1,
      16,1,17,1,17,1,17,1,18,1,18,1,18,1,18,1,18,1,18,1,18,1,18,1,18,1,18,
      3,18,138,8,18,1,19,1,19,1,19,1,19,1,19,1,19,1,19,3,19,147,8,19,1,20,
      1,20,1,20,1,20,5,20,153,8,20,10,20,12,20,156,9,20,5,20,158,8,20,10,
      20,12,20,161,9,20,1,20,1,20,1,21,1,21,1,21,1,21,5,21,169,8,21,10,21,
      12,21,172,9,21,5,21,174,8,21,10,21,12,21,177,9,21,1,21,1,21,1,22,1,
      22,1,22,5,22,184,8,22,10,22,12,22,187,9,22,5,22,189,8,22,10,22,12,
      22,192,9,22,1,22,1,22,1,23,1,23,1,23,1,23,3,23,200,8,23,1,24,1,24,
      1,24,5,24,205,8,24,10,24,12,24,208,9,24,5,24,210,8,24,10,24,12,24,
      213,9,24,1,24,1,24,1,25,1,25,1,25,1,25,1,25,1,25,3,25,223,8,25,1,26,
      5,26,226,8,26,10,26,12,26,229,9,26,1,26,5,26,232,8,26,10,26,12,26,
      235,9,26,1,26,3,26,238,8,26,1,27,1,27,1,27,1,27,1,27,5,27,245,8,27,
      10,27,12,27,248,9,27,1,28,1,28,1,28,1,28,1,28,5,28,255,8,28,10,28,
      12,28,258,9,28,1,29,1,29,3,29,262,8,29,1,29,1,29,1,29,1,29,3,29,268,
      8,29,1,29,1,29,5,29,272,8,29,10,29,12,29,275,9,29,1,29,1,29,3,29,279,
      8,29,1,29,1,29,1,29,1,29,3,29,285,8,29,1,29,1,29,5,29,289,8,29,10,
      29,12,29,292,9,29,3,29,294,8,29,1,30,1,30,1,30,1,30,3,30,300,8,30,
      1,31,1,31,1,31,0,0,32,0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,
      34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,0,4,1,0,2,6,1,0,7,11,
      1,0,12,13,1,0,20,22,317,0,64,1,0,0,0,2,66,1,0,0,0,4,68,1,0,0,0,6,70,
      1,0,0,0,8,72,1,0,0,0,10,77,1,0,0,0,12,79,1,0,0,0,14,81,1,0,0,0,16,
      83,1,0,0,0,18,85,1,0,0,0,20,87,1,0,0,0,22,97,1,0,0,0,24,101,1,0,0,
      0,26,103,1,0,0,0,28,105,1,0,0,0,30,119,1,0,0,0,32,121,1,0,0,0,34,124,
      1,0,0,0,36,137,1,0,0,0,38,146,1,0,0,0,40,148,1,0,0,0,42,164,1,0,0,
      0,44,180,1,0,0,0,46,199,1,0,0,0,48,201,1,0,0,0,50,222,1,0,0,0,52,227,
      1,0,0,0,54,239,1,0,0,0,56,249,1,0,0,0,58,293,1,0,0,0,60,299,1,0,0,
      0,62,301,1,0,0,0,64,65,5,1,0,0,65,1,1,0,0,0,66,67,7,0,0,0,67,3,1,0,
      0,0,68,69,7,1,0,0,69,5,1,0,0,0,70,71,7,2,0,0,71,7,1,0,0,0,72,73,5,
      14,0,0,73,9,1,0,0,0,74,78,3,2,1,0,75,78,3,4,2,0,76,78,3,6,3,0,77,74,
      1,0,0,0,77,75,1,0,0,0,77,76,1,0,0,0,78,11,1,0,0,0,79,80,5,15,0,0,80,
      13,1,0,0,0,81,82,5,16,0,0,82,15,1,0,0,0,83,84,5,17,0,0,84,17,1,0,0,
      0,85,86,5,18,0,0,86,19,1,0,0,0,87,88,5,19,0,0,88,21,1,0,0,0,89,98,
      3,10,5,0,90,98,3,12,6,0,91,98,3,14,7,0,92,98,3,8,4,0,93,98,3,0,0,0,
      94,98,3,16,8,0,95,98,3,18,9,0,96,98,3,20,10,0,97,89,1,0,0,0,97,90,
      1,0,0,0,97,91,1,0,0,0,97,92,1,0,0,0,97,93,1,0,0,0,97,94,1,0,0,0,97,
      95,1,0,0,0,97,96,1,0,0,0,98,23,1,0,0,0,99,102,3,60,30,0,100,102,3,
      22,11,0,101,99,1,0,0,0,101,100,1,0,0,0,102,25,1,0,0,0,103,104,7,3,
      0,0,104,27,1,0,0,0,105,106,3,44,22,0,106,107,5,23,0,0,107,109,3,44,
      22,0,108,110,3,26,13,0,109,108,1,0,0,0,109,110,1,0,0,0,110,29,1,0,
      0,0,111,112,3,24,12,0,112,113,5,24,0,0,113,114,3,28,14,0,114,120,1,
      0,0,0,115,116,3,24,12,0,116,117,5,24,0,0,117,118,3,24,12,0,118,120,
      1,0,0,0,119,111,1,0,0,0,119,115,1,0,0,0,120,31,1,0,0,0,121,122,5,25,
      0,0,122,123,3,50,25,0,123,33,1,0,0,0,124,125,5,26,0,0,125,126,3,50,
      25,0,126,35,1,0,0,0,127,128,3,24,12,0,128,129,5,24,0,0,129,130,3,50,
      25,0,130,138,1,0,0,0,131,132,5,27,0,0,132,133,3,24,12,0,133,134,5,
      27,0,0,134,135,5,24,0,0,135,136,3,50,25,0,136,138,1,0,0,0,137,127,
      1,0,0,0,137,131,1,0,0,0,138,37,1,0,0,0,139,147,3,36,18,0,140,147,3,
      24,12,0,141,147,3,34,17,0,142,147,3,32,16,0,143,147,3,42,21,0,144,
      147,3,40,20,0,145,147,3,46,23,0,146,139,1,0,0,0,146,140,1,0,0,0,146,
      141,1,0,0,0,146,142,1,0,0,0,146,143,1,0,0,0,146,144,1,0,0,0,146,145,
      1,0,0,0,147,39,1,0,0,0,148,149,5,28,0,0,149,159,5,29,0,0,150,154,3,
      38,19,0,151,153,5,30,0,0,152,151,1,0,0,0,153,156,1,0,0,0,154,152,1,
      0,0,0,154,155,1,0,0,0,155,158,1,0,0,0,156,154,1,0,0,0,157,150,1,0,
      0,0,158,161,1,0,0,0,159,157,1,0,0,0,159,160,1,0,0,0,160,162,1,0,0,
      0,161,159,1,0,0,0,162,163,5,31,0,0,163,41,1,0,0,0,164,165,5,32,0,0,
      165,175,5,29,0,0,166,170,3,38,19,0,167,169,5,30,0,0,168,167,1,0,0,
      0,169,172,1,0,0,0,170,168,1,0,0,0,170,171,1,0,0,0,171,174,1,0,0,0,
      172,170,1,0,0,0,173,166,1,0,0,0,174,177,1,0,0,0,175,173,1,0,0,0,175,
      176,1,0,0,0,176,178,1,0,0,0,177,175,1,0,0,0,178,179,5,31,0,0,179,43,
      1,0,0,0,180,190,5,33,0,0,181,185,3,38,19,0,182,184,5,34,0,0,183,182,
      1,0,0,0,184,187,1,0,0,0,185,183,1,0,0,0,185,186,1,0,0,0,186,189,1,
      0,0,0,187,185,1,0,0,0,188,181,1,0,0,0,189,192,1,0,0,0,190,188,1,0,
      0,0,190,191,1,0,0,0,191,193,1,0,0,0,192,190,1,0,0,0,193,194,5,35,0,
      0,194,45,1,0,0,0,195,196,5,36,0,0,196,200,3,28,14,0,197,198,5,37,0,
      0,198,200,3,48,24,0,199,195,1,0,0,0,199,197,1,0,0,0,200,47,1,0,0,0,
      201,211,5,29,0,0,202,206,3,30,15,0,203,205,5,30,0,0,204,203,1,0,0,
      0,205,208,1,0,0,0,206,204,1,0,0,0,206,207,1,0,0,0,207,210,1,0,0,0,
      208,206,1,0,0,0,209,202,1,0,0,0,210,213,1,0,0,0,211,209,1,0,0,0,211,
      212,1,0,0,0,212,214,1,0,0,0,213,211,1,0,0,0,214,215,5,31,0,0,215,49,
      1,0,0,0,216,223,3,24,12,0,217,223,3,34,17,0,218,223,3,32,16,0,219,
      223,3,42,21,0,220,223,3,40,20,0,221,223,3,46,23,0,222,216,1,0,0,0,
      222,217,1,0,0,0,222,218,1,0,0,0,222,219,1,0,0,0,222,220,1,0,0,0,222,
      221,1,0,0,0,223,51,1,0,0,0,224,226,3,54,27,0,225,224,1,0,0,0,226,229,
      1,0,0,0,227,225,1,0,0,0,227,228,1,0,0,0,228,233,1,0,0,0,229,227,1,
      0,0,0,230,232,3,56,28,0,231,230,1,0,0,0,232,235,1,0,0,0,233,231,1,
      0,0,0,233,234,1,0,0,0,234,237,1,0,0,0,235,233,1,0,0,0,236,238,3,58,
      29,0,237,236,1,0,0,0,237,238,1,0,0,0,238,53,1,0,0,0,239,240,5,38,0,
      0,240,241,5,27,0,0,241,242,3,62,31,0,242,246,5,27,0,0,243,245,5,30,
      0,0,244,243,1,0,0,0,245,248,1,0,0,0,246,244,1,0,0,0,246,247,1,0,0,
      0,247,55,1,0,0,0,248,246,1,0,0,0,249,250,5,39,0,0,250,251,3,24,12,
      0,251,252,5,40,0,0,252,256,3,50,25,0,253,255,5,30,0,0,254,253,1,0,
      0,0,255,258,1,0,0,0,256,254,1,0,0,0,256,257,1,0,0,0,257,57,1,0,0,0,
      258,256,1,0,0,0,259,261,5,37,0,0,260,262,3,24,12,0,261,260,1,0,0,0,
      261,262,1,0,0,0,262,263,1,0,0,0,263,267,5,24,0,0,264,265,3,44,22,0,
      265,266,5,23,0,0,266,268,1,0,0,0,267,264,1,0,0,0,267,268,1,0,0,0,268,
      269,1,0,0,0,269,273,3,48,24,0,270,272,5,30,0,0,271,270,1,0,0,0,272,
      275,1,0,0,0,273,271,1,0,0,0,273,274,1,0,0,0,274,294,1,0,0,0,275,273,
      1,0,0,0,276,278,5,37,0,0,277,279,3,24,12,0,278,277,1,0,0,0,278,279,
      1,0,0,0,279,280,1,0,0,0,280,284,5,24,0,0,281,282,3,44,22,0,282,283,
      5,23,0,0,283,285,1,0,0,0,284,281,1,0,0,0,284,285,1,0,0,0,285,286,1,
      0,0,0,286,290,3,24,12,0,287,289,5,30,0,0,288,287,1,0,0,0,289,292,1,
      0,0,0,290,288,1,0,0,0,290,291,1,0,0,0,291,294,1,0,0,0,292,290,1,0,
      0,0,293,259,1,0,0,0,293,276,1,0,0,0,294,59,1,0,0,0,295,300,5,41,0,
      0,296,297,5,27,0,0,297,298,5,41,0,0,298,300,5,27,0,0,299,295,1,0,0,
      0,299,296,1,0,0,0,300,61,1,0,0,0,301,302,5,42,0,0,302,63,1,0,0,0,30,
      77,97,101,109,119,137,146,154,159,170,175,185,190,199,206,211,222,
      227,233,237,246,256,261,267,273,278,284,290,293,299
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}
class NullContext extends ParserRuleContext {
  NullContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_null;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitNull(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class NatTypeContext extends ParserRuleContext {
  NatTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_natType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitNatType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class IntTypeContext extends ParserRuleContext {
  IntTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_intType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitIntType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class FloatTypeContext extends ParserRuleContext {
  FloatTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_floatType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitFloatType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class BlobTypeContext extends ParserRuleContext {
  BlobTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_blobType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitBlobType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class NumberTypeContext extends ParserRuleContext {
  NatTypeContext? natType() => getRuleContext<NatTypeContext>(0);
  IntTypeContext? intType() => getRuleContext<IntTypeContext>(0);
  FloatTypeContext? floatType() => getRuleContext<FloatTypeContext>(0);
  NumberTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_numberType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitNumberType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class BoolTypeContext extends ParserRuleContext {
  BoolTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_boolType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitBoolType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class TextTypeContext extends ParserRuleContext {
  TextTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_textType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitTextType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class PrincipalTypeContext extends ParserRuleContext {
  PrincipalTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_principalType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitPrincipalType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ReservedTypeContext extends ParserRuleContext {
  ReservedTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_reservedType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitReservedType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class EmptyTypeContext extends ParserRuleContext {
  EmptyTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_emptyType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitEmptyType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class PrimTypeContext extends ParserRuleContext {
  NumberTypeContext? numberType() => getRuleContext<NumberTypeContext>(0);
  BoolTypeContext? boolType() => getRuleContext<BoolTypeContext>(0);
  TextTypeContext? textType() => getRuleContext<TextTypeContext>(0);
  BlobTypeContext? blobType() => getRuleContext<BlobTypeContext>(0);
  NullContext? null_() => getRuleContext<NullContext>(0);
  PrincipalTypeContext? principalType() => getRuleContext<PrincipalTypeContext>(0);
  ReservedTypeContext? reservedType() => getRuleContext<ReservedTypeContext>(0);
  EmptyTypeContext? emptyType() => getRuleContext<EmptyTypeContext>(0);
  PrimTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_primType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitPrimType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class IdTypeContext extends ParserRuleContext {
  IdContext? id() => getRuleContext<IdContext>(0);
  PrimTypeContext? primType() => getRuleContext<PrimTypeContext>(0);
  IdTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_idType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitIdType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class FuncAnnContext extends ParserRuleContext {
  FuncAnnContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_funcAnn;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitFuncAnn(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class FuncTypeContext extends ParserRuleContext {
  List<TupleTypeContext> tupleTypes() => getRuleContexts<TupleTypeContext>();
  TupleTypeContext? tupleType(int i) => getRuleContext<TupleTypeContext>(i);
  FuncAnnContext? funcAnn() => getRuleContext<FuncAnnContext>(0);
  FuncTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_funcType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitFuncType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class MethTypeContext extends ParserRuleContext {
  List<IdTypeContext> idTypes() => getRuleContexts<IdTypeContext>();
  IdTypeContext? idType(int i) => getRuleContext<IdTypeContext>(i);
  FuncTypeContext? funcType() => getRuleContext<FuncTypeContext>(0);
  MethTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_methType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitMethType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class OptTypeContext extends ParserRuleContext {
  DataTypeContext? dataType() => getRuleContext<DataTypeContext>(0);
  OptTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_optType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitOptType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class VecTypeContext extends ParserRuleContext {
  DataTypeContext? dataType() => getRuleContext<DataTypeContext>(0);
  VecTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_vecType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitVecType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class PairTypeContext extends ParserRuleContext {
  IdTypeContext? idType() => getRuleContext<IdTypeContext>(0);
  DataTypeContext? dataType() => getRuleContext<DataTypeContext>(0);
  PairTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_pairType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitPairType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ExprTypeContext extends ParserRuleContext {
  PairTypeContext? pairType() => getRuleContext<PairTypeContext>(0);
  IdTypeContext? idType() => getRuleContext<IdTypeContext>(0);
  VecTypeContext? vecType() => getRuleContext<VecTypeContext>(0);
  OptTypeContext? optType() => getRuleContext<OptTypeContext>(0);
  VariantTypeContext? variantType() => getRuleContext<VariantTypeContext>(0);
  RecordTypeContext? recordType() => getRuleContext<RecordTypeContext>(0);
  RefTypeContext? refType() => getRuleContext<RefTypeContext>(0);
  ExprTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_exprType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitExprType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class RecordTypeContext extends ParserRuleContext {
  List<ExprTypeContext> exprTypes() => getRuleContexts<ExprTypeContext>();
  ExprTypeContext? exprType(int i) => getRuleContext<ExprTypeContext>(i);
  RecordTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_recordType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitRecordType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class VariantTypeContext extends ParserRuleContext {
  List<ExprTypeContext> exprTypes() => getRuleContexts<ExprTypeContext>();
  ExprTypeContext? exprType(int i) => getRuleContext<ExprTypeContext>(i);
  VariantTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_variantType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitVariantType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class TupleTypeContext extends ParserRuleContext {
  List<ExprTypeContext> exprTypes() => getRuleContexts<ExprTypeContext>();
  ExprTypeContext? exprType(int i) => getRuleContext<ExprTypeContext>(i);
  TupleTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_tupleType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitTupleType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class RefTypeContext extends ParserRuleContext {
  FuncTypeContext? funcType() => getRuleContext<FuncTypeContext>(0);
  ActorTypeContext? actorType() => getRuleContext<ActorTypeContext>(0);
  RefTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_refType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitRefType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ActorTypeContext extends ParserRuleContext {
  List<MethTypeContext> methTypes() => getRuleContexts<MethTypeContext>();
  MethTypeContext? methType(int i) => getRuleContext<MethTypeContext>(i);
  ActorTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_actorType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitActorType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class DataTypeContext extends ParserRuleContext {
  IdTypeContext? idType() => getRuleContext<IdTypeContext>(0);
  VecTypeContext? vecType() => getRuleContext<VecTypeContext>(0);
  OptTypeContext? optType() => getRuleContext<OptTypeContext>(0);
  VariantTypeContext? variantType() => getRuleContext<VariantTypeContext>(0);
  RecordTypeContext? recordType() => getRuleContext<RecordTypeContext>(0);
  RefTypeContext? refType() => getRuleContext<RefTypeContext>(0);
  DataTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_dataType;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitDataType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ProgContext extends ParserRuleContext {
  List<ImpContext> imps() => getRuleContexts<ImpContext>();
  ImpContext? imp(int i) => getRuleContext<ImpContext>(i);
  List<DefContext> defs() => getRuleContexts<DefContext>();
  DefContext? def(int i) => getRuleContext<DefContext>(i);
  ActorContext? actor() => getRuleContext<ActorContext>(0);
  ProgContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_prog;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitProg(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ImpContext extends ParserRuleContext {
  ImportPartContext? importPart() => getRuleContext<ImportPartContext>(0);
  ImpContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_imp;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitImp(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class DefContext extends ParserRuleContext {
  IdTypeContext? idType() => getRuleContext<IdTypeContext>(0);
  DataTypeContext? dataType() => getRuleContext<DataTypeContext>(0);
  DefContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_def;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitDef(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ActorContext extends ParserRuleContext {
  ActorTypeContext? actorType() => getRuleContext<ActorTypeContext>(0);
  List<IdTypeContext> idTypes() => getRuleContexts<IdTypeContext>();
  IdTypeContext? idType(int i) => getRuleContext<IdTypeContext>(i);
  TupleTypeContext? tupleType() => getRuleContext<TupleTypeContext>(0);
  ActorContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_actor;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitActor(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class IdContext extends ParserRuleContext {
  TerminalNode? IDENTIFIER() => getToken(CandidParser.TOKEN_IDENTIFIER, 0);
  IdContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_id;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitId(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ImportPartContext extends ParserRuleContext {
  TerminalNode? IMPORT_LETTER() => getToken(CandidParser.TOKEN_IMPORT_LETTER, 0);
  ImportPartContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_importPart;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is CandidVisitor<T>) {
     return visitor.visitImportPart(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

