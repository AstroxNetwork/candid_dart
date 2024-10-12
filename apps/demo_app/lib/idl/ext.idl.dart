// coverage:ignore-file
// ignore_for_file: type=lint, unnecessary_null_comparison
// ======================================
// GENERATED CODE - DO NOT MODIFY BY HAND
// ======================================

import 'dart:async';
import 'dart:typed_data';
import 'package:agent_dart/agent_dart.dart';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

class ExtIDLActor {
  const ExtIDLActor._();

  /// ```Candid
  ///   getFee: () -> (FeeResult) query
  /// ```
  static Future<FeeResult> getFee(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('getFee')!(dat);
    return FeeResult.fromJson(ret);
  }

  /// ```Candid
  ///   balance: (BalanceRequest) -> (BalanceResponse) query
  /// ```
  static Future<BalanceResponse> balance(
    CanisterActor actor,
    BalanceRequest arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('balance')!(dat);
    return BalanceResponse.fromJson(ret);
  }

  /// ```Candid
  ///   metadata: () -> (Result) query
  /// ```
  static Future<Result> metadata(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('metadata')!(dat);
    return Result.fromJson(ret);
  }

  /// ```Candid
  ///   transfer: (TransferRequest) -> (TransferResponse)
  /// ```
  static Future<TransferResponse> transfer(
    CanisterActor actor,
    TransferRequest arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('transfer')!(dat);
    return TransferResponse.fromJson(ret);
  }
}

class ExtIDLService {
  ExtIDLService({
    required this.canisterId,
    required this.uri,
    this.identity,
    this.createActorMethod,
    this.debug = true,
  }) : idl = ExtIDL.idl;

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

  Future<FeeResult> getFee() async {
    final actor = await getActor();
    return ExtIDLActor.getFee(
      actor,
    );
  }

  Future<BalanceResponse> balance(
    BalanceRequest arg,
  ) async {
    final actor = await getActor();
    return ExtIDLActor.balance(
      actor,
      arg,
    );
  }

  Future<Result> metadata() async {
    final actor = await getActor();
    return ExtIDLActor.metadata(
      actor,
    );
  }

  Future<TransferResponse> transfer(
    TransferRequest arg,
  ) async {
    final actor = await getActor();
    return ExtIDLActor.transfer(
      actor,
      arg,
    );
  }
}

class ExtIDL {
  const ExtIDL._();

  /// [_User] defined in Candid
  /// ```Candid
  ///   type User = variant { address: AccountIdentifier; principal: principal };
  /// ```
  static final VariantClass _User = IDL.Variant({
    'address': _AccountIdentifier,
    'principal': IDL.Principal,
  });

  /// [_TransferResponse] defined in Candid
  /// ```Candid
  ///   type TransferResponse = variant { err: variant { CannotNotify: AccountIdentifier; InsufficientAllowance; InsufficientBalance; InvalidToken: TokenIdentifier; Other: text; Rejected; Unauthorized: AccountIdentifier }; ok: Balance };
  /// ```
  static final VariantClass _TransferResponse = IDL.Variant({
    'err': IDL.Variant({
      'CannotNotify': _AccountIdentifier,
      'InsufficientAllowance': IDL.Null,
      'InsufficientBalance': IDL.Null,
      'InvalidToken': _TokenIdentifier,
      'Other': IDL.Text,
      'Rejected': IDL.Null,
      'Unauthorized': _AccountIdentifier,
    }),
    'ok': _Balance,
  });

  /// [_TransferRequest] defined in Candid
  /// ```Candid
  ///   type TransferRequest = record { amount: Balance; from: User; memo: Memo; nonce: opt nat; notify: bool; subaccount: opt vec nat8; to: User; token: TokenIdentifier };
  /// ```
  static final RecordClass _TransferRequest = IDL.Record({
    'amount': _Balance,
    'from': _User,
    'memo': _Memo,
    'nonce': IDL.Opt(
      IDL.Nat,
    ),
    'notify': IDL.Bool,
    'subaccount': IDL.Opt(
      IDL.Vec(
        IDL.Nat8,
      ),
    ),
    'to': _User,
    'token': _TokenIdentifier,
  });

