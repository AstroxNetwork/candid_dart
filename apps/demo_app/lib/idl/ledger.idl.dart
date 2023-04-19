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

class LedgerIDLActor {
  const LedgerIDLActor._();

  /// ```Candid
  ///   transfer: (TransferArgs) -> (TransferResult)
  /// ```
  static Future<TransferResult> transfer(
    CanisterActor actor,
    TransferArgs arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('transfer')!(dat);
    return TransferResult.fromJson(ret);
  }

  /// ```Candid
  ///   account_balance: (AccountBalanceArgs) -> (Tokens) query
  /// ```
  static Future<Tokens> accountBalance(
    CanisterActor actor,
    AccountBalanceArgs arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('account_balance')!(dat);
    return Tokens.fromJson(ret);
  }

  /// ```Candid
  ///   transfer_fee: (TransferFeeArg) -> (TransferFee) query
  /// ```
  static Future<TransferFee> transferFee(
    CanisterActor actor,
    TransferFeeArg arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('transfer_fee')!(dat);
    return TransferFee.fromJson(ret);
  }

  /// ```Candid
  ///   symbol: () -> (record { symbol: text }) query
  /// ```
  static Future<SymbolRet0> symbol(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('symbol')!(dat);
    return SymbolRet0.fromJson(
      ret,
    );
  }

  /// ```Candid
  ///   name: () -> (record { name: text }) query
  /// ```
  static Future<NameRet0> name(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('name')!(dat);
    return NameRet0.fromJson(
      ret,
    );
  }

  /// ```Candid
  ///   decimals: () -> (record { decimals: nat32 }) query
  /// ```
  static Future<DecimalsRet0> decimals(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('decimals')!(dat);
    return DecimalsRet0.fromJson(
      ret,
    );
  }

  /// ```Candid
  ///   archives: () -> (Archives) query
  /// ```
  static Future<Archives> archives(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('archives')!(dat);
    return Archives.fromJson(ret);
  }
}

class LedgerIDLService {
  LedgerIDLService({
    required this.canisterId,
    required this.uri,
    this.identity,
    this.createActorMethod,
    this.debug = true,
  }) : idl = LedgerIDL.idl;

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

  Future<TransferResult> transfer(
    TransferArgs arg,
  ) async {
    final actor = await getActor();
    return LedgerIDLActor.transfer(
      actor,
      arg,
    );
  }

  Future<Tokens> accountBalance(
    AccountBalanceArgs arg,
  ) async {
    final actor = await getActor();
    return LedgerIDLActor.accountBalance(
      actor,
      arg,
    );
  }

  Future<TransferFee> transferFee(
    TransferFeeArg arg,
  ) async {
    final actor = await getActor();
    return LedgerIDLActor.transferFee(
      actor,
      arg,
    );
  }

  Future<SymbolRet0> symbol() async {
    final actor = await getActor();
    return LedgerIDLActor.symbol(
      actor,
    );
  }

  Future<NameRet0> name() async {
    final actor = await getActor();
    return LedgerIDLActor.name(
      actor,
    );
  }

  Future<DecimalsRet0> decimals() async {
    final actor = await getActor();
    return LedgerIDLActor.decimals(
      actor,
    );
  }

  Future<Archives> archives() async {
    final actor = await getActor();
    return LedgerIDLActor.archives(
      actor,
    );
  }
}

class LedgerIDL {
  const LedgerIDL._();

  /// [_Tokens] defined in Candid
  /// ```Candid
  ///   type Tokens = record { e8s: nat64 };
  /// ```
  static final RecordClass _Tokens = IDL.Record({
    'e8s': IDL.Nat64,
  });

  /// [_TimeStamp] defined in Candid
  /// ```Candid
  ///   type TimeStamp = record { timestamp_nanos: nat64 };
  /// ```
  static final RecordClass _TimeStamp = IDL.Record({
    'timestamp_nanos': IDL.Nat64,
  });

  /// [_AccountIdentifier] defined in Candid
  /// ```Candid
  ///   type AccountIdentifier = blob;
  /// ```
  static final _AccountIdentifier = IDL.Vec(IDL.Nat8);

