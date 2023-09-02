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

class CdIDLActor {
  const CdIDLActor._();

  /// ```Candid
  ///   echo: (node: opt Node) -> (opt Node1) query
  /// ```
  static Future<Node1?> echo(
    CanisterActor actor, [
    Node? arg,
  ]) async {
    final request = [
      [if (arg != null) arg]
    ];
    const method = 'echo';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
      return e == null ? null : Node1.fromJson(e);
    }).firstOrNull;
  }

  /// ```Candid
  ///   echo1: (A, B, C, D, E, F, G, H, I, J) -> (opt A, opt B, opt C, opt D, opt E, opt F, opt G, opt H, opt I, opt J)
  /// ```
  static Future<Echo1Ret> echo1(
    CanisterActor actor,
    Echo1Arg arg,
  ) async {
    final request = arg.toJson();
    const method = 'echo1';
    final response = await actor.getFunc(method)!(request);
    return Echo1Ret.fromJson(response);
  }

  /// ```Candid
  ///   echo2: (tt: J) -> ()
  /// ```
  static Future<void> echo2(
    CanisterActor actor,
    J arg,
  ) async {
    final request = [
      [
        if (arg != null)
          arg.map((e) {
            return [if (e != null) e];
          }).toList()
      ]
    ];
    const method = 'echo2';
    await actor.getFunc(method)!(request);
  }

  /// ```Candid
  ///   echo3: (tt: J) -> () composite_query
  /// ```
  static Future<void> echo3(
    CanisterActor actor,
    J arg,
  ) async {
    final request = [
      [
        if (arg != null)
          arg.map((e) {
            return [if (e != null) e];
          }).toList()
      ]
    ];
    const method = 'echo3';
    await actor.getFunc(method)!(request);
  }
}

class CdIDL {
  const CdIDL._();

  /// [_Class] defined in Candid
  /// ```Candid
  ///   type Class = variant { no_body; hello: text; class: opt vec opt Class; bigint: nat };
  /// ```
  static final RecClass _Class = IDL.Rec();
  static final VariantClass __Class = IDL.Variant({
    'no_body': IDL.Null,
    'hello': IDL.Text,
    'class': IDL.Opt(
      IDL.Vec(
        IDL.Opt(
          _Class,
        ),
      ),
    ),
    'bigint': IDL.Nat,
  });

  /// [_Node2] defined in Candid
  /// ```Candid
  ///   type Node2 = record { Node1 };
  /// ```
  static final RecClass _Node2 = IDL.Rec();
  static final TupleClass __Node2 = IDL.Tuple([
    _Node1,
  ]);

  /// [_Node] defined in Candid
  /// ```Candid
  ///   type Node = record { data: nat; left: opt Node2 };
  /// ```
  static final RecClass _Node = IDL.Rec();
  static final RecordClass __Node = IDL.Record({
    'data': IDL.Nat,
    'left': IDL.Opt(
      _Node2,
    ),
  });

  /// [_Node1] defined in Candid
  /// ```Candid
  ///   type Node1 = record { Node; Node };
  /// ```
  static final RecClass _Node1 = IDL.Rec();
  static final TupleClass __Node1 = IDL.Tuple([
    _Node,
    _Node,
  ]);

  /// [_A] defined in Candid
  /// ```Candid
  ///   type A = vec B;
  /// ```
  static final VecClass _A = IDL.Vec(
    _B,
  );

  /// [_B] defined in Candid
  /// ```Candid
  ///   type B = vec C;
  /// ```
  static final VecClass _B = IDL.Vec(
    _C,
  );

  /// [_C] defined in Candid
  /// ```Candid
  ///   type C = opt vec D;
  /// ```
  static final RecClass _C = IDL.Rec();
  static final OptClass __C = IDL.Opt(
    IDL.Vec(
      _D,
    ),
  );

  /// [_D] defined in Candid
  /// ```Candid
  ///   type D = variant { A; B; c: C; d: D; e: E; node2: Node2 };
  /// ```
  static final RecClass _D = IDL.Rec();
  static final VariantClass __D = IDL.Variant({
    'A': IDL.Null,
    'B': IDL.Null,
    'c': _C,
    'd': _D,
    'e': _E,
    'node2': _Node2,
  });

