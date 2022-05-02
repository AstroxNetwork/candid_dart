// Generated from antlr/Candid.g4 by ANTLR 4.10.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'CandidListener.dart';
import 'CandidBaseListener.dart';
const int RULE_null = 0, RULE_natType = 1, RULE_intType = 2, RULE_floatType = 3, 
          RULE_blobType = 4, RULE_numberType = 5, RULE_boolType = 6, RULE_textType = 7, 
          RULE_principalType = 8, RULE_reservedType = 9, RULE_emptyType = 10, 
          RULE_primType = 11, RULE_idType = 12, RULE_funcAnn = 13, RULE_funcType = 14, 
          RULE_methType = 15, RULE_optType = 16, RULE_vecType = 17, RULE_pairType = 18, 
          RULE_exprType = 19, RULE_recordType = 20, RULE_variantType = 21, 
          RULE_tupleType = 22, RULE_refType = 23, RULE_actorType = 24, RULE_dataType = 25, 
          RULE_did = 26, RULE_imp = 27, RULE_def = 28, RULE_actor = 29, 
          RULE_id = 30, RULE_importPart = 31;
class CandidParser extends Parser {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.10.1', RuntimeMetaData.VERSION);
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
                   TOKEN_IDENTIFIER = 40, TOKEN_IMPORT_LETTER = 41, TOKEN_WHITESPACE = 42, 
                   TOKEN_SINGLE_LINE_COMMENT = 43, TOKEN_MULTI_LINE_COMMENT = 44;

