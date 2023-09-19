// coverage:ignore-file
// ignore_for_file: type=lint, unnecessary_null_comparison, unnecessary_non_null_assertion, unused_field
// ======================================
// GENERATED CODE - DO NOT MODIFY BY HAND
// ======================================

import 'dart:async';
import 'dart:typed_data';
import 'package:agent_dart/agent_dart.dart';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

class TestIDLActor {
  const TestIDLActor._();

  /// ```Candid
  ///   echo: () -> ()
  /// ```
  static Future<void> echo(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'echo';
    await actor.getFunc(method)!(request);
  }

  /// ```Candid
  ///   echo1: (text) -> (text)
  /// ```
  static Future<String> echo1(
    CanisterActor actor,
    String arg,
  ) async {
    final request = [arg];
    const method = 'echo1';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   echo2: (opt vec opt New2, opt vec opt New2, opt vec opt New2) -> (opt vec New2, opt vec opt New2, opt vec opt New2)
  /// ```
  static Future<RefServiceEcho2Ret> echo2(
    CanisterActor actor,
    RefServiceEcho2Arg arg,
  ) async {
    final request = arg.toJson();
    const method = 'echo2';
    final response = await actor.getFunc(method)!(request);
    return RefServiceEcho2Ret.fromJson(response);
  }

  /// ```Candid
  ///   echo3: (record { text }) -> (record { text })
  /// ```
  static Future<RefServiceEcho3Ret0> echo3(
    CanisterActor actor,
    RefServiceEcho3Arg0 arg,
  ) async {
    final request = [
      [
        arg.item1,
      ]
    ];
    const method = 'echo3';
    final response = await actor.getFunc(method)!(request);
    return RefServiceEcho3Ret0(
      response[0],
    );
  }

  /// ```Candid
  ///   insert: (text, text, text) -> ()
  /// ```
  static Future<void> insert(
    CanisterActor actor,
    RefServiceInsertArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'insert';
    await actor.getFunc(method)!(request);
  }

  /// ```Candid
  ///   lookup: (text) -> (opt Record) query
  /// ```
  static Future<Record?> lookup(
    CanisterActor actor,
    String arg,
  ) async {
    final request = [arg];
    const method = 'lookup';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
      return e == null ? null : Record.fromJson(e);
    }).firstOrNull;
  }

  /// ```Candid
  ///   family: (text) -> (opt vec Record) query
  /// ```
  static Future<List<Record>?> family(
    CanisterActor actor,
    String arg,
  ) async {
    final request = [arg];
    const method = 'family';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
      return (e as List?)?.map((e) {
        return Record.fromJson(e);
      }).toList();
    }).firstOrNull;
  }

  /// ```Candid
  ///   "echo4": (TestEnum) -> (TestEnum)
  /// ```
  static Future<TestEnum> echo4(
    CanisterActor actor,
    TestEnum arg,
  ) async {
    final request = [arg];
    const method = 'echo4';
    final response = await actor.getFunc(method)!(request);
    return TestEnum.fromJson(response);
  }
}

class TestIDLService {
  TestIDLService({
    required this.canisterId,
    required this.uri,
    this.identity,
    this.createActorMethod,
    this.debug = true,
  }) : idl = TestIDL.idl;

  final String canisterId;
  final Uri uri;
  final Service idl;
  final Identity? identity;
  final bool debug;
  final CreateActorMethod? createActorMethod;

  Completer<CanisterActor>? _actor;

  Future<CanisterActor> getActor() {
    if (_actor != null) {
      return _actor!.future;
    }
    final completer = Completer<CanisterActor>();
    _actor = completer;
    Future(() async {
      final httpAgent = HttpAgent(
        defaultProtocol: uri.scheme,
        defaultHost: uri.host,
        defaultPort: uri.port,
        options: HttpAgentOptions(identity: identity),
      );
      if (debug) {
        await httpAgent.fetchRootKey();
      }
      httpAgent.addTransform(
        HttpAgentRequestTransformFn(call: makeNonceTransform()),
      );
      return CanisterActor(
        ActorConfig(
          canisterId: Principal.fromText(canisterId),
          agent: httpAgent,
        ),
        idl,
        createActorMethod: createActorMethod,
      );
    }).then(completer.complete).catchError((e, s) {
      completer.completeError(e, s);
      _actor = null;
    });
    return completer.future;
  }

  /// ```Candid
  ///   echo: () -> ()
  /// ```
  Future<void> echo() async {
    final actor = await getActor();
    return TestIDLActor.echo(
      actor,
    );
  }