  /// [_SubAccount] defined in Candid
  /// ```Candid
  ///   type SubAccount = blob;
  /// ```
  static final _SubAccount = IDL.Vec(IDL.Nat8);

  /// [_BlockIndex] defined in Candid
  /// ```Candid
  ///   type BlockIndex = nat64;
  /// ```
  static final _BlockIndex = IDL.Nat64;

  /// [_Memo] defined in Candid
  /// ```Candid
  ///   type Memo = nat64;
  /// ```
  static final _Memo = IDL.Nat64;

  /// [_TransferArgs] defined in Candid
  /// ```Candid
  ///   type TransferArgs = record { memo: Memo; amount: Tokens; fee: Tokens; from_subaccount: opt SubAccount; to: AccountIdentifier; created_at_time: opt TimeStamp };
  /// ```
  static final RecordClass _TransferArgs = IDL.Record({
    'memo': _Memo,
    'amount': _Tokens,
    'fee': _Tokens,
    'from_subaccount': IDL.Opt(
      _SubAccount,
    ),
    'to': _AccountIdentifier,
    'created_at_time': IDL.Opt(
      _TimeStamp,
    ),
  });

  /// [_TransferError] defined in Candid
  /// ```Candid
  ///   type TransferError = variant { BadFee: record { expected_fee: Tokens }; InsufficientFunds: record { balance: Tokens }; TxTooOld: record { allowed_window_nanos: nat64 }; TxCreatedInFuture: null; TxDuplicate: record { duplicate_of: BlockIndex } };
  /// ```
  static final VariantClass _TransferError = IDL.Variant({
    'BadFee': IDL.Record({
      'expected_fee': _Tokens,
    }),
    'InsufficientFunds': IDL.Record({
      'balance': _Tokens,
    }),
    'TxTooOld': IDL.Record({
      'allowed_window_nanos': IDL.Nat64,
    }),
    'TxCreatedInFuture': IDL.Null,
    'TxDuplicate': IDL.Record({
      'duplicate_of': _BlockIndex,
    }),
  });

  /// [_TransferResult] defined in Candid
  /// ```Candid
  ///   type TransferResult = variant { Ok: BlockIndex; Err: TransferError };
  /// ```
  static final VariantClass _TransferResult = IDL.Variant({
    'Ok': _BlockIndex,
    'Err': _TransferError,
  });

  /// [_AccountBalanceArgs] defined in Candid
  /// ```Candid
  ///   type AccountBalanceArgs = record { account: AccountIdentifier };
  /// ```
  static final RecordClass _AccountBalanceArgs = IDL.Record({
    'account': _AccountIdentifier,
  });

  /// [_TransferFeeArg] defined in Candid
  /// ```Candid
  ///   type TransferFeeArg = record {  };
  /// ```
  static final TupleClass _TransferFeeArg = IDL.Tuple([]);

  /// [_TransferFee] defined in Candid
  /// ```Candid
  ///   type TransferFee = record { transfer_fee: Tokens };
  /// ```
  static final RecordClass _TransferFee = IDL.Record({
    'transfer_fee': _Tokens,
  });

  /// [_Archive] defined in Candid
  /// ```Candid
  ///   type Archive = record { canister_id: principal };
  /// ```
  static final RecordClass _Archive = IDL.Record({
    'canister_id': IDL.Principal,
  });

  /// [_Archives] defined in Candid
  /// ```Candid
  ///   type Archives = record { archives: vec Archive };
  /// ```
  static final RecordClass _Archives = IDL.Record({
    'archives': IDL.Vec(
      _Archive,
    ),
  });

  static final ServiceClass idl = IDL.Service({
    'transfer': IDL.Func(
      [_TransferArgs],
      [_TransferResult],
      [],
    ),
    'account_balance': IDL.Func(
      [_AccountBalanceArgs],
      [_Tokens],
      ['query'],
    ),
    'transfer_fee': IDL.Func(
      [_TransferFeeArg],
      [_TransferFee],
      ['query'],
    ),
    'symbol': IDL.Func(
      [],
      [
        IDL.Record({
          'symbol': IDL.Text,
        })
      ],
      ['query'],
    ),
    'name': IDL.Func(
      [],
      [
        IDL.Record({
          'name': IDL.Text,
        })
      ],
      ['query'],
    ),
    'decimals': IDL.Func(
      [],
      [
        IDL.Record({
          'decimals': IDL.Nat32,
        })
      ],
      ['query'],
    ),
    'archives': IDL.Func(
      [],
      [_Archives],
      ['query'],
    ),
  });
}