  /// [_TokenIdentifier] defined in Candid
  /// ```Candid
  ///   type TokenIdentifier = text;
  /// ```
  static final _TokenIdentifier = IDL.Text;

  /// [_Balance] defined in Candid
  /// ```Candid
  ///   type Balance = nat;
  /// ```
  static final _Balance = IDL.Nat;

  /// [_Result] defined in Candid
  /// ```Candid
  ///   type Result = variant { err: CommonError; ok: Metadata };
  /// ```
  static final VariantClass _Result = IDL.Variant({
    'err': _CommonError,
    'ok': _Metadata,
  });

  /// [_Metadata] defined in Candid
  /// ```Candid
  ///   type Metadata = variant { fungible: record { decimals: nat8; metadata: opt blob; name: text; ownerAccount: AccountIdentifier; symbol: text }; nonfungible: record { metadata: opt blob } };
  /// ```
  static final VariantClass _Metadata = IDL.Variant({
    'fungible': IDL.Record({
      'decimals': IDL.Nat8,
      'metadata': IDL.Opt(
        IDL.Vec(IDL.Nat8),
      ),
      'name': IDL.Text,
      'ownerAccount': _AccountIdentifier,
      'symbol': IDL.Text,
    }),
    'nonfungible': IDL.Record({
      'metadata': IDL.Opt(
        IDL.Vec(IDL.Nat8),
      ),
    }),
  });

  /// [_Memo] defined in Candid
  /// ```Candid
  ///   type Memo = blob;
  /// ```
  static final _Memo = IDL.Vec(IDL.Nat8);

  /// [_CommonError] defined in Candid
  /// ```Candid
  ///   type CommonError = variant { InsufficientBalance; InvalidToken: TokenIdentifier; Other: text; Unauthorized: AccountIdentifier };
  /// ```
  static final VariantClass _CommonError = IDL.Variant({
    'InsufficientBalance': IDL.Null,
    'InvalidToken': _TokenIdentifier,
    'Other': IDL.Text,
    'Unauthorized': _AccountIdentifier,
  });

  /// [_BalanceResponse] defined in Candid
  /// ```Candid
  ///   type BalanceResponse = variant { err: CommonError; ok: Balance };
  /// ```
  static final VariantClass _BalanceResponse = IDL.Variant({
    'err': _CommonError,
    'ok': _Balance,
  });

  /// [_BalanceRequest] defined in Candid
  /// ```Candid
  ///   type BalanceRequest = record { token: TokenIdentifier; user: User };
  /// ```
  static final RecordClass _BalanceRequest = IDL.Record({
    'token': _TokenIdentifier,
    'user': _User,
  });

  /// [_FeeResult] defined in Candid
  /// ```Candid
  ///   type FeeResult = variant { err: CommonError; ok: nat };
  /// ```
  static final VariantClass _FeeResult = IDL.Variant({
    'err': _CommonError,
    'ok': IDL.Nat,
  });

  /// [_AccountIdentifier] defined in Candid
  /// ```Candid
  ///   type AccountIdentifier = text;
  /// ```
  static final _AccountIdentifier = IDL.Text;

  static final ServiceClass idl = IDL.Service({
    'getFee': IDL.Func(
      [],
      [_FeeResult],
      ['query'],
    ),
    'balance': IDL.Func(
      [_BalanceRequest],
      [_BalanceResponse],
      ['query'],
    ),
    'metadata': IDL.Func(
      [],
      [_Result],
      ['query'],
    ),
    'transfer': IDL.Func(
      [_TransferRequest],
      [_TransferResponse],
      [],
    ),
  });
}

/// [User] defined in Candid
/// ```Candid
///   variant { address: AccountIdentifier; principal: principal }
/// ```
@immutable
class User {
  const User({
    /// [address] defined in Candid: `address: AccountIdentifier`
    this.address,

    /// [principal] defined in Candid: `principal: principal`
    this.principal,
  });

  factory User.fromJson(Map json) {
    return User(
      address: json['address'],
      principal:
          json['principal'] == null ? null : Principal.from(json['principal']),
    );
  }

  /// [address] defined in Candid: `address: AccountIdentifier`
  final AccountIdentifier? address;

  /// [principal] defined in Candid: `principal: principal`
  final Principal? principal;

