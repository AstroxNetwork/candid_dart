// coverage:ignore-file
// ignore_for_file: type=lint, unnecessary_null_comparison
// ======================================
// GENERATED CODE - DO NOT MODIFY BY HAND
// ======================================

import 'dart:async';
import 'package:agent_dart/agent_dart.dart';
import 'package:meta/meta.dart';

class Dip20IDLActor {
  const Dip20IDLActor._();

  /// ```Candid
  ///   allowance: (principal, principal) -> (nat) query
  /// ```
  static Future<BigInt> allowance(
    CanisterActor actor,
    AllowanceArg arg,
  ) async {
    final dat = arg.toJson();
    final ret = await actor.getFunc('allowance')!(dat);
    return ret is BigInt ? ret : BigInt.from(ret);
  }

  /// ```Candid
  ///   approve: (principal, nat) -> (Result)
  /// ```
  static Future<Result> approve(
    CanisterActor actor,
    ApproveArg arg,
  ) async {
    final dat = arg.toJson();
    final ret = await actor.getFunc('approve')!(dat);
    return Result.fromJson(ret);
  }

  /// ```Candid
  ///   balanceOf: (principal) -> (nat) query
  /// ```
  static Future<BigInt> balanceOf(
    CanisterActor actor,
    Principal arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('balanceOf')!(dat);
    return ret is BigInt ? ret : BigInt.from(ret);
  }

  /// ```Candid
  ///   burn: (nat) -> (Result)
  /// ```
  static Future<Result> burn(
    CanisterActor actor,
    BigInt arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('burn')!(dat);
    return Result.fromJson(ret);
  }

  /// ```Candid
  ///   decimals: () -> (nat8) query
  /// ```
  static Future<int> decimals(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('decimals')!(dat);
    return ret;
  }

  /// ```Candid
  ///   getAllowanceSize: () -> (nat64) query
  /// ```
  static Future<BigInt> getAllowanceSize(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('getAllowanceSize')!(dat);
    return ret is BigInt ? ret : BigInt.from(ret);
  }

  /// ```Candid
  ///   getHolders: (nat64, nat64) -> (vec record { principal; nat }) query
  /// ```
  static Future<List<GetHoldersRet0Item>> getHolders(
    CanisterActor actor,
    GetHoldersArg arg,
  ) async {
    final dat = arg.toJson();
    final ret = await actor.getFunc('getHolders')!(dat);
    return (ret as List).map((e) {
      return GetHoldersRet0Item(
        Principal.from(e[0]),
        e[1] is BigInt ? e[1] : BigInt.from(e[1]),
      );
    }).toList();
  }

  /// ```Candid
  ///   getMetadata: () -> (Metadata) query
  /// ```
  static Future<Metadata> getMetadata(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('getMetadata')!(dat);
    return Metadata.fromJson(ret);
  }

  /// ```Candid
  ///   getTokenInfo: () -> (TokenInfo) query
  /// ```
  static Future<TokenInfo> getTokenInfo(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('getTokenInfo')!(dat);
    return TokenInfo.fromJson(ret);
  }

  /// ```Candid
  ///   getUserApprovals: (principal) -> (vec record { principal; nat }) query
  /// ```
  static Future<List<GetUserApprovalsRet0Item>> getUserApprovals(
    CanisterActor actor,
    Principal arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('getUserApprovals')!(dat);
    return (ret as List).map((e) {
      return GetUserApprovalsRet0Item(
        Principal.from(e[0]),
        e[1] is BigInt ? e[1] : BigInt.from(e[1]),
      );
    }).toList();
  }

  /// ```Candid
  ///   historySize: () -> (nat64) query
  /// ```
  static Future<BigInt> historySize(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('historySize')!(dat);
    return ret is BigInt ? ret : BigInt.from(ret);
  }

  /// ```Candid
  ///   logo: () -> (text) query
  /// ```
  static Future<String> logo(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('logo')!(dat);
    return ret;
  }

  /// ```Candid
  ///   mint: (principal, nat) -> (Result)
  /// ```
  static Future<Result> mint(
    CanisterActor actor,
    MintArg arg,
  ) async {
    final dat = arg.toJson();
    final ret = await actor.getFunc('mint')!(dat);
    return Result.fromJson(ret);
  }

  /// ```Candid
  ///   name: () -> (text) query
  /// ```
  static Future<String> name(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('name')!(dat);
    return ret;
  }

  /// ```Candid
  ///   owner: () -> (principal) query
  /// ```
  static Future<Principal> owner(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('owner')!(dat);
    return Principal.from(ret);
  }

  /// ```Candid
  ///   setFee: (nat) -> ()
  /// ```
  static Future<void> setFee(
    CanisterActor actor,
    BigInt arg,
  ) async {
    final dat = [arg];
    await actor.getFunc('setFee')!(dat);
  }