/// [SymbolRet0] defined in Candid
/// ```Candid
///   record { symbol: text }
/// ```
@immutable
class SymbolRet0 {
  const SymbolRet0(
      {
      /// [symbol] defined in Candid: `symbol: text`
      required this.symbol});

  factory SymbolRet0.fromJson(Map json) {
    return SymbolRet0(
      symbol: json['symbol'],
    );
  }

  /// [symbol] defined in Candid: `symbol: text`
  final String symbol;

  Map<String, dynamic> toJson() {
    final symbol = this.symbol;
    return {
      'symbol': symbol,
    };
  }

  SymbolRet0 copyWith(
      {
      /// [symbol] defined in Candid: `symbol: text`
      String? symbol}) {
    return SymbolRet0(
      symbol: symbol ?? this.symbol,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SymbolRet0 &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, symbol]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [NameRet0] defined in Candid
/// ```Candid
///   record { name: text }
/// ```
@immutable
class NameRet0 {
  const NameRet0(
      {
      /// [name] defined in Candid: `name: text`
      required this.name});

  factory NameRet0.fromJson(Map json) {
    return NameRet0(
      name: json['name'],
    );
  }

  /// [name] defined in Candid: `name: text`
  final String name;

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }

  NameRet0 copyWith(
      {
      /// [name] defined in Candid: `name: text`
      String? name}) {
    return NameRet0(
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NameRet0 &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, name]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [DecimalsRet0] defined in Candid
/// ```Candid
///   record { decimals: nat32 }
/// ```
@immutable
class DecimalsRet0 {
  const DecimalsRet0(
      {
      /// [decimals] defined in Candid: `decimals: nat32`
      required this.decimals});

  factory DecimalsRet0.fromJson(Map json) {
    return DecimalsRet0(
      decimals: json['decimals'],
    );
  }

  /// [decimals] defined in Candid: `decimals: nat32`
  final int decimals;

  Map<String, dynamic> toJson() {
    final decimals = this.decimals;
    return {
      'decimals': decimals,
    };
  }

  DecimalsRet0 copyWith(
      {
      /// [decimals] defined in Candid: `decimals: nat32`
      int? decimals}) {
    return DecimalsRet0(
      decimals: decimals ?? this.decimals,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DecimalsRet0 &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, decimals]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Tokens] defined in Candid
/// ```Candid
///   record { e8s: nat64 }
/// ```
@immutable
class Tokens {
  const Tokens(
      {
      /// [e8s] defined in Candid: `e8s: nat64`
      required this.e8s});

  factory Tokens.fromJson(Map json) {
    return Tokens(
      e8s: json['e8s'] is BigInt ? json['e8s'] : BigInt.from(json['e8s']),
    );
  }

  /// [e8s] defined in Candid: `e8s: nat64`
  final BigInt e8s;

  Map<String, dynamic> toJson() {
    final e8s = this.e8s;
    return {
      'e8s': e8s,
    };
  }

  Tokens copyWith(
      {
      /// [e8s] defined in Candid: `e8s: nat64`
      BigInt? e8s}) {
    return Tokens(
      e8s: e8s ?? this.e8s,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Tokens &&
            (identical(other.e8s, e8s) || other.e8s == e8s));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, e8s]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TimeStamp] defined in Candid
/// ```Candid
///   record { timestamp_nanos: nat64 }
/// ```
@immutable
class TimeStamp {
  const TimeStamp(
      {
      /// [timestampNanos] defined in Candid: `timestamp_nanos: nat64`
      required this.timestampNanos});

  factory TimeStamp.fromJson(Map json) {
    return TimeStamp(
      timestampNanos: json['timestamp_nanos'] is BigInt
          ? json['timestamp_nanos']
          : BigInt.from(json['timestamp_nanos']),
    );
  }

  /// [timestampNanos] defined in Candid: `timestamp_nanos: nat64`
  final BigInt timestampNanos;

  Map<String, dynamic> toJson() {
    final timestampNanos = this.timestampNanos;
    return {
      'timestamp_nanos': timestampNanos,
    };
  }

  TimeStamp copyWith(
      {
      /// [timestampNanos] defined in Candid: `timestamp_nanos: nat64`
      BigInt? timestampNanos}) {
    return TimeStamp(
      timestampNanos: timestampNanos ?? this.timestampNanos,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimeStamp &&
            (identical(other.timestampNanos, timestampNanos) ||
                other.timestampNanos == timestampNanos));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, timestampNanos]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransferArgs] defined in Candid
/// ```Candid
///   record { memo: Memo; amount: Tokens; fee: Tokens; from_subaccount: opt SubAccount; to: AccountIdentifier; created_at_time: opt TimeStamp }
/// ```
@immutable
class TransferArgs {
  const TransferArgs({
    /// [memo] defined in Candid: `memo: Memo`
    required this.memo,

    /// [amount] defined in Candid: `amount: Tokens`
    required this.amount,

    /// [fee] defined in Candid: `fee: Tokens`
    required this.fee,

    /// [fromSubaccount] defined in Candid: `from_subaccount: opt SubAccount`
    this.fromSubaccount,

    /// [to] defined in Candid: `to: AccountIdentifier`
    required this.to,

    /// [createdAtTime] defined in Candid: `created_at_time: opt TimeStamp`
    this.createdAtTime,
  });

  factory TransferArgs.fromJson(Map json) {
    return TransferArgs(
      memo: json['memo'] is BigInt ? json['memo'] : BigInt.from(json['memo']),
      amount: Tokens.fromJson(json['amount']),
      fee: Tokens.fromJson(json['fee']),
      fromSubaccount: (json['from_subaccount'] as List).map((e) {
        return e is Uint8List ? e : Uint8List.fromList(e);
      }).firstOrNull,
      to: json['to'] is Uint8List ? json['to'] : Uint8List.fromList(json['to']),
      createdAtTime: (json['created_at_time'] as List).map((e) {
        return e == null ? null : TimeStamp.fromJson(e);
      }).firstOrNull,
    );
  }

  /// [memo] defined in Candid: `memo: Memo`
  final Memo memo;

  /// [amount] defined in Candid: `amount: Tokens`
  final Tokens amount;

  /// [fee] defined in Candid: `fee: Tokens`
  final Tokens fee;

  /// [fromSubaccount] defined in Candid: `from_subaccount: opt SubAccount`
  final SubAccount? fromSubaccount;

  /// [to] defined in Candid: `to: AccountIdentifier`
  final AccountIdentifier to;

  /// [createdAtTime] defined in Candid: `created_at_time: opt TimeStamp`
  final TimeStamp? createdAtTime;

  Map<String, dynamic> toJson() {
    final memo = this.memo;
    final amount = this.amount;
    final fee = this.fee;
    final fromSubaccount = this.fromSubaccount;
    final to = this.to;
    final createdAtTime = this.createdAtTime;
    return {
      'memo': memo,
      'amount': amount,
      'fee': fee,
      'from_subaccount': [if (fromSubaccount != null) fromSubaccount],
      'to': to,
      'created_at_time': [if (createdAtTime != null) createdAtTime],
    };
  }

  TransferArgs copyWith({
    /// [memo] defined in Candid: `memo: Memo`
    Memo? memo,

    /// [amount] defined in Candid: `amount: Tokens`
    Tokens? amount,

    /// [fee] defined in Candid: `fee: Tokens`
    Tokens? fee,

    /// [fromSubaccount] defined in Candid: `from_subaccount: opt SubAccount`
    SubAccount? fromSubaccount,

    /// [to] defined in Candid: `to: AccountIdentifier`
    AccountIdentifier? to,

    /// [createdAtTime] defined in Candid: `created_at_time: opt TimeStamp`
    TimeStamp? createdAtTime,
  }) {
    return TransferArgs(
      memo: memo ?? this.memo,
      amount: amount ?? this.amount,
      fee: fee ?? this.fee,
      fromSubaccount: fromSubaccount ?? this.fromSubaccount,
      to: to ?? this.to,
      createdAtTime: createdAtTime ?? this.createdAtTime,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferArgs &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.fromSubaccount, fromSubaccount) ||
                other.fromSubaccount == fromSubaccount) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.createdAtTime, createdAtTime) ||
                other.createdAtTime == createdAtTime));
  }