  Map<String, dynamic> toJson() {
    final address = this.address;
    final principal = this.principal;
    return {
      if (address != null) 'address': address,
      if (principal != null) 'principal': principal,
    };
  }

  User copyWith({
    /// [address] defined in Candid: `address: AccountIdentifier`
    AccountIdentifier? address,

    /// [principal] defined in Candid: `principal: principal`
    Principal? principal,
  }) {
    return User(
      address: address ?? this.address,
      principal: principal ?? this.principal,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.principal, principal) ||
                other.principal == principal));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, address, principal]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransferResponseErr] defined in Candid
/// ```Candid
///   variant { CannotNotify: AccountIdentifier; InsufficientAllowance; InsufficientBalance; InvalidToken: TokenIdentifier; Other: text; Rejected; Unauthorized: AccountIdentifier }
/// ```
@immutable
class TransferResponseErr {
  const TransferResponseErr({
    /// [cannotNotify] defined in Candid: `CannotNotify: AccountIdentifier`
    this.cannotNotify,

    /// [insufficientAllowance] defined in Candid: `InsufficientAllowance`
    this.insufficientAllowance = false,

    /// [insufficientBalance] defined in Candid: `InsufficientBalance`
    this.insufficientBalance = false,

    /// [invalidToken] defined in Candid: `InvalidToken: TokenIdentifier`
    this.invalidToken,

    /// [other] defined in Candid: `Other: text`
    this.other,

    /// [rejected] defined in Candid: `Rejected`
    this.rejected = false,

    /// [unauthorized] defined in Candid: `Unauthorized: AccountIdentifier`
    this.unauthorized,
  });

  factory TransferResponseErr.fromJson(Map json) {
    return TransferResponseErr(
      cannotNotify: json['CannotNotify'],
      insufficientAllowance: json.containsKey('InsufficientAllowance'),
      insufficientBalance: json.containsKey('InsufficientBalance'),
      invalidToken: json['InvalidToken'],
      other: json['Other'],
      rejected: json.containsKey('Rejected'),
      unauthorized: json['Unauthorized'],
    );
  }

  /// [cannotNotify] defined in Candid: `CannotNotify: AccountIdentifier`
  final AccountIdentifier? cannotNotify;

  /// [insufficientAllowance] defined in Candid: `InsufficientAllowance`
  final bool insufficientAllowance;

  /// [insufficientBalance] defined in Candid: `InsufficientBalance`
  final bool insufficientBalance;

  /// [invalidToken] defined in Candid: `InvalidToken: TokenIdentifier`
  final TokenIdentifier? invalidToken;

  /// [other] defined in Candid: `Other: text`
  final String? other;

  /// [rejected] defined in Candid: `Rejected`
  final bool rejected;

  /// [unauthorized] defined in Candid: `Unauthorized: AccountIdentifier`
  final AccountIdentifier? unauthorized;

  Map<String, dynamic> toJson() {
    final cannotNotify = this.cannotNotify;
    final insufficientAllowance = this.insufficientAllowance;
    final insufficientBalance = this.insufficientBalance;
    final invalidToken = this.invalidToken;
    final other = this.other;
    final rejected = this.rejected;
    final unauthorized = this.unauthorized;
    return {
      if (cannotNotify != null) 'CannotNotify': cannotNotify,
      if (insufficientAllowance) 'InsufficientAllowance': null,
      if (insufficientBalance) 'InsufficientBalance': null,
      if (invalidToken != null) 'InvalidToken': invalidToken,
      if (other != null) 'Other': other,
      if (rejected) 'Rejected': null,
      if (unauthorized != null) 'Unauthorized': unauthorized,
    };
  }