  /// ```Candid
  ///   setFeeTo: (principal) -> ()
  /// ```
  static Future<void> setFeeTo(
    CanisterActor actor,
    Principal arg,
  ) async {
    final dat = [arg];
    await actor.getFunc('setFeeTo')!(dat);
  }

  /// ```Candid
  ///   setLogo: (text) -> ()
  /// ```
  static Future<void> setLogo(
    CanisterActor actor,
    String arg,
  ) async {
    final dat = [arg];
    await actor.getFunc('setLogo')!(dat);
  }

  /// ```Candid
  ///   setName: (text) -> ()
  /// ```
  static Future<void> setName(
    CanisterActor actor,
    String arg,
  ) async {
    final dat = [arg];
    await actor.getFunc('setName')!(dat);
  }

  /// ```Candid
  ///   setOwner: (principal) -> ()
  /// ```
  static Future<void> setOwner(
    CanisterActor actor,
    Principal arg,
  ) async {
    final dat = [arg];
    await actor.getFunc('setOwner')!(dat);
  }

  /// ```Candid
  ///   symbol: () -> (text) query
  /// ```
  static Future<String> symbol(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('symbol')!(dat);
    return ret;
  }

  /// ```Candid
  ///   totalSupply: () -> (nat) query
  /// ```
  static Future<BigInt> totalSupply(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('totalSupply')!(dat);
    return ret is BigInt ? ret : BigInt.from(ret);
  }

  /// ```Candid
  ///   transfer: (principal, nat) -> (Result)
  /// ```
  static Future<Result> transfer(
    CanisterActor actor,
    TransferArg arg,
  ) async {
    final dat = arg.toJson();
    final ret = await actor.getFunc('transfer')!(dat);
    return Result.fromJson(ret);
  }

  /// ```Candid
  ///   transferFrom: (principal, principal, nat) -> (Result)
  /// ```
  static Future<Result> transferFrom(
    CanisterActor actor,
    TransferFromArg arg,
  ) async {
    final dat = arg.toJson();
    final ret = await actor.getFunc('transferFrom')!(dat);
    return Result.fromJson(ret);
  }
}

class Dip20IDLService {
  Dip20IDLService({
    required this.canisterId,
    required this.uri,
    this.identity,
    this.createActorMethod,
    this.debug = true,
  }) : idl = Dip20IDL.idl;

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

  Future<BigInt> allowance(
    AllowanceArg arg,
  ) async {
    final actor = await getActor();
    return Dip20IDLActor.allowance(
      actor,
      arg,
    );
  }

  Future<Result> approve(
    ApproveArg arg,
  ) async {
    final actor = await getActor();
    return Dip20IDLActor.approve(
      actor,
      arg,
    );
  }

  Future<BigInt> balanceOf(
    Principal arg,
  ) async {
    final actor = await getActor();
    return Dip20IDLActor.balanceOf(
      actor,
      arg,
    );
  }

  Future<Result> burn(
    BigInt arg,
  ) async {
    final actor = await getActor();
    return Dip20IDLActor.burn(
      actor,
      arg,
    );
  }

  Future<int> decimals() async {
    final actor = await getActor();
    return Dip20IDLActor.decimals(
      actor,
    );
  }

  Future<BigInt> getAllowanceSize() async {
    final actor = await getActor();
    return Dip20IDLActor.getAllowanceSize(
      actor,
    );
  }

  Future<List<GetHoldersRet0Item>> getHolders(
    GetHoldersArg arg,
  ) async {
    final actor = await getActor();
    return Dip20IDLActor.getHolders(
      actor,
      arg,
    );
  }

  Future<Metadata> getMetadata() async {
    final actor = await getActor();
    return Dip20IDLActor.getMetadata(
      actor,
    );
  }

  Future<TokenInfo> getTokenInfo() async {
    final actor = await getActor();
    return Dip20IDLActor.getTokenInfo(
      actor,
    );
  }

  Future<List<GetUserApprovalsRet0Item>> getUserApprovals(
    Principal arg,
  ) async {
    final actor = await getActor();
    return Dip20IDLActor.getUserApprovals(
      actor,
      arg,
    );
  }

  Future<BigInt> historySize() async {
    final actor = await getActor();
    return Dip20IDLActor.historySize(
      actor,
    );
  }

  Future<String> logo() async {
    final actor = await getActor();
    return Dip20IDLActor.logo(
      actor,
    );
  }

  Future<Result> mint(
    MintArg arg,
  ) async {
    final actor = await getActor();
    return Dip20IDLActor.mint(
      actor,
      arg,
    );
  }

  Future<String> name() async {
    final actor = await getActor();
    return Dip20IDLActor.name(
      actor,
    );
  }