  @override
  final List<String> ruleNames = [
    'null', 'natType', 'intType', 'floatType', 'blobType', 'numberType', 
    'boolType', 'textType', 'principalType', 'reservedType', 'emptyType', 
    'primType', 'idType', 'funcAnn', 'funcType', 'methType', 'optType', 
    'vecType', 'pairType', 'exprType', 'recordType', 'variantType', 'tupleType', 
    'refType', 'actorType', 'dataType', 'did', 'imp', 'def', 'actor', 'id', 
    'importPart'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "'null'", "'nat'", "'nat8'", "'nat16'", "'nat32'", "'nat64'", 
      "'int'", "'int8'", "'int16'", "'int32'", "'int64'", "'float32'", "'float64'", 
      "'blob'", "'bool'", "'text'", "'principal'", "'reserved'", "'empty'", 
      "'oneway'", "'query'", "'->'", "':'", "'opt'", "'vec'", "'\"'", "'record'", 
      "'{'", "';'", "'}'", "'variant'", "'('", "','", "')'", "'func'", "'service'", 
      "'import'", "'type'", "'='"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, null, null, null, null, null, null, null, null, null, null, 
      null, null, null, null, null, null, null, null, null, null, null, 
      null, null, null, null, null, null, null, null, null, null, null, 
      null, null, null, null, null, null, null, "IDENTIFIER", "IMPORT_LETTER", 
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
      if (!((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_T__1) | (BigInt.one << TOKEN_T__2) | (BigInt.one << TOKEN_T__3) | (BigInt.one << TOKEN_T__4) | (BigInt.one << TOKEN_T__5))) != BigInt.zero))) {
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
      if (!((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_T__6) | (BigInt.one << TOKEN_T__7) | (BigInt.one << TOKEN_T__8) | (BigInt.one << TOKEN_T__9) | (BigInt.one << TOKEN_T__10))) != BigInt.zero))) {
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
      if (!(_la == TOKEN_T__19 || _la == TOKEN_T__20)) {
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
      match(TOKEN_T__21);
      state = 107;
      tupleType();
      state = 111;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_T__19 || _la == TOKEN_T__20) {
        state = 108;
        funcAnn();
        state = 113;
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

  MethTypeContext methType() {
    dynamic _localctx = MethTypeContext(context, state);
    enterRule(_localctx, 30, RULE_methType);
    try {
      state = 122;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 4, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 114;
        idType();
        state = 115;
        match(TOKEN_T__22);
        state = 116;
        funcType();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 118;
        idType();
        state = 119;
        match(TOKEN_T__22);
        state = 120;
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
      state = 124;
      match(TOKEN_T__23);
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

  VecTypeContext vecType() {
    dynamic _localctx = VecTypeContext(context, state);
    enterRule(_localctx, 34, RULE_vecType);
    try {
      enterOuterAlt(_localctx, 1);
      state = 127;
      match(TOKEN_T__24);
      state = 128;
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
      state = 140;
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
      case TOKEN_IDENTIFIER:
        enterOuterAlt(_localctx, 1);
        state = 130;
        idType();
        state = 131;
        match(TOKEN_T__22);
        state = 132;
        dataType();
        break;
      case TOKEN_T__25:
        enterOuterAlt(_localctx, 2);
        state = 134;
        match(TOKEN_T__25);
        state = 135;
        idType();
        state = 136;
        match(TOKEN_T__25);
        state = 137;
        match(TOKEN_T__22);
        state = 138;
        dataType();
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

  ExprTypeContext exprType() {
    dynamic _localctx = ExprTypeContext(context, state);
    enterRule(_localctx, 38, RULE_exprType);
    try {
      state = 149;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 6, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 142;
        pairType();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 143;
        idType();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 144;
        vecType();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 145;
        optType();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 146;
        variantType();
        break;
      case 6:
        enterOuterAlt(_localctx, 6);
        state = 147;
        recordType();
        break;
      case 7:
        enterOuterAlt(_localctx, 7);
        state = 148;
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
      state = 151;
      match(TOKEN_T__26);
      state = 152;
      match(TOKEN_T__27);
      state = 162;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_T__0) | (BigInt.one << TOKEN_T__1) | (BigInt.one << TOKEN_T__2) | (BigInt.one << TOKEN_T__3) | (BigInt.one << TOKEN_T__4) | (BigInt.one << TOKEN_T__5) | (BigInt.one << TOKEN_T__6) | (BigInt.one << TOKEN_T__7) | (BigInt.one << TOKEN_T__8) | (BigInt.one << TOKEN_T__9) | (BigInt.one << TOKEN_T__10) | (BigInt.one << TOKEN_T__11) | (BigInt.one << TOKEN_T__12) | (BigInt.one << TOKEN_T__13) | (BigInt.one << TOKEN_T__14) | (BigInt.one << TOKEN_T__15) | (BigInt.one << TOKEN_T__16) | (BigInt.one << TOKEN_T__17) | (BigInt.one << TOKEN_T__18) | (BigInt.one << TOKEN_T__23) | (BigInt.one << TOKEN_T__24) | (BigInt.one << TOKEN_T__25) | (BigInt.one << TOKEN_T__26) | (BigInt.one << TOKEN_T__30) | (BigInt.one << TOKEN_T__34) | (BigInt.one << TOKEN_T__35) | (BigInt.one << TOKEN_IDENTIFIER))) != BigInt.zero)) {
        state = 153;
        exprType();
        state = 157;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_T__28) {
          state = 154;
          match(TOKEN_T__28);
          state = 159;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 164;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 165;
      match(TOKEN_T__29);
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
      state = 167;
      match(TOKEN_T__30);
      state = 168;
      match(TOKEN_T__27);
      state = 178;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_T__0) | (BigInt.one << TOKEN_T__1) | (BigInt.one << TOKEN_T__2) | (BigInt.one << TOKEN_T__3) | (BigInt.one << TOKEN_T__4) | (BigInt.one << TOKEN_T__5) | (BigInt.one << TOKEN_T__6) | (BigInt.one << TOKEN_T__7) | (BigInt.one << TOKEN_T__8) | (BigInt.one << TOKEN_T__9) | (BigInt.one << TOKEN_T__10) | (BigInt.one << TOKEN_T__11) | (BigInt.one << TOKEN_T__12) | (BigInt.one << TOKEN_T__13) | (BigInt.one << TOKEN_T__14) | (BigInt.one << TOKEN_T__15) | (BigInt.one << TOKEN_T__16) | (BigInt.one << TOKEN_T__17) | (BigInt.one << TOKEN_T__18) | (BigInt.one << TOKEN_T__23) | (BigInt.one << TOKEN_T__24) | (BigInt.one << TOKEN_T__25) | (BigInt.one << TOKEN_T__26) | (BigInt.one << TOKEN_T__30) | (BigInt.one << TOKEN_T__34) | (BigInt.one << TOKEN_T__35) | (BigInt.one << TOKEN_IDENTIFIER))) != BigInt.zero)) {
        state = 169;
        exprType();
        state = 173;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_T__28) {
          state = 170;
          match(TOKEN_T__28);
          state = 175;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 180;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 181;
      match(TOKEN_T__29);
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
      state = 183;
      match(TOKEN_T__31);
      state = 193;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_T__0) | (BigInt.one << TOKEN_T__1) | (BigInt.one << TOKEN_T__2) | (BigInt.one << TOKEN_T__3) | (BigInt.one << TOKEN_T__4) | (BigInt.one << TOKEN_T__5) | (BigInt.one << TOKEN_T__6) | (BigInt.one << TOKEN_T__7) | (BigInt.one << TOKEN_T__8) | (BigInt.one << TOKEN_T__9) | (BigInt.one << TOKEN_T__10) | (BigInt.one << TOKEN_T__11) | (BigInt.one << TOKEN_T__12) | (BigInt.one << TOKEN_T__13) | (BigInt.one << TOKEN_T__14) | (BigInt.one << TOKEN_T__15) | (BigInt.one << TOKEN_T__16) | (BigInt.one << TOKEN_T__17) | (BigInt.one << TOKEN_T__18) | (BigInt.one << TOKEN_T__23) | (BigInt.one << TOKEN_T__24) | (BigInt.one << TOKEN_T__26) | (BigInt.one << TOKEN_T__30) | (BigInt.one << TOKEN_T__34) | (BigInt.one << TOKEN_T__35) | (BigInt.one << TOKEN_IDENTIFIER))) != BigInt.zero)) {
        state = 184;
        dataType();
        state = 188;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_T__32) {
          state = 185;
          match(TOKEN_T__32);
          state = 190;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 195;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 196;
      match(TOKEN_T__33);
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
      state = 202;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_T__34:
        enterOuterAlt(_localctx, 1);
        state = 198;
        match(TOKEN_T__34);
        state = 199;
        funcType();
        break;
      case TOKEN_T__35:
        enterOuterAlt(_localctx, 2);
        state = 200;
        match(TOKEN_T__35);
        state = 201;
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
      state = 204;
      match(TOKEN_T__27);
      state = 214;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_T__0) | (BigInt.one << TOKEN_T__1) | (BigInt.one << TOKEN_T__2) | (BigInt.one << TOKEN_T__3) | (BigInt.one << TOKEN_T__4) | (BigInt.one << TOKEN_T__5) | (BigInt.one << TOKEN_T__6) | (BigInt.one << TOKEN_T__7) | (BigInt.one << TOKEN_T__8) | (BigInt.one << TOKEN_T__9) | (BigInt.one << TOKEN_T__10) | (BigInt.one << TOKEN_T__11) | (BigInt.one << TOKEN_T__12) | (BigInt.one << TOKEN_T__13) | (BigInt.one << TOKEN_T__14) | (BigInt.one << TOKEN_T__15) | (BigInt.one << TOKEN_T__16) | (BigInt.one << TOKEN_T__17) | (BigInt.one << TOKEN_T__18) | (BigInt.one << TOKEN_IDENTIFIER))) != BigInt.zero)) {
        state = 205;
        methType();
        state = 209;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_T__28) {
          state = 206;
          match(TOKEN_T__28);
          state = 211;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 216;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 217;
      match(TOKEN_T__29);
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
      state = 225;
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
      case TOKEN_IDENTIFIER:
        enterOuterAlt(_localctx, 1);
        state = 219;
        idType();
        break;
      case TOKEN_T__24:
        enterOuterAlt(_localctx, 2);
        state = 220;
        vecType();
        break;
      case TOKEN_T__23:
        enterOuterAlt(_localctx, 3);
        state = 221;
        optType();
        break;
      case TOKEN_T__30:
        enterOuterAlt(_localctx, 4);
        state = 222;
        variantType();
        break;
      case TOKEN_T__26:
        enterOuterAlt(_localctx, 5);
        state = 223;
        recordType();
        break;
      case TOKEN_T__34:
      case TOKEN_T__35:
        enterOuterAlt(_localctx, 6);
        state = 224;
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

  DidContext did() {
    dynamic _localctx = DidContext(context, state);
    enterRule(_localctx, 52, RULE_did);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 230;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_T__36) {
        state = 227;
        imp();
        state = 232;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 236;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_T__37) {
        state = 233;
        def();
        state = 238;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 240;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_T__35) {
        state = 239;
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
      state = 242;
      match(TOKEN_T__36);
      state = 243;
      match(TOKEN_T__25);
      state = 244;
      importPart();
      state = 245;
      match(TOKEN_T__25);
      state = 249;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_T__28) {
        state = 246;
        match(TOKEN_T__28);
        state = 251;
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
      state = 252;
      match(TOKEN_T__37);
      state = 253;
      idType();
      state = 254;
      match(TOKEN_T__38);
      state = 255;
      dataType();
      state = 259;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_T__28) {
        state = 256;
        match(TOKEN_T__28);
        state = 261;
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
      state = 296;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 28, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 262;
        match(TOKEN_T__35);
        state = 264;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if ((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_T__0) | (BigInt.one << TOKEN_T__1) | (BigInt.one << TOKEN_T__2) | (BigInt.one << TOKEN_T__3) | (BigInt.one << TOKEN_T__4) | (BigInt.one << TOKEN_T__5) | (BigInt.one << TOKEN_T__6) | (BigInt.one << TOKEN_T__7) | (BigInt.one << TOKEN_T__8) | (BigInt.one << TOKEN_T__9) | (BigInt.one << TOKEN_T__10) | (BigInt.one << TOKEN_T__11) | (BigInt.one << TOKEN_T__12) | (BigInt.one << TOKEN_T__13) | (BigInt.one << TOKEN_T__14) | (BigInt.one << TOKEN_T__15) | (BigInt.one << TOKEN_T__16) | (BigInt.one << TOKEN_T__17) | (BigInt.one << TOKEN_T__18) | (BigInt.one << TOKEN_IDENTIFIER))) != BigInt.zero)) {
          state = 263;
          idType();
        }

        state = 266;
        match(TOKEN_T__22);
        state = 270;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_T__31) {
          state = 267;
          tupleType();
          state = 268;
          match(TOKEN_T__21);
        }

        state = 272;
        actorType();
        state = 276;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_T__28) {
          state = 273;
          match(TOKEN_T__28);
          state = 278;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 279;
        match(TOKEN_T__35);
        state = 281;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if ((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_T__0) | (BigInt.one << TOKEN_T__1) | (BigInt.one << TOKEN_T__2) | (BigInt.one << TOKEN_T__3) | (BigInt.one << TOKEN_T__4) | (BigInt.one << TOKEN_T__5) | (BigInt.one << TOKEN_T__6) | (BigInt.one << TOKEN_T__7) | (BigInt.one << TOKEN_T__8) | (BigInt.one << TOKEN_T__9) | (BigInt.one << TOKEN_T__10) | (BigInt.one << TOKEN_T__11) | (BigInt.one << TOKEN_T__12) | (BigInt.one << TOKEN_T__13) | (BigInt.one << TOKEN_T__14) | (BigInt.one << TOKEN_T__15) | (BigInt.one << TOKEN_T__16) | (BigInt.one << TOKEN_T__17) | (BigInt.one << TOKEN_T__18) | (BigInt.one << TOKEN_IDENTIFIER))) != BigInt.zero)) {
          state = 280;
          idType();
        }

        state = 283;
        match(TOKEN_T__22);
        state = 287;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_T__31) {
          state = 284;
          tupleType();
          state = 285;
          match(TOKEN_T__21);
        }

        state = 289;
        idType();
        state = 293;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_T__28) {
          state = 290;
          match(TOKEN_T__28);
          state = 295;
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
      enterOuterAlt(_localctx, 1);
      state = 298;
      match(TOKEN_IDENTIFIER);
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
      state = 300;
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
      4,1,44,303,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,
      2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,
      14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,
      2,21,7,21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,2,27,7,
      27,2,28,7,28,2,29,7,29,2,30,7,30,2,31,7,31,1,0,1,0,1,1,1,1,1,2,1,2,
      1,3,1,3,1,4,1,4,1,5,1,5,1,5,3,5,78,8,5,1,6,1,6,1,7,1,7,1,8,1,8,1,9,
      1,9,1,10,1,10,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,3,11,98,8,11,
      1,12,1,12,3,12,102,8,12,1,13,1,13,1,14,1,14,1,14,1,14,5,14,110,8,14,
      10,14,12,14,113,9,14,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,3,15,
      123,8,15,1,16,1,16,1,16,1,17,1,17,1,17,1,18,1,18,1,18,1,18,1,18,1,
      18,1,18,1,18,1,18,1,18,3,18,141,8,18,1,19,1,19,1,19,1,19,1,19,1,19,
      1,19,3,19,150,8,19,1,20,1,20,1,20,1,20,5,20,156,8,20,10,20,12,20,159,
      9,20,5,20,161,8,20,10,20,12,20,164,9,20,1,20,1,20,1,21,1,21,1,21,1,
      21,5,21,172,8,21,10,21,12,21,175,9,21,5,21,177,8,21,10,21,12,21,180,
      9,21,1,21,1,21,1,22,1,22,1,22,5,22,187,8,22,10,22,12,22,190,9,22,5,
      22,192,8,22,10,22,12,22,195,9,22,1,22,1,22,1,23,1,23,1,23,1,23,3,23,
      203,8,23,1,24,1,24,1,24,5,24,208,8,24,10,24,12,24,211,9,24,5,24,213,
      8,24,10,24,12,24,216,9,24,1,24,1,24,1,25,1,25,1,25,1,25,1,25,1,25,
      3,25,226,8,25,1,26,5,26,229,8,26,10,26,12,26,232,9,26,1,26,5,26,235,
      8,26,10,26,12,26,238,9,26,1,26,3,26,241,8,26,1,27,1,27,1,27,1,27,1,
      27,5,27,248,8,27,10,27,12,27,251,9,27,1,28,1,28,1,28,1,28,1,28,5,28,
      258,8,28,10,28,12,28,261,9,28,1,29,1,29,3,29,265,8,29,1,29,1,29,1,
      29,1,29,3,29,271,8,29,1,29,1,29,5,29,275,8,29,10,29,12,29,278,9,29,
      1,29,1,29,3,29,282,8,29,1,29,1,29,1,29,1,29,3,29,288,8,29,1,29,1,29,
      5,29,292,8,29,10,29,12,29,295,9,29,3,29,297,8,29,1,30,1,30,1,31,1,
      31,1,31,0,0,32,0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,
      38,40,42,44,46,48,50,52,54,56,58,60,62,0,4,1,0,2,6,1,0,7,11,1,0,12,
      13,1,0,20,21,315,0,64,1,0,0,0,2,66,1,0,0,0,4,68,1,0,0,0,6,70,1,0,0,
      0,8,72,1,0,0,0,10,77,1,0,0,0,12,79,1,0,0,0,14,81,1,0,0,0,16,83,1,0,
      0,0,18,85,1,0,0,0,20,87,1,0,0,0,22,97,1,0,0,0,24,101,1,0,0,0,26,103,
      1,0,0,0,28,105,1,0,0,0,30,122,1,0,0,0,32,124,1,0,0,0,34,127,1,0,0,
      0,36,140,1,0,0,0,38,149,1,0,0,0,40,151,1,0,0,0,42,167,1,0,0,0,44,183,
      1,0,0,0,46,202,1,0,0,0,48,204,1,0,0,0,50,225,1,0,0,0,52,230,1,0,0,
      0,54,242,1,0,0,0,56,252,1,0,0,0,58,296,1,0,0,0,60,298,1,0,0,0,62,300,
      1,0,0,0,64,65,5,1,0,0,65,1,1,0,0,0,66,67,7,0,0,0,67,3,1,0,0,0,68,69,
      7,1,0,0,69,5,1,0,0,0,70,71,7,2,0,0,71,7,1,0,0,0,72,73,5,14,0,0,73,
      9,1,0,0,0,74,78,3,2,1,0,75,78,3,4,2,0,76,78,3,6,3,0,77,74,1,0,0,0,
      77,75,1,0,0,0,77,76,1,0,0,0,78,11,1,0,0,0,79,80,5,15,0,0,80,13,1,0,
      0,0,81,82,5,16,0,0,82,15,1,0,0,0,83,84,5,17,0,0,84,17,1,0,0,0,85,86,
      5,18,0,0,86,19,1,0,0,0,87,88,5,19,0,0,88,21,1,0,0,0,89,98,3,10,5,0,
      90,98,3,12,6,0,91,98,3,14,7,0,92,98,3,8,4,0,93,98,3,0,0,0,94,98,3,
      16,8,0,95,98,3,18,9,0,96,98,3,20,10,0,97,89,1,0,0,0,97,90,1,0,0,0,
      97,91,1,0,0,0,97,92,1,0,0,0,97,93,1,0,0,0,97,94,1,0,0,0,97,95,1,0,
      0,0,97,96,1,0,0,0,98,23,1,0,0,0,99,102,3,60,30,0,100,102,3,22,11,0,
      101,99,1,0,0,0,101,100,1,0,0,0,102,25,1,0,0,0,103,104,7,3,0,0,104,
      27,1,0,0,0,105,106,3,44,22,0,106,107,5,22,0,0,107,111,3,44,22,0,108,
      110,3,26,13,0,109,108,1,0,0,0,110,113,1,0,0,0,111,109,1,0,0,0,111,
      112,1,0,0,0,112,29,1,0,0,0,113,111,1,0,0,0,114,115,3,24,12,0,115,116,
      5,23,0,0,116,117,3,28,14,0,117,123,1,0,0,0,118,119,3,24,12,0,119,120,
      5,23,0,0,120,121,3,24,12,0,121,123,1,0,0,0,122,114,1,0,0,0,122,118,
      1,0,0,0,123,31,1,0,0,0,124,125,5,24,0,0,125,126,3,50,25,0,126,33,1,
      0,0,0,127,128,5,25,0,0,128,129,3,50,25,0,129,35,1,0,0,0,130,131,3,
      24,12,0,131,132,5,23,0,0,132,133,3,50,25,0,133,141,1,0,0,0,134,135,
      5,26,0,0,135,136,3,24,12,0,136,137,5,26,0,0,137,138,5,23,0,0,138,139,
      3,50,25,0,139,141,1,0,0,0,140,130,1,0,0,0,140,134,1,0,0,0,141,37,1,
      0,0,0,142,150,3,36,18,0,143,150,3,24,12,0,144,150,3,34,17,0,145,150,
      3,32,16,0,146,150,3,42,21,0,147,150,3,40,20,0,148,150,3,46,23,0,149,
      142,1,0,0,0,149,143,1,0,0,0,149,144,1,0,0,0,149,145,1,0,0,0,149,146,
      1,0,0,0,149,147,1,0,0,0,149,148,1,0,0,0,150,39,1,0,0,0,151,152,5,27,
      0,0,152,162,5,28,0,0,153,157,3,38,19,0,154,156,5,29,0,0,155,154,1,
      0,0,0,156,159,1,0,0,0,157,155,1,0,0,0,157,158,1,0,0,0,158,161,1,0,
      0,0,159,157,1,0,0,0,160,153,1,0,0,0,161,164,1,0,0,0,162,160,1,0,0,
      0,162,163,1,0,0,0,163,165,1,0,0,0,164,162,1,0,0,0,165,166,5,30,0,0,
      166,41,1,0,0,0,167,168,5,31,0,0,168,178,5,28,0,0,169,173,3,38,19,0,
      170,172,5,29,0,0,171,170,1,0,0,0,172,175,1,0,0,0,173,171,1,0,0,0,173,
      174,1,0,0,0,174,177,1,0,0,0,175,173,1,0,0,0,176,169,1,0,0,0,177,180,
      1,0,0,0,178,176,1,0,0,0,178,179,1,0,0,0,179,181,1,0,0,0,180,178,1,
      0,0,0,181,182,5,30,0,0,182,43,1,0,0,0,183,193,5,32,0,0,184,188,3,50,
      25,0,185,187,5,33,0,0,186,185,1,0,0,0,187,190,1,0,0,0,188,186,1,0,
      0,0,188,189,1,0,0,0,189,192,1,0,0,0,190,188,1,0,0,0,191,184,1,0,0,
      0,192,195,1,0,0,0,193,191,1,0,0,0,193,194,1,0,0,0,194,196,1,0,0,0,
      195,193,1,0,0,0,196,197,5,34,0,0,197,45,1,0,0,0,198,199,5,35,0,0,199,
      203,3,28,14,0,200,201,5,36,0,0,201,203,3,48,24,0,202,198,1,0,0,0,202,
      200,1,0,0,0,203,47,1,0,0,0,204,214,5,28,0,0,205,209,3,30,15,0,206,
      208,5,29,0,0,207,206,1,0,0,0,208,211,1,0,0,0,209,207,1,0,0,0,209,210,
      1,0,0,0,210,213,1,0,0,0,211,209,1,0,0,0,212,205,1,0,0,0,213,216,1,
      0,0,0,214,212,1,0,0,0,214,215,1,0,0,0,215,217,1,0,0,0,216,214,1,0,
      0,0,217,218,5,30,0,0,218,49,1,0,0,0,219,226,3,24,12,0,220,226,3,34,
      17,0,221,226,3,32,16,0,222,226,3,42,21,0,223,226,3,40,20,0,224,226,
      3,46,23,0,225,219,1,0,0,0,225,220,1,0,0,0,225,221,1,0,0,0,225,222,
      1,0,0,0,225,223,1,0,0,0,225,224,1,0,0,0,226,51,1,0,0,0,227,229,3,54,
      27,0,228,227,1,0,0,0,229,232,1,0,0,0,230,228,1,0,0,0,230,231,1,0,0,
      0,231,236,1,0,0,0,232,230,1,0,0,0,233,235,3,56,28,0,234,233,1,0,0,
      0,235,238,1,0,0,0,236,234,1,0,0,0,236,237,1,0,0,0,237,240,1,0,0,0,
      238,236,1,0,0,0,239,241,3,58,29,0,240,239,1,0,0,0,240,241,1,0,0,0,
      241,53,1,0,0,0,242,243,5,37,0,0,243,244,5,26,0,0,244,245,3,62,31,0,
      245,249,5,26,0,0,246,248,5,29,0,0,247,246,1,0,0,0,248,251,1,0,0,0,
      249,247,1,0,0,0,249,250,1,0,0,0,250,55,1,0,0,0,251,249,1,0,0,0,252,
      253,5,38,0,0,253,254,3,24,12,0,254,255,5,39,0,0,255,259,3,50,25,0,
      256,258,5,29,0,0,257,256,1,0,0,0,258,261,1,0,0,0,259,257,1,0,0,0,259,
      260,1,0,0,0,260,57,1,0,0,0,261,259,1,0,0,0,262,264,5,36,0,0,263,265,
      3,24,12,0,264,263,1,0,0,0,264,265,1,0,0,0,265,266,1,0,0,0,266,270,
      5,23,0,0,267,268,3,44,22,0,268,269,5,22,0,0,269,271,1,0,0,0,270,267,
      1,0,0,0,270,271,1,0,0,0,271,272,1,0,0,0,272,276,3,48,24,0,273,275,
      5,29,0,0,274,273,1,0,0,0,275,278,1,0,0,0,276,274,1,0,0,0,276,277,1,
      0,0,0,277,297,1,0,0,0,278,276,1,0,0,0,279,281,5,36,0,0,280,282,3,24,
      12,0,281,280,1,0,0,0,281,282,1,0,0,0,282,283,1,0,0,0,283,287,5,23,
      0,0,284,285,3,44,22,0,285,286,5,22,0,0,286,288,1,0,0,0,287,284,1,0,
      0,0,287,288,1,0,0,0,288,289,1,0,0,0,289,293,3,24,12,0,290,292,5,29,
      0,0,291,290,1,0,0,0,292,295,1,0,0,0,293,291,1,0,0,0,293,294,1,0,0,
      0,294,297,1,0,0,0,295,293,1,0,0,0,296,262,1,0,0,0,296,279,1,0,0,0,
      297,59,1,0,0,0,298,299,5,40,0,0,299,61,1,0,0,0,300,301,5,41,0,0,301,
      63,1,0,0,0,29,77,97,101,111,122,140,149,157,162,173,178,188,193,202,
      209,214,225,230,236,240,249,259,264,270,276,281,287,293,296
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}
class NullContext extends ParserRuleContext {
  NullContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_null;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterNull(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitNull(this);
  }
}

