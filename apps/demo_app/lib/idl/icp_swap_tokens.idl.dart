// coverage:ignore-file
// ignore_for_file: type=lint, unnecessary_null_comparison
// ======================================
// GENERATED CODE - DO NOT MODIFY BY HAND
// ======================================

import 'dart:async';
import 'package:agent_dart/agent_dart.dart';
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
    final dat = [arg];
    final ret = await actor.getFunc('add')!(dat);
    return BoolResult.fromJson(ret);
  }

  /// ```Candid
  ///   addAdmin: (text) -> (BoolResult)
  /// ```
  static Future<BoolResult> addAdmin(
    CanisterActor actor,
    String arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('addAdmin')!(dat);
    return BoolResult.fromJson(ret);
  }

  /// ```Candid
  ///   cycleAvailable: () -> (NatResult)
  /// ```
  static Future<NatResult> cycleAvailable(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('cycleAvailable')!(dat);
    return NatResult.fromJson(ret);
  }

  /// ```Candid
  ///   cycleBalance: () -> (NatResult) query
  /// ```
  static Future<NatResult> cycleBalance(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('cycleBalance')!(dat);
    return NatResult.fromJson(ret);
  }

  /// ```Candid
  ///   edit: (text, TokenMetadata) -> (BoolResult)
  /// ```
  static Future<BoolResult> edit(
    CanisterActor actor,
    EditArg arg,
  ) async {
    final dat = arg.toJson();
    final ret = await actor.getFunc('edit')!(dat);
    return BoolResult.fromJson(ret);
  }

  /// ```Candid
  ///   get: (text) -> (Result_2) query
  /// ```
  static Future<Result2> get(
    CanisterActor actor,
    String arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('get')!(dat);
    return Result2.fromJson(ret);
  }

  /// ```Candid
  ///   getAdminList: () -> (Result_1) query
  /// ```
  static Future<Result1> getAdminList(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('getAdminList')!(dat);
    return Result1.fromJson(ret);
  }

  /// ```Candid
  ///   getList: () -> (Result) query
  /// ```
  static Future<Result> getList(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('getList')!(dat);
    return Result.fromJson(ret);
  }

  /// ```Candid
  ///   remove: (text) -> (BoolResult)
  /// ```
  static Future<BoolResult> remove(
    CanisterActor actor,
    String arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('remove')!(dat);
    return BoolResult.fromJson(ret);
  }

  /// ```Candid
  ///   removeAdmin: (text) -> (BoolResult)
  /// ```
  static Future<BoolResult> removeAdmin(
    CanisterActor actor,
    String arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('removeAdmin')!(dat);
    return BoolResult.fromJson(ret);
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

  Future<BoolResult> add(
    TokenMetadata arg,
  ) async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.add(
      actor,
      arg,
    );
  }

  Future<BoolResult> addAdmin(
    String arg,
  ) async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.addAdmin(
      actor,
      arg,
    );
  }

  Future<NatResult> cycleAvailable() async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.cycleAvailable(
      actor,
    );
  }

  Future<NatResult> cycleBalance() async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.cycleBalance(
      actor,
    );
  }

  Future<BoolResult> edit(
    EditArg arg,
  ) async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.edit(
      actor,
      arg,
    );
  }

  Future<Result2> get(
    String arg,
  ) async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.get(
      actor,
      arg,
    );
  }

  Future<Result1> getAdminList() async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.getAdminList(
      actor,
    );
  }

  Future<Result> getList() async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.getList(
      actor,
    );
  }

  Future<BoolResult> remove(
    String arg,
  ) async {
    final actor = await getActor();
    return IcpSwapTokensIDLActor.remove(
      actor,
      arg,
    );
  }

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
    /// [canisterId] defined in Candid: `canisterId: text`
    required this.canisterId,

    /// [decimals] defined in Candid: `decimals: nat`
    required this.decimals,

    /// [fee] defined in Candid: `fee: nat`
    required this.fee,

    /// [introduction] defined in Candid: `introduction: text`
    required this.introduction,

    /// [mediaLinks] defined in Candid: `mediaLinks: vec Media`
    required this.mediaLinks,

    /// [name] defined in Candid: `name: text`
    required this.name,

    /// [rank] defined in Candid: `rank: nat32`
    required this.rank,

    /// [standard] defined in Candid: `standard: text`
    required this.standard,

    /// [symbol] defined in Candid: `symbol: text`
    required this.symbol,

    /// [totalSupply] defined in Candid: `totalSupply: nat`
    required this.totalSupply,
  });

  factory TokenMetadata.fromJson(Map json) {
    return TokenMetadata(
      canisterId: json['canisterId'],
      decimals: json['decimals'] is BigInt
          ? json['decimals']
          : BigInt.from(json['decimals']),
      fee: json['fee'] is BigInt ? json['fee'] : BigInt.from(json['fee']),
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
          : BigInt.from(json['totalSupply']),
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

  Map<String, dynamic> toJson() {
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

  TokenMetadata copyWith({
    /// [canisterId] defined in Candid: `canisterId: text`
    String? canisterId,

    /// [decimals] defined in Candid: `decimals: nat`
    BigInt? decimals,

    /// [fee] defined in Candid: `fee: nat`
    BigInt? fee,

    /// [introduction] defined in Candid: `introduction: text`
    String? introduction,

    /// [mediaLinks] defined in Candid: `mediaLinks: vec Media`
    List<Media>? mediaLinks,

    /// [name] defined in Candid: `name: text`
    String? name,

    /// [rank] defined in Candid: `rank: nat32`
    int? rank,

    /// [standard] defined in Candid: `standard: text`
    String? standard,

    /// [symbol] defined in Candid: `symbol: text`
    String? symbol,

    /// [totalSupply] defined in Candid: `totalSupply: nat`
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
  bool operator ==(dynamic other) {
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
    /// [err] defined in Candid: `err: text`
    this.err,

    /// [ok] defined in Candid: `ok: opt TokenMetadata`
    this.ok,
  });

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

  Map<String, dynamic> toJson() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': [if (ok != null) ok],
    };
  }

  Result2 copyWith({
    /// [err] defined in Candid: `err: text`
    String? err,

    /// [ok] defined in Candid: `ok: opt TokenMetadata`
    TokenMetadata? ok,
  }) {
    return Result2(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(dynamic other) {
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
    /// [err] defined in Candid: `err: text`
    this.err,

    /// [ok] defined in Candid: `ok: vec text`
    this.ok,
  });

  factory Result1.fromJson(Map json) {
    return Result1(
      err: json['err'],
      ok: json['ok'],
    );
  }

  /// [err] defined in Candid: `err: text`
  final String? err;

  /// [ok] defined in Candid: `ok: vec text`
  final List<String>? ok;

  Map<String, dynamic> toJson() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  Result1 copyWith({
    /// [err] defined in Candid: `err: text`
    String? err,

    /// [ok] defined in Candid: `ok: vec text`
    List<String>? ok,
  }) {
    return Result1(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(dynamic other) {
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
    /// [err] defined in Candid: `err: text`
    this.err,

    /// [ok] defined in Candid: `ok: vec TokenMetadata`
    this.ok,
  });

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

  Map<String, dynamic> toJson() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  Result copyWith({
    /// [err] defined in Candid: `err: text`
    String? err,

    /// [ok] defined in Candid: `ok: vec TokenMetadata`
    List<TokenMetadata>? ok,
  }) {
    return Result(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(dynamic other) {
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
    /// [err] defined in Candid: `err: text`
    this.err,

    /// [ok] defined in Candid: `ok: nat`
    this.ok,
  });

  factory NatResult.fromJson(Map json) {
    return NatResult(
      err: json['err'],
      ok: json['ok'] == null
          ? null
          : json['ok'] is BigInt
              ? json['ok']
              : BigInt.from(json['ok']),
    );
  }

  /// [err] defined in Candid: `err: text`
  final String? err;

  /// [ok] defined in Candid: `ok: nat`
  final BigInt? ok;

  Map<String, dynamic> toJson() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  NatResult copyWith({
    /// [err] defined in Candid: `err: text`
    String? err,

    /// [ok] defined in Candid: `ok: nat`
    BigInt? ok,
  }) {
    return NatResult(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(dynamic other) {
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
    /// [link] defined in Candid: `link: text`
    required this.link,

    /// [mediaType] defined in Candid: `mediaType: text`
    required this.mediaType,
  });

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

  Map<String, dynamic> toJson() {
    final link = this.link;
    final mediaType = this.mediaType;
    return {
      'link': link,
      'mediaType': mediaType,
    };
  }

  Media copyWith({
    /// [link] defined in Candid: `link: text`
    String? link,

    /// [mediaType] defined in Candid: `mediaType: text`
    String? mediaType,
  }) {
    return Media(
      link: link ?? this.link,
      mediaType: mediaType ?? this.mediaType,
    );
  }

  @override
  bool operator ==(dynamic other) {
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
    /// [err] defined in Candid: `err: text`
    this.err,

    /// [ok] defined in Candid: `ok: bool`
    this.ok,
  });

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

  Map<String, dynamic> toJson() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  BoolResult copyWith({
    /// [err] defined in Candid: `err: text`
    String? err,

    /// [ok] defined in Candid: `ok: bool`
    bool? ok,
  }) {
    return BoolResult(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(dynamic other) {
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

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      item1,
      item2,
    ];
  }

  EditArg copyWith({
    /// [item1] defined in Candid: `text`
    String? item1,

    /// [item2] defined in Candid: `TokenMetadata`
    TokenMetadata? item2,
  }) {
    return EditArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(dynamic other) {
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