  /// [_E] defined in Candid
  /// ```Candid
  ///   type E = vec nat8;
  /// ```
  static final VecClass _E = IDL.Vec(
    IDL.Nat8,
  );

  /// [_F] defined in Candid
  /// ```Candid
  ///   type F = vec E;
  /// ```
  static final VecClass _F = IDL.Vec(
    _E,
  );

  /// [_G] defined in Candid
  /// ```Candid
  ///   type G = record { record { F; E; G }; record { A; B; C } };
  /// ```
  static final RecClass _G = IDL.Rec();
  static final TupleClass __G = IDL.Tuple([
    IDL.Tuple([
      _F,
      _E,
      _G,
    ]),
    IDL.Tuple([
      _A,
      _B,
      _C,
    ]),
  ]);

  /// [_H] defined in Candid
  /// ```Candid
  ///   type H = record { A; B; C };
  /// ```
  static final TupleClass _H = IDL.Tuple([
    _A,
    _B,
    _C,
  ]);

  /// [_I] defined in Candid
  /// ```Candid
  ///   type I = opt record { A; B; C };
  /// ```
  static final OptClass _I = IDL.Opt(
    IDL.Tuple([
      _A,
      _B,
      _C,
    ]),
  );

  /// [_J] defined in Candid
  /// ```Candid
  ///   type J = opt vec opt vec H;
  /// ```
  static final OptClass _J = IDL.Opt(
    IDL.Vec(
      IDL.Opt(
        IDL.Vec(
          _H,
        ),
      ),
    ),
  );

  /// [_K] defined in Candid
  /// ```Candid
  ///   type K = func () -> ();
  /// ```
  static final FuncClass _K = IDL.Func(
    [],
    [],
    [],
  );

  static final ServiceClass idl = () {
    _Class.fill(__Class);
    _Node2.fill(__Node2);
    _Node.fill(__Node);
    _Node1.fill(__Node1);
    _C.fill(__C);
    _D.fill(__D);
    _G.fill(__G);
    return IDL.Service({
      'echo': IDL.Func(
        [
          IDL.Opt(
            _Node,
          )
        ],
        [
          IDL.Opt(
            _Node1,
          )
        ],
        ['query'],
      ),
      'echo1': IDL.Func(
        [_A, _B, _C, _D, _E, _F, _G, _H, _I, _J],
        [
          IDL.Opt(
            _A,
          ),
          IDL.Opt(
            _B,
          ),
          IDL.Opt(
            _C,
          ),
          IDL.Opt(
            _D,
          ),
          IDL.Opt(
            _E,
          ),
          IDL.Opt(
            _F,
          ),
          IDL.Opt(
            _G,
          ),
          IDL.Opt(
            _H,
          ),
          IDL.Opt(
            _I,
          ),
          IDL.Opt(
            _J,
          )
        ],
        [],
      ),
      'echo2': IDL.Func(
        [_J],
        [],
        [],
      ),
      'echo3': IDL.Func(
        [_J],
        [],
        ['composite_query'],
      ),
    });
  }();
}

/// [Class] defined in Candid
/// ```Candid
///   variant { no_body; hello: text; class: opt vec opt Class; bigint: nat }
/// ```
@immutable
class Class {
  const Class({
    /// [noBody] defined in Candid: `no_body`
    this.noBody = false,

    /// [hello] defined in Candid: `hello: text`
    this.hello,

    /// [class_] defined in Candid: `class: opt vec opt Class`
    this.class_,

    /// [bigint] defined in Candid: `bigint: nat`
    this.bigint,
  });

  factory Class.fromJson(Map json) {
    return Class(
      noBody: json.containsKey('no_body'),
      hello: json['hello'],
      class_: (json['class'] as List).map((e) {
        return (e as List?)?.map((e) {
          return (e as List).map((e) {
            return e == null ? null : Class.fromJson(e);
          }).firstOrNull;
        }).toList();
      }).firstOrNull,
      bigint: json['bigint'] == null
          ? null
          : json['bigint'] is BigInt
              ? json['bigint']
              : BigInt.from(json['bigint']),
    );
  }

  /// [noBody] defined in Candid: `no_body`
  final bool noBody;

  /// [hello] defined in Candid: `hello: text`
  final String? hello;

  /// [class_] defined in Candid: `class: opt vec opt Class`
  final List<Class?>? class_;