class NatTypeContext extends ParserRuleContext {
  NatTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_natType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterNatType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitNatType(this);
  }
}

class IntTypeContext extends ParserRuleContext {
  IntTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_intType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterIntType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitIntType(this);
  }
}

class FloatTypeContext extends ParserRuleContext {
  FloatTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_floatType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterFloatType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitFloatType(this);
  }
}

class BlobTypeContext extends ParserRuleContext {
  BlobTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_blobType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterBlobType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitBlobType(this);
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
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterNumberType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitNumberType(this);
  }
}

class BoolTypeContext extends ParserRuleContext {
  BoolTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_boolType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterBoolType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitBoolType(this);
  }
}

class TextTypeContext extends ParserRuleContext {
  TextTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_textType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterTextType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitTextType(this);
  }
}

class PrincipalTypeContext extends ParserRuleContext {
  PrincipalTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_principalType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterPrincipalType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitPrincipalType(this);
  }
}

class ReservedTypeContext extends ParserRuleContext {
  ReservedTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_reservedType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterReservedType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitReservedType(this);
  }
}

class EmptyTypeContext extends ParserRuleContext {
  EmptyTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_emptyType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterEmptyType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitEmptyType(this);
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
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterPrimType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitPrimType(this);
  }
}

class IdTypeContext extends ParserRuleContext {
  IdContext? id() => getRuleContext<IdContext>(0);
  PrimTypeContext? primType() => getRuleContext<PrimTypeContext>(0);
  IdTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_idType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterIdType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitIdType(this);
  }
}

