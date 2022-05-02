// Generated from antlr/Candid.g4 by ANTLR 4.10.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';


class CandidLexer extends Lexer {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.10.1', RuntimeMetaData.VERSION);

  static final List<DFA> _decisionToDFA = List.generate(
        _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int
    TOKEN_T__0 = 1, TOKEN_T__1 = 2, TOKEN_T__2 = 3, TOKEN_T__3 = 4, TOKEN_T__4 = 5, 
    TOKEN_T__5 = 6, TOKEN_T__6 = 7, TOKEN_T__7 = 8, TOKEN_T__8 = 9, TOKEN_T__9 = 10, 
    TOKEN_T__10 = 11, TOKEN_T__11 = 12, TOKEN_T__12 = 13, TOKEN_T__13 = 14, 
    TOKEN_T__14 = 15, TOKEN_T__15 = 16, TOKEN_T__16 = 17, TOKEN_T__17 = 18, 
    TOKEN_T__18 = 19, TOKEN_T__19 = 20, TOKEN_T__20 = 21, TOKEN_T__21 = 22, 
    TOKEN_T__22 = 23, TOKEN_T__23 = 24, TOKEN_T__24 = 25, TOKEN_T__25 = 26, 
    TOKEN_T__26 = 27, TOKEN_T__27 = 28, TOKEN_T__28 = 29, TOKEN_T__29 = 30, 
    TOKEN_T__30 = 31, TOKEN_T__31 = 32, TOKEN_T__32 = 33, TOKEN_T__33 = 34, 
    TOKEN_T__34 = 35, TOKEN_T__35 = 36, TOKEN_T__36 = 37, TOKEN_T__37 = 38, 
    TOKEN_T__38 = 39, TOKEN_IDENTIFIER = 40, TOKEN_IMPORT_LETTER = 41, TOKEN_WHITESPACE = 42, 
    TOKEN_SINGLE_LINE_COMMENT = 43, TOKEN_MULTI_LINE_COMMENT = 44;
  @override
  final List<String> channelNames = [
    'DEFAULT_TOKEN_CHANNEL', 'HIDDEN'
  ];

  @override
  final List<String> modeNames = [
    'DEFAULT_MODE'
  ];

  @override
  final List<String> ruleNames = [
    'T__0', 'T__1', 'T__2', 'T__3', 'T__4', 'T__5', 'T__6', 'T__7', 'T__8', 
    'T__9', 'T__10', 'T__11', 'T__12', 'T__13', 'T__14', 'T__15', 'T__16', 
    'T__17', 'T__18', 'T__19', 'T__20', 'T__21', 'T__22', 'T__23', 'T__24', 
    'T__25', 'T__26', 'T__27', 'T__28', 'T__29', 'T__30', 'T__31', 'T__32', 
    'T__33', 'T__34', 'T__35', 'T__36', 'T__37', 'T__38', 'IDENTIFIER', 
    'IMPORT_LETTER', 'WHITESPACE', 'SINGLE_LINE_COMMENT', 'MULTI_LINE_COMMENT'
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


  CandidLexer(CharStream input) : super(input) {
    interpreter = LexerATNSimulator(_ATN, _decisionToDFA, _sharedContextCache, recog: this);
  }

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  String get grammarFileName => 'Candid.g4';

  @override
  ATN getATN() { return _ATN; }

  static const List<int> _serializedATN = [
      4,0,44,328,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,
      6,7,6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,
      13,2,14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,
      7,20,2,21,7,21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,2,
      27,7,27,2,28,7,28,2,29,7,29,2,30,7,30,2,31,7,31,2,32,7,32,2,33,7,33,
      2,34,7,34,2,35,7,35,2,36,7,36,2,37,7,37,2,38,7,38,2,39,7,39,2,40,7,
      40,2,41,7,41,2,42,7,42,2,43,7,43,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,
      1,1,2,1,2,1,2,1,2,1,2,1,3,1,3,1,3,1,3,1,3,1,3,1,4,1,4,1,4,1,4,1,4,
      1,4,1,5,1,5,1,5,1,5,1,5,1,5,1,6,1,6,1,6,1,6,1,7,1,7,1,7,1,7,1,7,1,
      8,1,8,1,8,1,8,1,8,1,8,1,9,1,9,1,9,1,9,1,9,1,9,1,10,1,10,1,10,1,10,
      1,10,1,10,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,12,1,12,1,12,1,
      12,1,12,1,12,1,12,1,12,1,13,1,13,1,13,1,13,1,13,1,14,1,14,1,14,1,14,
      1,14,1,15,1,15,1,15,1,15,1,15,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,
      16,1,16,1,16,1,17,1,17,1,17,1,17,1,17,1,17,1,17,1,17,1,17,1,18,1,18,
      1,18,1,18,1,18,1,18,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,20,1,20,1,
      20,1,20,1,20,1,20,1,21,1,21,1,21,1,22,1,22,1,23,1,23,1,23,1,23,1,24,
      1,24,1,24,1,24,1,25,1,25,1,26,1,26,1,26,1,26,1,26,1,26,1,26,1,27,1,
      27,1,28,1,28,1,29,1,29,1,30,1,30,1,30,1,30,1,30,1,30,1,30,1,30,1,31,
      1,31,1,32,1,32,1,33,1,33,1,34,1,34,1,34,1,34,1,34,1,35,1,35,1,35,1,
      35,1,35,1,35,1,35,1,35,1,36,1,36,1,36,1,36,1,36,1,36,1,36,1,37,1,37,
      1,37,1,37,1,37,1,38,1,38,1,39,4,39,288,8,39,11,39,12,39,289,1,40,4,
      40,293,8,40,11,40,12,40,294,1,41,4,41,298,8,41,11,41,12,41,299,1,41,
      1,41,1,42,1,42,1,42,1,42,5,42,308,8,42,10,42,12,42,311,9,42,1,42,1,
      42,1,43,1,43,1,43,1,43,5,43,319,8,43,10,43,12,43,322,9,43,1,43,1,43,
      1,43,1,43,1,43,1,320,0,44,1,1,3,2,5,3,7,4,9,5,11,6,13,7,15,8,17,9,
      19,10,21,11,23,12,25,13,27,14,29,15,31,16,33,17,35,18,37,19,39,20,
      41,21,43,22,45,23,47,24,49,25,51,26,53,27,55,28,57,29,59,30,61,31,
      63,32,65,33,67,34,69,35,71,36,73,37,75,38,77,39,79,40,81,41,83,42,
      85,43,87,44,1,0,4,4,0,48,57,65,90,95,95,97,122,5,0,46,46,48,57,65,
      90,95,95,97,122,3,0,9,10,13,13,32,32,2,0,10,10,13,13,332,0,1,1,0,0,
      0,0,3,1,0,0,0,0,5,1,0,0,0,0,7,1,0,0,0,0,9,1,0,0,0,0,11,1,0,0,0,0,13,
      1,0,0,0,0,15,1,0,0,0,0,17,1,0,0,0,0,19,1,0,0,0,0,21,1,0,0,0,0,23,1,
      0,0,0,0,25,1,0,0,0,0,27,1,0,0,0,0,29,1,0,0,0,0,31,1,0,0,0,0,33,1,0,
      0,0,0,35,1,0,0,0,0,37,1,0,0,0,0,39,1,0,0,0,0,41,1,0,0,0,0,43,1,0,0,
      0,0,45,1,0,0,0,0,47,1,0,0,0,0,49,1,0,0,0,0,51,1,0,0,0,0,53,1,0,0,0,
      0,55,1,0,0,0,0,57,1,0,0,0,0,59,1,0,0,0,0,61,1,0,0,0,0,63,1,0,0,0,0,
      65,1,0,0,0,0,67,1,0,0,0,0,69,1,0,0,0,0,71,1,0,0,0,0,73,1,0,0,0,0,75,
      1,0,0,0,0,77,1,0,0,0,0,79,1,0,0,0,0,81,1,0,0,0,0,83,1,0,0,0,0,85,1,
      0,0,0,0,87,1,0,0,0,1,89,1,0,0,0,3,94,1,0,0,0,5,98,1,0,0,0,7,103,1,
      0,0,0,9,109,1,0,0,0,11,115,1,0,0,0,13,121,1,0,0,0,15,125,1,0,0,0,17,
      130,1,0,0,0,19,136,1,0,0,0,21,142,1,0,0,0,23,148,1,0,0,0,25,156,1,
      0,0,0,27,164,1,0,0,0,29,169,1,0,0,0,31,174,1,0,0,0,33,179,1,0,0,0,
      35,189,1,0,0,0,37,198,1,0,0,0,39,204,1,0,0,0,41,211,1,0,0,0,43,217,
      1,0,0,0,45,220,1,0,0,0,47,222,1,0,0,0,49,226,1,0,0,0,51,230,1,0,0,
      0,53,232,1,0,0,0,55,239,1,0,0,0,57,241,1,0,0,0,59,243,1,0,0,0,61,245,
      1,0,0,0,63,253,1,0,0,0,65,255,1,0,0,0,67,257,1,0,0,0,69,259,1,0,0,
      0,71,264,1,0,0,0,73,272,1,0,0,0,75,279,1,0,0,0,77,284,1,0,0,0,79,287,
      1,0,0,0,81,292,1,0,0,0,83,297,1,0,0,0,85,303,1,0,0,0,87,314,1,0,0,
      0,89,90,5,110,0,0,90,91,5,117,0,0,91,92,5,108,0,0,92,93,5,108,0,0,
      93,2,1,0,0,0,94,95,5,110,0,0,95,96,5,97,0,0,96,97,5,116,0,0,97,4,1,
      0,0,0,98,99,5,110,0,0,99,100,5,97,0,0,100,101,5,116,0,0,101,102,5,
      56,0,0,102,6,1,0,0,0,103,104,5,110,0,0,104,105,5,97,0,0,105,106,5,
      116,0,0,106,107,5,49,0,0,107,108,5,54,0,0,108,8,1,0,0,0,109,110,5,
      110,0,0,110,111,5,97,0,0,111,112,5,116,0,0,112,113,5,51,0,0,113,114,
      5,50,0,0,114,10,1,0,0,0,115,116,5,110,0,0,116,117,5,97,0,0,117,118,
      5,116,0,0,118,119,5,54,0,0,119,120,5,52,0,0,120,12,1,0,0,0,121,122,
      5,105,0,0,122,123,5,110,0,0,123,124,5,116,0,0,124,14,1,0,0,0,125,126,
      5,105,0,0,126,127,5,110,0,0,127,128,5,116,0,0,128,129,5,56,0,0,129,
      16,1,0,0,0,130,131,5,105,0,0,131,132,5,110,0,0,132,133,5,116,0,0,133,
      134,5,49,0,0,134,135,5,54,0,0,135,18,1,0,0,0,136,137,5,105,0,0,137,
      138,5,110,0,0,138,139,5,116,0,0,139,140,5,51,0,0,140,141,5,50,0,0,
      141,20,1,0,0,0,142,143,5,105,0,0,143,144,5,110,0,0,144,145,5,116,0,
      0,145,146,5,54,0,0,146,147,5,52,0,0,147,22,1,0,0,0,148,149,5,102,0,
      0,149,150,5,108,0,0,150,151,5,111,0,0,151,152,5,97,0,0,152,153,5,116,
      0,0,153,154,5,51,0,0,154,155,5,50,0,0,155,24,1,0,0,0,156,157,5,102,
      0,0,157,158,5,108,0,0,158,159,5,111,0,0,159,160,5,97,0,0,160,161,5,
      116,0,0,161,162,5,54,0,0,162,163,5,52,0,0,163,26,1,0,0,0,164,165,5,
      98,0,0,165,166,5,108,0,0,166,167,5,111,0,0,167,168,5,98,0,0,168,28,
      1,0,0,0,169,170,5,98,0,0,170,171,5,111,0,0,171,172,5,111,0,0,172,173,
      5,108,0,0,173,30,1,0,0,0,174,175,5,116,0,0,175,176,5,101,0,0,176,177,
      5,120,0,0,177,178,5,116,0,0,178,32,1,0,0,0,179,180,5,112,0,0,180,181,
      5,114,0,0,181,182,5,105,0,0,182,183,5,110,0,0,183,184,5,99,0,0,184,
      185,5,105,0,0,185,186,5,112,0,0,186,187,5,97,0,0,187,188,5,108,0,0,
      188,34,1,0,0,0,189,190,5,114,0,0,190,191,5,101,0,0,191,192,5,115,0,
      0,192,193,5,101,0,0,193,194,5,114,0,0,194,195,5,118,0,0,195,196,5,
      101,0,0,196,197,5,100,0,0,197,36,1,0,0,0,198,199,5,101,0,0,199,200,
      5,109,0,0,200,201,5,112,0,0,201,202,5,116,0,0,202,203,5,121,0,0,203,
      38,1,0,0,0,204,205,5,111,0,0,205,206,5,110,0,0,206,207,5,101,0,0,207,
      208,5,119,0,0,208,209,5,97,0,0,209,210,5,121,0,0,210,40,1,0,0,0,211,
      212,5,113,0,0,212,213,5,117,0,0,213,214,5,101,0,0,214,215,5,114,0,
      0,215,216,5,121,0,0,216,42,1,0,0,0,217,218,5,45,0,0,218,219,5,62,0,
      0,219,44,1,0,0,0,220,221,5,58,0,0,221,46,1,0,0,0,222,223,5,111,0,0,
      223,224,5,112,0,0,224,225,5,116,0,0,225,48,1,0,0,0,226,227,5,118,0,
      0,227,228,5,101,0,0,228,229,5,99,0,0,229,50,1,0,0,0,230,231,5,34,0,
      0,231,52,1,0,0,0,232,233,5,114,0,0,233,234,5,101,0,0,234,235,5,99,
      0,0,235,236,5,111,0,0,236,237,5,114,0,0,237,238,5,100,0,0,238,54,1,
      0,0,0,239,240,5,123,0,0,240,56,1,0,0,0,241,242,5,59,0,0,242,58,1,0,
      0,0,243,244,5,125,0,0,244,60,1,0,0,0,245,246,5,118,0,0,246,247,5,97,
      0,0,247,248,5,114,0,0,248,249,5,105,0,0,249,250,5,97,0,0,250,251,5,
      110,0,0,251,252,5,116,0,0,252,62,1,0,0,0,253,254,5,40,0,0,254,64,1,
      0,0,0,255,256,5,44,0,0,256,66,1,0,0,0,257,258,5,41,0,0,258,68,1,0,
      0,0,259,260,5,102,0,0,260,261,5,117,0,0,261,262,5,110,0,0,262,263,
      5,99,0,0,263,70,1,0,0,0,264,265,5,115,0,0,265,266,5,101,0,0,266,267,
      5,114,0,0,267,268,5,118,0,0,268,269,5,105,0,0,269,270,5,99,0,0,270,
      271,5,101,0,0,271,72,1,0,0,0,272,273,5,105,0,0,273,274,5,109,0,0,274,
      275,5,112,0,0,275,276,5,111,0,0,276,277,5,114,0,0,277,278,5,116,0,
      0,278,74,1,0,0,0,279,280,5,116,0,0,280,281,5,121,0,0,281,282,5,112,
      0,0,282,283,5,101,0,0,283,76,1,0,0,0,284,285,5,61,0,0,285,78,1,0,0,
      0,286,288,7,0,0,0,287,286,1,0,0,0,288,289,1,0,0,0,289,287,1,0,0,0,
      289,290,1,0,0,0,290,80,1,0,0,0,291,293,7,1,0,0,292,291,1,0,0,0,293,
      294,1,0,0,0,294,292,1,0,0,0,294,295,1,0,0,0,295,82,1,0,0,0,296,298,
      7,2,0,0,297,296,1,0,0,0,298,299,1,0,0,0,299,297,1,0,0,0,299,300,1,
      0,0,0,300,301,1,0,0,0,301,302,6,41,0,0,302,84,1,0,0,0,303,304,5,47,
      0,0,304,305,5,47,0,0,305,309,1,0,0,0,306,308,8,3,0,0,307,306,1,0,0,
      0,308,311,1,0,0,0,309,307,1,0,0,0,309,310,1,0,0,0,310,312,1,0,0,0,
      311,309,1,0,0,0,312,313,6,42,0,0,313,86,1,0,0,0,314,315,5,47,0,0,315,
      316,5,42,0,0,316,320,1,0,0,0,317,319,9,0,0,0,318,317,1,0,0,0,319,322,
      1,0,0,0,320,321,1,0,0,0,320,318,1,0,0,0,321,323,1,0,0,0,322,320,1,
      0,0,0,323,324,5,42,0,0,324,325,5,47,0,0,325,326,1,0,0,0,326,327,6,
      43,0,0,327,88,1,0,0,0,6,0,289,294,299,309,320,1,6,0,0
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}