  @override
  int get hashCode => Object.hashAll(
      [runtimeType, memo, amount, fee, fromSubaccount, to, createdAtTime]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransferErrorBadFee] defined in Candid
/// ```Candid
///   record { expected_fee: Tokens }
/// ```
@immutable
class TransferErrorBadFee {
  const TransferErrorBadFee(
      {
      /// [expectedFee] defined in Candid: `expected_fee: Tokens`
      required this.expectedFee});

  factory TransferErrorBadFee.fromJson(Map json) {
    return TransferErrorBadFee(
      expectedFee: Tokens.fromJson(json['expected_fee']),
    );
  }

  /// [expectedFee] defined in Candid: `expected_fee: Tokens`
  final Tokens expectedFee;

  Map<String, dynamic> toJson() {
    final expectedFee = this.expectedFee;
    return {
      'expected_fee': expectedFee,
    };
  }

  TransferErrorBadFee copyWith(
      {
      /// [expectedFee] defined in Candid: `expected_fee: Tokens`
      Tokens? expectedFee}) {
    return TransferErrorBadFee(
      expectedFee: expectedFee ?? this.expectedFee,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferErrorBadFee &&
            (identical(other.expectedFee, expectedFee) ||
                other.expectedFee == expectedFee));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, expectedFee]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransferErrorInsufficientFunds] defined in Candid
/// ```Candid
///   record { balance: Tokens }
/// ```
@immutable
class TransferErrorInsufficientFunds {
  const TransferErrorInsufficientFunds(
      {
      /// [balance] defined in Candid: `balance: Tokens`
      required this.balance});