  /// [bigint] defined in Candid: `bigint: nat`
  final BigInt? bigint;

  Map<String, dynamic> toJson() {
    final noBody = this.noBody;
    final hello = this.hello;
    final class_ = this.class_;
    final bigint = this.bigint;
    return {
      if (noBody) 'no_body': null,
      if (hello != null) 'hello': hello,
      if (class_ != null)
        'class': [
          if (class_ != null)
            class_.map((e) {
              return [if (e != null) e];
            }).toList()
        ],
      if (bigint != null) 'bigint': bigint,
    };
  }

  Class copyWith({
    /// [noBody] defined in Candid: `no_body`
    bool? noBody,

    /// [hello] defined in Candid: `hello: text`
    String? hello,

    /// [class_] defined in Candid: `class: opt vec opt Class`
    List<Class?>? class_,

    /// [bigint] defined in Candid: `bigint: nat`
    BigInt? bigint,
  }) {
    return Class(
      noBody: noBody ?? this.noBody,
      hello: hello ?? this.hello,
      class_: class_ ?? this.class_,
      bigint: bigint ?? this.bigint,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Class &&
            (identical(other.noBody, noBody) || other.noBody == noBody) &&
            (identical(other.hello, hello) || other.hello == hello) &&
            const DeepCollectionEquality().equals(other.class_, class_) &&
            (identical(other.bigint, bigint) || other.bigint == bigint));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        noBody,
        hello,
        const DeepCollectionEquality().hash(class_),
        bigint
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Node2] defined in Candid
/// ```Candid
///   record { Node1 }
/// ```
@immutable
class Node2 {
  const Node2(this.item1);

  factory Node2.fromJson(List<dynamic> tuple) {
    return Node2(
      Node1.fromJson(tuple[0]),
    );
  }

  /// [item1] defined in Candid: `Node1`
  final Node1 item1;

  List<dynamic> toJson() {
    final item1 = this.item1;
    return [
      item1,
    ];
  }

  Node2 copyWith(
      {
      /// [item1] defined in Candid: `Node1`
      Node1? item1}) {
    return Node2(
      item1 ?? this.item1,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Node2 &&
            (identical(other.item1, item1) || other.item1 == item1));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, item1]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Node] defined in Candid
/// ```Candid
///   record { data: nat; left: opt Node2 }
/// ```
@immutable
class Node {
  const Node({
    /// [data] defined in Candid: `data: nat`
    required this.data,

    /// [left] defined in Candid: `left: opt Node2`
    this.left,
  });

  factory Node.fromJson(Map json) {
    return Node(
      data: json['data'] is BigInt ? json['data'] : BigInt.from(json['data']),
      left: (json['left'] as List).map((e) {
        return e == null ? null : Node2.fromJson(e);
      }).firstOrNull,
    );
  }

  /// [data] defined in Candid: `data: nat`
  final BigInt data;

  /// [left] defined in Candid: `left: opt Node2`
  final Node2? left;

  Map<String, dynamic> toJson() {
    final data = this.data;
    final left = this.left;
    return {
      'data': data,
      'left': [if (left != null) left],
    };
  }

  Node copyWith({
    /// [data] defined in Candid: `data: nat`
    BigInt? data,

    /// [left] defined in Candid: `left: opt Node2`
    Node2? left,
  }) {
    return Node(
      data: data ?? this.data,
      left: left ?? this.left,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Node &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.left, left) || other.left == left));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, data, left]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Node1] defined in Candid
/// ```Candid
///   record { Node; Node }
/// ```
@immutable
class Node1 {
  const Node1(
    this.item1,
    this.item2,
  );

  factory Node1.fromJson(List<dynamic> tuple) {
    return Node1(
      Node.fromJson(tuple[0]),
      Node.fromJson(tuple[1]),
    );
  }

  /// [item1] defined in Candid: `Node`
  final Node item1;