  /// ```Candid
  ///   echo1: (text) -> (text)
  /// ```
  Future<String> echo1(
    String arg,
  ) async {
    final actor = await getActor();
    return TestIDLActor.echo1(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   echo2: (opt vec opt New2, opt vec opt New2, opt vec opt New2) -> (opt vec New2, opt vec opt New2, opt vec opt New2)
  /// ```
  Future<RefServiceEcho2Ret> echo2(
    RefServiceEcho2Arg arg,
  ) async {
    final actor = await getActor();
    return TestIDLActor.echo2(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   echo3: (record { text }) -> (record { text })
  /// ```
  Future<RefServiceEcho3Ret0> echo3(
    RefServiceEcho3Arg0 arg,
  ) async {
    final actor = await getActor();
    return TestIDLActor.echo3(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   insert: (text, text, text) -> ()
  /// ```
  Future<void> insert(
    RefServiceInsertArg arg,
  ) async {
    final actor = await getActor();
    return TestIDLActor.insert(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   lookup: (text) -> (opt Record) query
  /// ```
  Future<Record?> lookup(
    String arg,
  ) async {
    final actor = await getActor();
    return TestIDLActor.lookup(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   family: (text) -> (opt vec Record) query
  /// ```
  Future<List<Record>?> family(
    String arg,
  ) async {
    final actor = await getActor();
    return TestIDLActor.family(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   "echo4": (TestEnum) -> (TestEnum)
  /// ```
  Future<TestEnum> echo4(
    TestEnum arg,
  ) async {
    final actor = await getActor();
    return TestIDLActor.echo4(
      actor,
      arg,
    );
  }
}

class TestIDL {
  const TestIDL._();

  /// [_Service] defined in Candid
  /// ```Candid
  ///   type Service = service {
  ///     do: (action: text) -> (service {
  ///     echo: () -> ();
  ///     echo1: (Name) -> (Name) query;
  ///     echo2: (Record) -> (Record);
  ///     echo3: (Record, Variant) -> (Record, Variant)
  ///   })
  ///   };
  /// ```
  static final ServiceClass _Service = IDL.Service({
    'do': IDL.Func(
      [IDL.Text],
      [
        IDL.Service({
          'echo': IDL.Func(
            [],
            [],
            [],
          ),
          'echo1': IDL.Func(
            [_Name],
            [_Name],
            ['query'],
          ),
          'echo2': IDL.Func(
            [_Record],
            [_Record],
            [],
          ),
          'echo3': IDL.Func(
            [_Record, _Variant],
            [_Record, _Variant],
            [],
          ),
        })
      ],
      [],
    ),
  });

  /// [_Tuple] defined in Candid
  /// ```Candid
  ///   type Tuple = record { text; text; vec nat8; opt vec nat8 };
  /// ```
  static final TupleClass _Tuple = IDL.Tuple([
    IDL.Text,
    IDL.Text,
    IDL.Vec(
      IDL.Nat8,
    ),
    IDL.Opt(
      IDL.Vec(
        IDL.Nat8,
      ),
    ),
  ]);

  /// [_TestEnum] defined in Candid
  /// ```Candid
  ///   type TestEnum = variant { Q; W; E; R; T };
  /// ```
  static final VariantClass _TestEnum = IDL.Variant({
    'Q': IDL.Null,
    'W': IDL.Null,
    'E': IDL.Null,
    'R': IDL.Null,
    'T': IDL.Null,
  });

  /// [_EmptyRecord] defined in Candid
  /// ```Candid
  ///   type EmptyRecord = record {  };
  /// ```
  static final TupleClass _EmptyRecord = IDL.Tuple([]);

  /// [_EmptyVariant] defined in Candid
  /// ```Candid
  ///   type EmptyVariant = variant {  };
  /// ```
  static final VariantClass _EmptyVariant = IDL.Variant({});

  /// [_Name] defined in Candid
  /// ```Candid
  ///   type Name = text;
  /// ```
  static final _Name = IDL.Text;

  /// [_Tel] defined in Candid
  /// ```Candid
  ///   type Tel = Phone;
  /// ```
  static final _Tel = _Phone;

  /// [_Phone] defined in Candid
  /// ```Candid
  ///   type Phone = Mobile;
  /// ```
  static final _Phone = _Mobile;

  /// [_Mobile] defined in Candid
  /// ```Candid
  ///   type Mobile = nat;
  /// ```
  static final _Mobile = IDL.Nat;

  /// [_Contact] defined in Candid
  /// ```Candid
  ///   type Contact = Phone;
  /// ```
  static final _Contact = _Phone;

  /// [_Contacts] defined in Candid
  /// ```Candid
  ///   type Contacts = vec Contact;
  /// ```
  static final VecClass _Contacts = IDL.Vec(
    _Contact,
  );

  /// [_NullableContacts] defined in Candid
  /// ```Candid
  ///   type NullableContacts = opt vec Contact;
  /// ```
  static final OptClass _NullableContacts = IDL.Opt(
    IDL.Vec(
      _Contact,
    ),
  );

  /// [_Record] defined in Candid
  /// ```Candid
  ///   type Record = record { emptyRecord: EmptyRecord; emptyVariant: EmptyVariant; tuple: Tuple; name: Name; phone: opt Phone; profile: opt text };
  /// ```
  static final RecordClass _Record = IDL.Record({
    'emptyRecord': _EmptyRecord,
    'emptyVariant': _EmptyVariant,
    'tuple': _Tuple,
    'name': _Name,
    'phone': IDL.Opt(
      _Phone,
    ),
    'profile': IDL.Opt(
      IDL.Text,
    ),
  });

  /// [_Variant] defined in Candid
  /// ```Candid
  ///   type Variant = variant { name: Name; phone: opt Phone; profile: opt text };
  /// ```
  static final VariantClass _Variant = IDL.Variant({
    'name': _Name,
    'phone': IDL.Opt(
      _Phone,
    ),
    'profile': IDL.Opt(
      IDL.Text,
    ),
  });

  /// [_NullableRecord] defined in Candid
  /// ```Candid
  ///   type NullableRecord = opt record { name: Name; phone: opt Phone; profile: opt text; family: opt vec Variant };
  /// ```
  static final OptClass _NullableRecord = IDL.Opt(
    IDL.Record({
      'name': _Name,
      'phone': IDL.Opt(
        _Phone,
      ),
      'profile': IDL.Opt(
        IDL.Text,
      ),
      'family': IDL.Opt(
        IDL.Vec(
          _Variant,
        ),
      ),
    }),
  );

  /// [_NullableNestedRecord] defined in Candid
  /// ```Candid
  ///   type NullableNestedRecord = opt vec record { name: Name; phone: opt Phone; profile: opt text; family: opt vec Variant };
  /// ```
  static final OptClass _NullableNestedRecord = IDL.Opt(
    IDL.Vec(
      IDL.Record({
        'name': _Name,
        'phone': IDL.Opt(
          _Phone,
        ),
        'profile': IDL.Opt(
          IDL.Text,
        ),
        'family': IDL.Opt(
          IDL.Vec(
            _Variant,
          ),
        ),
      }),
    ),
  );

  /// [_NullableVariant] defined in Candid
  /// ```Candid
  ///   type NullableVariant = opt variant { name: Name; phone: opt Phone; profile: opt text; family: opt vec Record };
  /// ```
  static final OptClass _NullableVariant = IDL.Opt(
    IDL.Variant({
      'name': _Name,
      'phone': IDL.Opt(
        _Phone,
      ),
      'profile': IDL.Opt(
        IDL.Text,
      ),
      'family': IDL.Opt(
        IDL.Vec(
          _Record,
        ),
      ),
    }),
  );

  /// [_New] defined in Candid
  /// ```Candid
  ///   type New = record { Record; Variant };
  /// ```
  static final TupleClass _New = IDL.Tuple([
    _Record,
    _Variant,
  ]);

  /// [_NullableNew] defined in Candid
  /// ```Candid
  ///   type NullableNew = opt record { Record; Variant };
  /// ```
  static final OptClass _NullableNew = IDL.Opt(
    IDL.Tuple([
      _Record,
      _Variant,
    ]),
  );

  /// [_New1] defined in Candid
  /// ```Candid
  ///   type New1 = New;
  /// ```
  static final _New1 = _New;

  /// [_New2] defined in Candid
  /// ```Candid
  ///   type New2 = opt vec opt New1;
  /// ```
  static final OptClass _New2 = IDL.Opt(
    IDL.Vec(
      IDL.Opt(
        _New1,
      ),
    ),
  );

  /// [_Complex] defined in Candid
  /// ```Candid
  ///   type Complex = record { field1: opt vec Record; field2: opt vec Phone; nested1: record { field1: vec nat; field2: vec nat8; nested3: record { field1: vec nat; field2: vec nat8; nested5: record { field1: opt vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: opt vec opt vec opt vec opt vec opt vec Record } } }; nested2: variant { no_body; field1: opt vec nat; field2: vec nat8; nested4: record { field1: vec nat; field2: opt vec nat8; nested6: variant { no_body; field1: vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: vec opt vec Record; field6: vec opt vec New1; field7: vec opt vec New2 } } }; nested3: variant { no_key; nested5: record { field1: vec nat; field2: opt vec nat8; nested7: variant { no_key; field1: vec nat; field2: vec nat8; field3: vec vec Record; field4: vec vec New1; field5: vec vec New2 } } } };
  /// ```
  static final RecordClass _Complex = IDL.Record({
    'field1': IDL.Opt(
      IDL.Vec(
        _Record,
      ),
    ),
    'field2': IDL.Opt(
      IDL.Vec(
        _Phone,
      ),
    ),
    'nested1': IDL.Record({
      'field1': IDL.Vec(
        IDL.Nat,
      ),
      'field2': IDL.Vec(
        IDL.Nat8,
      ),
      'nested3': IDL.Record({
        'field1': IDL.Vec(
          IDL.Nat,
        ),
        'field2': IDL.Vec(
          IDL.Nat8,
        ),
        'nested5': IDL.Record({
          'field1': IDL.Opt(
            IDL.Vec(
              IDL.Nat,
            ),
          ),
          'field2': IDL.Vec(
            IDL.Nat8,
          ),
          'field3': IDL.Vec(
            IDL.Vec(
              IDL.Vec(
                IDL.Vec(
                  IDL.Vec(
                    _Record,
                  ),
                ),
              ),
            ),
          ),
          'field4': IDL.Opt(
            IDL.Vec(
              IDL.Vec(
                IDL.Vec(
                  IDL.Vec(
                    IDL.Vec(
                      _Record,
                    ),
                  ),
                ),
              ),
            ),
          ),
          'field5': IDL.Opt(
            IDL.Vec(
              IDL.Opt(
                IDL.Vec(
                  IDL.Opt(
                    IDL.Vec(
                      IDL.Opt(
                        IDL.Vec(
                          IDL.Opt(
                            IDL.Vec(
                              _Record,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        }),
      }),
    }),
    'nested2': IDL.Variant({
      'no_body': IDL.Null,
      'field1': IDL.Opt(
        IDL.Vec(
          IDL.Nat,
        ),
      ),
      'field2': IDL.Vec(
        IDL.Nat8,
      ),
      'nested4': IDL.Record({
        'field1': IDL.Vec(
          IDL.Nat,
        ),
        'field2': IDL.Opt(
          IDL.Vec(
            IDL.Nat8,
          ),
        ),
        'nested6': IDL.Variant({
          'no_body': IDL.Null,
          'field1': IDL.Vec(
            IDL.Nat,
          ),
          'field2': IDL.Vec(
            IDL.Nat8,
          ),
          'field3': IDL.Vec(
            IDL.Vec(
              IDL.Vec(
                IDL.Vec(
                  IDL.Vec(
                    _Record,
                  ),
                ),
              ),
            ),
          ),
          'field4': IDL.Opt(
            IDL.Vec(
              IDL.Vec(
                IDL.Vec(
                  IDL.Vec(
                    IDL.Vec(
                      _Record,
                    ),
                  ),
                ),
              ),
            ),
          ),
          'field5': IDL.Vec(
            IDL.Opt(
              IDL.Vec(
                _Record,
              ),
            ),
          ),
          'field6': IDL.Vec(
            IDL.Opt(
              IDL.Vec(
                _New1,
              ),
            ),
          ),
          'field7': IDL.Vec(
            IDL.Opt(
              IDL.Vec(
                _New2,
              ),
            ),
          ),
        }),
      }),
    }),
    'nested3': IDL.Variant({
      'no_key': IDL.Null,
      'nested5': IDL.Record({
        'field1': IDL.Vec(
          IDL.Nat,
        ),
        'field2': IDL.Opt(
          IDL.Vec(
            IDL.Nat8,
          ),
        ),
        'nested7': IDL.Variant({
          'no_key': IDL.Null,
          'field1': IDL.Vec(
            IDL.Nat,
          ),
          'field2': IDL.Vec(
            IDL.Nat8,
          ),
          'field3': IDL.Vec(
            IDL.Vec(
              _Record,
            ),
          ),
          'field4': IDL.Vec(
            IDL.Vec(
              _New1,
            ),
          ),
          'field5': IDL.Vec(
            IDL.Vec(
              _New2,
            ),
          ),
        }),
      }),
    }),
  });

  /// [_refFunc] defined in Candid
  /// ```Candid
  ///   type refFunc = func (Name, func (Record) -> (Variant)) -> (opt NullableNestedRecord);
  /// ```
  static final FuncClass _refFunc = IDL.Func(
    [
      _Name,
      IDL.Func(
        [_Record],
        [_Variant],
        [],
      )
    ],
    [
      IDL.Opt(
        _NullableNestedRecord,
      )
    ],
    [],
  );

  /// [_refService] defined in Candid
  /// ```Candid
  ///   type refService = service {
  ///     refFunc: refFunc;
  ///     insert: (text, text, text) -> ();
  ///     lookup: (text) -> (opt Record) query;
  ///     family: (text) -> (opt vec Record) query;
  ///     echo: () -> ();
  ///     echo1: (text) -> (text);
  ///     echo2: (opt vec opt New2, opt vec opt New2, opt vec opt New2) -> (opt vec New2, opt vec opt New2, opt vec opt New2);
  ///     echo3: (record { text }) -> (record { text });
  ///     "echo4": (TestEnum) -> (TestEnum)
  ///   };
  /// ```
  static final ServiceClass _refService = IDL.Service({
    'refFunc': _refFunc,
    'insert': IDL.Func(
      [IDL.Text, IDL.Text, IDL.Text],
      [],
      [],
    ),
    'lookup': IDL.Func(
      [IDL.Text],
      [
        IDL.Opt(
          _Record,
        )
      ],
      ['query'],
    ),
    'family': IDL.Func(
      [IDL.Text],
      [
        IDL.Opt(
          IDL.Vec(
            _Record,
          ),
        )
      ],
      ['query'],
    ),
    'echo': IDL.Func(
      [],
      [],
      [],
    ),
    'echo1': IDL.Func(
      [IDL.Text],
      [IDL.Text],
      [],
    ),
    'echo2': IDL.Func(
      [
        IDL.Opt(
          IDL.Vec(
            IDL.Opt(
              _New2,
            ),
          ),
        ),
        IDL.Opt(
          IDL.Vec(
            IDL.Opt(
              _New2,
            ),
          ),
        ),
        IDL.Opt(
          IDL.Vec(
            IDL.Opt(
              _New2,
            ),
          ),
        )
      ],
      [
        IDL.Opt(
          IDL.Vec(
            _New2,
          ),
        ),
        IDL.Opt(
          IDL.Vec(
            IDL.Opt(
              _New2,
            ),
          ),
        ),
        IDL.Opt(
          IDL.Vec(
            IDL.Opt(
              _New2,
            ),
          ),
        )
      ],
      [],
    ),
    'echo3': IDL.Func(
      [
        IDL.Tuple([
          IDL.Text,
        ])
      ],
      [
        IDL.Tuple([
          IDL.Text,
        ])
      ],
      [],
    ),
    '"echo4"': IDL.Func(
      [_TestEnum],
      [_TestEnum],
      [],
    ),
  });

  static final testIdl = _refService;
  static final idl = testIdl;
  static final List<CType> $initIdl = <CType>[_Record, _NullableNew];
}

/// [Tuple] defined in Candid
/// ```Candid
///   record { text; text; vec nat8; opt vec nat8 }
/// ```
@immutable
class Tuple {
  const Tuple(
    this.item1,
    this.item2,
    this.item3,
    this.item4,
  );

  factory Tuple.fromJson(List<dynamic> tuple) {
    return Tuple(
      tuple[0],
      tuple[1],
      tuple[2] is Uint8List
          ? tuple[2]
          : Uint8List.fromList((tuple[2] as List).cast()),
      (tuple[3] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
    );
  }

  /// [item1] defined in Candid: `text`
  final String item1;

  /// [item2] defined in Candid: `text`
  final String item2;

  /// [item3] defined in Candid: `vec nat8`
  final Uint8List item3;

  /// [item4] defined in Candid: `opt vec nat8`
  final Uint8List? item4;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    final item3 = this.item3;
    final item4 = this.item4;
    return [
      item1,
      item2,
      item3,
      [if (item4 != null) item4],
    ];
  }

  Tuple copyWith({
    /// [item1] defined in Candid: `text`
    String? item1,

    /// [item2] defined in Candid: `text`
    String? item2,

    /// [item3] defined in Candid: `vec nat8`
    Uint8List? item3,

    /// [item4] defined in Candid: `opt vec nat8`
    Uint8List? item4,
  }) {
    return Tuple(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
      item4 ?? this.item4,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Tuple &&
            (identical(other.item1, item1) || other.item1 == item1) &&
            (identical(other.item2, item2) || other.item2 == item2) &&
            (identical(other.item3, item3) || other.item3 == item3) &&
            (identical(other.item4, item4) || other.item4 == item4));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, item1, item2, item3, item4]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TestEnum] defined in Candid
/// ```Candid
///   variant { Q; W; E; R; T }
/// ```
enum TestEnum {
  /// [q] defined in Candid: `Q`
  q('Q'),

  /// [w] defined in Candid: `W`
  w('W'),

  /// [e] defined in Candid: `E`
  e('E'),

  /// [r] defined in Candid: `R`
  r('R'),

  /// [t] defined in Candid: `T`
  t('T');

  const TestEnum(this.name);

  factory TestEnum.fromJson(Map json) {
    final key = json.keys.first;
    return TestEnum.values.firstWhere((e) => e.name == key);
  }

  final String name;

  bool get isQ => this == TestEnum.q;
  bool get isW => this == TestEnum.w;
  bool get isE => this == TestEnum.e;
  bool get isR => this == TestEnum.r;
  bool get isT => this == TestEnum.t;
  Map<String, dynamic> toJson() {
    return {name: null};
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EmptyRecord] defined in Candid
/// ```Candid
///   record {  }
/// ```
@immutable
class EmptyRecord {
  const EmptyRecord();

  factory EmptyRecord.fromJson(List<dynamic> tuple) {
    return EmptyRecord();
  }

  List<dynamic> toJson() {
    return [];
  }

  EmptyRecord copyWith() {
    return EmptyRecord();
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmptyRecord);
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EmptyVariant] defined in Candid
/// ```Candid
///   variant {  }
/// ```
@immutable
class EmptyVariant {
  const EmptyVariant();

  factory EmptyVariant.fromJson(Map json) {
    return EmptyVariant();
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  EmptyVariant copyWith() {
    return EmptyVariant();
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmptyVariant);
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Record] defined in Candid
/// ```Candid
///   record { emptyRecord: EmptyRecord; emptyVariant: EmptyVariant; tuple: Tuple; name: Name; phone: opt Phone; profile: opt text }
/// ```
@immutable
class Record {
  const Record({
    /// [emptyRecord] defined in Candid: `emptyRecord: EmptyRecord`
    required this.emptyRecord,

    /// [emptyVariant] defined in Candid: `emptyVariant: EmptyVariant`
    required this.emptyVariant,

    /// [tuple] defined in Candid: `tuple: Tuple`
    required this.tuple,

    /// [name] defined in Candid: `name: Name`
    required this.name,

    /// [phone] defined in Candid: `phone: opt Phone`
    this.phone,

    /// [profile] defined in Candid: `profile: opt text`
    this.profile,
  });

  factory Record.fromJson(Map json) {
    return Record(
      emptyRecord: EmptyRecord.fromJson(json['emptyRecord']),
      emptyVariant: EmptyVariant.fromJson(json['emptyVariant']),
      tuple: Tuple.fromJson(json['tuple']),
      name: json['name'],
      phone: (json['phone'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      profile: (json['profile'] as List).map((e) {
        return e;
      }).firstOrNull,
    );
  }

  /// [emptyRecord] defined in Candid: `emptyRecord: EmptyRecord`
  final EmptyRecord emptyRecord;

  /// [emptyVariant] defined in Candid: `emptyVariant: EmptyVariant`
  final EmptyVariant emptyVariant;

  /// [tuple] defined in Candid: `tuple: Tuple`
  final Tuple tuple;

  /// [name] defined in Candid: `name: Name`
  final Name name;

  /// [phone] defined in Candid: `phone: opt Phone`
  final Phone? phone;

  /// [profile] defined in Candid: `profile: opt text`
  final String? profile;

  Map<String, dynamic> toJson() {
    final emptyRecord = this.emptyRecord;
    final emptyVariant = this.emptyVariant;
    final tuple = this.tuple;
    final name = this.name;
    final phone = this.phone;
    final profile = this.profile;
    return {
      'emptyRecord': emptyRecord,
      'emptyVariant': emptyVariant,
      'tuple': tuple,
      'name': name,
      'phone': [if (phone != null) phone],
      'profile': [if (profile != null) profile],
    };
  }

  Record copyWith({
    /// [emptyRecord] defined in Candid: `emptyRecord: EmptyRecord`
    EmptyRecord? emptyRecord,

    /// [emptyVariant] defined in Candid: `emptyVariant: EmptyVariant`
    EmptyVariant? emptyVariant,

    /// [tuple] defined in Candid: `tuple: Tuple`
    Tuple? tuple,

    /// [name] defined in Candid: `name: Name`
    Name? name,

    /// [phone] defined in Candid: `phone: opt Phone`
    Phone? phone,

    /// [profile] defined in Candid: `profile: opt text`
    String? profile,
  }) {
    return Record(
      emptyRecord: emptyRecord ?? this.emptyRecord,
      emptyVariant: emptyVariant ?? this.emptyVariant,
      tuple: tuple ?? this.tuple,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      profile: profile ?? this.profile,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Record &&
            (identical(other.emptyRecord, emptyRecord) ||
                other.emptyRecord == emptyRecord) &&
            (identical(other.emptyVariant, emptyVariant) ||
                other.emptyVariant == emptyVariant) &&
            (identical(other.tuple, tuple) || other.tuple == tuple) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hashAll(
      [runtimeType, emptyRecord, emptyVariant, tuple, name, phone, profile]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Variant] defined in Candid
/// ```Candid
///   variant { name: Name; phone: opt Phone; profile: opt text }
/// ```
@immutable
class Variant {
  const Variant({
    /// [name] defined in Candid: `name: Name`
    this.name,

    /// [phone] defined in Candid: `phone: opt Phone`
    this.phone,

    /// [profile] defined in Candid: `profile: opt text`
    this.profile,
  });

  factory Variant.fromJson(Map json) {
    return Variant(
      name: json['name'],
      phone: (json['phone'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      profile: (json['profile'] as List).map((e) {
        return e;
      }).firstOrNull,
    );
  }

  /// [name] defined in Candid: `name: Name`
  final Name? name;

  /// [phone] defined in Candid: `phone: opt Phone`
  final Phone? phone;

  /// [profile] defined in Candid: `profile: opt text`
  final String? profile;

  Map<String, dynamic> toJson() {
    final name = this.name;
    final phone = this.phone;
    final profile = this.profile;
    return {
      if (name != null) 'name': name,
      if (phone != null) 'phone': [if (phone != null) phone],
      if (profile != null) 'profile': [if (profile != null) profile],
    };
  }

  Variant copyWith({
    /// [name] defined in Candid: `name: Name`
    Name? name,

    /// [phone] defined in Candid: `phone: opt Phone`
    Phone? phone,

    /// [profile] defined in Candid: `profile: opt text`
    String? profile,
  }) {
    return Variant(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      profile: profile ?? this.profile,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Variant &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, name, phone, profile]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [NullableRecordOpt] defined in Candid
/// ```Candid
///   record { name: Name; phone: opt Phone; profile: opt text; family: opt vec Variant }
/// ```
@immutable
class NullableRecordOpt {
  const NullableRecordOpt({
    /// [name] defined in Candid: `name: Name`
    required this.name,

    /// [phone] defined in Candid: `phone: opt Phone`
    this.phone,

    /// [profile] defined in Candid: `profile: opt text`
    this.profile,

    /// [family] defined in Candid: `family: opt vec Variant`
    this.family,
  });

  factory NullableRecordOpt.fromJson(Map json) {
    return NullableRecordOpt(
      name: json['name'],
      phone: (json['phone'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      profile: (json['profile'] as List).map((e) {
        return e;
      }).firstOrNull,
      family: (json['family'] as List).map((e) {
        return (e as List?)?.map((e) {
          return Variant.fromJson(e);
        }).toList();
      }).firstOrNull,
    );
  }

  /// [name] defined in Candid: `name: Name`
  final Name name;

  /// [phone] defined in Candid: `phone: opt Phone`
  final Phone? phone;

  /// [profile] defined in Candid: `profile: opt text`
  final String? profile;

  /// [family] defined in Candid: `family: opt vec Variant`
  final List<Variant>? family;

  Map<String, dynamic> toJson() {
    final name = this.name;
    final phone = this.phone;
    final profile = this.profile;
    final family = this.family;
    return {
      'name': name,
      'phone': [if (phone != null) phone],
      'profile': [if (profile != null) profile],
      'family': [if (family != null) family],
    };
  }

  NullableRecordOpt copyWith({
    /// [name] defined in Candid: `name: Name`
    Name? name,

    /// [phone] defined in Candid: `phone: opt Phone`
    Phone? phone,

    /// [profile] defined in Candid: `profile: opt text`
    String? profile,

    /// [family] defined in Candid: `family: opt vec Variant`
    List<Variant>? family,
  }) {
    return NullableRecordOpt(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      profile: profile ?? this.profile,
      family: family ?? this.family,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NullableRecordOpt &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality().equals(other.family, family));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        phone,
        profile,
        const DeepCollectionEquality().hash(family)
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [NullableNestedRecordOptItem] defined in Candid
/// ```Candid
///   record { name: Name; phone: opt Phone; profile: opt text; family: opt vec Variant }
/// ```
typedef NullableNestedRecordOptItem = NullableRecordOpt;

/// [NullableVariantOpt] defined in Candid
/// ```Candid
///   variant { name: Name; phone: opt Phone; profile: opt text; family: opt vec Record }
/// ```
@immutable
class NullableVariantOpt {
  const NullableVariantOpt({
    /// [name] defined in Candid: `name: Name`
    this.name,

    /// [phone] defined in Candid: `phone: opt Phone`
    this.phone,

    /// [profile] defined in Candid: `profile: opt text`
    this.profile,

    /// [family] defined in Candid: `family: opt vec Record`
    this.family,
  });

  factory NullableVariantOpt.fromJson(Map json) {
    return NullableVariantOpt(
      name: json['name'],
      phone: (json['phone'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      profile: (json['profile'] as List).map((e) {
        return e;
      }).firstOrNull,
      family: (json['family'] as List).map((e) {
        return (e as List?)?.map((e) {
          return Record.fromJson(e);
        }).toList();
      }).firstOrNull,
    );
  }

  /// [name] defined in Candid: `name: Name`
  final Name? name;

  /// [phone] defined in Candid: `phone: opt Phone`
  final Phone? phone;

  /// [profile] defined in Candid: `profile: opt text`
  final String? profile;

  /// [family] defined in Candid: `family: opt vec Record`
  final List<Record>? family;

  Map<String, dynamic> toJson() {
    final name = this.name;
    final phone = this.phone;
    final profile = this.profile;
    final family = this.family;
    return {
      if (name != null) 'name': name,
      if (phone != null) 'phone': [if (phone != null) phone],
      if (profile != null) 'profile': [if (profile != null) profile],
      if (family != null) 'family': [if (family != null) family],
    };
  }

  NullableVariantOpt copyWith({
    /// [name] defined in Candid: `name: Name`
    Name? name,

    /// [phone] defined in Candid: `phone: opt Phone`
    Phone? phone,

    /// [profile] defined in Candid: `profile: opt text`
    String? profile,

    /// [family] defined in Candid: `family: opt vec Record`
    List<Record>? family,
  }) {
    return NullableVariantOpt(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      profile: profile ?? this.profile,
      family: family ?? this.family,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NullableVariantOpt &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality().equals(other.family, family));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        phone,
        profile,
        const DeepCollectionEquality().hash(family)
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [New] defined in Candid
/// ```Candid
///   record { Record; Variant }
/// ```
@immutable
class New {
  const New(
    this.item1,
    this.item2,
  );

  factory New.fromJson(List<dynamic> tuple) {
    return New(
      Record.fromJson(tuple[0]),
      Variant.fromJson(tuple[1]),
    );
  }

  /// [item1] defined in Candid: `Record`
  final Record item1;

  /// [item2] defined in Candid: `Variant`
  final Variant item2;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      item1,
      item2,
    ];
  }

  New copyWith({
    /// [item1] defined in Candid: `Record`
    Record? item1,

    /// [item2] defined in Candid: `Variant`
    Variant? item2,
  }) {
    return New(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is New &&
            (identical(other.item1, item1) || other.item1 == item1) &&
            (identical(other.item2, item2) || other.item2 == item2));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, item1, item2]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [NullableNewOpt] defined in Candid
/// ```Candid
///   record { Record; Variant }
/// ```
typedef NullableNewOpt = New;

/// [ComplexNested1Nested3Nested5] defined in Candid
/// ```Candid
///   record { field1: opt vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: opt vec opt vec opt vec opt vec opt vec Record }
/// ```
@immutable
class ComplexNested1Nested3Nested5 {
  const ComplexNested1Nested3Nested5({
    /// [field1] defined in Candid: `field1: opt vec nat`
    this.field1,

    /// [field2] defined in Candid: `field2: vec nat8`
    required this.field2,

    /// [field3] defined in Candid: `field3: vec vec vec vec vec Record`
    required this.field3,

    /// [field4] defined in Candid: `field4: opt vec vec vec vec vec Record`
    this.field4,

    /// [field5] defined in Candid: `field5: opt vec opt vec opt vec opt vec opt vec Record`
    this.field5,
  });

  factory ComplexNested1Nested3Nested5.fromJson(Map json) {
    return ComplexNested1Nested3Nested5(
      field1: (json['field1'] as List).map((e) {
        return (e as List?)?.map((e) {
          return e is BigInt ? e : BigInt.from(e);
        }).toList();
      }).firstOrNull,
      field2: json['field2'] is Uint8List
          ? json['field2']
          : Uint8List.fromList((json['field2'] as List).cast()),
      field3: (json['field3'] as List).map((e) {
        return (e as List).map((e) {
          return (e as List).map((e) {
            return (e as List).map((e) {
              return (e as List).map((e) {
                return Record.fromJson(e);
              }).toList();
            }).toList();
          }).toList();
        }).toList();
      }).toList(),
      field4: (json['field4'] as List).map((e) {
        return (e as List?)?.map((e) {
          return (e as List).map((e) {
            return (e as List).map((e) {
              return (e as List).map((e) {
                return (e as List).map((e) {
                  return Record.fromJson(e);
                }).toList();
              }).toList();
            }).toList();
          }).toList();
        }).toList();
      }).firstOrNull,
      field5: (json['field5'] as List).map((e) {
        return (e as List?)?.map((e) {
          return (e as List).map((e) {
            return (e as List?)?.map((e) {
              return (e as List).map((e) {
                return (e as List?)?.map((e) {
                  return (e as List).map((e) {
                    return (e as List?)?.map((e) {
                      return (e as List).map((e) {
                        return (e as List?)?.map((e) {
                          return Record.fromJson(e);
                        }).toList();
                      }).firstOrNull;
                    }).toList();
                  }).firstOrNull;
                }).toList();
              }).firstOrNull;
            }).toList();
          }).firstOrNull;
        }).toList();
      }).firstOrNull,
    );
  }

  /// [field1] defined in Candid: `field1: opt vec nat`
  final List<BigInt>? field1;

  /// [field2] defined in Candid: `field2: vec nat8`
  final Uint8List field2;

  /// [field3] defined in Candid: `field3: vec vec vec vec vec Record`
  final List<List<List<List<List<Record>>>>> field3;

  /// [field4] defined in Candid: `field4: opt vec vec vec vec vec Record`
  final List<List<List<List<List<Record>>>>>? field4;

  /// [field5] defined in Candid: `field5: opt vec opt vec opt vec opt vec opt vec Record`
  final List<List<List<List<List<Record>?>?>?>?>? field5;

  Map<String, dynamic> toJson() {
    final field1 = this.field1;
    final field2 = this.field2;
    final field3 = this.field3;
    final field4 = this.field4;
    final field5 = this.field5;
    return {
      'field1': [if (field1 != null) field1],
      'field2': field2,
      'field3': field3,
      'field4': [if (field4 != null) field4],
      'field5': [
        if (field5 != null)
          field5.map((e) {
            return [
              if (e != null)
                e.map((e) {
                  return [
                    if (e != null)
                      e.map((e) {
                        return [
                          if (e != null)
                            e.map((e) {
                              return [if (e != null) e];
                            }).toList()
                        ];
                      }).toList()
                  ];
                }).toList()
            ];
          }).toList()
      ],
    };
  }

  ComplexNested1Nested3Nested5 copyWith({
    /// [field1] defined in Candid: `field1: opt vec nat`
    List<BigInt>? field1,

    /// [field2] defined in Candid: `field2: vec nat8`
    Uint8List? field2,

    /// [field3] defined in Candid: `field3: vec vec vec vec vec Record`
    List<List<List<List<List<Record>>>>>? field3,

    /// [field4] defined in Candid: `field4: opt vec vec vec vec vec Record`
    List<List<List<List<List<Record>>>>>? field4,

    /// [field5] defined in Candid: `field5: opt vec opt vec opt vec opt vec opt vec Record`
    List<List<List<List<List<Record>?>?>?>?>? field5,
  }) {
    return ComplexNested1Nested3Nested5(
      field1: field1 ?? this.field1,
      field2: field2 ?? this.field2,
      field3: field3 ?? this.field3,
      field4: field4 ?? this.field4,
      field5: field5 ?? this.field5,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComplexNested1Nested3Nested5 &&
            const DeepCollectionEquality().equals(other.field1, field1) &&
            (identical(other.field2, field2) || other.field2 == field2) &&
            const DeepCollectionEquality().equals(other.field3, field3) &&
            const DeepCollectionEquality().equals(other.field4, field4) &&
            const DeepCollectionEquality().equals(other.field5, field5));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(field1),
        field2,
        const DeepCollectionEquality().hash(field3),
        const DeepCollectionEquality().hash(field4),
        const DeepCollectionEquality().hash(field5)
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [ComplexNested1Nested3] defined in Candid
/// ```Candid
///   record { field1: vec nat; field2: vec nat8; nested5: record { field1: opt vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: opt vec opt vec opt vec opt vec opt vec Record } }
/// ```
@immutable
class ComplexNested1Nested3 {
  const ComplexNested1Nested3({
    /// [field1] defined in Candid: `field1: vec nat`
    required this.field1,

    /// [field2] defined in Candid: `field2: vec nat8`
    required this.field2,

    /// [nested5] defined in Candid: `nested5: record { field1: opt vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: opt vec opt vec opt vec opt vec opt vec Record }`
    required this.nested5,
  });

  factory ComplexNested1Nested3.fromJson(Map json) {
    return ComplexNested1Nested3(
      field1: (json['field1'] as List).map((e) {
        return e is BigInt ? e : BigInt.from(e);
      }).toList(),
      field2: json['field2'] is Uint8List
          ? json['field2']
          : Uint8List.fromList((json['field2'] as List).cast()),
      nested5: ComplexNested1Nested3Nested5.fromJson(
        json['nested5'],
      ),
    );
  }

  /// [field1] defined in Candid: `field1: vec nat`
  final List<BigInt> field1;

  /// [field2] defined in Candid: `field2: vec nat8`
  final Uint8List field2;

  /// [nested5] defined in Candid: `nested5: record { field1: opt vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: opt vec opt vec opt vec opt vec opt vec Record }`
  final ComplexNested1Nested3Nested5 nested5;

  Map<String, dynamic> toJson() {
    final field1 = this.field1;
    final field2 = this.field2;
    final nested5 = this.nested5;
    return {
      'field1': field1,
      'field2': field2,
      'nested5': nested5,
    };
  }

  ComplexNested1Nested3 copyWith({
    /// [field1] defined in Candid: `field1: vec nat`
    List<BigInt>? field1,

    /// [field2] defined in Candid: `field2: vec nat8`
    Uint8List? field2,

    /// [nested5] defined in Candid: `nested5: record { field1: opt vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: opt vec opt vec opt vec opt vec opt vec Record }`
    ComplexNested1Nested3Nested5? nested5,
  }) {
    return ComplexNested1Nested3(
      field1: field1 ?? this.field1,
      field2: field2 ?? this.field2,
      nested5: nested5 ?? this.nested5,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComplexNested1Nested3 &&
            const DeepCollectionEquality().equals(other.field1, field1) &&
            (identical(other.field2, field2) || other.field2 == field2) &&
            (identical(other.nested5, nested5) || other.nested5 == nested5));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(field1),
        field2,
        nested5
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [ComplexNested1] defined in Candid
/// ```Candid
///   record { field1: vec nat; field2: vec nat8; nested3: record { field1: vec nat; field2: vec nat8; nested5: record { field1: opt vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: opt vec opt vec opt vec opt vec opt vec Record } } }
/// ```
@immutable
class ComplexNested1 {
  const ComplexNested1({
    /// [field1] defined in Candid: `field1: vec nat`
    required this.field1,

    /// [field2] defined in Candid: `field2: vec nat8`
    required this.field2,

    /// [nested3] defined in Candid: `nested3: record { field1: vec nat; field2: vec nat8; nested5: record { field1: opt vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: opt vec opt vec opt vec opt vec opt vec Record } }`
    required this.nested3,
  });

  factory ComplexNested1.fromJson(Map json) {
    return ComplexNested1(
      field1: (json['field1'] as List).map((e) {
        return e is BigInt ? e : BigInt.from(e);
      }).toList(),
      field2: json['field2'] is Uint8List
          ? json['field2']
          : Uint8List.fromList((json['field2'] as List).cast()),
      nested3: ComplexNested1Nested3.fromJson(
        json['nested3'],
      ),
    );
  }

  /// [field1] defined in Candid: `field1: vec nat`
  final List<BigInt> field1;

  /// [field2] defined in Candid: `field2: vec nat8`
  final Uint8List field2;

  /// [nested3] defined in Candid: `nested3: record { field1: vec nat; field2: vec nat8; nested5: record { field1: opt vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: opt vec opt vec opt vec opt vec opt vec Record } }`
  final ComplexNested1Nested3 nested3;

  Map<String, dynamic> toJson() {
    final field1 = this.field1;
    final field2 = this.field2;
    final nested3 = this.nested3;
    return {
      'field1': field1,
      'field2': field2,
      'nested3': nested3,
    };
  }

  ComplexNested1 copyWith({
    /// [field1] defined in Candid: `field1: vec nat`
    List<BigInt>? field1,

    /// [field2] defined in Candid: `field2: vec nat8`
    Uint8List? field2,

    /// [nested3] defined in Candid: `nested3: record { field1: vec nat; field2: vec nat8; nested5: record { field1: opt vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: opt vec opt vec opt vec opt vec opt vec Record } }`
    ComplexNested1Nested3? nested3,
  }) {
    return ComplexNested1(
      field1: field1 ?? this.field1,
      field2: field2 ?? this.field2,
      nested3: nested3 ?? this.nested3,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComplexNested1 &&
            const DeepCollectionEquality().equals(other.field1, field1) &&
            (identical(other.field2, field2) || other.field2 == field2) &&
            (identical(other.nested3, nested3) || other.nested3 == nested3));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(field1),
        field2,
        nested3
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [ComplexNested2Nested4Nested6] defined in Candid
/// ```Candid
///   variant { no_body; field1: vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: vec opt vec Record; field6: vec opt vec New1; field7: vec opt vec New2 }
/// ```
@immutable
class ComplexNested2Nested4Nested6 {
  const ComplexNested2Nested4Nested6({
    /// [noBody] defined in Candid: `no_body`
    this.noBody = false,

    /// [field1] defined in Candid: `field1: vec nat`
    this.field1,

    /// [field2] defined in Candid: `field2: vec nat8`
    this.field2,

    /// [field3] defined in Candid: `field3: vec vec vec vec vec Record`
    this.field3,

    /// [field4] defined in Candid: `field4: opt vec vec vec vec vec Record`
    this.field4,

    /// [field5] defined in Candid: `field5: vec opt vec Record`
    this.field5,

    /// [field6] defined in Candid: `field6: vec opt vec New1`
    this.field6,

    /// [field7] defined in Candid: `field7: vec opt vec New2`
    this.field7,
  });

  factory ComplexNested2Nested4Nested6.fromJson(Map json) {
    return ComplexNested2Nested4Nested6(
      noBody: json.containsKey('no_body'),
      field1: (json['field1'] as List?)?.map((e) {
        return e is BigInt ? e : BigInt.from(e);
      }).toList(),
      field2: json['field2'] == null
          ? null
          : json['field2'] is Uint8List
              ? json['field2']
              : Uint8List.fromList((json['field2'] as List).cast()),
      field3: (json['field3'] as List?)?.map((e) {
        return (e as List).map((e) {
          return (e as List).map((e) {
            return (e as List).map((e) {
              return (e as List).map((e) {
                return Record.fromJson(e);
              }).toList();
            }).toList();
          }).toList();
        }).toList();
      }).toList(),
      field4: (json['field4'] as List).map((e) {
        return (e as List?)?.map((e) {
          return (e as List).map((e) {
            return (e as List).map((e) {
              return (e as List).map((e) {
                return (e as List).map((e) {
                  return Record.fromJson(e);
                }).toList();
              }).toList();
            }).toList();
          }).toList();
        }).toList();
      }).firstOrNull,
      field5: (json['field5'] as List?)?.map((e) {
        return (e as List).map((e) {
          return (e as List?)?.map((e) {
            return Record.fromJson(e);
          }).toList();
        }).firstOrNull;
      }).toList(),
      field6: (json['field6'] as List?)?.map((e) {
        return (e as List).map((e) {
          return (e as List?)?.map((e) {
            return New.fromJson(e);
          }).toList();
        }).firstOrNull;
      }).toList(),
      field7: (json['field7'] as List?)?.map((e) {
        return (e as List).map((e) {
          return (e as List?)?.map((e) {
            return (e as List).map((e) {
              return (e as List?)?.map((e) {
                return (e as List).map((e) {
                  return New.fromJson(e);
                }).firstOrNull;
              }).toList();
            }).firstOrNull;
          }).toList();
        }).firstOrNull;
      }).toList(),
    );
  }

  /// [noBody] defined in Candid: `no_body`
  final bool noBody;

  /// [field1] defined in Candid: `field1: vec nat`
  final List<BigInt>? field1;

  /// [field2] defined in Candid: `field2: vec nat8`
  final Uint8List? field2;

  /// [field3] defined in Candid: `field3: vec vec vec vec vec Record`
  final List<List<List<List<List<Record>>>>>? field3;

  /// [field4] defined in Candid: `field4: opt vec vec vec vec vec Record`
  final List<List<List<List<List<Record>>>>>? field4;

  /// [field5] defined in Candid: `field5: vec opt vec Record`
  final List<List<Record>?>? field5;

  /// [field6] defined in Candid: `field6: vec opt vec New1`
  final List<List<New1>?>? field6;

  /// [field7] defined in Candid: `field7: vec opt vec New2`
  final List<List<New2>?>? field7;

  Map<String, dynamic> toJson() {
    final noBody = this.noBody;
    final field1 = this.field1;
    final field2 = this.field2;
    final field3 = this.field3;
    final field4 = this.field4;
    final field5 = this.field5;
    final field6 = this.field6;
    final field7 = this.field7;
    return {
      if (noBody) 'no_body': null,
      if (field1 != null) 'field1': field1,
      if (field2 != null) 'field2': field2,
      if (field3 != null) 'field3': field3,
      if (field4 != null) 'field4': [if (field4 != null) field4],
      if (field5 != null)
        'field5': field5.map((e) {
          return [if (e != null) e];
        }).toList(),
      if (field6 != null)
        'field6': field6.map((e) {
          return [if (e != null) e];
        }).toList(),
      if (field7 != null)
        'field7': field7.map((e) {
          return [
            if (e != null)
              e.map((e) {
                return [
                  if (e != null)
                    e.map((e) {
                      return [if (e != null) e];
                    }).toList()
                ];
              }).toList()
          ];
        }).toList(),
    };
  }

  ComplexNested2Nested4Nested6 copyWith({
    /// [noBody] defined in Candid: `no_body`
    bool? noBody,

    /// [field1] defined in Candid: `field1: vec nat`
    List<BigInt>? field1,

    /// [field2] defined in Candid: `field2: vec nat8`
    Uint8List? field2,

    /// [field3] defined in Candid: `field3: vec vec vec vec vec Record`
    List<List<List<List<List<Record>>>>>? field3,

    /// [field4] defined in Candid: `field4: opt vec vec vec vec vec Record`
    List<List<List<List<List<Record>>>>>? field4,

    /// [field5] defined in Candid: `field5: vec opt vec Record`
    List<List<Record>?>? field5,

    /// [field6] defined in Candid: `field6: vec opt vec New1`
    List<List<New1>?>? field6,

    /// [field7] defined in Candid: `field7: vec opt vec New2`
    List<List<New2>?>? field7,
  }) {
    return ComplexNested2Nested4Nested6(
      noBody: noBody ?? this.noBody,
      field1: field1 ?? this.field1,
      field2: field2 ?? this.field2,
      field3: field3 ?? this.field3,
      field4: field4 ?? this.field4,
      field5: field5 ?? this.field5,
      field6: field6 ?? this.field6,
      field7: field7 ?? this.field7,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComplexNested2Nested4Nested6 &&
            (identical(other.noBody, noBody) || other.noBody == noBody) &&
            const DeepCollectionEquality().equals(other.field1, field1) &&
            (identical(other.field2, field2) || other.field2 == field2) &&
            const DeepCollectionEquality().equals(other.field3, field3) &&
            const DeepCollectionEquality().equals(other.field4, field4) &&
            const DeepCollectionEquality().equals(other.field5, field5) &&
            const DeepCollectionEquality().equals(other.field6, field6) &&
            const DeepCollectionEquality().equals(other.field7, field7));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        noBody,
        const DeepCollectionEquality().hash(field1),
        field2,
        const DeepCollectionEquality().hash(field3),
        const DeepCollectionEquality().hash(field4),
        const DeepCollectionEquality().hash(field5),
        const DeepCollectionEquality().hash(field6),
        const DeepCollectionEquality().hash(field7)
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [ComplexNested2Nested4] defined in Candid
/// ```Candid
///   record { field1: vec nat; field2: opt vec nat8; nested6: variant { no_body; field1: vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: vec opt vec Record; field6: vec opt vec New1; field7: vec opt vec New2 } }
/// ```
@immutable
class ComplexNested2Nested4 {
  const ComplexNested2Nested4({
    /// [field1] defined in Candid: `field1: vec nat`
    required this.field1,

    /// [field2] defined in Candid: `field2: opt vec nat8`
    this.field2,

    /// [nested6] defined in Candid: `nested6: variant { no_body; field1: vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: vec opt vec Record; field6: vec opt vec New1; field7: vec opt vec New2 }`
    required this.nested6,
  });

  factory ComplexNested2Nested4.fromJson(Map json) {
    return ComplexNested2Nested4(
      field1: (json['field1'] as List).map((e) {
        return e is BigInt ? e : BigInt.from(e);
      }).toList(),
      field2: (json['field2'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      nested6: ComplexNested2Nested4Nested6.fromJson(
        json['nested6'],
      ),
    );
  }

  /// [field1] defined in Candid: `field1: vec nat`
  final List<BigInt> field1;

  /// [field2] defined in Candid: `field2: opt vec nat8`
  final Uint8List? field2;

  /// [nested6] defined in Candid: `nested6: variant { no_body; field1: vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: vec opt vec Record; field6: vec opt vec New1; field7: vec opt vec New2 }`
  final ComplexNested2Nested4Nested6 nested6;

  Map<String, dynamic> toJson() {
    final field1 = this.field1;
    final field2 = this.field2;
    final nested6 = this.nested6;
    return {
      'field1': field1,
      'field2': [if (field2 != null) field2],
      'nested6': nested6,
    };
  }

  ComplexNested2Nested4 copyWith({
    /// [field1] defined in Candid: `field1: vec nat`
    List<BigInt>? field1,

    /// [field2] defined in Candid: `field2: opt vec nat8`
    Uint8List? field2,

    /// [nested6] defined in Candid: `nested6: variant { no_body; field1: vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: vec opt vec Record; field6: vec opt vec New1; field7: vec opt vec New2 }`
    ComplexNested2Nested4Nested6? nested6,
  }) {
    return ComplexNested2Nested4(
      field1: field1 ?? this.field1,
      field2: field2 ?? this.field2,
      nested6: nested6 ?? this.nested6,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComplexNested2Nested4 &&
            const DeepCollectionEquality().equals(other.field1, field1) &&
            (identical(other.field2, field2) || other.field2 == field2) &&
            (identical(other.nested6, nested6) || other.nested6 == nested6));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(field1),
        field2,
        nested6
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [ComplexNested2] defined in Candid
/// ```Candid
///   variant { no_body; field1: opt vec nat; field2: vec nat8; nested4: record { field1: vec nat; field2: opt vec nat8; nested6: variant { no_body; field1: vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: vec opt vec Record; field6: vec opt vec New1; field7: vec opt vec New2 } } }
/// ```
@immutable
class ComplexNested2 {
  const ComplexNested2({
    /// [noBody] defined in Candid: `no_body`
    this.noBody = false,

    /// [field1] defined in Candid: `field1: opt vec nat`
    this.field1,

    /// [field2] defined in Candid: `field2: vec nat8`
    this.field2,

    /// [nested4] defined in Candid: `nested4: record { field1: vec nat; field2: opt vec nat8; nested6: variant { no_body; field1: vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: vec opt vec Record; field6: vec opt vec New1; field7: vec opt vec New2 } }`
    this.nested4,
  });

  factory ComplexNested2.fromJson(Map json) {
    return ComplexNested2(
      noBody: json.containsKey('no_body'),
      field1: (json['field1'] as List).map((e) {
        return (e as List?)?.map((e) {
          return e is BigInt ? e : BigInt.from(e);
        }).toList();
      }).firstOrNull,
      field2: json['field2'] == null
          ? null
          : json['field2'] is Uint8List
              ? json['field2']
              : Uint8List.fromList((json['field2'] as List).cast()),
      nested4: json['nested4'] == null
          ? null
          : ComplexNested2Nested4.fromJson(
              json['nested4'],
            ),
    );
  }

  /// [noBody] defined in Candid: `no_body`
  final bool noBody;

  /// [field1] defined in Candid: `field1: opt vec nat`
  final List<BigInt>? field1;

  /// [field2] defined in Candid: `field2: vec nat8`
  final Uint8List? field2;

  /// [nested4] defined in Candid: `nested4: record { field1: vec nat; field2: opt vec nat8; nested6: variant { no_body; field1: vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: vec opt vec Record; field6: vec opt vec New1; field7: vec opt vec New2 } }`
  final ComplexNested2Nested4? nested4;

  Map<String, dynamic> toJson() {
    final noBody = this.noBody;
    final field1 = this.field1;
    final field2 = this.field2;
    final nested4 = this.nested4;
    return {
      if (noBody) 'no_body': null,
      if (field1 != null) 'field1': [if (field1 != null) field1],
      if (field2 != null) 'field2': field2,
      if (nested4 != null) 'nested4': nested4,
    };
  }

  ComplexNested2 copyWith({
    /// [noBody] defined in Candid: `no_body`
    bool? noBody,

    /// [field1] defined in Candid: `field1: opt vec nat`
    List<BigInt>? field1,

    /// [field2] defined in Candid: `field2: vec nat8`
    Uint8List? field2,

    /// [nested4] defined in Candid: `nested4: record { field1: vec nat; field2: opt vec nat8; nested6: variant { no_body; field1: vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: vec opt vec Record; field6: vec opt vec New1; field7: vec opt vec New2 } }`
    ComplexNested2Nested4? nested4,
  }) {
    return ComplexNested2(
      noBody: noBody ?? this.noBody,
      field1: field1 ?? this.field1,
      field2: field2 ?? this.field2,
      nested4: nested4 ?? this.nested4,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComplexNested2 &&
            (identical(other.noBody, noBody) || other.noBody == noBody) &&
            const DeepCollectionEquality().equals(other.field1, field1) &&
            (identical(other.field2, field2) || other.field2 == field2) &&
            (identical(other.nested4, nested4) || other.nested4 == nested4));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        noBody,
        const DeepCollectionEquality().hash(field1),
        field2,
        nested4
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [ComplexNested3Nested5Nested7] defined in Candid
/// ```Candid
///   variant { no_key; field1: vec nat; field2: vec nat8; field3: vec vec Record; field4: vec vec New1; field5: vec vec New2 }
/// ```
@immutable
class ComplexNested3Nested5Nested7 {
  const ComplexNested3Nested5Nested7({
    /// [noKey] defined in Candid: `no_key`
    this.noKey = false,

    /// [field1] defined in Candid: `field1: vec nat`
    this.field1,

    /// [field2] defined in Candid: `field2: vec nat8`
    this.field2,

    /// [field3] defined in Candid: `field3: vec vec Record`
    this.field3,

    /// [field4] defined in Candid: `field4: vec vec New1`
    this.field4,

    /// [field5] defined in Candid: `field5: vec vec New2`
    this.field5,
  });

  factory ComplexNested3Nested5Nested7.fromJson(Map json) {
    return ComplexNested3Nested5Nested7(
      noKey: json.containsKey('no_key'),
      field1: (json['field1'] as List?)?.map((e) {
        return e is BigInt ? e : BigInt.from(e);
      }).toList(),
      field2: json['field2'] == null
          ? null
          : json['field2'] is Uint8List
              ? json['field2']
              : Uint8List.fromList((json['field2'] as List).cast()),
      field3: (json['field3'] as List?)?.map((e) {
        return (e as List).map((e) {
          return Record.fromJson(e);
        }).toList();
      }).toList(),
      field4: (json['field4'] as List?)?.map((e) {
        return (e as List).map((e) {
          return New.fromJson(e);
        }).toList();
      }).toList(),
      field5: (json['field5'] as List?)?.map((e) {
        return (e as List).map((e) {
          return (e as List).map((e) {
            return (e as List?)?.map((e) {
              return (e as List).map((e) {
                return New.fromJson(e);
              }).firstOrNull;
            }).toList();
          }).firstOrNull;
        }).toList();
      }).toList(),
    );
  }

  /// [noKey] defined in Candid: `no_key`
  final bool noKey;

  /// [field1] defined in Candid: `field1: vec nat`
  final List<BigInt>? field1;

  /// [field2] defined in Candid: `field2: vec nat8`
  final Uint8List? field2;

  /// [field3] defined in Candid: `field3: vec vec Record`
  final List<List<Record>>? field3;

  /// [field4] defined in Candid: `field4: vec vec New1`
  final List<List<New1>>? field4;

  /// [field5] defined in Candid: `field5: vec vec New2`
  final List<List<New2>>? field5;

  Map<String, dynamic> toJson() {
    final noKey = this.noKey;
    final field1 = this.field1;
    final field2 = this.field2;
    final field3 = this.field3;
    final field4 = this.field4;
    final field5 = this.field5;
    return {
      if (noKey) 'no_key': null,
      if (field1 != null) 'field1': field1,
      if (field2 != null) 'field2': field2,
      if (field3 != null) 'field3': field3,
      if (field4 != null) 'field4': field4,
      if (field5 != null)
        'field5': field5.map((e) {
          return e.map((e) {
            return [
              if (e != null)
                e.map((e) {
                  return [if (e != null) e];
                }).toList()
            ];
          }).toList();
        }).toList(),
    };
  }

  ComplexNested3Nested5Nested7 copyWith({
    /// [noKey] defined in Candid: `no_key`
    bool? noKey,

    /// [field1] defined in Candid: `field1: vec nat`
    List<BigInt>? field1,

    /// [field2] defined in Candid: `field2: vec nat8`
    Uint8List? field2,

    /// [field3] defined in Candid: `field3: vec vec Record`
    List<List<Record>>? field3,

    /// [field4] defined in Candid: `field4: vec vec New1`
    List<List<New1>>? field4,

    /// [field5] defined in Candid: `field5: vec vec New2`
    List<List<New2>>? field5,
  }) {
    return ComplexNested3Nested5Nested7(
      noKey: noKey ?? this.noKey,
      field1: field1 ?? this.field1,
      field2: field2 ?? this.field2,
      field3: field3 ?? this.field3,
      field4: field4 ?? this.field4,
      field5: field5 ?? this.field5,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComplexNested3Nested5Nested7 &&
            (identical(other.noKey, noKey) || other.noKey == noKey) &&
            const DeepCollectionEquality().equals(other.field1, field1) &&
            (identical(other.field2, field2) || other.field2 == field2) &&
            const DeepCollectionEquality().equals(other.field3, field3) &&
            const DeepCollectionEquality().equals(other.field4, field4) &&
            const DeepCollectionEquality().equals(other.field5, field5));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        noKey,
        const DeepCollectionEquality().hash(field1),
        field2,
        const DeepCollectionEquality().hash(field3),
        const DeepCollectionEquality().hash(field4),
        const DeepCollectionEquality().hash(field5)
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [ComplexNested3Nested5] defined in Candid
/// ```Candid
///   record { field1: vec nat; field2: opt vec nat8; nested7: variant { no_key; field1: vec nat; field2: vec nat8; field3: vec vec Record; field4: vec vec New1; field5: vec vec New2 } }
/// ```
@immutable
class ComplexNested3Nested5 {
  const ComplexNested3Nested5({
    /// [field1] defined in Candid: `field1: vec nat`
    required this.field1,

    /// [field2] defined in Candid: `field2: opt vec nat8`
    this.field2,

    /// [nested7] defined in Candid: `nested7: variant { no_key; field1: vec nat; field2: vec nat8; field3: vec vec Record; field4: vec vec New1; field5: vec vec New2 }`
    required this.nested7,
  });

  factory ComplexNested3Nested5.fromJson(Map json) {
    return ComplexNested3Nested5(
      field1: (json['field1'] as List).map((e) {
        return e is BigInt ? e : BigInt.from(e);
      }).toList(),
      field2: (json['field2'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      nested7: ComplexNested3Nested5Nested7.fromJson(
        json['nested7'],
      ),
    );
  }

  /// [field1] defined in Candid: `field1: vec nat`
  final List<BigInt> field1;

  /// [field2] defined in Candid: `field2: opt vec nat8`
  final Uint8List? field2;

  /// [nested7] defined in Candid: `nested7: variant { no_key; field1: vec nat; field2: vec nat8; field3: vec vec Record; field4: vec vec New1; field5: vec vec New2 }`
  final ComplexNested3Nested5Nested7 nested7;

  Map<String, dynamic> toJson() {
    final field1 = this.field1;
    final field2 = this.field2;
    final nested7 = this.nested7;
    return {
      'field1': field1,
      'field2': [if (field2 != null) field2],
      'nested7': nested7,
    };
  }

  ComplexNested3Nested5 copyWith({
    /// [field1] defined in Candid: `field1: vec nat`
    List<BigInt>? field1,

    /// [field2] defined in Candid: `field2: opt vec nat8`
    Uint8List? field2,

    /// [nested7] defined in Candid: `nested7: variant { no_key; field1: vec nat; field2: vec nat8; field3: vec vec Record; field4: vec vec New1; field5: vec vec New2 }`
    ComplexNested3Nested5Nested7? nested7,
  }) {
    return ComplexNested3Nested5(
      field1: field1 ?? this.field1,
      field2: field2 ?? this.field2,
      nested7: nested7 ?? this.nested7,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComplexNested3Nested5 &&
            const DeepCollectionEquality().equals(other.field1, field1) &&
            (identical(other.field2, field2) || other.field2 == field2) &&
            (identical(other.nested7, nested7) || other.nested7 == nested7));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(field1),
        field2,
        nested7
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [ComplexNested3] defined in Candid
/// ```Candid
///   variant { no_key; nested5: record { field1: vec nat; field2: opt vec nat8; nested7: variant { no_key; field1: vec nat; field2: vec nat8; field3: vec vec Record; field4: vec vec New1; field5: vec vec New2 } } }
/// ```
@immutable
class ComplexNested3 {
  const ComplexNested3({
    /// [noKey] defined in Candid: `no_key`
    this.noKey = false,

    /// [nested5] defined in Candid: `nested5: record { field1: vec nat; field2: opt vec nat8; nested7: variant { no_key; field1: vec nat; field2: vec nat8; field3: vec vec Record; field4: vec vec New1; field5: vec vec New2 } }`
    this.nested5,
  });

  factory ComplexNested3.fromJson(Map json) {
    return ComplexNested3(
      noKey: json.containsKey('no_key'),
      nested5: json['nested5'] == null
          ? null
          : ComplexNested3Nested5.fromJson(
              json['nested5'],
            ),
    );
  }

  /// [noKey] defined in Candid: `no_key`
  final bool noKey;

  /// [nested5] defined in Candid: `nested5: record { field1: vec nat; field2: opt vec nat8; nested7: variant { no_key; field1: vec nat; field2: vec nat8; field3: vec vec Record; field4: vec vec New1; field5: vec vec New2 } }`
  final ComplexNested3Nested5? nested5;

  Map<String, dynamic> toJson() {
    final noKey = this.noKey;
    final nested5 = this.nested5;
    return {
      if (noKey) 'no_key': null,
      if (nested5 != null) 'nested5': nested5,
    };
  }

  ComplexNested3 copyWith({
    /// [noKey] defined in Candid: `no_key`
    bool? noKey,

    /// [nested5] defined in Candid: `nested5: record { field1: vec nat; field2: opt vec nat8; nested7: variant { no_key; field1: vec nat; field2: vec nat8; field3: vec vec Record; field4: vec vec New1; field5: vec vec New2 } }`
    ComplexNested3Nested5? nested5,
  }) {
    return ComplexNested3(
      noKey: noKey ?? this.noKey,
      nested5: nested5 ?? this.nested5,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComplexNested3 &&
            (identical(other.noKey, noKey) || other.noKey == noKey) &&
            (identical(other.nested5, nested5) || other.nested5 == nested5));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, noKey, nested5]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Complex] defined in Candid
/// ```Candid
///   record { field1: opt vec Record; field2: opt vec Phone; nested1: record { field1: vec nat; field2: vec nat8; nested3: record { field1: vec nat; field2: vec nat8; nested5: record { field1: opt vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: opt vec opt vec opt vec opt vec opt vec Record } } }; nested2: variant { no_body; field1: opt vec nat; field2: vec nat8; nested4: record { field1: vec nat; field2: opt vec nat8; nested6: variant { no_body; field1: vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: vec opt vec Record; field6: vec opt vec New1; field7: vec opt vec New2 } } }; nested3: variant { no_key; nested5: record { field1: vec nat; field2: opt vec nat8; nested7: variant { no_key; field1: vec nat; field2: vec nat8; field3: vec vec Record; field4: vec vec New1; field5: vec vec New2 } } } }
/// ```
@immutable
class Complex {
  const Complex({
    /// [field1] defined in Candid: `field1: opt vec Record`
    this.field1,

    /// [field2] defined in Candid: `field2: opt vec Phone`
    this.field2,

    /// [nested1] defined in Candid: `nested1: record { field1: vec nat; field2: vec nat8; nested3: record { field1: vec nat; field2: vec nat8; nested5: record { field1: opt vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: opt vec opt vec opt vec opt vec opt vec Record } } }`
    required this.nested1,

    /// [nested2] defined in Candid: `nested2: variant { no_body; field1: opt vec nat; field2: vec nat8; nested4: record { field1: vec nat; field2: opt vec nat8; nested6: variant { no_body; field1: vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: vec opt vec Record; field6: vec opt vec New1; field7: vec opt vec New2 } } }`
    required this.nested2,

    /// [nested3] defined in Candid: `nested3: variant { no_key; nested5: record { field1: vec nat; field2: opt vec nat8; nested7: variant { no_key; field1: vec nat; field2: vec nat8; field3: vec vec Record; field4: vec vec New1; field5: vec vec New2 } } }`
    required this.nested3,
  });

  factory Complex.fromJson(Map json) {
    return Complex(
      field1: (json['field1'] as List).map((e) {
        return (e as List?)?.map((e) {
          return Record.fromJson(e);
        }).toList();
      }).firstOrNull,
      field2: (json['field2'] as List).map((e) {
        return (e as List?)?.map((e) {
          return e == null
              ? null
              : e is BigInt
                  ? e
                  : BigInt.from(e);
        }).toList();
      }).firstOrNull,
      nested1: ComplexNested1.fromJson(
        json['nested1'],
      ),
      nested2: ComplexNested2.fromJson(
        json['nested2'],
      ),
      nested3: ComplexNested3.fromJson(
        json['nested3'],
      ),
    );
  }

  /// [field1] defined in Candid: `field1: opt vec Record`
  final List<Record>? field1;

  /// [field2] defined in Candid: `field2: opt vec Phone`
  final List<Phone>? field2;

  /// [nested1] defined in Candid: `nested1: record { field1: vec nat; field2: vec nat8; nested3: record { field1: vec nat; field2: vec nat8; nested5: record { field1: opt vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: opt vec opt vec opt vec opt vec opt vec Record } } }`
  final ComplexNested1 nested1;

  /// [nested2] defined in Candid: `nested2: variant { no_body; field1: opt vec nat; field2: vec nat8; nested4: record { field1: vec nat; field2: opt vec nat8; nested6: variant { no_body; field1: vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: vec opt vec Record; field6: vec opt vec New1; field7: vec opt vec New2 } } }`
  final ComplexNested2 nested2;

  /// [nested3] defined in Candid: `nested3: variant { no_key; nested5: record { field1: vec nat; field2: opt vec nat8; nested7: variant { no_key; field1: vec nat; field2: vec nat8; field3: vec vec Record; field4: vec vec New1; field5: vec vec New2 } } }`
  final ComplexNested3 nested3;

  Map<String, dynamic> toJson() {
    final field1 = this.field1;
    final field2 = this.field2;
    final nested1 = this.nested1;
    final nested2 = this.nested2;
    final nested3 = this.nested3;
    return {
      'field1': [if (field1 != null) field1],
      'field2': [if (field2 != null) field2],
      'nested1': nested1,
      'nested2': nested2,
      'nested3': nested3,
    };
  }

  Complex copyWith({
    /// [field1] defined in Candid: `field1: opt vec Record`
    List<Record>? field1,

    /// [field2] defined in Candid: `field2: opt vec Phone`
    List<Phone>? field2,

    /// [nested1] defined in Candid: `nested1: record { field1: vec nat; field2: vec nat8; nested3: record { field1: vec nat; field2: vec nat8; nested5: record { field1: opt vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: opt vec opt vec opt vec opt vec opt vec Record } } }`
    ComplexNested1? nested1,

    /// [nested2] defined in Candid: `nested2: variant { no_body; field1: opt vec nat; field2: vec nat8; nested4: record { field1: vec nat; field2: opt vec nat8; nested6: variant { no_body; field1: vec nat; field2: vec nat8; field3: vec vec vec vec vec Record; field4: opt vec vec vec vec vec Record; field5: vec opt vec Record; field6: vec opt vec New1; field7: vec opt vec New2 } } }`
    ComplexNested2? nested2,

    /// [nested3] defined in Candid: `nested3: variant { no_key; nested5: record { field1: vec nat; field2: opt vec nat8; nested7: variant { no_key; field1: vec nat; field2: vec nat8; field3: vec vec Record; field4: vec vec New1; field5: vec vec New2 } } }`
    ComplexNested3? nested3,
  }) {
    return Complex(
      field1: field1 ?? this.field1,
      field2: field2 ?? this.field2,
      nested1: nested1 ?? this.nested1,
      nested2: nested2 ?? this.nested2,
      nested3: nested3 ?? this.nested3,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Complex &&
            const DeepCollectionEquality().equals(other.field1, field1) &&
            const DeepCollectionEquality().equals(other.field2, field2) &&
            (identical(other.nested1, nested1) || other.nested1 == nested1) &&
            (identical(other.nested2, nested2) || other.nested2 == nested2) &&
            (identical(other.nested3, nested3) || other.nested3 == nested3));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(field1),
        const DeepCollectionEquality().hash(field2),
        nested1,
        nested2,
        nested3
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [RefServiceEcho3Arg0] defined in Candid
/// ```Candid
///   record { text }
/// ```
@immutable
class RefServiceEcho3Arg0 {
  const RefServiceEcho3Arg0(this.item1);

  factory RefServiceEcho3Arg0.fromJson(List<dynamic> tuple) {
    return RefServiceEcho3Arg0(
      tuple[0],
    );
  }

  /// [item1] defined in Candid: `text`
  final String item1;

  List<dynamic> toJson() {
    final item1 = this.item1;
    return [
      item1,
    ];
  }

  RefServiceEcho3Arg0 copyWith(
      {
      /// [item1] defined in Candid: `text`
      String? item1}) {
    return RefServiceEcho3Arg0(
      item1 ?? this.item1,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RefServiceEcho3Arg0 &&
            (identical(other.item1, item1) || other.item1 == item1));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, item1]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [RefServiceEcho3Ret0] defined in Candid
/// ```Candid
///   record { text }
/// ```
typedef RefServiceEcho3Ret0 = RefServiceEcho3Arg0;

/// [ServiceDoRet0Echo3Arg] defined in Candid
/// ```Candid
///   (Record, Variant)
/// ```
@immutable
class ServiceDoRet0Echo3Arg {
  const ServiceDoRet0Echo3Arg(
    this.item1,
    this.item2,
  );

  factory ServiceDoRet0Echo3Arg.fromJson(List<dynamic> tuple) {
    return ServiceDoRet0Echo3Arg(
      Record.fromJson(tuple[0]),
      Variant.fromJson(tuple[1]),
    );
  }

  /// [item1] defined in Candid: `Record`
  final Record item1;

  /// [item2] defined in Candid: `Variant`
  final Variant item2;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      item1,
      item2,
    ];
  }

  ServiceDoRet0Echo3Arg copyWith({
    /// [item1] defined in Candid: `Record`
    Record? item1,

    /// [item2] defined in Candid: `Variant`
    Variant? item2,
  }) {
    return ServiceDoRet0Echo3Arg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceDoRet0Echo3Arg &&
            (identical(other.item1, item1) || other.item1 == item1) &&
            (identical(other.item2, item2) || other.item2 == item2));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, item1, item2]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [ServiceDoRet0Echo3Ret] defined in Candid
/// ```Candid
///   (Record, Variant)
/// ```
@immutable
class ServiceDoRet0Echo3Ret {
  const ServiceDoRet0Echo3Ret(
    this.item1,
    this.item2,
  );

  factory ServiceDoRet0Echo3Ret.fromJson(List<dynamic> tuple) {
    return ServiceDoRet0Echo3Ret(
      Record.fromJson(tuple[0]),
      Variant.fromJson(tuple[1]),
    );
  }

  /// [item1] defined in Candid: `Record`
  final Record item1;

  /// [item2] defined in Candid: `Variant`
  final Variant item2;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      item1,
      item2,
    ];
  }

  ServiceDoRet0Echo3Ret copyWith({
    /// [item1] defined in Candid: `Record`
    Record? item1,

    /// [item2] defined in Candid: `Variant`
    Variant? item2,
  }) {
    return ServiceDoRet0Echo3Ret(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceDoRet0Echo3Ret &&
            (identical(other.item1, item1) || other.item1 == item1) &&
            (identical(other.item2, item2) || other.item2 == item2));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, item1, item2]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [RefServiceInsertArg] defined in Candid
/// ```Candid
///   (text, text, text)
/// ```
@immutable
class RefServiceInsertArg {
  const RefServiceInsertArg(
    this.item1,
    this.item2,
    this.item3,
  );

  factory RefServiceInsertArg.fromJson(List<dynamic> tuple) {
    return RefServiceInsertArg(
      tuple[0],
      tuple[1],
      tuple[2],
    );
  }

  /// [item1] defined in Candid: `text`
  final String item1;

  /// [item2] defined in Candid: `text`
  final String item2;

  /// [item3] defined in Candid: `text`
  final String item3;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    final item3 = this.item3;
    return [
      item1,
      item2,
      item3,
    ];
  }

  RefServiceInsertArg copyWith({
    /// [item1] defined in Candid: `text`
    String? item1,

    /// [item2] defined in Candid: `text`
    String? item2,

    /// [item3] defined in Candid: `text`
    String? item3,
  }) {
    return RefServiceInsertArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RefServiceInsertArg &&
            (identical(other.item1, item1) || other.item1 == item1) &&
            (identical(other.item2, item2) || other.item2 == item2) &&
            (identical(other.item3, item3) || other.item3 == item3));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, item1, item2, item3]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [RefServiceEcho2Arg] defined in Candid
/// ```Candid
///   (opt vec opt New2, opt vec opt New2, opt vec opt New2)
/// ```
@immutable
class RefServiceEcho2Arg {
  const RefServiceEcho2Arg(
    this.item1,
    this.item2,
    this.item3,
  );

  factory RefServiceEcho2Arg.fromJson(List<dynamic> tuple) {
    return RefServiceEcho2Arg(
      (tuple[0] as List).map((e) {
        return (e as List?)?.map((e) {
          return (e as List).map((e) {
            return (e as List).map((e) {
              return (e as List?)?.map((e) {
                return (e as List).map((e) {
                  return New.fromJson(e);
                }).firstOrNull;
              }).toList();
            }).firstOrNull;
          }).firstOrNull;
        }).toList();
      }).firstOrNull,
      (tuple[1] as List).map((e) {
        return (e as List?)?.map((e) {
          return (e as List).map((e) {
            return (e as List).map((e) {
              return (e as List?)?.map((e) {
                return (e as List).map((e) {
                  return New.fromJson(e);
                }).firstOrNull;
              }).toList();
            }).firstOrNull;
          }).firstOrNull;
        }).toList();
      }).firstOrNull,
      (tuple[2] as List).map((e) {
        return (e as List?)?.map((e) {
          return (e as List).map((e) {
            return (e as List).map((e) {
              return (e as List?)?.map((e) {
                return (e as List).map((e) {
                  return New.fromJson(e);
                }).firstOrNull;
              }).toList();
            }).firstOrNull;
          }).firstOrNull;
        }).toList();
      }).firstOrNull,
    );
  }

  /// [item1] defined in Candid: `opt vec opt New2`
  final List<New2?>? item1;

  /// [item2] defined in Candid: `opt vec opt New2`
  final List<New2?>? item2;

  /// [item3] defined in Candid: `opt vec opt New2`
  final List<New2?>? item3;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    final item3 = this.item3;
    return [
      [
        if (item1 != null)
          item1.map((e) {
            return [
              if (e != null)
                [
                  if (e != null)
                    e.map((e) {
                      return [if (e != null) e];
                    }).toList()
                ]
            ];
          }).toList()
      ],
      [
        if (item2 != null)
          item2.map((e) {
            return [
              if (e != null)
                [
                  if (e != null)
                    e.map((e) {
                      return [if (e != null) e];
                    }).toList()
                ]
            ];
          }).toList()
      ],
      [
        if (item3 != null)
          item3.map((e) {
            return [
              if (e != null)
                [
                  if (e != null)
                    e.map((e) {
                      return [if (e != null) e];
                    }).toList()
                ]
            ];
          }).toList()
      ],
    ];
  }

  RefServiceEcho2Arg copyWith({
    /// [item1] defined in Candid: `opt vec opt New2`
    List<New2?>? item1,

    /// [item2] defined in Candid: `opt vec opt New2`
    List<New2?>? item2,

    /// [item3] defined in Candid: `opt vec opt New2`
    List<New2?>? item3,
  }) {
    return RefServiceEcho2Arg(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RefServiceEcho2Arg &&
            const DeepCollectionEquality().equals(other.item1, item1) &&
            const DeepCollectionEquality().equals(other.item2, item2) &&
            const DeepCollectionEquality().equals(other.item3, item3));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(item1),
        const DeepCollectionEquality().hash(item2),
        const DeepCollectionEquality().hash(item3)
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [RefServiceEcho2Ret] defined in Candid
/// ```Candid
///   (opt vec New2, opt vec opt New2, opt vec opt New2)
/// ```
@immutable
class RefServiceEcho2Ret {
  const RefServiceEcho2Ret(
    this.item1,
    this.item2,
    this.item3,
  );

  factory RefServiceEcho2Ret.fromJson(List<dynamic> tuple) {
    return RefServiceEcho2Ret(
      (tuple[0] as List).map((e) {
        return (e as List?)?.map((e) {
          return (e as List).map((e) {
            return (e as List?)?.map((e) {
              return (e as List).map((e) {
                return New.fromJson(e);
              }).firstOrNull;
            }).toList();
          }).firstOrNull;
        }).toList();
      }).firstOrNull,
      (tuple[1] as List).map((e) {
        return (e as List?)?.map((e) {
          return (e as List).map((e) {
            return (e as List).map((e) {
              return (e as List?)?.map((e) {
                return (e as List).map((e) {
                  return New.fromJson(e);
                }).firstOrNull;
              }).toList();
            }).firstOrNull;
          }).firstOrNull;
        }).toList();
      }).firstOrNull,
      (tuple[2] as List).map((e) {
        return (e as List?)?.map((e) {
          return (e as List).map((e) {
            return (e as List).map((e) {
              return (e as List?)?.map((e) {
                return (e as List).map((e) {
                  return New.fromJson(e);
                }).firstOrNull;
              }).toList();
            }).firstOrNull;
          }).firstOrNull;
        }).toList();
      }).firstOrNull,
    );
  }

  /// [item1] defined in Candid: `opt vec New2`
  final List<New2>? item1;

  /// [item2] defined in Candid: `opt vec opt New2`
  final List<New2?>? item2;

  /// [item3] defined in Candid: `opt vec opt New2`
  final List<New2?>? item3;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    final item3 = this.item3;
    return [
      [
        if (item1 != null)
          item1.map((e) {
            return [
              if (e != null)
                e.map((e) {
                  return [if (e != null) e];
                }).toList()
            ];
          }).toList()
      ],
      [
        if (item2 != null)
          item2.map((e) {
            return [
              if (e != null)
                [
                  if (e != null)
                    e.map((e) {
                      return [if (e != null) e];
                    }).toList()
                ]
            ];
          }).toList()
      ],
      [
        if (item3 != null)
          item3.map((e) {
            return [
              if (e != null)
                [
                  if (e != null)
                    e.map((e) {
                      return [if (e != null) e];
                    }).toList()
                ]
            ];
          }).toList()
      ],
    ];
  }

  RefServiceEcho2Ret copyWith({
    /// [item1] defined in Candid: `opt vec New2`
    List<New2>? item1,

    /// [item2] defined in Candid: `opt vec opt New2`
    List<New2?>? item2,

    /// [item3] defined in Candid: `opt vec opt New2`
    List<New2?>? item3,
  }) {
    return RefServiceEcho2Ret(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RefServiceEcho2Ret &&
            const DeepCollectionEquality().equals(other.item1, item1) &&
            const DeepCollectionEquality().equals(other.item2, item2) &&
            const DeepCollectionEquality().equals(other.item3, item3));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(item1),
        const DeepCollectionEquality().hash(item2),
        const DeepCollectionEquality().hash(item3)
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Name] defined in Candid
/// ```Candid
///   type Name = text;
/// ```
typedef Name = String;

/// [Tel] defined in Candid
/// ```Candid
///   type Tel = Phone;
/// ```
typedef Tel = Phone;

/// [Phone] defined in Candid
/// ```Candid
///   type Phone = Mobile;
/// ```
typedef Phone = Mobile;

/// [Mobile] defined in Candid
/// ```Candid
///   type Mobile = nat;
/// ```
typedef Mobile = BigInt;

/// [Contact] defined in Candid
/// ```Candid
///   type Contact = Phone;
/// ```
typedef Contact = Phone;

/// [Contacts] defined in Candid
/// ```Candid
///   type Contacts = vec Contact;
/// ```
typedef Contacts = List<Contact>;

/// [NullableContacts] defined in Candid
/// ```Candid
///   type NullableContacts = opt vec Contact;
/// ```
typedef NullableContacts = List<Contact>?;

/// [NullableRecord] defined in Candid
/// ```Candid
///   type NullableRecord = opt record { name: Name; phone: opt Phone; profile: opt text; family: opt vec Variant };
/// ```
typedef NullableRecord = NullableRecordOpt?;

/// [NullableNestedRecord] defined in Candid
/// ```Candid
///   type NullableNestedRecord = opt vec record { name: Name; phone: opt Phone; profile: opt text; family: opt vec Variant };
/// ```
typedef NullableNestedRecord = List<NullableNestedRecordOptItem>?;

/// [NullableVariant] defined in Candid
/// ```Candid
///   type NullableVariant = opt variant { name: Name; phone: opt Phone; profile: opt text; family: opt vec Record };
/// ```
typedef NullableVariant = NullableVariantOpt?;

/// [NullableNew] defined in Candid
/// ```Candid
///   type NullableNew = opt record { Record; Variant };
/// ```
typedef NullableNew = NullableNewOpt?;

/// [New1] defined in Candid
/// ```Candid
///   type New1 = New;
/// ```
typedef New1 = New;

/// [New2] defined in Candid
/// ```Candid
///   type New2 = opt vec opt New1;
/// ```
typedef New2 = List<New1?>?;