  factory TransferErrorInsufficientFunds.fromJson(Map json) {
    return TransferErrorInsufficientFunds(
      balance: Tokens.fromJson(json['balance']),
    );
  }

  /// [balance] defined in Candid: `balance: Tokens`
  final Tokens balance;

  Map<String, dynamic> toJson() {
    final balance = this.balance;
    return {
      'balance': balance,
    };
  }

  TransferErrorInsufficientFunds copyWith(
      {
      /// [balance] defined in Candid: `balance: Tokens`
      Tokens? balance}) {
    return TransferErrorInsufficientFunds(
      balance: balance ?? this.balance,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferErrorInsufficientFunds &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, balance]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransferErrorTxTooOld] defined in Candid
/// ```Candid
///   record { allowed_window_nanos: nat64 }
/// ```
@immutable
class TransferErrorTxTooOld {
  const TransferErrorTxTooOld(
      {
      /// [allowedWindowNanos] defined in Candid: `allowed_window_nanos: nat64`
      required this.allowedWindowNanos});

  factory TransferErrorTxTooOld.fromJson(Map json) {
    return TransferErrorTxTooOld(
      allowedWindowNanos: json['allowed_window_nanos'] is BigInt
          ? json['allowed_window_nanos']
          : BigInt.from(json['allowed_window_nanos']),
    );
  }

  /// [allowedWindowNanos] defined in Candid: `allowed_window_nanos: nat64`
  final BigInt allowedWindowNanos;

  Map<String, dynamic> toJson() {
    final allowedWindowNanos = this.allowedWindowNanos;
    return {
      'allowed_window_nanos': allowedWindowNanos,
    };
  }

  TransferErrorTxTooOld copyWith(
      {
      /// [allowedWindowNanos] defined in Candid: `allowed_window_nanos: nat64`
      BigInt? allowedWindowNanos}) {
    return TransferErrorTxTooOld(
      allowedWindowNanos: allowedWindowNanos ?? this.allowedWindowNanos,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferErrorTxTooOld &&
            (identical(other.allowedWindowNanos, allowedWindowNanos) ||
                other.allowedWindowNanos == allowedWindowNanos));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, allowedWindowNanos]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransferErrorTxDuplicate] defined in Candid
/// ```Candid
///   record { duplicate_of: BlockIndex }
/// ```
@immutable
class TransferErrorTxDuplicate {
  const TransferErrorTxDuplicate(
      {
      /// [duplicateOf] defined in Candid: `duplicate_of: BlockIndex`
      required this.duplicateOf});