  TransferResponseErr copyWith({
    /// [cannotNotify] defined in Candid: `CannotNotify: AccountIdentifier`
    AccountIdentifier? cannotNotify,

    /// [insufficientAllowance] defined in Candid: `InsufficientAllowance`
    bool? insufficientAllowance,

    /// [insufficientBalance] defined in Candid: `InsufficientBalance`
    bool? insufficientBalance,

    /// [invalidToken] defined in Candid: `InvalidToken: TokenIdentifier`
    TokenIdentifier? invalidToken,

    /// [other] defined in Candid: `Other: text`
    String? other,

    /// [rejected] defined in Candid: `Rejected`
    bool? rejected,

    /// [unauthorized] defined in Candid: `Unauthorized: AccountIdentifier`
    AccountIdentifier? unauthorized,
  }) {
    return TransferResponseErr(
      cannotNotify: cannotNotify ?? this.cannotNotify,
      insufficientAllowance:
          insufficientAllowance ?? this.insufficientAllowance,
      insufficientBalance: insufficientBalance ?? this.insufficientBalance,
      invalidToken: invalidToken ?? this.invalidToken,
      other: other ?? this.other,
      rejected: rejected ?? this.rejected,
      unauthorized: unauthorized ?? this.unauthorized,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferResponseErr &&
            (identical(other.cannotNotify, cannotNotify) ||
                other.cannotNotify == cannotNotify) &&
            (identical(other.insufficientAllowance, insufficientAllowance) ||
                other.insufficientAllowance == insufficientAllowance) &&
            (identical(other.insufficientBalance, insufficientBalance) ||
                other.insufficientBalance == insufficientBalance) &&
            (identical(other.invalidToken, invalidToken) ||
                other.invalidToken == invalidToken) &&
            (identical(other.other, other) || other.other == other) &&
            (identical(other.rejected, rejected) ||
                other.rejected == rejected) &&
            (identical(other.unauthorized, unauthorized) ||
                other.unauthorized == unauthorized));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        cannotNotify,
        insufficientAllowance,
        insufficientBalance,
        invalidToken,
        other,
        rejected,
        unauthorized
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransferResponse] defined in Candid
/// ```Candid
///   variant { err: variant { CannotNotify: AccountIdentifier; InsufficientAllowance; InsufficientBalance; InvalidToken: TokenIdentifier; Other: text; Rejected; Unauthorized: AccountIdentifier }; ok: Balance }
/// ```
@immutable
class TransferResponse {
  const TransferResponse({
    /// [err] defined in Candid: `err: variant { CannotNotify: AccountIdentifier; InsufficientAllowance; InsufficientBalance; InvalidToken: TokenIdentifier; Other: text; Rejected; Unauthorized: AccountIdentifier }`
    this.err,

    /// [ok] defined in Candid: `ok: Balance`
    this.ok,
  });

  factory TransferResponse.fromJson(Map json) {
    return TransferResponse(
      err: json['err'] == null
          ? null
          : TransferResponseErr.fromJson(
              json['err'],
            ),
      ok: json['ok'] is BigInt ? json['ok'] : BigInt.from(json['ok']),
    );
  }

  /// [err] defined in Candid: `err: variant { CannotNotify: AccountIdentifier; InsufficientAllowance; InsufficientBalance; InvalidToken: TokenIdentifier; Other: text; Rejected; Unauthorized: AccountIdentifier }`
  final TransferResponseErr? err;

  /// [ok] defined in Candid: `ok: Balance`
  final Balance? ok;