class FuncAnnContext extends ParserRuleContext {
  FuncAnnContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_funcAnn;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterFuncAnn(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitFuncAnn(this);
  }
}

class FuncTypeContext extends ParserRuleContext {
  List<TupleTypeContext> tupleTypes() => getRuleContexts<TupleTypeContext>();
  TupleTypeContext? tupleType(int i) => getRuleContext<TupleTypeContext>(i);
  List<FuncAnnContext> funcAnns() => getRuleContexts<FuncAnnContext>();
  FuncAnnContext? funcAnn(int i) => getRuleContext<FuncAnnContext>(i);
  FuncTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_funcType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterFuncType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitFuncType(this);
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
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterMethType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitMethType(this);
  }
}

class OptTypeContext extends ParserRuleContext {
  DataTypeContext? dataType() => getRuleContext<DataTypeContext>(0);
  OptTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_optType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterOptType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitOptType(this);
  }
}

class VecTypeContext extends ParserRuleContext {
  DataTypeContext? dataType() => getRuleContext<DataTypeContext>(0);
  VecTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_vecType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterVecType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitVecType(this);
  }
}

class PairTypeContext extends ParserRuleContext {
  IdTypeContext? idType() => getRuleContext<IdTypeContext>(0);
  DataTypeContext? dataType() => getRuleContext<DataTypeContext>(0);
  PairTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_pairType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterPairType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitPairType(this);
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
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterExprType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitExprType(this);
  }
}