  factory TransferErrorTxDuplicate.fromJson(Map json) {
    return TransferErrorTxDuplicate(
      duplicateOf: json['duplicate_of'] is BigInt
          ? json['duplicate_of']
          : BigInt.from(json['duplicate_of']),
    );
  }

  /// [duplicateOf] defined in Candid: `duplicate_of: BlockIndex`
  final BlockIndex duplicateOf;

  Map<String, dynamic> toJson() {
    final duplicateOf = this.duplicateOf;
    return {
      'duplicate_of': duplicateOf,
    };
  }

  TransferErrorTxDuplicate copyWith(
      {
      /// [duplicateOf] defined in Candid: `duplicate_of: BlockIndex`
      BlockIndex? duplicateOf}) {
    return TransferErrorTxDuplicate(
      duplicateOf: duplicateOf ?? this.duplicateOf,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferErrorTxDuplicate &&
            (identical(other.duplicateOf, duplicateOf) ||
                other.duplicateOf == duplicateOf));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, duplicateOf]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransferError] defined in Candid
/// ```Candid
///   variant { BadFee: record { expected_fee: Tokens }; InsufficientFunds: record { balance: Tokens }; TxTooOld: record { allowed_window_nanos: nat64 }; TxCreatedInFuture: null; TxDuplicate: record { duplicate_of: BlockIndex } }
/// ```
@immutable
class TransferError {
  const TransferError({
    /// [badFee] defined in Candid: `BadFee: record { expected_fee: Tokens }`
    this.badFee,

    /// [insufficientFunds] defined in Candid: `InsufficientFunds: record { balance: Tokens }`
    this.insufficientFunds,

    /// [txTooOld] defined in Candid: `TxTooOld: record { allowed_window_nanos: nat64 }`
    this.txTooOld,

    /// [txCreatedInFuture] defined in Candid: `TxCreatedInFuture: null`
    this.txCreatedInFuture = false,

    /// [txDuplicate] defined in Candid: `TxDuplicate: record { duplicate_of: BlockIndex }`
    this.txDuplicate,
  });

  factory TransferError.fromJson(Map json) {
    return TransferError(
      badFee: json['BadFee'] == null
          ? null
          : TransferErrorBadFee.fromJson(
              json['BadFee'],
            ),
      insufficientFunds: json['InsufficientFunds'] == null
          ? null
          : TransferErrorInsufficientFunds.fromJson(
              json['InsufficientFunds'],
            ),
      txTooOld: json['TxTooOld'] == null
          ? null
          : TransferErrorTxTooOld.fromJson(
              json['TxTooOld'],
            ),
      txCreatedInFuture: json.containsKey('TxCreatedInFuture'),
      txDuplicate: json['TxDuplicate'] == null
          ? null
          : TransferErrorTxDuplicate.fromJson(
              json['TxDuplicate'],
            ),
    );
  }

  /// [badFee] defined in Candid: `BadFee: record { expected_fee: Tokens }`
  final TransferErrorBadFee? badFee;

  /// [insufficientFunds] defined in Candid: `InsufficientFunds: record { balance: Tokens }`
  final TransferErrorInsufficientFunds? insufficientFunds;

  /// [txTooOld] defined in Candid: `TxTooOld: record { allowed_window_nanos: nat64 }`
  final TransferErrorTxTooOld? txTooOld;

  /// [txCreatedInFuture] defined in Candid: `TxCreatedInFuture: null`
  final bool txCreatedInFuture;

  /// [txDuplicate] defined in Candid: `TxDuplicate: record { duplicate_of: BlockIndex }`
  final TransferErrorTxDuplicate? txDuplicate;

  Map<String, dynamic> toJson() {
    final badFee = this.badFee;
    final insufficientFunds = this.insufficientFunds;
    final txTooOld = this.txTooOld;
    final txCreatedInFuture = this.txCreatedInFuture;
    final txDuplicate = this.txDuplicate;
    return {
      if (badFee != null) 'BadFee': badFee,
      if (insufficientFunds != null) 'InsufficientFunds': insufficientFunds,
      if (txTooOld != null) 'TxTooOld': txTooOld,
      if (txCreatedInFuture) 'TxCreatedInFuture': null,
      if (txDuplicate != null) 'TxDuplicate': txDuplicate,
    };
  }