  /// [item2] defined in Candid: `Node`
  final Node item2;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      item1,
      item2,
    ];
  }

  Node1 copyWith({
    /// [item1] defined in Candid: `Node`
    Node? item1,

    /// [item2] defined in Candid: `Node`
    Node? item2,
  }) {
    return Node1(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Node1 &&
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

/// [D] defined in Candid
/// ```Candid
///   variant { A; B; c: C; d: D; e: E; node2: Node2 }
/// ```
@immutable
class D {
  const D({
    /// [a] defined in Candid: `A`
    this.a = false,

    /// [b] defined in Candid: `B`
    this.b = false,

    /// [c] defined in Candid: `c: C`
    this.c,

    /// [d] defined in Candid: `d: D`
    this.d,

    /// [e] defined in Candid: `e: E`
    this.e,

    /// [node2] defined in Candid: `node2: Node2`
    this.node2,
  });

  factory D.fromJson(Map json) {
    return D(
      a: json.containsKey('A'),
      b: json.containsKey('B'),
      c: (json['c'] as List).map((e) {
        return (e as List?)?.map((e) {
          return D.fromJson(e);
        }).toList();
      }).firstOrNull,
      d: json['d'] == null ? null : D.fromJson(json['d']),
      e: json['e'] == null
          ? null
          : json['e'] is Uint8List
              ? json['e']
              : Uint8List.fromList((json['e'] as List).cast()),
      node2: json['node2'] == null ? null : Node2.fromJson(json['node2']),
    );
  }

  /// [a] defined in Candid: `A`
  final bool a;

  /// [b] defined in Candid: `B`
  final bool b;

  /// [c] defined in Candid: `c: C`
  final C? c;

  /// [d] defined in Candid: `d: D`
  final D? d;

  /// [e] defined in Candid: `e: E`
  final E? e;

  /// [node2] defined in Candid: `node2: Node2`
  final Node2? node2;

  Map<String, dynamic> toJson() {
    final a = this.a;
    final b = this.b;
    final c = this.c;
    final d = this.d;
    final e = this.e;
    final node2 = this.node2;
    return {
      if (a) 'A': null,
      if (b) 'B': null,
      if (c != null) 'c': [if (c != null) c],
      if (d != null) 'd': d,
      if (e != null) 'e': e,
      if (node2 != null) 'node2': node2,
    };
  }

  D copyWith({
    /// [a] defined in Candid: `A`
    bool? a,

    /// [b] defined in Candid: `B`
    bool? b,

    /// [c] defined in Candid: `c: C`
    C? c,

    /// [d] defined in Candid: `d: D`
    D? d,

    /// [e] defined in Candid: `e: E`
    E? e,

    /// [node2] defined in Candid: `node2: Node2`
    Node2? node2,
  }) {
    return D(
      a: a ?? this.a,
      b: b ?? this.b,
      c: c ?? this.c,
      d: d ?? this.d,
      e: e ?? this.e,
      node2: node2 ?? this.node2,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is D &&
            (identical(other.a, a) || other.a == a) &&
            (identical(other.b, b) || other.b == b) &&
            (identical(other.c, c) || other.c == c) &&
            (identical(other.d, d) || other.d == d) &&
            (identical(other.e, e) || other.e == e) &&
            (identical(other.node2, node2) || other.node2 == node2));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, a, b, c, d, e, node2]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [G0] defined in Candid
/// ```Candid
///   record { F; E; G }
/// ```
@immutable
class G0 {
  const G0(
    this.item1,
    this.item2,
    this.item3,
  );

  factory G0.fromJson(List<dynamic> tuple) {
    return G0(
      (tuple[0] as List).map((e) {
        return e is Uint8List ? e : Uint8List.fromList((e as List).cast());
      }).toList(),
      tuple[1] is Uint8List
          ? tuple[1]
          : Uint8List.fromList((tuple[1] as List).cast()),
      G.fromJson(tuple[2]),
    );
  }

  /// [item1] defined in Candid: `F`
  final F item1;

  /// [item2] defined in Candid: `E`
  final E item2;

  /// [item3] defined in Candid: `G`
  final G item3;

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

  G0 copyWith({
    /// [item1] defined in Candid: `F`
    F? item1,

    /// [item2] defined in Candid: `E`
    E? item2,

    /// [item3] defined in Candid: `G`
    G? item3,
  }) {
    return G0(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is G0 &&
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

/// [G1] defined in Candid
/// ```Candid
///   record { A; B; C }
/// ```
@immutable
class G1 {
  const G1(
    this.item1,
    this.item2,
    this.item3,
  );

  factory G1.fromJson(List<dynamic> tuple) {
    return G1(
      (tuple[0] as List).map((e) {
        return (e as List).map((e) {
          return (e as List).map((e) {
            return (e as List?)?.map((e) {
              return D.fromJson(e);
            }).toList();
          }).firstOrNull;
        }).toList();
      }).toList(),
      (tuple[1] as List).map((e) {
        return (e as List).map((e) {
          return (e as List?)?.map((e) {
            return D.fromJson(e);
          }).toList();
        }).firstOrNull;
      }).toList(),
      (tuple[2] as List).map((e) {
        return (e as List?)?.map((e) {
          return D.fromJson(e);
        }).toList();
      }).firstOrNull,
    );
  }

  /// [item1] defined in Candid: `A`
  final A item1;

  /// [item2] defined in Candid: `B`
  final B item2;

  /// [item3] defined in Candid: `C`
  final C item3;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    final item3 = this.item3;
    return [
      item1.map((e) {
        return e.map((e) {
          return [if (e != null) e];
        }).toList();
      }).toList(),
      item2.map((e) {
        return [if (e != null) e];
      }).toList(),
      [if (item3 != null) item3],
    ];
  }

  G1 copyWith({
    /// [item1] defined in Candid: `A`
    A? item1,

    /// [item2] defined in Candid: `B`
    B? item2,

    /// [item3] defined in Candid: `C`
    C? item3,
  }) {
    return G1(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is G1 &&
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

/// [H] defined in Candid
/// ```Candid
///   record { A; B; C }
/// ```
typedef H = G1;

/// [IOpt] defined in Candid
/// ```Candid
///   record { A; B; C }
/// ```
typedef IOpt = G1;

/// [G] defined in Candid
/// ```Candid
///   record { record { F; E; G }; record { A; B; C } }
/// ```
@immutable
class G {
  const G(
    this.item1,
    this.item2,
  );

  factory G.fromJson(List<dynamic> tuple) {
    return G(
      G0(
        (tuple[0][0] as List).map((e) {
          return e is Uint8List ? e : Uint8List.fromList((e as List).cast());
        }).toList(),
        tuple[0][1] is Uint8List
            ? tuple[0][1]
            : Uint8List.fromList((tuple[0][1] as List).cast()),
        G.fromJson(tuple[0][2]),
      ),
      G1(
        (tuple[1][0] as List).map((e) {
          return (e as List).map((e) {
            return (e as List).map((e) {
              return (e as List?)?.map((e) {
                return D.fromJson(e);
              }).toList();
            }).firstOrNull;
          }).toList();
        }).toList(),
        (tuple[1][1] as List).map((e) {
          return (e as List).map((e) {
            return (e as List?)?.map((e) {
              return D.fromJson(e);
            }).toList();
          }).firstOrNull;
        }).toList(),
        (tuple[1][2] as List).map((e) {
          return (e as List?)?.map((e) {
            return D.fromJson(e);
          }).toList();
        }).firstOrNull,
      ),
    );
  }

  /// [item1] defined in Candid: `record { F; E; G }`
  final G0 item1;

  /// [item2] defined in Candid: `record { A; B; C }`
  final G1 item2;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      [
        item1.item1,
        item1.item2,
        item1.item3,
      ],
      [
        item2.item1.map((e) {
          return e.map((e) {
            return [if (e != null) e];
          }).toList();
        }).toList(),
        item2.item2.map((e) {
          return [if (e != null) e];
        }).toList(),
        [if (item2.item3 != null) item2.item3],
      ],
    ];
  }

  G copyWith({
    /// [item1] defined in Candid: `record { F; E; G }`
    G0? item1,

    /// [item2] defined in Candid: `record { A; B; C }`
    G1? item2,
  }) {
    return G(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is G &&
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

/// [Echo1Arg] defined in Candid
/// ```Candid
///   (A, B, C, D, E, F, G, H, I, J)
/// ```
@immutable
class Echo1Arg {
  const Echo1Arg(
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.item6,
    this.item7,
    this.item8,
    this.item9,
    this.item10,
  );

  factory Echo1Arg.fromJson(List<dynamic> tuple) {
    return Echo1Arg(
      (tuple[0] as List).map((e) {
        return (e as List).map((e) {
          return (e as List).map((e) {
            return (e as List?)?.map((e) {
              return D.fromJson(e);
            }).toList();
          }).firstOrNull;
        }).toList();
      }).toList(),
      (tuple[1] as List).map((e) {
        return (e as List).map((e) {
          return (e as List?)?.map((e) {
            return D.fromJson(e);
          }).toList();
        }).firstOrNull;
      }).toList(),
      (tuple[2] as List).map((e) {
        return (e as List?)?.map((e) {
          return D.fromJson(e);
        }).toList();
      }).firstOrNull,
      D.fromJson(tuple[3]),
      tuple[4] is Uint8List
          ? tuple[4]
          : Uint8List.fromList((tuple[4] as List).cast()),
      (tuple[5] as List).map((e) {
        return e is Uint8List ? e : Uint8List.fromList((e as List).cast());
      }).toList(),
      G.fromJson(tuple[6]),
      H.fromJson(tuple[7]),
      (tuple[8] as List).map((e) {
        return e == null
            ? null
            : IOpt(
                (e[0] as List).map((e) {
                  return (e as List).map((e) {
                    return (e as List).map((e) {
                      return (e as List?)?.map((e) {
                        return D.fromJson(e);
                      }).toList();
                    }).firstOrNull;
                  }).toList();
                }).toList(),
                (e[1] as List).map((e) {
                  return (e as List).map((e) {
                    return (e as List?)?.map((e) {
                      return D.fromJson(e);
                    }).toList();
                  }).firstOrNull;
                }).toList(),
                (e[2] as List).map((e) {
                  return (e as List?)?.map((e) {
                    return D.fromJson(e);
                  }).toList();
                }).firstOrNull,
              );
      }).firstOrNull,
      (tuple[9] as List).map((e) {
        return (e as List?)?.map((e) {
          return (e as List).map((e) {
            return (e as List?)?.map((e) {
              return H.fromJson(e);
            }).toList();
          }).firstOrNull;
        }).toList();
      }).firstOrNull,
    );
  }

  /// [item1] defined in Candid: `A`
  final A item1;

  /// [item2] defined in Candid: `B`
  final B item2;

  /// [item3] defined in Candid: `C`
  final C item3;

  /// [item4] defined in Candid: `D`
  final D item4;

  /// [item5] defined in Candid: `E`
  final E item5;

  /// [item6] defined in Candid: `F`
  final F item6;

  /// [item7] defined in Candid: `G`
  final G item7;

  /// [item8] defined in Candid: `H`
  final H item8;

  /// [item9] defined in Candid: `I`
  final I item9;

  /// [item10] defined in Candid: `J`
  final J item10;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    final item3 = this.item3;
    final item4 = this.item4;
    final item5 = this.item5;
    final item6 = this.item6;
    final item7 = this.item7;
    final item8 = this.item8;
    final item9 = this.item9;
    final item10 = this.item10;
    return [
      item1.map((e) {
        return e.map((e) {
          return [if (e != null) e];
        }).toList();
      }).toList(),
      item2.map((e) {
        return [if (e != null) e];
      }).toList(),
      [if (item3 != null) item3],
      item4,
      item5,
      item6,
      item7,
      item8,
      [
        if (item9 != null)
          [
            item9!.item1.map((e) {
              return e.map((e) {
                return [if (e != null) e];
              }).toList();
            }).toList(),
            item9!.item2.map((e) {
              return [if (e != null) e];
            }).toList(),
            [if (item9!.item3 != null) item9!.item3],
          ]
      ],
      [
        if (item10 != null)
          item10.map((e) {
            return [if (e != null) e];
          }).toList()
      ],
    ];
  }

  Echo1Arg copyWith({
    /// [item1] defined in Candid: `A`
    A? item1,

    /// [item2] defined in Candid: `B`
    B? item2,

    /// [item3] defined in Candid: `C`
    C? item3,

    /// [item4] defined in Candid: `D`
    D? item4,

    /// [item5] defined in Candid: `E`
    E? item5,

    /// [item6] defined in Candid: `F`
    F? item6,

    /// [item7] defined in Candid: `G`
    G? item7,

    /// [item8] defined in Candid: `H`
    H? item8,

    /// [item9] defined in Candid: `I`
    I? item9,

    /// [item10] defined in Candid: `J`
    J? item10,
  }) {
    return Echo1Arg(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
      item4 ?? this.item4,
      item5 ?? this.item5,
      item6 ?? this.item6,
      item7 ?? this.item7,
      item8 ?? this.item8,
      item9 ?? this.item9,
      item10 ?? this.item10,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Echo1Arg &&
            (identical(other.item1, item1) || other.item1 == item1) &&
            (identical(other.item2, item2) || other.item2 == item2) &&
            (identical(other.item3, item3) || other.item3 == item3) &&
            (identical(other.item4, item4) || other.item4 == item4) &&
            (identical(other.item5, item5) || other.item5 == item5) &&
            (identical(other.item6, item6) || other.item6 == item6) &&
            (identical(other.item7, item7) || other.item7 == item7) &&
            (identical(other.item8, item8) || other.item8 == item8) &&
            (identical(other.item9, item9) || other.item9 == item9) &&
            (identical(other.item10, item10) || other.item10 == item10));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        item1,
        item2,
        item3,
        item4,
        item5,
        item6,
        item7,
        item8,
        item9,
        item10
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Echo1Ret] defined in Candid
/// ```Candid
///   (opt A, opt B, opt C, opt D, opt E, opt F, opt G, opt H, opt I, opt J)
/// ```
@immutable
class Echo1Ret {
  const Echo1Ret(
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.item6,
    this.item7,
    this.item8,
    this.item9,
    this.item10,
  );

  factory Echo1Ret.fromJson(List<dynamic> tuple) {
    return Echo1Ret(
      (tuple[0] as List).map((e) {
        return (e as List?)?.map((e) {
          return (e as List).map((e) {
            return (e as List).map((e) {
              return (e as List?)?.map((e) {
                return D.fromJson(e);
              }).toList();
            }).firstOrNull;
          }).toList();
        }).toList();
      }).firstOrNull,
      (tuple[1] as List).map((e) {
        return (e as List?)?.map((e) {
          return (e as List).map((e) {
            return (e as List?)?.map((e) {
              return D.fromJson(e);
            }).toList();
          }).firstOrNull;
        }).toList();
      }).firstOrNull,
      (tuple[2] as List).map((e) {
        return (e as List).map((e) {
          return (e as List?)?.map((e) {
            return D.fromJson(e);
          }).toList();
        }).firstOrNull;
      }).firstOrNull,
      (tuple[3] as List).map((e) {
        return e == null ? null : D.fromJson(e);
      }).firstOrNull,
      (tuple[4] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      (tuple[5] as List).map((e) {
        return (e as List?)?.map((e) {
          return e is Uint8List ? e : Uint8List.fromList((e as List).cast());
        }).toList();
      }).firstOrNull,
      (tuple[6] as List).map((e) {
        return e == null ? null : G.fromJson(e);
      }).firstOrNull,
      (tuple[7] as List).map((e) {
        return e == null ? null : H.fromJson(e);
      }).firstOrNull,
      (tuple[8] as List).map((e) {
        return (e as List).map((e) {
          return e == null
              ? null
              : IOpt(
                  (e[0] as List).map((e) {
                    return (e as List).map((e) {
                      return (e as List).map((e) {
                        return (e as List?)?.map((e) {
                          return D.fromJson(e);
                        }).toList();
                      }).firstOrNull;
                    }).toList();
                  }).toList(),
                  (e[1] as List).map((e) {
                    return (e as List).map((e) {
                      return (e as List?)?.map((e) {
                        return D.fromJson(e);
                      }).toList();
                    }).firstOrNull;
                  }).toList(),
                  (e[2] as List).map((e) {
                    return (e as List?)?.map((e) {
                      return D.fromJson(e);
                    }).toList();
                  }).firstOrNull,
                );
        }).firstOrNull;
      }).firstOrNull,
      (tuple[9] as List).map((e) {
        return (e as List).map((e) {
          return (e as List?)?.map((e) {
            return (e as List).map((e) {
              return (e as List?)?.map((e) {
                return H.fromJson(e);
              }).toList();
            }).firstOrNull;
          }).toList();
        }).firstOrNull;
      }).firstOrNull,
    );
  }

  /// [item1] defined in Candid: `opt A`
  final A? item1;

  /// [item2] defined in Candid: `opt B`
  final B? item2;

  /// [item3] defined in Candid: `opt C`
  final C? item3;

  /// [item4] defined in Candid: `opt D`
  final D? item4;

  /// [item5] defined in Candid: `opt E`
  final E? item5;

  /// [item6] defined in Candid: `opt F`
  final F? item6;

  /// [item7] defined in Candid: `opt G`
  final G? item7;

  /// [item8] defined in Candid: `opt H`
  final H? item8;

  /// [item9] defined in Candid: `opt I`
  final I? item9;

  /// [item10] defined in Candid: `opt J`
  final J? item10;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    final item3 = this.item3;
    final item4 = this.item4;
    final item5 = this.item5;
    final item6 = this.item6;
    final item7 = this.item7;
    final item8 = this.item8;
    final item9 = this.item9;
    final item10 = this.item10;
    return [
      [
        if (item1 != null)
          item1?.map((e) {
            return e.map((e) {
              return [if (e != null) e];
            }).toList();
          }).toList()
      ],
      [
        if (item2 != null)
          item2?.map((e) {
            return [if (e != null) e];
          }).toList()
      ],
      [
        if (item3 != null) [if (item3 != null) item3]
      ],
      [if (item4 != null) item4],
      [if (item5 != null) item5],
      [if (item6 != null) item6],
      [if (item7 != null) item7],
      [if (item8 != null) item8],
      [
        if (item9 != null)
          [
            if (item9 != null)
              [
                item9!.item1.map((e) {
                  return e.map((e) {
                    return [if (e != null) e];
                  }).toList();
                }).toList(),
                item9!.item2.map((e) {
                  return [if (e != null) e];
                }).toList(),
                [if (item9!.item3 != null) item9!.item3],
              ]
          ]
      ],
      [
        if (item10 != null)
          [
            if (item10 != null)
              item10.map((e) {
                return [if (e != null) e];
              }).toList()
          ]
      ],
    ];
  }

  Echo1Ret copyWith({
    /// [item1] defined in Candid: `opt A`
    A? item1,

    /// [item2] defined in Candid: `opt B`
    B? item2,

    /// [item3] defined in Candid: `opt C`
    C? item3,

    /// [item4] defined in Candid: `opt D`
    D? item4,

    /// [item5] defined in Candid: `opt E`
    E? item5,

    /// [item6] defined in Candid: `opt F`
    F? item6,

    /// [item7] defined in Candid: `opt G`
    G? item7,

    /// [item8] defined in Candid: `opt H`
    H? item8,

    /// [item9] defined in Candid: `opt I`
    I? item9,

    /// [item10] defined in Candid: `opt J`
    J? item10,
  }) {
    return Echo1Ret(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
      item4 ?? this.item4,
      item5 ?? this.item5,
      item6 ?? this.item6,
      item7 ?? this.item7,
      item8 ?? this.item8,
      item9 ?? this.item9,
      item10 ?? this.item10,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Echo1Ret &&
            (identical(other.item1, item1) || other.item1 == item1) &&
            (identical(other.item2, item2) || other.item2 == item2) &&
            (identical(other.item3, item3) || other.item3 == item3) &&
            (identical(other.item4, item4) || other.item4 == item4) &&
            (identical(other.item5, item5) || other.item5 == item5) &&
            (identical(other.item6, item6) || other.item6 == item6) &&
            (identical(other.item7, item7) || other.item7 == item7) &&
            (identical(other.item8, item8) || other.item8 == item8) &&
            (identical(other.item9, item9) || other.item9 == item9) &&
            (identical(other.item10, item10) || other.item10 == item10));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        item1,
        item2,
        item3,
        item4,
        item5,
        item6,
        item7,
        item8,
        item9,
        item10
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [A] defined in Candid
/// ```Candid
///   type A = vec B;
/// ```
typedef A = List<B>;

/// [B] defined in Candid
/// ```Candid
///   type B = vec C;
/// ```
typedef B = List<C>;

/// [C] defined in Candid
/// ```Candid
///   type C = opt vec D;
/// ```
typedef C = List<D>?;

/// [E] defined in Candid
/// ```Candid
///   type E = vec nat8;
/// ```
typedef E = Uint8List;

/// [F] defined in Candid
/// ```Candid
///   type F = vec E;
/// ```
typedef F = List<E>;

/// [I] defined in Candid
/// ```Candid
///   type I = opt record { A; B; C };
/// ```
typedef I = IOpt?;

/// [J] defined in Candid
/// ```Candid
///   type J = opt vec opt vec H;
/// ```
typedef J = List<List<H>?>?;