class RecordTypeContext extends ParserRuleContext {
  List<ExprTypeContext> exprTypes() => getRuleContexts<ExprTypeContext>();
  ExprTypeContext? exprType(int i) => getRuleContext<ExprTypeContext>(i);
  RecordTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_recordType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterRecordType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitRecordType(this);
  }
}

class VariantTypeContext extends ParserRuleContext {
  List<ExprTypeContext> exprTypes() => getRuleContexts<ExprTypeContext>();
  ExprTypeContext? exprType(int i) => getRuleContext<ExprTypeContext>(i);
  VariantTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_variantType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterVariantType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitVariantType(this);
  }
}

class TupleTypeContext extends ParserRuleContext {
  List<DataTypeContext> dataTypes() => getRuleContexts<DataTypeContext>();
  DataTypeContext? dataType(int i) => getRuleContext<DataTypeContext>(i);
  TupleTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_tupleType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterTupleType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitTupleType(this);
  }
}

class RefTypeContext extends ParserRuleContext {
  FuncTypeContext? funcType() => getRuleContext<FuncTypeContext>(0);
  ActorTypeContext? actorType() => getRuleContext<ActorTypeContext>(0);
  RefTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_refType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterRefType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitRefType(this);
  }
}

class ActorTypeContext extends ParserRuleContext {
  List<MethTypeContext> methTypes() => getRuleContexts<MethTypeContext>();
  MethTypeContext? methType(int i) => getRuleContext<MethTypeContext>(i);
  ActorTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_actorType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterActorType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitActorType(this);
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
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterDataType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitDataType(this);
  }
}