  TransferError copyWith({
    /// [badFee] defined in Candid: `BadFee: record { expected_fee: Tokens }`
    TransferErrorBadFee? badFee,

    /// [insufficientFunds] defined in Candid: `InsufficientFunds: record { balance: Tokens }`
    TransferErrorInsufficientFunds? insufficientFunds,

    /// [txTooOld] defined in Candid: `TxTooOld: record { allowed_window_nanos: nat64 }`
    TransferErrorTxTooOld? txTooOld,

    /// [txCreatedInFuture] defined in Candid: `TxCreatedInFuture: null`
    bool? txCreatedInFuture,

    /// [txDuplicate] defined in Candid: `TxDuplicate: record { duplicate_of: BlockIndex }`
    TransferErrorTxDuplicate? txDuplicate,
  }) {
    return TransferError(
      badFee: badFee ?? this.badFee,
      insufficientFunds: insufficientFunds ?? this.insufficientFunds,
      txTooOld: txTooOld ?? this.txTooOld,
      txCreatedInFuture: txCreatedInFuture ?? this.txCreatedInFuture,
      txDuplicate: txDuplicate ?? this.txDuplicate,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferError &&
            (identical(other.badFee, badFee) || other.badFee == badFee) &&
            (identical(other.insufficientFunds, insufficientFunds) ||
                other.insufficientFunds == insufficientFunds) &&
            (identical(other.txTooOld, txTooOld) ||
                other.txTooOld == txTooOld) &&
            (identical(other.txCreatedInFuture, txCreatedInFuture) ||
                other.txCreatedInFuture == txCreatedInFuture) &&
            (identical(other.txDuplicate, txDuplicate) ||
                other.txDuplicate == txDuplicate));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        badFee,
        insufficientFunds,
        txTooOld,
        txCreatedInFuture,
        txDuplicate
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransferResult] defined in Candid
/// ```Candid
///   variant { Ok: BlockIndex; Err: TransferError }
/// ```
@immutable
class TransferResult {
  const TransferResult({
    /// [ok] defined in Candid: `Ok: BlockIndex`
    this.ok,

    /// [err] defined in Candid: `Err: TransferError`
    this.err,
  });

  factory TransferResult.fromJson(Map json) {
    return TransferResult(
      ok: json['Ok'] is BigInt ? json['Ok'] : BigInt.from(json['Ok']),
      err: json['Err'] == null ? null : TransferError.fromJson(json['Err']),
    );
  }

  /// [ok] defined in Candid: `Ok: BlockIndex`
  final BlockIndex? ok;

  /// [err] defined in Candid: `Err: TransferError`
  final TransferError? err;

  Map<String, dynamic> toJson() {
    final ok = this.ok;
    final err = this.err;
    return {
      if (ok != null) 'Ok': ok,
      if (err != null) 'Err': err,
    };
  }

