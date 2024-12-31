// coverage:ignore-file
// ignore_for_file: type=lint, depend_on_referenced_packages, unnecessary_null_comparison, unnecessary_non_null_assertion, unused_field, unused_import
// ======================================
// GENERATED CODE - DO NOT MODIFY BY HAND
// ======================================

import 'dart:async';
import 'package:agent_dart_base/agent_dart_base.dart';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

class IcpSwapTokensIDLActor {
  const IcpSwapTokensIDLActor._();

  /// ```Candid
  ///   add: (TokenMetadata) -> (BoolResult)
  /// ```
  static Future<BoolResult> add(
    CanisterActor actor,
    TokenMetadata arg,
  ) async {
    final request = [arg];
    const method = 'add';
    final response = await actor.getFunc(method)!(request);
    return BoolResult.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   addAdmin: (text) -> (BoolResult)
  /// ```
  static Future<BoolResult> addAdmin(
    CanisterActor actor,
    String arg,
  ) async {
    final request = [arg];
    const method = 'addAdmin';
    final response = await actor.getFunc(method)!(request);
    return BoolResult.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   cycleAvailable: () -> (NatResult)
  /// ```
  static Future<NatResult> cycleAvailable(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'cycleAvailable';
    final response = await actor.getFunc(method)!(request);
    return NatResult.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   cycleBalance: () -> (NatResult) query
  /// ```
  static Future<NatResult> cycleBalance(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'cycleBalance';
    final response = await actor.getFunc(method)!(request);
    return NatResult.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   edit: (text, TokenMetadata) -> (BoolResult)
  /// ```
  static Future<BoolResult> edit(
    CanisterActor actor,
    EditArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'edit';
    final response = await actor.getFunc(method)!(request);
    return BoolResult.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   get: (text) -> (Result_2) query
  /// ```
  static Future<Result2> get_(
    CanisterActor actor,
    String arg,
  ) async {
    final request = [arg];
    const method = 'get';
    final response = await actor.getFunc(method)!(request);
    return Result2.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   getAdminList: () -> (Result_1) query
  /// ```
  static Future<Result1> getAdminList(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'getAdminList';
    final response = await actor.getFunc(method)!(request);
    return Result1.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   getList: () -> (Result) query
  /// ```
  static Future<Result> getList(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'getList';
    final response = await actor.getFunc(method)!(request);
    return Result.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   remove: (text) -> (BoolResult)
  /// ```
  static Future<BoolResult> remove(
    CanisterActor actor,
    String arg,
  ) async {
    final request = [arg];
    const method = 'remove';
    final response = await actor.getFunc(method)!(request);
    return BoolResult.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   removeAdmin: (text) -> (BoolResult)
  /// ```
  static Future<BoolResult> removeAdmin(
    CanisterActor actor,
    String arg,
  ) async {
    final request = [arg];
    const method = 'removeAdmin';
    final response = await actor.getFunc(method)!(request);
    return BoolResult.fromIDLDeserializable(response);
  }
}

class IcpSwapTokensIDLService {
  IcpSwapTokensIDLService({
    required this.canisterId,
    required this.uri,
    this.identity,
    this.createActorMethod,
    this.debug = true,
  }) : idl = IcpSwapTokensIDL.idl;

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
  ///   add: (TokenMetadata) -> (BoolResult)
  /// ```
  Future<BoolResult> add(
    TokenMetadata arg,
  ) async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.add(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   addAdmin: (text) -> (BoolResult)
  /// ```
  Future<BoolResult> addAdmin(
    String arg,
  ) async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.addAdmin(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   cycleAvailable: () -> (NatResult)
  /// ```
  Future<NatResult> cycleAvailable() async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.cycleAvailable(
      actor,
    );
  }

  /// ```Candid
  ///   cycleBalance: () -> (NatResult) query
  /// ```
  Future<NatResult> cycleBalance() async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.cycleBalance(
      actor,
    );
  }

  /// ```Candid
  ///   edit: (text, TokenMetadata) -> (BoolResult)
  /// ```
  Future<BoolResult> edit(
    EditArg arg,
  ) async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.edit(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   get: (text) -> (Result_2) query
  /// ```
  Future<Result2> get_(
    String arg,
  ) async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.get_(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   getAdminList: () -> (Result_1) query
  /// ```
  Future<Result1> getAdminList() async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.getAdminList(
      actor,
    );
  }

  /// ```Candid
  ///   getList: () -> (Result) query
  /// ```
  Future<Result> getList() async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.getList(
      actor,
    );
  }

  /// ```Candid
  ///   remove: (text) -> (BoolResult)
  /// ```
  Future<BoolResult> remove(
    String arg,
  ) async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.remove(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   removeAdmin: (text) -> (BoolResult)
  /// ```
  Future<BoolResult> removeAdmin(
    String arg,
  ) async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.removeAdmin(
      actor,
      arg,
    );
  }
}

class IcpSwapTokensIDL {
  const IcpSwapTokensIDL._();

  /// [_TokenMetadata] defined in Candid
  /// ```Candid
  ///   type TokenMetadata = record { canisterId: text; decimals: nat; fee: nat; introduction: text; mediaLinks: vec Media; name: text; rank: nat32; standard: text; symbol: text; totalSupply: nat };
  /// ```
  static final RecordClass _TokenMetadata = IDL.Record({
    'canisterId': IDL.Text,
    'decimals': IDL.Nat,
    'fee': IDL.Nat,
    'introduction': IDL.Text,
    'mediaLinks': IDL.Vec(
      _Media,
    ),
    'name': IDL.Text,
    'rank': IDL.Nat32,
    'standard': IDL.Text,
    'symbol': IDL.Text,
    'totalSupply': IDL.Nat,
  });

  /// [_Result_2] defined in Candid
  /// ```Candid
  ///   type Result_2 = variant { err: text; ok: opt TokenMetadata };
  /// ```
  static final VariantClass _Result_2 = IDL.Variant({
    'err': IDL.Text,
    'ok': IDL.Opt(
      _TokenMetadata,
    ),
  });

  /// [_Result_1] defined in Candid
  /// ```Candid
  ///   type Result_1 = variant { err: text; ok: vec text };
  /// ```
  static final VariantClass _Result_1 = IDL.Variant({
    'err': IDL.Text,
    'ok': IDL.Vec(
      IDL.Text,
    ),
  });

  /// [_Result] defined in Candid
  /// ```Candid
  ///   type Result = variant { err: text; ok: vec TokenMetadata };
  /// ```
  static final VariantClass _Result = IDL.Variant({
    'err': IDL.Text,
    'ok': IDL.Vec(
      _TokenMetadata,
    ),
  });

  /// [_NatResult] defined in Candid
  /// ```Candid
  ///   type NatResult = variant { err: text; ok: nat };
  /// ```
  static final VariantClass _NatResult = IDL.Variant({
    'err': IDL.Text,
    'ok': IDL.Nat,
  });

  /// [_Media] defined in Candid
  /// ```Candid
  ///   type Media = record { link: text; mediaType: text };
  /// ```
  static final RecordClass _Media = IDL.Record({
    'link': IDL.Text,
    'mediaType': IDL.Text,
  });

  /// [_BoolResult] defined in Candid
  /// ```Candid
  ///   type BoolResult = variant { err: text; ok: bool };
  /// ```
  static final VariantClass _BoolResult = IDL.Variant({
    'err': IDL.Text,
    'ok': IDL.Bool,
  });

  static final ServiceClass idl = IDL.Service({
    'add': IDL.Func(
      [_TokenMetadata],
      [_BoolResult],
      [],
    ),
    'addAdmin': IDL.Func(
      [IDL.Text],
      [_BoolResult],
      [],
    ),
    'cycleAvailable': IDL.Func(
      [],
      [_NatResult],
      [],
    ),
    'cycleBalance': IDL.Func(
      [],
      [_NatResult],
      ['query'],
    ),
    'edit': IDL.Func(
      [IDL.Text, _TokenMetadata],
      [_BoolResult],
      [],
    ),
    'get': IDL.Func(
      [IDL.Text],
      [_Result_2],
      ['query'],
    ),
    'getAdminList': IDL.Func(
      [],
      [_Result_1],
      ['query'],
    ),
    'getList': IDL.Func(
      [],
      [_Result],
      ['query'],
    ),
    'remove': IDL.Func(
      [IDL.Text],
      [_BoolResult],
      [],
    ),
    'removeAdmin': IDL.Func(
      [IDL.Text],
      [_BoolResult],
      [],
    ),
  });
}

/// [TokenMetadata] defined in Candid
/// ```Candid
///   record { canisterId: text; decimals: nat; fee: nat; introduction: text; mediaLinks: vec Media; name: text; rank: nat32; standard: text; symbol: text; totalSupply: nat }
/// ```
@immutable
class TokenMetadata {
  const TokenMetadata({
    required this.canisterId,
    required this.decimals,
    required this.fee,
    required this.introduction,
    required this.mediaLinks,
    required this.name,
    required this.rank,
    required this.standard,
    required this.symbol,
    required this.totalSupply,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TokenMetadata.fromIDLDeserializable(Map obj) {
    return TokenMetadata(
      canisterId: obj['canisterId'],
      decimals: obj['decimals'] is BigInt
          ? obj['decimals']
          : BigInt.from(obj['decimals']),
      fee: obj['fee'] is BigInt ? obj['fee'] : BigInt.from(obj['fee']),
      introduction: obj['introduction'],
      mediaLinks: (obj['mediaLinks'] as List).map((e) {
        return Media.fromIDLDeserializable(e);
      }).toList(),
      name: obj['name'],
      rank: obj['rank'],
      standard: obj['standard'],
      symbol: obj['symbol'],
      totalSupply: obj['totalSupply'] is BigInt
          ? obj['totalSupply']
          : BigInt.from(obj['totalSupply']),
    );
  }

  factory TokenMetadata.fromJson(Map json) {
    return TokenMetadata(
      canisterId: json['canisterId'],
      decimals: json['decimals'] is BigInt
          ? json['decimals']
          : json['decimals'] is num
              ? BigInt.from(json['decimals'])
              : BigInt.parse('${json['decimals']}'),
      fee: json['fee'] is BigInt
          ? json['fee']
          : json['fee'] is num
              ? BigInt.from(json['fee'])
              : BigInt.parse('${json['fee']}'),
      introduction: json['introduction'],
      mediaLinks: (json['mediaLinks'] as List).map((e) {
        return Media.fromJson(e);
      }).toList(),
      name: json['name'],
      rank: json['rank'],
      standard: json['standard'],
      symbol: json['symbol'],
      totalSupply: json['totalSupply'] is BigInt
          ? json['totalSupply']
          : json['totalSupply'] is num
              ? BigInt.from(json['totalSupply'])
              : BigInt.parse('${json['totalSupply']}'),
    );
  }

  /// [canisterId] defined in Candid: `canisterId: text`
  final String canisterId;

  /// [decimals] defined in Candid: `decimals: nat`
  final BigInt decimals;

  /// [fee] defined in Candid: `fee: nat`
  final BigInt fee;

  /// [introduction] defined in Candid: `introduction: text`
  final String introduction;

  /// [mediaLinks] defined in Candid: `mediaLinks: vec Media`
  final List<Media> mediaLinks;

  /// [name] defined in Candid: `name: text`
  final String name;

  /// [rank] defined in Candid: `rank: nat32`
  final int rank;

  /// [standard] defined in Candid: `standard: text`
  final String standard;

  /// [symbol] defined in Candid: `symbol: text`
  final String symbol;

  /// [totalSupply] defined in Candid: `totalSupply: nat`
  final BigInt totalSupply;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final canisterId = this.canisterId;
    final decimals = this.decimals;
    final fee = this.fee;
    final introduction = this.introduction;
    final mediaLinks = this.mediaLinks;
    final name = this.name;
    final rank = this.rank;
    final standard = this.standard;
    final symbol = this.symbol;
    final totalSupply = this.totalSupply;
    return {
      'canisterId': canisterId,
      'decimals': decimals,
      'fee': fee,
      'introduction': introduction,
      'mediaLinks': mediaLinks,
      'name': name,
      'rank': rank,
      'standard': standard,
      'symbol': symbol,
      'totalSupply': totalSupply,
    };
  }

  Map<String, dynamic> toJson() {
    final canisterId = this.canisterId;
    final decimals = this.decimals.toString();
    final fee = this.fee.toString();
    final introduction = this.introduction;
    final mediaLinks = this.mediaLinks;
    final name = this.name;
    final rank = this.rank;
    final standard = this.standard;
    final symbol = this.symbol;
    final totalSupply = this.totalSupply.toString();
    return {
      'canisterId': canisterId,
      'decimals': decimals,
      'fee': fee,
      'introduction': introduction,
      'mediaLinks': mediaLinks,
      'name': name,
      'rank': rank,
      'standard': standard,
      'symbol': symbol,
      'totalSupply': totalSupply,
    };
  }

  TokenMetadata copyWith({
    String? canisterId,
    BigInt? decimals,
    BigInt? fee,
    String? introduction,
    List<Media>? mediaLinks,
    String? name,
    int? rank,
    String? standard,
    String? symbol,
    BigInt? totalSupply,
  }) {
    return TokenMetadata(
      canisterId: canisterId ?? this.canisterId,
      decimals: decimals ?? this.decimals,
      fee: fee ?? this.fee,
      introduction: introduction ?? this.introduction,
      mediaLinks: mediaLinks ?? this.mediaLinks,
      name: name ?? this.name,
      rank: rank ?? this.rank,
      standard: standard ?? this.standard,
      symbol: symbol ?? this.symbol,
      totalSupply: totalSupply ?? this.totalSupply,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TokenMetadata &&
            (identical(other.canisterId, canisterId) ||
                other.canisterId == canisterId) &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.introduction, introduction) ||
                other.introduction == introduction) &&
            const DeepCollectionEquality()
                .equals(other.mediaLinks, mediaLinks) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.standard, standard) ||
                other.standard == standard) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.totalSupply, totalSupply) ||
                other.totalSupply == totalSupply));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        canisterId,
        decimals,
        fee,
        introduction,
        const DeepCollectionEquality().hash(mediaLinks),
        name,
        rank,
        standard,
        symbol,
        totalSupply
      ]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Result2] defined in Candid
/// ```Candid
///   variant { err: text; ok: opt TokenMetadata }
/// ```
@immutable
class Result2 {
  const Result2({
    this.err,
    this.ok,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Result2.fromIDLDeserializable(Map obj) {
    return Result2(
      err: obj['err'],
      ok: (obj['ok'] as List).map((e) {
        return e == null ? null : TokenMetadata.fromIDLDeserializable(e);
      }).firstOrNull,
    );
  }

  factory Result2.fromJson(Map json) {
    return Result2(
      err: json['err'],
      ok: (json['ok'] as List).map((e) {
        return e == null ? null : TokenMetadata.fromJson(e);
      }).firstOrNull,
    );
  }

  /// [err] defined in Candid: `err: text`
  final String? err;

  /// [ok] defined in Candid: `ok: opt TokenMetadata`
  final TokenMetadata? ok;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': [if (ok != null) ok],
    };
  }

  Map<String, dynamic> toJson() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': [if (ok != null) ok],
    };
  }

  Result2 copyWith({
    String? err,
    TokenMetadata? ok,
  }) {
    return Result2(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Result2 &&
            (identical(other.err, err) || other.err == err) &&
            (identical(other.ok, ok) || other.ok == ok));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, err, ok]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Result1] defined in Candid
/// ```Candid
///   variant { err: text; ok: vec text }
/// ```
@immutable
class Result1 {
  const Result1({
    this.err,
    this.ok,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Result1.fromIDLDeserializable(Map obj) {
    return Result1(
      err: obj['err'],
      ok: (obj['ok'] as List?)?.cast<String>(),
    );
  }

  factory Result1.fromJson(Map json) {
    return Result1(
      err: json['err'],
      ok: (json['ok'] as List?)?.cast<String>(),
    );
  }

  /// [err] defined in Candid: `err: text`
  final String? err;

  /// [ok] defined in Candid: `ok: vec text`
  final List<String>? ok;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  Map<String, dynamic> toJson() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  Result1 copyWith({
    String? err,
    List<String>? ok,
  }) {
    return Result1(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Result1 &&
            (identical(other.err, err) || other.err == err) &&
            const DeepCollectionEquality().equals(other.ok, ok));
  }

  @override
  int get hashCode => Object.hashAll(
      [runtimeType, err, const DeepCollectionEquality().hash(ok)]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Result] defined in Candid
/// ```Candid
///   variant { err: text; ok: vec TokenMetadata }
/// ```
@immutable
class Result {
  const Result({
    this.err,
    this.ok,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Result.fromIDLDeserializable(Map obj) {
    return Result(
      err: obj['err'],
      ok: (obj['ok'] as List?)?.map((e) {
        return TokenMetadata.fromIDLDeserializable(e);
      }).toList(),
    );
  }

  factory Result.fromJson(Map json) {
    return Result(
      err: json['err'],
      ok: (json['ok'] as List?)?.map((e) {
        return TokenMetadata.fromJson(e);
      }).toList(),
    );
  }

  /// [err] defined in Candid: `err: text`
  final String? err;

  /// [ok] defined in Candid: `ok: vec TokenMetadata`
  final List<TokenMetadata>? ok;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  Map<String, dynamic> toJson() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  Result copyWith({
    String? err,
    List<TokenMetadata>? ok,
  }) {
    return Result(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Result &&
            (identical(other.err, err) || other.err == err) &&
            const DeepCollectionEquality().equals(other.ok, ok));
  }

  @override
  int get hashCode => Object.hashAll(
      [runtimeType, err, const DeepCollectionEquality().hash(ok)]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [NatResult] defined in Candid
/// ```Candid
///   variant { err: text; ok: nat }
/// ```
@immutable
class NatResult {
  const NatResult({
    this.err,
    this.ok,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory NatResult.fromIDLDeserializable(Map obj) {
    return NatResult(
      err: obj['err'],
      ok: obj['ok'] == null
          ? null
          : obj['ok'] is BigInt
              ? obj['ok']
              : BigInt.from(obj['ok']),
    );
  }

  factory NatResult.fromJson(Map json) {
    return NatResult(
      err: json['err'],
      ok: json['ok'] == null
          ? null
          : json['ok'] is BigInt
              ? json['ok']
              : json['ok'] is num
                  ? BigInt.from(json['ok'])
                  : BigInt.parse('${json['ok']}'),
    );
  }

  /// [err] defined in Candid: `err: text`
  final String? err;

  /// [ok] defined in Candid: `ok: nat`
  final BigInt? ok;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  Map<String, dynamic> toJson() {
    final err = this.err;
    final ok = this.ok.toString();
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  NatResult copyWith({
    String? err,
    BigInt? ok,
  }) {
    return NatResult(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NatResult &&
            (identical(other.err, err) || other.err == err) &&
            (identical(other.ok, ok) || other.ok == ok));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, err, ok]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Media] defined in Candid
/// ```Candid
///   record { link: text; mediaType: text }
/// ```
@immutable
class Media {
  const Media({
    required this.link,
    required this.mediaType,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Media.fromIDLDeserializable(Map obj) {
    return Media(
      link: obj['link'],
      mediaType: obj['mediaType'],
    );
  }

  factory Media.fromJson(Map json) {
    return Media(
      link: json['link'],
      mediaType: json['mediaType'],
    );
  }

  /// [link] defined in Candid: `link: text`
  final String link;

  /// [mediaType] defined in Candid: `mediaType: text`
  final String mediaType;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final link = this.link;
    final mediaType = this.mediaType;
    return {
      'link': link,
      'mediaType': mediaType,
    };
  }

  Map<String, dynamic> toJson() {
    final link = this.link;
    final mediaType = this.mediaType;
    return {
      'link': link,
      'mediaType': mediaType,
    };
  }

  Media copyWith({
    String? link,
    String? mediaType,
  }) {
    return Media(
      link: link ?? this.link,
      mediaType: mediaType ?? this.mediaType,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Media &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, link, mediaType]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [BoolResult] defined in Candid
/// ```Candid
///   variant { err: text; ok: bool }
/// ```
@immutable
class BoolResult {
  const BoolResult({
    this.err,
    this.ok,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory BoolResult.fromIDLDeserializable(Map obj) {
    return BoolResult(
      err: obj['err'],
      ok: obj['ok'],
    );
  }

  factory BoolResult.fromJson(Map json) {
    return BoolResult(
      err: json['err'],
      ok: json['ok'],
    );
  }

  /// [err] defined in Candid: `err: text`
  final String? err;

  /// [ok] defined in Candid: `ok: bool`
  final bool? ok;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  Map<String, dynamic> toJson() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  BoolResult copyWith({
    String? err,
    bool? ok,
  }) {
    return BoolResult(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BoolResult &&
            (identical(other.err, err) || other.err == err) &&
            (identical(other.ok, ok) || other.ok == ok));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, err, ok]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EditArg] defined in Candid
/// ```Candid
///   (text, TokenMetadata)
/// ```
@immutable
class EditArg {
  const EditArg(
    this.item1,
    this.item2,
  );

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory EditArg.fromIDLDeserializable(List<dynamic> tuple) {
    return EditArg(
      tuple[0],
      TokenMetadata.fromIDLDeserializable(tuple[1]),
    );
  }

  factory EditArg.fromJson(List<dynamic> tuple) {
    return EditArg(
      tuple[0],
      TokenMetadata.fromJson(tuple[1]),
    );
  }

  /// [item1] defined in Candid: `text`
  final String item1;

  /// [item2] defined in Candid: `TokenMetadata`
  final TokenMetadata item2;

  /// An extra method for the serialization with `packages:agent_dart`.
  List<dynamic> toIDLSerializable() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      item1,
      item2,
    ];
  }

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2.toJson();
    return [
      item1,
      item2,
    ];
  }

  EditArg copyWith({
    String? item1,
    TokenMetadata? item2,
  }) {
    return EditArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EditArg &&
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