  Map<String, dynamic> toJson() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  TransferResponse copyWith({
    /// [err] defined in Candid: `err: variant { CannotNotify: AccountIdentifier; InsufficientAllowance; InsufficientBalance; InvalidToken: TokenIdentifier; Other: text; Rejected; Unauthorized: AccountIdentifier }`
    TransferResponseErr? err,

    /// [ok] defined in Candid: `ok: Balance`
    Balance? ok,
  }) {
    return TransferResponse(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferResponse &&
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

/// [TransferRequest] defined in Candid
/// ```Candid
///   record { amount: Balance; from: User; memo: Memo; nonce: opt nat; notify: bool; subaccount: opt vec nat8; to: User; token: TokenIdentifier }
/// ```
@immutable
class TransferRequest {
  const TransferRequest({
    /// [amount] defined in Candid: `amount: Balance`
    required this.amount,

    /// [from] defined in Candid: `from: User`
    required this.from,

    /// [memo] defined in Candid: `memo: Memo`
    required this.memo,

    /// [nonce] defined in Candid: `nonce: opt nat`
    this.nonce,

    /// [notify] defined in Candid: `notify: bool`
    required this.notify,

    /// [subaccount] defined in Candid: `subaccount: opt vec nat8`
    this.subaccount,

    /// [to] defined in Candid: `to: User`
    required this.to,

    /// [token] defined in Candid: `token: TokenIdentifier`
    required this.token,
  });

  factory TransferRequest.fromJson(Map json) {
    return TransferRequest(
      amount: json['amount'] is BigInt
          ? json['amount']
          : BigInt.from(json['amount']),
      from: User.fromJson(json['from']),
      memo: json['memo'] is Uint8List
          ? json['memo']
          : Uint8List.fromList(json['memo']),
      nonce: (json['nonce'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      notify: json['notify'],
      subaccount: (json['subaccount'] as List).map((e) {
        return e;
      }).firstOrNull,
      to: User.fromJson(json['to']),
      token: json['token'],
    );
  }

  /// [amount] defined in Candid: `amount: Balance`
  final Balance amount;

  /// [from] defined in Candid: `from: User`
  final User from;

  /// [memo] defined in Candid: `memo: Memo`
  final Memo memo;

  /// [nonce] defined in Candid: `nonce: opt nat`
  final BigInt? nonce;

  /// [notify] defined in Candid: `notify: bool`
  final bool notify;

  /// [subaccount] defined in Candid: `subaccount: opt vec nat8`
  final Uint8List? subaccount;

  /// [to] defined in Candid: `to: User`
  final User to;

  /// [token] defined in Candid: `token: TokenIdentifier`
  final TokenIdentifier token;

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final from = this.from;
    final memo = this.memo;
    final nonce = this.nonce;
    final notify = this.notify;
    final subaccount = this.subaccount;
    final to = this.to;
    final token = this.token;
    return {
      'amount': amount,
      'from': from,
      'memo': memo,
      'nonce': [if (nonce != null) nonce],
      'notify': notify,
      'subaccount': [if (subaccount != null) subaccount],
      'to': to,
      'token': token,
    };
  }

  TransferRequest copyWith({
    /// [amount] defined in Candid: `amount: Balance`
    Balance? amount,

    /// [from] defined in Candid: `from: User`
    User? from,

    /// [memo] defined in Candid: `memo: Memo`
    Memo? memo,

    /// [nonce] defined in Candid: `nonce: opt nat`
    BigInt? nonce,

    /// [notify] defined in Candid: `notify: bool`
    bool? notify,

    /// [subaccount] defined in Candid: `subaccount: opt vec nat8`
    Uint8List? subaccount,

    /// [to] defined in Candid: `to: User`
    User? to,

    /// [token] defined in Candid: `token: TokenIdentifier`
    TokenIdentifier? token,
  }) {
    return TransferRequest(
      amount: amount ?? this.amount,
      from: from ?? this.from,
      memo: memo ?? this.memo,
      nonce: nonce ?? this.nonce,
      notify: notify ?? this.notify,
      subaccount: subaccount ?? this.subaccount,
      to: to ?? this.to,
      token: token ?? this.token,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferRequest &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.nonce, nonce) || other.nonce == nonce) &&
            (identical(other.notify, notify) || other.notify == notify) &&
            (identical(other.subaccount, subaccount) ||
                other.subaccount == subaccount) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hashAll(
      [runtimeType, amount, from, memo, nonce, notify, subaccount, to, token]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Result] defined in Candid
/// ```Candid
///   variant { err: CommonError; ok: Metadata }
/// ```
@immutable
class Result {
  const Result({
    /// [err] defined in Candid: `err: CommonError`
    this.err,

    /// [ok] defined in Candid: `ok: Metadata`
    this.ok,
  });

  factory Result.fromJson(Map json) {
    return Result(
      err: json['err'] == null ? null : CommonError.fromJson(json['err']),
      ok: json['ok'] == null ? null : Metadata.fromJson(json['ok']),
    );
  }

  /// [err] defined in Candid: `err: CommonError`
  final CommonError? err;

  /// [ok] defined in Candid: `ok: Metadata`
  final Metadata? ok;

  Map<String, dynamic> toJson() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  Result copyWith({
    /// [err] defined in Candid: `err: CommonError`
    CommonError? err,

    /// [ok] defined in Candid: `ok: Metadata`
    Metadata? ok,
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
            (identical(other.ok, ok) || other.ok == ok));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, err, ok]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [MetadataFungible] defined in Candid
/// ```Candid
///   record { decimals: nat8; metadata: opt blob; name: text; ownerAccount: AccountIdentifier; symbol: text }
/// ```
@immutable
class MetadataFungible {
  const MetadataFungible({
    /// [decimals] defined in Candid: `decimals: nat8`
    required this.decimals,

    /// [metadata] defined in Candid: `metadata: opt blob`
    this.metadata,

    /// [name] defined in Candid: `name: text`
    required this.name,

    /// [ownerAccount] defined in Candid: `ownerAccount: AccountIdentifier`
    required this.ownerAccount,

    /// [symbol] defined in Candid: `symbol: text`
    required this.symbol,
  });

  factory MetadataFungible.fromJson(Map json) {
    return MetadataFungible(
      decimals: json['decimals'],
      metadata: (json['metadata'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList(e);
      }).firstOrNull,
      name: json['name'],
      ownerAccount: json['ownerAccount'],
      symbol: json['symbol'],
    );
  }

  /// [decimals] defined in Candid: `decimals: nat8`
  final int decimals;

  /// [metadata] defined in Candid: `metadata: opt blob`
  final Uint8List? metadata;

  /// [name] defined in Candid: `name: text`
  final String name;

  /// [ownerAccount] defined in Candid: `ownerAccount: AccountIdentifier`
  final AccountIdentifier ownerAccount;

  /// [symbol] defined in Candid: `symbol: text`
  final String symbol;

  Map<String, dynamic> toJson() {
    final decimals = this.decimals;
    final metadata = this.metadata;
    final name = this.name;
    final ownerAccount = this.ownerAccount;
    final symbol = this.symbol;
    return {
      'decimals': decimals,
      'metadata': [if (metadata != null) metadata],
      'name': name,
      'ownerAccount': ownerAccount,
      'symbol': symbol,
    };
  }

  MetadataFungible copyWith({
    /// [decimals] defined in Candid: `decimals: nat8`
    int? decimals,

    /// [metadata] defined in Candid: `metadata: opt blob`
    Uint8List? metadata,

    /// [name] defined in Candid: `name: text`
    String? name,

    /// [ownerAccount] defined in Candid: `ownerAccount: AccountIdentifier`
    AccountIdentifier? ownerAccount,

    /// [symbol] defined in Candid: `symbol: text`
    String? symbol,
  }) {
    return MetadataFungible(
      decimals: decimals ?? this.decimals,
      metadata: metadata ?? this.metadata,
      name: name ?? this.name,
      ownerAccount: ownerAccount ?? this.ownerAccount,
      symbol: symbol ?? this.symbol,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MetadataFungible &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ownerAccount, ownerAccount) ||
                other.ownerAccount == ownerAccount) &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @override
  int get hashCode => Object.hashAll(
      [runtimeType, decimals, metadata, name, ownerAccount, symbol]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [MetadataNonfungible] defined in Candid
/// ```Candid
///   record { metadata: opt blob }
/// ```
@immutable
class MetadataNonfungible {
  const MetadataNonfungible(
      {
      /// [metadata] defined in Candid: `metadata: opt blob`
      this.metadata});

  factory MetadataNonfungible.fromJson(Map json) {
    return MetadataNonfungible(
      metadata: (json['metadata'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList(e);
      }).firstOrNull,
    );
  }

  /// [metadata] defined in Candid: `metadata: opt blob`
  final Uint8List? metadata;

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    return {
      'metadata': [if (metadata != null) metadata],
    };
  }

  MetadataNonfungible copyWith(
      {
      /// [metadata] defined in Candid: `metadata: opt blob`
      Uint8List? metadata}) {
    return MetadataNonfungible(
      metadata: metadata ?? this.metadata,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MetadataNonfungible &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, metadata]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Metadata] defined in Candid
/// ```Candid
///   variant { fungible: record { decimals: nat8; metadata: opt blob; name: text; ownerAccount: AccountIdentifier; symbol: text }; nonfungible: record { metadata: opt blob } }
/// ```
@immutable
class Metadata {
  const Metadata({
    /// [fungible] defined in Candid: `fungible: record { decimals: nat8; metadata: opt blob; name: text; ownerAccount: AccountIdentifier; symbol: text }`
    this.fungible,

    /// [nonfungible] defined in Candid: `nonfungible: record { metadata: opt blob }`
    this.nonfungible,
  });

  factory Metadata.fromJson(Map json) {
    return Metadata(
      fungible: json['fungible'] == null
          ? null
          : MetadataFungible.fromJson(
              json['fungible'],
            ),
      nonfungible: json['nonfungible'] == null
          ? null
          : MetadataNonfungible.fromJson(
              json['nonfungible'],
            ),
    );
  }

  /// [fungible] defined in Candid: `fungible: record { decimals: nat8; metadata: opt blob; name: text; ownerAccount: AccountIdentifier; symbol: text }`
  final MetadataFungible? fungible;

  /// [nonfungible] defined in Candid: `nonfungible: record { metadata: opt blob }`
  final MetadataNonfungible? nonfungible;

  Map<String, dynamic> toJson() {
    final fungible = this.fungible;
    final nonfungible = this.nonfungible;
    return {
      if (fungible != null) 'fungible': fungible,
      if (nonfungible != null) 'nonfungible': nonfungible,
    };
  }

  Metadata copyWith({
    /// [fungible] defined in Candid: `fungible: record { decimals: nat8; metadata: opt blob; name: text; ownerAccount: AccountIdentifier; symbol: text }`
    MetadataFungible? fungible,

    /// [nonfungible] defined in Candid: `nonfungible: record { metadata: opt blob }`
    MetadataNonfungible? nonfungible,
  }) {
    return Metadata(
      fungible: fungible ?? this.fungible,
      nonfungible: nonfungible ?? this.nonfungible,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Metadata &&
            (identical(other.fungible, fungible) ||
                other.fungible == fungible) &&
            (identical(other.nonfungible, nonfungible) ||
                other.nonfungible == nonfungible));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, fungible, nonfungible]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [CommonError] defined in Candid
/// ```Candid
///   variant { InsufficientBalance; InvalidToken: TokenIdentifier; Other: text; Unauthorized: AccountIdentifier }
/// ```
@immutable
class CommonError {
  const CommonError({
    /// [insufficientBalance] defined in Candid: `InsufficientBalance`
    this.insufficientBalance = false,

    /// [invalidToken] defined in Candid: `InvalidToken: TokenIdentifier`
    this.invalidToken,

    /// [other] defined in Candid: `Other: text`
    this.other,

    /// [unauthorized] defined in Candid: `Unauthorized: AccountIdentifier`
    this.unauthorized,
  });

  factory CommonError.fromJson(Map json) {
    return CommonError(
      insufficientBalance: json.containsKey('InsufficientBalance'),
      invalidToken: json['InvalidToken'],
      other: json['Other'],
      unauthorized: json['Unauthorized'],
    );
  }

  /// [insufficientBalance] defined in Candid: `InsufficientBalance`
  final bool insufficientBalance;

  /// [invalidToken] defined in Candid: `InvalidToken: TokenIdentifier`
  final TokenIdentifier? invalidToken;

  /// [other] defined in Candid: `Other: text`
  final String? other;

  /// [unauthorized] defined in Candid: `Unauthorized: AccountIdentifier`
  final AccountIdentifier? unauthorized;

  Map<String, dynamic> toJson() {
    final insufficientBalance = this.insufficientBalance;
    final invalidToken = this.invalidToken;
    final other = this.other;
    final unauthorized = this.unauthorized;
    return {
      if (insufficientBalance) 'InsufficientBalance': null,
      if (invalidToken != null) 'InvalidToken': invalidToken,
      if (other != null) 'Other': other,
      if (unauthorized != null) 'Unauthorized': unauthorized,
    };
  }

  CommonError copyWith({
    /// [insufficientBalance] defined in Candid: `InsufficientBalance`
    bool? insufficientBalance,

    /// [invalidToken] defined in Candid: `InvalidToken: TokenIdentifier`
    TokenIdentifier? invalidToken,

    /// [other] defined in Candid: `Other: text`
    String? other,

    /// [unauthorized] defined in Candid: `Unauthorized: AccountIdentifier`
    AccountIdentifier? unauthorized,
  }) {
    return CommonError(
      insufficientBalance: insufficientBalance ?? this.insufficientBalance,
      invalidToken: invalidToken ?? this.invalidToken,
      other: other ?? this.other,
      unauthorized: unauthorized ?? this.unauthorized,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommonError &&
            (identical(other.insufficientBalance, insufficientBalance) ||
                other.insufficientBalance == insufficientBalance) &&
            (identical(other.invalidToken, invalidToken) ||
                other.invalidToken == invalidToken) &&
            (identical(other.other, other) || other.other == other) &&
            (identical(other.unauthorized, unauthorized) ||
                other.unauthorized == unauthorized));
  }

  @override
  int get hashCode => Object.hashAll(
      [runtimeType, insufficientBalance, invalidToken, other, unauthorized]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [BalanceResponse] defined in Candid
/// ```Candid
///   variant { err: CommonError; ok: Balance }
/// ```
@immutable
class BalanceResponse {
  const BalanceResponse({
    /// [err] defined in Candid: `err: CommonError`
    this.err,

    /// [ok] defined in Candid: `ok: Balance`
    this.ok,
  });

  factory BalanceResponse.fromJson(Map json) {
    return BalanceResponse(
      err: json['err'] == null ? null : CommonError.fromJson(json['err']),
      ok: json['ok'] is BigInt ? json['ok'] : BigInt.from(json['ok']),
    );
  }

  /// [err] defined in Candid: `err: CommonError`
  final CommonError? err;

  /// [ok] defined in Candid: `ok: Balance`
  final Balance? ok;

  Map<String, dynamic> toJson() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  BalanceResponse copyWith({
    /// [err] defined in Candid: `err: CommonError`
    CommonError? err,

    /// [ok] defined in Candid: `ok: Balance`
    Balance? ok,
  }) {
    return BalanceResponse(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BalanceResponse &&
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

/// [BalanceRequest] defined in Candid
/// ```Candid
///   record { token: TokenIdentifier; user: User }
/// ```
@immutable
class BalanceRequest {
  const BalanceRequest({
    /// [token] defined in Candid: `token: TokenIdentifier`
    required this.token,

    /// [user] defined in Candid: `user: User`
    required this.user,
  });

  factory BalanceRequest.fromJson(Map json) {
    return BalanceRequest(
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }

  /// [token] defined in Candid: `token: TokenIdentifier`
  final TokenIdentifier token;

  /// [user] defined in Candid: `user: User`
  final User user;

  Map<String, dynamic> toJson() {
    final token = this.token;
    final user = this.user;
    return {
      'token': token,
      'user': user,
    };
  }

  BalanceRequest copyWith({
    /// [token] defined in Candid: `token: TokenIdentifier`
    TokenIdentifier? token,

    /// [user] defined in Candid: `user: User`
    User? user,
  }) {
    return BalanceRequest(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BalanceRequest &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, token, user]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [FeeResult] defined in Candid
/// ```Candid
///   variant { err: CommonError; ok: nat }
/// ```
@immutable
class FeeResult {
  const FeeResult({
    /// [err] defined in Candid: `err: CommonError`
    this.err,

    /// [ok] defined in Candid: `ok: nat`
    this.ok,
  });

  factory FeeResult.fromJson(Map json) {
    return FeeResult(
      err: json['err'] == null ? null : CommonError.fromJson(json['err']),
      ok: json['ok'] == null
          ? null
          : json['ok'] is BigInt
              ? json['ok']
              : BigInt.from(json['ok']),
    );
  }

  /// [err] defined in Candid: `err: CommonError`
  final CommonError? err;

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

  FeeResult copyWith({
    /// [err] defined in Candid: `err: CommonError`
    CommonError? err,

    /// [ok] defined in Candid: `ok: nat`
    BigInt? ok,
  }) {
    return FeeResult(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeeResult &&
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

/// [TokenIdentifier] defined in Candid
/// ```Candid
///   type TokenIdentifier = text;
/// ```
typedef TokenIdentifier = String;

/// [Balance] defined in Candid
/// ```Candid
///   type Balance = nat;
/// ```
typedef Balance = BigInt;

/// [Memo] defined in Candid
/// ```Candid
///   type Memo = blob;
/// ```
typedef Memo = Uint8List;

/// [AccountIdentifier] defined in Candid
/// ```Candid
///   type AccountIdentifier = text;
/// ```
typedef AccountIdentifier = String;