  Future<Principal> owner() async {
    final actor = await getActor();
    return Dip20IDLActor.owner(
      actor,
    );
  }

  Future<void> setFee(
    BigInt arg,
  ) async {
    final actor = await getActor();
    return Dip20IDLActor.setFee(
      actor,
      arg,
    );
  }

  Future<void> setFeeTo(
    Principal arg,
  ) async {
    final actor = await getActor();
    return Dip20IDLActor.setFeeTo(
      actor,
      arg,
    );
  }

  Future<void> setLogo(
    String arg,
  ) async {
    final actor = await getActor();
    return Dip20IDLActor.setLogo(
      actor,
      arg,
    );
  }

  Future<void> setName(
    String arg,
  ) async {
    final actor = await getActor();
    return Dip20IDLActor.setName(
      actor,
      arg,
    );
  }

  Future<void> setOwner(
    Principal arg,
  ) async {
    final actor = await getActor();
    return Dip20IDLActor.setOwner(
      actor,
      arg,
    );
  }

  Future<String> symbol() async {
    final actor = await getActor();
    return Dip20IDLActor.symbol(
      actor,
    );
  }

  Future<BigInt> totalSupply() async {
    final actor = await getActor();
    return Dip20IDLActor.totalSupply(
      actor,
    );
  }

  Future<Result> transfer(
    TransferArg arg,
  ) async {
    final actor = await getActor();
    return Dip20IDLActor.transfer(
      actor,
      arg,
    );
  }

  Future<Result> transferFrom(
    TransferFromArg arg,
  ) async {
    final actor = await getActor();
    return Dip20IDLActor.transferFrom(
      actor,
      arg,
    );
  }
}

class Dip20IDL {
  const Dip20IDL._();

  /// [_Metadata] defined in Candid
  /// ```Candid
  ///   type Metadata = record { fee: nat; decimals: nat8; owner: principal; logo: text; name: text; totalSupply: nat; symbol: text };
  /// ```
  static final RecordClass _Metadata = IDL.Record({
    'fee': IDL.Nat,
    'decimals': IDL.Nat8,
    'owner': IDL.Principal,
    'logo': IDL.Text,
    'name': IDL.Text,
    'totalSupply': IDL.Nat,
    'symbol': IDL.Text,
  });

  /// [_Result] defined in Candid
  /// ```Candid
  ///   type Result = variant { Ok: nat; Err: TxError };
  /// ```
  static final VariantClass _Result = IDL.Variant({
    'Ok': IDL.Nat,
    'Err': _TxError,
  });

  /// [_TokenInfo] defined in Candid
  /// ```Candid
  ///   type TokenInfo = record { holderNumber: nat64; deployTime: nat64; metadata: Metadata; historySize: nat64; cycles: nat64; feeTo: principal };
  /// ```
  static final RecordClass _TokenInfo = IDL.Record({
    'holderNumber': IDL.Nat64,
    'deployTime': IDL.Nat64,
    'metadata': _Metadata,
    'historySize': IDL.Nat64,
    'cycles': IDL.Nat64,
    'feeTo': IDL.Principal,
  });

  /// [_TxError] defined in Candid
  /// ```Candid
  ///   type TxError = variant { InsufficientAllowance; InsufficientBalance; ErrorOperationStyle; Unauthorized; LedgerTrap; ErrorTo; Other: text; BlockUsed; AmountTooSmall };
  /// ```
  static final VariantClass _TxError = IDL.Variant({
    'InsufficientAllowance': IDL.Null,
    'InsufficientBalance': IDL.Null,
    'ErrorOperationStyle': IDL.Null,
    'Unauthorized': IDL.Null,
    'LedgerTrap': IDL.Null,
    'ErrorTo': IDL.Null,
    'Other': IDL.Text,
    'BlockUsed': IDL.Null,
    'AmountTooSmall': IDL.Null,
  });