  TransferResult copyWith({
    /// [ok] defined in Candid: `Ok: BlockIndex`
    BlockIndex? ok,

    /// [err] defined in Candid: `Err: TransferError`
    TransferError? err,
  }) {
    return TransferResult(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferResult &&
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

/// [AccountBalanceArgs] defined in Candid
/// ```Candid
///   record { account: AccountIdentifier }
/// ```
@immutable
class AccountBalanceArgs {
  const AccountBalanceArgs(
      {
      /// [account] defined in Candid: `account: AccountIdentifier`
      required this.account});

  factory AccountBalanceArgs.fromJson(Map json) {
    return AccountBalanceArgs(
      account: json['account'] is Uint8List
          ? json['account']
          : Uint8List.fromList(json['account']),
    );
  }

  /// [account] defined in Candid: `account: AccountIdentifier`
  final AccountIdentifier account;

  Map<String, dynamic> toJson() {
    final account = this.account;
    return {
      'account': account,
    };
  }

  AccountBalanceArgs copyWith(
      {
      /// [account] defined in Candid: `account: AccountIdentifier`
      AccountIdentifier? account}) {
    return AccountBalanceArgs(
      account: account ?? this.account,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountBalanceArgs &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, account]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransferFeeArg] defined in Candid
/// ```Candid
///   record {  }
/// ```
@immutable
class TransferFeeArg {
  const TransferFeeArg();

  factory TransferFeeArg.fromJson(List<dynamic> tuple) {
    return TransferFeeArg();
  }

  List<dynamic> toJson() {
    return [];
  }

  TransferFeeArg copyWith() {
    return TransferFeeArg();
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TransferFeeArg);
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

/// [TransferFee] defined in Candid
/// ```Candid
///   record { transfer_fee: Tokens }
/// ```
@immutable
class TransferFee {
  const TransferFee(
      {
      /// [transferFee] defined in Candid: `transfer_fee: Tokens`
      required this.transferFee});

  factory TransferFee.fromJson(Map json) {
    return TransferFee(
      transferFee: Tokens.fromJson(json['transfer_fee']),
    );
  }

  /// [transferFee] defined in Candid: `transfer_fee: Tokens`
  final Tokens transferFee;

  Map<String, dynamic> toJson() {
    final transferFee = this.transferFee;
    return {
      'transfer_fee': transferFee,
    };
  }

  TransferFee copyWith(
      {
      /// [transferFee] defined in Candid: `transfer_fee: Tokens`
      Tokens? transferFee}) {
    return TransferFee(
      transferFee: transferFee ?? this.transferFee,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferFee &&
            (identical(other.transferFee, transferFee) ||
                other.transferFee == transferFee));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, transferFee]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Archive] defined in Candid
/// ```Candid
///   record { canister_id: principal }
/// ```
@immutable
class Archive {
  const Archive(
      {
      /// [canisterId] defined in Candid: `canister_id: principal`
      required this.canisterId});

  factory Archive.fromJson(Map json) {
    return Archive(
      canisterId: Principal.from(json['canister_id']),
    );
  }

  /// [canisterId] defined in Candid: `canister_id: principal`
  final Principal canisterId;

  Map<String, dynamic> toJson() {
    final canisterId = this.canisterId;
    return {
      'canister_id': canisterId,
    };
  }

  Archive copyWith(
      {
      /// [canisterId] defined in Candid: `canister_id: principal`
      Principal? canisterId}) {
    return Archive(
      canisterId: canisterId ?? this.canisterId,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Archive &&
            (identical(other.canisterId, canisterId) ||
                other.canisterId == canisterId));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, canisterId]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Archives] defined in Candid
/// ```Candid
///   record { archives: vec Archive }
/// ```
@immutable
class Archives {
  const Archives(
      {
      /// [archives] defined in Candid: `archives: vec Archive`
      required this.archives});

  factory Archives.fromJson(Map json) {
    return Archives(
      archives: (json['archives'] as List).map((e) {
        return Archive.fromJson(e);
      }).toList(),
    );
  }

  /// [archives] defined in Candid: `archives: vec Archive`
  final List<Archive> archives;

  Map<String, dynamic> toJson() {
    final archives = this.archives;
    return {
      'archives': archives,
    };
  }

  Archives copyWith(
      {
      /// [archives] defined in Candid: `archives: vec Archive`
      List<Archive>? archives}) {
    return Archives(
      archives: archives ?? this.archives,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Archives &&
            const DeepCollectionEquality().equals(other.archives, archives));
  }

  @override
  int get hashCode => Object.hashAll(
      [runtimeType, const DeepCollectionEquality().hash(archives)]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [AccountIdentifier] defined in Candid
/// ```Candid
///   type AccountIdentifier = blob;
/// ```
typedef AccountIdentifier = Uint8List;

/// [SubAccount] defined in Candid
/// ```Candid
///   type SubAccount = blob;
/// ```
typedef SubAccount = Uint8List;

/// [BlockIndex] defined in Candid
/// ```Candid
///   type BlockIndex = nat64;
/// ```
typedef BlockIndex = BigInt;

/// [Memo] defined in Candid
/// ```Candid
///   type Memo = nat64;
/// ```
typedef Memo = BigInt;