class DidContext extends ParserRuleContext {
  List<ImpContext> imps() => getRuleContexts<ImpContext>();
  ImpContext? imp(int i) => getRuleContext<ImpContext>(i);
  List<DefContext> defs() => getRuleContexts<DefContext>();
  DefContext? def(int i) => getRuleContext<DefContext>(i);
  ActorContext? actor() => getRuleContext<ActorContext>(0);
  DidContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_did;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterDid(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitDid(this);
  }
}

class ImpContext extends ParserRuleContext {
  ImportPartContext? importPart() => getRuleContext<ImportPartContext>(0);
  ImpContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_imp;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterImp(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitImp(this);
  }
}

class DefContext extends ParserRuleContext {
  IdTypeContext? idType() => getRuleContext<IdTypeContext>(0);
  DataTypeContext? dataType() => getRuleContext<DataTypeContext>(0);
  DefContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_def;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterDef(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitDef(this);
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
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterActor(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitActor(this);
  }
}

class IdContext extends ParserRuleContext {
  TerminalNode? IDENTIFIER() => getToken(CandidParser.TOKEN_IDENTIFIER, 0);
  IdContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_id;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterId(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitId(this);
  }
}

class ImportPartContext extends ParserRuleContext {
  TerminalNode? IMPORT_LETTER() => getToken(CandidParser.TOKEN_IMPORT_LETTER, 0);
  ImportPartContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_importPart;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.enterImportPart(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is CandidListener) listener.exitImportPart(this);
  }
}