  static final ServiceClass idl = IDL.Service({
    'allowance': IDL.Func(
      [IDL.Principal, IDL.Principal],
      [IDL.Nat],
      ['query'],
    ),
    'approve': IDL.Func(
      [IDL.Principal, IDL.Nat],
      [_Result],
      [],
    ),
    'balanceOf': IDL.Func(
      [IDL.Principal],
      [IDL.Nat],
      ['query'],
    ),
    'burn': IDL.Func(
      [IDL.Nat],
      [_Result],
      [],
    ),
    'decimals': IDL.Func(
      [],
      [IDL.Nat8],
      ['query'],
    ),
    'getAllowanceSize': IDL.Func(
      [],
      [IDL.Nat64],
      ['query'],
    ),
    'getHolders': IDL.Func(
      [IDL.Nat64, IDL.Nat64],
      [
        IDL.Vec(
          IDL.Tuple([
            IDL.Principal,
            IDL.Nat,
          ]),
        )
      ],
      ['query'],
    ),
    'getMetadata': IDL.Func(
      [],
      [_Metadata],
      ['query'],
    ),
    'getTokenInfo': IDL.Func(
      [],
      [_TokenInfo],
      ['query'],
    ),
    'getUserApprovals': IDL.Func(
      [IDL.Principal],
      [
        IDL.Vec(
          IDL.Tuple([
            IDL.Principal,
            IDL.Nat,
          ]),
        )
      ],
      ['query'],
    ),
    'historySize': IDL.Func(
      [],
      [IDL.Nat64],
      ['query'],
    ),
    'logo': IDL.Func(
      [],
      [IDL.Text],
      ['query'],
    ),
    'mint': IDL.Func(
      [IDL.Principal, IDL.Nat],
      [_Result],
      [],
    ),
    'name': IDL.Func(
      [],
      [IDL.Text],
      ['query'],
    ),
    'owner': IDL.Func(
      [],
      [IDL.Principal],
      ['query'],
    ),
    'setFee': IDL.Func(
      [IDL.Nat],
      [],
      [],
    ),
    'setFeeTo': IDL.Func(
      [IDL.Principal],
      [],
      [],
    ),
    'setLogo': IDL.Func(
      [IDL.Text],
      [],
      [],
    ),
    'setName': IDL.Func(
      [IDL.Text],
      [],
      [],
    ),
    'setOwner': IDL.Func(
      [IDL.Principal],
      [],
      [],
    ),
    'symbol': IDL.Func(
      [],
      [IDL.Text],
      ['query'],
    ),
    'totalSupply': IDL.Func(
      [],
      [IDL.Nat],
      ['query'],
    ),
    'transfer': IDL.Func(
      [IDL.Principal, IDL.Nat],
      [_Result],
      [],
    ),
    'transferFrom': IDL.Func(
      [IDL.Principal, IDL.Principal, IDL.Nat],
      [_Result],
      [],
    ),
  });
  static final List<CType> $initIdl = <CType>[
    IDL.Text,
    IDL.Text,
    IDL.Text,
    IDL.Nat8,
    IDL.Nat,
    IDL.Principal,
    IDL.Nat,
    IDL.Principal,
    IDL.Principal
  ];
}

/// [GetHoldersRet0Item] defined in Candid
/// ```Candid
///   record { principal; nat }
/// ```
@immutable
class GetHoldersRet0Item {
  const GetHoldersRet0Item(
    this.item1,
    this.item2,
  );

  factory GetHoldersRet0Item.fromJson(List<dynamic> tuple) {
    return GetHoldersRet0Item(
      Principal.from(tuple[0]),
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
    );
  }

  /// [item1] defined in Candid: `principal`
  final Principal item1;

  /// [item2] defined in Candid: `nat`
  final BigInt item2;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      item1,
      item2,
    ];
  }

  GetHoldersRet0Item copyWith({
    /// [item1] defined in Candid: `principal`
    Principal? item1,

    /// [item2] defined in Candid: `nat`
    BigInt? item2,
  }) {
    return GetHoldersRet0Item(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetHoldersRet0Item &&
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

/// [GetUserApprovalsRet0Item] defined in Candid
/// ```Candid
///   record { principal; nat }
/// ```
typedef GetUserApprovalsRet0Item = GetHoldersRet0Item;

/// [Metadata] defined in Candid
/// ```Candid
///   record { fee: nat; decimals: nat8; owner: principal; logo: text; name: text; totalSupply: nat; symbol: text }
/// ```
@immutable
class Metadata {
  const Metadata({
    /// [fee] defined in Candid: `fee: nat`
    required this.fee,

    /// [decimals] defined in Candid: `decimals: nat8`
    required this.decimals,

    /// [owner] defined in Candid: `owner: principal`
    required this.owner,

    /// [logo] defined in Candid: `logo: text`
    required this.logo,

    /// [name] defined in Candid: `name: text`
    required this.name,

    /// [totalSupply] defined in Candid: `totalSupply: nat`
    required this.totalSupply,

    /// [symbol] defined in Candid: `symbol: text`
    required this.symbol,
  });

  factory Metadata.fromJson(Map json) {
    return Metadata(
      fee: json['fee'] is BigInt ? json['fee'] : BigInt.from(json['fee']),
      decimals: json['decimals'],
      owner: Principal.from(json['owner']),
      logo: json['logo'],
      name: json['name'],
      totalSupply: json['totalSupply'] is BigInt
          ? json['totalSupply']
          : BigInt.from(json['totalSupply']),
      symbol: json['symbol'],
    );
  }

  /// [fee] defined in Candid: `fee: nat`
  final BigInt fee;

  /// [decimals] defined in Candid: `decimals: nat8`
  final int decimals;

  /// [owner] defined in Candid: `owner: principal`
  final Principal owner;

  /// [logo] defined in Candid: `logo: text`
  final String logo;

  /// [name] defined in Candid: `name: text`
  final String name;

  /// [totalSupply] defined in Candid: `totalSupply: nat`
  final BigInt totalSupply;

  /// [symbol] defined in Candid: `symbol: text`
  final String symbol;

  Map<String, dynamic> toJson() {
    final fee = this.fee;
    final decimals = this.decimals;
    final owner = this.owner;
    final logo = this.logo;
    final name = this.name;
    final totalSupply = this.totalSupply;
    final symbol = this.symbol;
    return {
      'fee': fee,
      'decimals': decimals,
      'owner': owner,
      'logo': logo,
      'name': name,
      'totalSupply': totalSupply,
      'symbol': symbol,
    };
  }

  Metadata copyWith({
    /// [fee] defined in Candid: `fee: nat`
    BigInt? fee,

    /// [decimals] defined in Candid: `decimals: nat8`
    int? decimals,

    /// [owner] defined in Candid: `owner: principal`
    Principal? owner,

    /// [logo] defined in Candid: `logo: text`
    String? logo,

    /// [name] defined in Candid: `name: text`
    String? name,

    /// [totalSupply] defined in Candid: `totalSupply: nat`
    BigInt? totalSupply,

    /// [symbol] defined in Candid: `symbol: text`
    String? symbol,
  }) {
    return Metadata(
      fee: fee ?? this.fee,
      decimals: decimals ?? this.decimals,
      owner: owner ?? this.owner,
      logo: logo ?? this.logo,
      name: name ?? this.name,
      totalSupply: totalSupply ?? this.totalSupply,
      symbol: symbol ?? this.symbol,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Metadata &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalSupply, totalSupply) ||
                other.totalSupply == totalSupply) &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @override
  int get hashCode => Object.hashAll(
      [runtimeType, fee, decimals, owner, logo, name, totalSupply, symbol]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Result] defined in Candid
/// ```Candid
///   variant { Ok: nat; Err: TxError }
/// ```
@immutable
class Result {
  const Result({
    /// [ok] defined in Candid: `Ok: nat`
    this.ok,

    /// [err] defined in Candid: `Err: TxError`
    this.err,
  });

  factory Result.fromJson(Map json) {
    return Result(
      ok: json['Ok'] == null
          ? null
          : json['Ok'] is BigInt
              ? json['Ok']
              : BigInt.from(json['Ok']),
      err: json['Err'] == null ? null : TxError.fromJson(json['Err']),
    );
  }

  /// [ok] defined in Candid: `Ok: nat`
  final BigInt? ok;

  /// [err] defined in Candid: `Err: TxError`
  final TxError? err;

  Map<String, dynamic> toJson() {
    final ok = this.ok;
    final err = this.err;
    return {
      if (ok != null) 'Ok': ok,
      if (err != null) 'Err': err,
    };
  }

  Result copyWith({
    /// [ok] defined in Candid: `Ok: nat`
    BigInt? ok,

    /// [err] defined in Candid: `Err: TxError`
    TxError? err,
  }) {
    return Result(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Result &&
            (identical(other.ok, ok) || other.ok == ok) &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, ok, err]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TokenInfo] defined in Candid
/// ```Candid
///   record { holderNumber: nat64; deployTime: nat64; metadata: Metadata; historySize: nat64; cycles: nat64; feeTo: principal }
/// ```
@immutable
class TokenInfo {
  const TokenInfo({
    /// [holderNumber] defined in Candid: `holderNumber: nat64`
    required this.holderNumber,

    /// [deployTime] defined in Candid: `deployTime: nat64`
    required this.deployTime,

    /// [metadata] defined in Candid: `metadata: Metadata`
    required this.metadata,

    /// [historySize] defined in Candid: `historySize: nat64`
    required this.historySize,

    /// [cycles] defined in Candid: `cycles: nat64`
    required this.cycles,

    /// [feeTo] defined in Candid: `feeTo: principal`
    required this.feeTo,
  });

  factory TokenInfo.fromJson(Map json) {
    return TokenInfo(
      holderNumber: json['holderNumber'] is BigInt
          ? json['holderNumber']
          : BigInt.from(json['holderNumber']),
      deployTime: json['deployTime'] is BigInt
          ? json['deployTime']
          : BigInt.from(json['deployTime']),
      metadata: Metadata.fromJson(json['metadata']),
      historySize: json['historySize'] is BigInt
          ? json['historySize']
          : BigInt.from(json['historySize']),
      cycles: json['cycles'] is BigInt
          ? json['cycles']
          : BigInt.from(json['cycles']),
      feeTo: Principal.from(json['feeTo']),
    );
  }

  /// [holderNumber] defined in Candid: `holderNumber: nat64`
  final BigInt holderNumber;

  /// [deployTime] defined in Candid: `deployTime: nat64`
  final BigInt deployTime;

  /// [metadata] defined in Candid: `metadata: Metadata`
  final Metadata metadata;

  /// [historySize] defined in Candid: `historySize: nat64`
  final BigInt historySize;

  /// [cycles] defined in Candid: `cycles: nat64`
  final BigInt cycles;

  /// [feeTo] defined in Candid: `feeTo: principal`
  final Principal feeTo;

  Map<String, dynamic> toJson() {
    final holderNumber = this.holderNumber;
    final deployTime = this.deployTime;
    final metadata = this.metadata;
    final historySize = this.historySize;
    final cycles = this.cycles;
    final feeTo = this.feeTo;
    return {
      'holderNumber': holderNumber,
      'deployTime': deployTime,
      'metadata': metadata,
      'historySize': historySize,
      'cycles': cycles,
      'feeTo': feeTo,
    };
  }

  TokenInfo copyWith({
    /// [holderNumber] defined in Candid: `holderNumber: nat64`
    BigInt? holderNumber,

    /// [deployTime] defined in Candid: `deployTime: nat64`
    BigInt? deployTime,

    /// [metadata] defined in Candid: `metadata: Metadata`
    Metadata? metadata,

    /// [historySize] defined in Candid: `historySize: nat64`
    BigInt? historySize,

    /// [cycles] defined in Candid: `cycles: nat64`
    BigInt? cycles,

    /// [feeTo] defined in Candid: `feeTo: principal`
    Principal? feeTo,
  }) {
    return TokenInfo(
      holderNumber: holderNumber ?? this.holderNumber,
      deployTime: deployTime ?? this.deployTime,
      metadata: metadata ?? this.metadata,
      historySize: historySize ?? this.historySize,
      cycles: cycles ?? this.cycles,
      feeTo: feeTo ?? this.feeTo,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TokenInfo &&
            (identical(other.holderNumber, holderNumber) ||
                other.holderNumber == holderNumber) &&
            (identical(other.deployTime, deployTime) ||
                other.deployTime == deployTime) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.historySize, historySize) ||
                other.historySize == historySize) &&
            (identical(other.cycles, cycles) || other.cycles == cycles) &&
            (identical(other.feeTo, feeTo) || other.feeTo == feeTo));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        holderNumber,
        deployTime,
        metadata,
        historySize,
        cycles,
        feeTo
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TxError] defined in Candid
/// ```Candid
///   variant { InsufficientAllowance; InsufficientBalance; ErrorOperationStyle; Unauthorized; LedgerTrap; ErrorTo; Other: text; BlockUsed; AmountTooSmall }
/// ```
@immutable
class TxError {
  const TxError({
    /// [insufficientAllowance] defined in Candid: `InsufficientAllowance`
    this.insufficientAllowance = false,

    /// [insufficientBalance] defined in Candid: `InsufficientBalance`
    this.insufficientBalance = false,

    /// [errorOperationStyle] defined in Candid: `ErrorOperationStyle`
    this.errorOperationStyle = false,

    /// [unauthorized] defined in Candid: `Unauthorized`
    this.unauthorized = false,

    /// [ledgerTrap] defined in Candid: `LedgerTrap`
    this.ledgerTrap = false,

    /// [errorTo] defined in Candid: `ErrorTo`
    this.errorTo = false,

    /// [other] defined in Candid: `Other: text`
    this.other,

    /// [blockUsed] defined in Candid: `BlockUsed`
    this.blockUsed = false,

    /// [amountTooSmall] defined in Candid: `AmountTooSmall`
    this.amountTooSmall = false,
  });

  factory TxError.fromJson(Map json) {
    return TxError(
      insufficientAllowance: json.containsKey('InsufficientAllowance'),
      insufficientBalance: json.containsKey('InsufficientBalance'),
      errorOperationStyle: json.containsKey('ErrorOperationStyle'),
      unauthorized: json.containsKey('Unauthorized'),
      ledgerTrap: json.containsKey('LedgerTrap'),
      errorTo: json.containsKey('ErrorTo'),
      other: json['Other'],
      blockUsed: json.containsKey('BlockUsed'),
      amountTooSmall: json.containsKey('AmountTooSmall'),
    );
  }

  /// [insufficientAllowance] defined in Candid: `InsufficientAllowance`
  final bool insufficientAllowance;

  /// [insufficientBalance] defined in Candid: `InsufficientBalance`
  final bool insufficientBalance;

  /// [errorOperationStyle] defined in Candid: `ErrorOperationStyle`
  final bool errorOperationStyle;

  /// [unauthorized] defined in Candid: `Unauthorized`
  final bool unauthorized;

  /// [ledgerTrap] defined in Candid: `LedgerTrap`
  final bool ledgerTrap;

  /// [errorTo] defined in Candid: `ErrorTo`
  final bool errorTo;

  /// [other] defined in Candid: `Other: text`
  final String? other;

  /// [blockUsed] defined in Candid: `BlockUsed`
  final bool blockUsed;

  /// [amountTooSmall] defined in Candid: `AmountTooSmall`
  final bool amountTooSmall;

  Map<String, dynamic> toJson() {
    final insufficientAllowance = this.insufficientAllowance;
    final insufficientBalance = this.insufficientBalance;
    final errorOperationStyle = this.errorOperationStyle;
    final unauthorized = this.unauthorized;
    final ledgerTrap = this.ledgerTrap;
    final errorTo = this.errorTo;
    final other = this.other;
    final blockUsed = this.blockUsed;
    final amountTooSmall = this.amountTooSmall;
    return {
      if (insufficientAllowance) 'InsufficientAllowance': null,
      if (insufficientBalance) 'InsufficientBalance': null,
      if (errorOperationStyle) 'ErrorOperationStyle': null,
      if (unauthorized) 'Unauthorized': null,
      if (ledgerTrap) 'LedgerTrap': null,
      if (errorTo) 'ErrorTo': null,
      if (other != null) 'Other': other,
      if (blockUsed) 'BlockUsed': null,
      if (amountTooSmall) 'AmountTooSmall': null,
    };
  }

  TxError copyWith({
    /// [insufficientAllowance] defined in Candid: `InsufficientAllowance`
    bool? insufficientAllowance,

    /// [insufficientBalance] defined in Candid: `InsufficientBalance`
    bool? insufficientBalance,

    /// [errorOperationStyle] defined in Candid: `ErrorOperationStyle`
    bool? errorOperationStyle,

    /// [unauthorized] defined in Candid: `Unauthorized`
    bool? unauthorized,

    /// [ledgerTrap] defined in Candid: `LedgerTrap`
    bool? ledgerTrap,

    /// [errorTo] defined in Candid: `ErrorTo`
    bool? errorTo,

    /// [other] defined in Candid: `Other: text`
    String? other,

    /// [blockUsed] defined in Candid: `BlockUsed`
    bool? blockUsed,

    /// [amountTooSmall] defined in Candid: `AmountTooSmall`
    bool? amountTooSmall,
  }) {
    return TxError(
      insufficientAllowance:
          insufficientAllowance ?? this.insufficientAllowance,
      insufficientBalance: insufficientBalance ?? this.insufficientBalance,
      errorOperationStyle: errorOperationStyle ?? this.errorOperationStyle,
      unauthorized: unauthorized ?? this.unauthorized,
      ledgerTrap: ledgerTrap ?? this.ledgerTrap,
      errorTo: errorTo ?? this.errorTo,
      other: other ?? this.other,
      blockUsed: blockUsed ?? this.blockUsed,
      amountTooSmall: amountTooSmall ?? this.amountTooSmall,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TxError &&
            (identical(other.insufficientAllowance, insufficientAllowance) ||
                other.insufficientAllowance == insufficientAllowance) &&
            (identical(other.insufficientBalance, insufficientBalance) ||
                other.insufficientBalance == insufficientBalance) &&
            (identical(other.errorOperationStyle, errorOperationStyle) ||
                other.errorOperationStyle == errorOperationStyle) &&
            (identical(other.unauthorized, unauthorized) ||
                other.unauthorized == unauthorized) &&
            (identical(other.ledgerTrap, ledgerTrap) ||
                other.ledgerTrap == ledgerTrap) &&
            (identical(other.errorTo, errorTo) || other.errorTo == errorTo) &&
            (identical(other.other, other) || other.other == other) &&
            (identical(other.blockUsed, blockUsed) ||
                other.blockUsed == blockUsed) &&
            (identical(other.amountTooSmall, amountTooSmall) ||
                other.amountTooSmall == amountTooSmall));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        insufficientAllowance,
        insufficientBalance,
        errorOperationStyle,
        unauthorized,
        ledgerTrap,
        errorTo,
        other,
        blockUsed,
        amountTooSmall
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [AllowanceArg] defined in Candid
/// ```Candid
///   (principal, principal)
/// ```
@immutable
class AllowanceArg {
  const AllowanceArg(
    this.item1,
    this.item2,
  );

  factory AllowanceArg.fromJson(List<dynamic> tuple) {
    return AllowanceArg(
      Principal.from(tuple[0]),
      Principal.from(tuple[1]),
    );
  }

  /// [item1] defined in Candid: `principal`
  final Principal item1;

  /// [item2] defined in Candid: `principal`
  final Principal item2;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      item1,
      item2,
    ];
  }

  AllowanceArg copyWith({
    /// [item1] defined in Candid: `principal`
    Principal? item1,

    /// [item2] defined in Candid: `principal`
    Principal? item2,
  }) {
    return AllowanceArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AllowanceArg &&
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

/// [ApproveArg] defined in Candid
/// ```Candid
///   (principal, nat)
/// ```
@immutable
class ApproveArg {
  const ApproveArg(
    this.item1,
    this.item2,
  );

  factory ApproveArg.fromJson(List<dynamic> tuple) {
    return ApproveArg(
      Principal.from(tuple[0]),
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
    );
  }

  /// [item1] defined in Candid: `principal`
  final Principal item1;

  /// [item2] defined in Candid: `nat`
  final BigInt item2;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      item1,
      item2,
    ];
  }

  ApproveArg copyWith({
    /// [item1] defined in Candid: `principal`
    Principal? item1,

    /// [item2] defined in Candid: `nat`
    BigInt? item2,
  }) {
    return ApproveArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApproveArg &&
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

/// [GetHoldersArg] defined in Candid
/// ```Candid
///   (nat64, nat64)
/// ```
@immutable
class GetHoldersArg {
  const GetHoldersArg(
    this.item1,
    this.item2,
  );

  factory GetHoldersArg.fromJson(List<dynamic> tuple) {
    return GetHoldersArg(
      tuple[0] is BigInt ? tuple[0] : BigInt.from(tuple[0]),
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
    );
  }

  /// [item1] defined in Candid: `nat64`
  final BigInt item1;

  /// [item2] defined in Candid: `nat64`
  final BigInt item2;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      item1,
      item2,
    ];
  }

  GetHoldersArg copyWith({
    /// [item1] defined in Candid: `nat64`
    BigInt? item1,

    /// [item2] defined in Candid: `nat64`
    BigInt? item2,
  }) {
    return GetHoldersArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetHoldersArg &&
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

/// [MintArg] defined in Candid
/// ```Candid
///   (principal, nat)
/// ```
@immutable
class MintArg {
  const MintArg(
    this.item1,
    this.item2,
  );

  factory MintArg.fromJson(List<dynamic> tuple) {
    return MintArg(
      Principal.from(tuple[0]),
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
    );
  }

  /// [item1] defined in Candid: `principal`
  final Principal item1;

  /// [item2] defined in Candid: `nat`
  final BigInt item2;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      item1,
      item2,
    ];
  }

  MintArg copyWith({
    /// [item1] defined in Candid: `principal`
    Principal? item1,

    /// [item2] defined in Candid: `nat`
    BigInt? item2,
  }) {
    return MintArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MintArg &&
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

/// [TransferArg] defined in Candid
/// ```Candid
///   (principal, nat)
/// ```
@immutable
class TransferArg {
  const TransferArg(
    this.item1,
    this.item2,
  );

  factory TransferArg.fromJson(List<dynamic> tuple) {
    return TransferArg(
      Principal.from(tuple[0]),
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
    );
  }

  /// [item1] defined in Candid: `principal`
  final Principal item1;

  /// [item2] defined in Candid: `nat`
  final BigInt item2;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      item1,
      item2,
    ];
  }

  TransferArg copyWith({
    /// [item1] defined in Candid: `principal`
    Principal? item1,

    /// [item2] defined in Candid: `nat`
    BigInt? item2,
  }) {
    return TransferArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferArg &&
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

/// [TransferFromArg] defined in Candid
/// ```Candid
///   (principal, principal, nat)
/// ```
@immutable
class TransferFromArg {
  const TransferFromArg(
    this.item1,
    this.item2,
    this.item3,
  );

  factory TransferFromArg.fromJson(List<dynamic> tuple) {
    return TransferFromArg(
      Principal.from(tuple[0]),
      Principal.from(tuple[1]),
      tuple[2] is BigInt ? tuple[2] : BigInt.from(tuple[2]),
    );
  }

  /// [item1] defined in Candid: `principal`
  final Principal item1;

  /// [item2] defined in Candid: `principal`
  final Principal item2;

  /// [item3] defined in Candid: `nat`
  final BigInt item3;

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

  TransferFromArg copyWith({
    /// [item1] defined in Candid: `principal`
    Principal? item1,

    /// [item2] defined in Candid: `principal`
    Principal? item2,

    /// [item3] defined in Candid: `nat`
    BigInt? item3,
  }) {
    return TransferFromArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferFromArg &&
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
