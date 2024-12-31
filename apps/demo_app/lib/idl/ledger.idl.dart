// coverage:ignore-file
// ignore_for_file: type=lint, depend_on_referenced_packages, unnecessary_null_comparison, unnecessary_non_null_assertion, unused_field, unused_import
// ======================================
// GENERATED CODE - DO NOT MODIFY BY HAND
// ======================================

import 'dart:async';
import 'dart:typed_data';
import 'package:agent_dart_base/agent_dart_base.dart';
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
    final request = [arg];
    const method = 'transfer';
    final response = await actor.getFunc(method)!(request);
    return TransferResult.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   account_balance: (AccountBalanceArgs) -> (Tokens) query
  /// ```
  static Future<Tokens> accountBalance(
    CanisterActor actor,
    AccountBalanceArgs arg,
  ) async {
    final request = [arg];
    const method = 'account_balance';
    final response = await actor.getFunc(method)!(request);
    return Tokens.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   transfer_fee: (TransferFeeArg) -> (TransferFee) query
  /// ```
  static Future<TransferFee> transferFee(
    CanisterActor actor,
    TransferFeeArg arg,
  ) async {
    final request = [arg];
    const method = 'transfer_fee';
    final response = await actor.getFunc(method)!(request);
    return TransferFee.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   symbol: () -> (record { symbol: text }) query
  /// ```
  static Future<SymbolRet0> symbol(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'symbol';
    final response = await actor.getFunc(method)!(request);
    return SymbolRet0.fromIDLDeserializable(
      response,
    );
  }

  /// ```Candid
  ///   name: () -> (record { name: text }) query
  /// ```
  static Future<NameRet0> name(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'name';
    final response = await actor.getFunc(method)!(request);
    return NameRet0.fromIDLDeserializable(
      response,
    );
  }

  /// ```Candid
  ///   decimals: () -> (record { decimals: nat32 }) query
  /// ```
  static Future<DecimalsRet0> decimals(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'decimals';
    final response = await actor.getFunc(method)!(request);
    return DecimalsRet0.fromIDLDeserializable(
      response,
    );
  }

  /// ```Candid
  ///   archives: () -> (Archives) query
  /// ```
  static Future<Archives> archives(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'archives';
    final response = await actor.getFunc(method)!(request);
    return Archives.fromIDLDeserializable(response);
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

  /// ```Candid
  ///   transfer: (TransferArgs) -> (TransferResult)
  /// ```
  Future<TransferResult> transfer(
    TransferArgs arg,
  ) async {
    final actor = await getActor();
    return LedgerIDLActor.transfer(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   account_balance: (AccountBalanceArgs) -> (Tokens) query
  /// ```
  Future<Tokens> accountBalance(
    AccountBalanceArgs arg,
  ) async {
    final actor = await getActor();
    return LedgerIDLActor.accountBalance(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   transfer_fee: (TransferFeeArg) -> (TransferFee) query
  /// ```
  Future<TransferFee> transferFee(
    TransferFeeArg arg,
  ) async {
    final actor = await getActor();
    return LedgerIDLActor.transferFee(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   symbol: () -> (record { symbol: text }) query
  /// ```
  Future<SymbolRet0> symbol() async {
    final actor = await getActor();
    return LedgerIDLActor.symbol(
      actor,
    );
  }

  /// ```Candid
  ///   name: () -> (record { name: text }) query
  /// ```
  Future<NameRet0> name() async {
    final actor = await getActor();
    return LedgerIDLActor.name(
      actor,
    );
  }

  /// ```Candid
  ///   decimals: () -> (record { decimals: nat32 }) query
  /// ```
  Future<DecimalsRet0> decimals() async {
    final actor = await getActor();
    return LedgerIDLActor.decimals(
      actor,
    );
  }

  /// ```Candid
  ///   archives: () -> (Archives) query
  /// ```
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
  const SymbolRet0({required this.symbol});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory SymbolRet0.fromIDLDeserializable(Map obj) {
    return SymbolRet0(
      symbol: obj['symbol'],
    );
  }

  factory SymbolRet0.fromJson(Map json) {
    return SymbolRet0(
      symbol: json['symbol'],
    );
  }

  /// [symbol] defined in Candid: `symbol: text`
  final String symbol;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final symbol = this.symbol;
    return {
      'symbol': symbol,
    };
  }

  Map<String, dynamic> toJson() {
    final symbol = this.symbol;
    return {
      'symbol': symbol,
    };
  }

  SymbolRet0 copyWith({String? symbol}) {
    return SymbolRet0(
      symbol: symbol ?? this.symbol,
    );
  }

  @override
  bool operator ==(Object other) {
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
  const NameRet0({required this.name});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory NameRet0.fromIDLDeserializable(Map obj) {
    return NameRet0(
      name: obj['name'],
    );
  }

  factory NameRet0.fromJson(Map json) {
    return NameRet0(
      name: json['name'],
    );
  }

  /// [name] defined in Candid: `name: text`
  final String name;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final name = this.name;
    return {
      'name': name,
    };
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }

  NameRet0 copyWith({String? name}) {
    return NameRet0(
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
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
  const DecimalsRet0({required this.decimals});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory DecimalsRet0.fromIDLDeserializable(Map obj) {
    return DecimalsRet0(
      decimals: obj['decimals'],
    );
  }

  factory DecimalsRet0.fromJson(Map json) {
    return DecimalsRet0(
      decimals: json['decimals'],
    );
  }

  /// [decimals] defined in Candid: `decimals: nat32`
  final int decimals;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final decimals = this.decimals;
    return {
      'decimals': decimals,
    };
  }

  Map<String, dynamic> toJson() {
    final decimals = this.decimals;
    return {
      'decimals': decimals,
    };
  }

  DecimalsRet0 copyWith({int? decimals}) {
    return DecimalsRet0(
      decimals: decimals ?? this.decimals,
    );
  }

  @override
  bool operator ==(Object other) {
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
  const Tokens({required this.e8s});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Tokens.fromIDLDeserializable(Map obj) {
    return Tokens(
      e8s: obj['e8s'] is BigInt ? obj['e8s'] : BigInt.from(obj['e8s']),
    );
  }

  factory Tokens.fromJson(Map json) {
    return Tokens(
      e8s: json['e8s'] is BigInt
          ? json['e8s']
          : json['e8s'] is num
              ? BigInt.from(json['e8s'])
              : BigInt.parse('${json['e8s']}'),
    );
  }

  /// [e8s] defined in Candid: `e8s: nat64`
  final BigInt e8s;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final e8s = this.e8s;
    return {
      'e8s': e8s,
    };
  }

  Map<String, dynamic> toJson() {
    final e8s = this.e8s.toString();
    return {
      'e8s': e8s,
    };
  }

  Tokens copyWith({BigInt? e8s}) {
    return Tokens(
      e8s: e8s ?? this.e8s,
    );
  }

  @override
  bool operator ==(Object other) {
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
  const TimeStamp({required this.timestampNanos});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TimeStamp.fromIDLDeserializable(Map obj) {
    return TimeStamp(
      timestampNanos: obj['timestamp_nanos'] is BigInt
          ? obj['timestamp_nanos']
          : BigInt.from(obj['timestamp_nanos']),
    );
  }

  factory TimeStamp.fromJson(Map json) {
    return TimeStamp(
      timestampNanos: json['timestamp_nanos'] is BigInt
          ? json['timestamp_nanos']
          : json['timestamp_nanos'] is num
              ? BigInt.from(json['timestamp_nanos'])
              : BigInt.parse('${json['timestamp_nanos']}'),
    );
  }

  /// [timestampNanos] defined in Candid: `timestamp_nanos: nat64`
  final BigInt timestampNanos;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final timestampNanos = this.timestampNanos;
    return {
      'timestamp_nanos': timestampNanos,
    };
  }

  Map<String, dynamic> toJson() {
    final timestampNanos = this.timestampNanos.toString();
    return {
      'timestamp_nanos': timestampNanos,
    };
  }

  TimeStamp copyWith({BigInt? timestampNanos}) {
    return TimeStamp(
      timestampNanos: timestampNanos ?? this.timestampNanos,
    );
  }

  @override
  bool operator ==(Object other) {
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
    required this.memo,
    required this.amount,
    required this.fee,
    this.fromSubaccount,
    required this.to,
    this.createdAtTime,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferArgs.fromIDLDeserializable(Map obj) {
    return TransferArgs(
      memo: obj['memo'] is BigInt ? obj['memo'] : BigInt.from(obj['memo']),
      amount: Tokens.fromIDLDeserializable(obj['amount']),
      fee: Tokens.fromIDLDeserializable(obj['fee']),
      fromSubaccount: (obj['from_subaccount'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      to: obj['to'] is Uint8List
          ? obj['to']
          : Uint8List.fromList((obj['to'] as List).cast()),
      createdAtTime: (obj['created_at_time'] as List).map((e) {
        return e == null ? null : TimeStamp.fromIDLDeserializable(e);
      }).firstOrNull,
    );
  }

  factory TransferArgs.fromJson(Map json) {
    return TransferArgs(
      memo: json['memo'] is BigInt
          ? json['memo']
          : json['memo'] is num
              ? BigInt.from(json['memo'])
              : BigInt.parse('${json['memo']}'),
      amount: Tokens.fromJson(json['amount']),
      fee: Tokens.fromJson(json['fee']),
      fromSubaccount: (json['from_subaccount'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      to: json['to'] is Uint8List
          ? json['to']
          : Uint8List.fromList((json['to'] as List).cast()),
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

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
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

  Map<String, dynamic> toJson() {
    final memo = this.memo.toString();
    final amount = this.amount.toJson();
    final fee = this.fee.toJson();
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
    Memo? memo,
    Tokens? amount,
    Tokens? fee,
    SubAccount? fromSubaccount,
    AccountIdentifier? to,
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
  bool operator ==(Object other) {
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
  const TransferErrorBadFee({required this.expectedFee});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferErrorBadFee.fromIDLDeserializable(Map obj) {
    return TransferErrorBadFee(
      expectedFee: Tokens.fromIDLDeserializable(obj['expected_fee']),
    );
  }

  factory TransferErrorBadFee.fromJson(Map json) {
    return TransferErrorBadFee(
      expectedFee: Tokens.fromJson(json['expected_fee']),
    );
  }

  /// [expectedFee] defined in Candid: `expected_fee: Tokens`
  final Tokens expectedFee;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final expectedFee = this.expectedFee;
    return {
      'expected_fee': expectedFee,
    };
  }

  Map<String, dynamic> toJson() {
    final expectedFee = this.expectedFee.toJson();
    return {
      'expected_fee': expectedFee,
    };
  }

  TransferErrorBadFee copyWith({Tokens? expectedFee}) {
    return TransferErrorBadFee(
      expectedFee: expectedFee ?? this.expectedFee,
    );
  }

  @override
  bool operator ==(Object other) {
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
  const TransferErrorInsufficientFunds({required this.balance});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferErrorInsufficientFunds.fromIDLDeserializable(Map obj) {
    return TransferErrorInsufficientFunds(
      balance: Tokens.fromIDLDeserializable(obj['balance']),
    );
  }

  factory TransferErrorInsufficientFunds.fromJson(Map json) {
    return TransferErrorInsufficientFunds(
      balance: Tokens.fromJson(json['balance']),
    );
  }

  /// [balance] defined in Candid: `balance: Tokens`
  final Tokens balance;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final balance = this.balance;
    return {
      'balance': balance,
    };
  }

  Map<String, dynamic> toJson() {
    final balance = this.balance.toJson();
    return {
      'balance': balance,
    };
  }

  TransferErrorInsufficientFunds copyWith({Tokens? balance}) {
    return TransferErrorInsufficientFunds(
      balance: balance ?? this.balance,
    );
  }

  @override
  bool operator ==(Object other) {
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
  const TransferErrorTxTooOld({required this.allowedWindowNanos});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferErrorTxTooOld.fromIDLDeserializable(Map obj) {
    return TransferErrorTxTooOld(
      allowedWindowNanos: obj['allowed_window_nanos'] is BigInt
          ? obj['allowed_window_nanos']
          : BigInt.from(obj['allowed_window_nanos']),
    );
  }

  factory TransferErrorTxTooOld.fromJson(Map json) {
    return TransferErrorTxTooOld(
      allowedWindowNanos: json['allowed_window_nanos'] is BigInt
          ? json['allowed_window_nanos']
          : json['allowed_window_nanos'] is num
              ? BigInt.from(json['allowed_window_nanos'])
              : BigInt.parse('${json['allowed_window_nanos']}'),
    );
  }

  /// [allowedWindowNanos] defined in Candid: `allowed_window_nanos: nat64`
  final BigInt allowedWindowNanos;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final allowedWindowNanos = this.allowedWindowNanos;
    return {
      'allowed_window_nanos': allowedWindowNanos,
    };
  }

  Map<String, dynamic> toJson() {
    final allowedWindowNanos = this.allowedWindowNanos.toString();
    return {
      'allowed_window_nanos': allowedWindowNanos,
    };
  }

  TransferErrorTxTooOld copyWith({BigInt? allowedWindowNanos}) {
    return TransferErrorTxTooOld(
      allowedWindowNanos: allowedWindowNanos ?? this.allowedWindowNanos,
    );
  }

  @override
  bool operator ==(Object other) {
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
  const TransferErrorTxDuplicate({required this.duplicateOf});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferErrorTxDuplicate.fromIDLDeserializable(Map obj) {
    return TransferErrorTxDuplicate(
      duplicateOf: obj['duplicate_of'] is BigInt
          ? obj['duplicate_of']
          : BigInt.from(obj['duplicate_of']),
    );
  }

  factory TransferErrorTxDuplicate.fromJson(Map json) {
    return TransferErrorTxDuplicate(
      duplicateOf: json['duplicate_of'] is BigInt
          ? json['duplicate_of']
          : json['duplicate_of'] is num
              ? BigInt.from(json['duplicate_of'])
              : BigInt.parse('${json['duplicate_of']}'),
    );
  }

  /// [duplicateOf] defined in Candid: `duplicate_of: BlockIndex`
  final BlockIndex duplicateOf;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final duplicateOf = this.duplicateOf;
    return {
      'duplicate_of': duplicateOf,
    };
  }

  Map<String, dynamic> toJson() {
    final duplicateOf = this.duplicateOf.toString();
    return {
      'duplicate_of': duplicateOf,
    };
  }

  TransferErrorTxDuplicate copyWith({BlockIndex? duplicateOf}) {
    return TransferErrorTxDuplicate(
      duplicateOf: duplicateOf ?? this.duplicateOf,
    );
  }

  @override
  bool operator ==(Object other) {
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
    this.badFee,
    this.insufficientFunds,
    this.txTooOld,
    this.txCreatedInFuture = false,
    this.txDuplicate,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferError.fromIDLDeserializable(Map obj) {
    return TransferError(
      badFee: obj['BadFee'] == null
          ? null
          : TransferErrorBadFee.fromIDLDeserializable(
              obj['BadFee'],
            ),
      insufficientFunds: obj['InsufficientFunds'] == null
          ? null
          : TransferErrorInsufficientFunds.fromIDLDeserializable(
              obj['InsufficientFunds'],
            ),
      txTooOld: obj['TxTooOld'] == null
          ? null
          : TransferErrorTxTooOld.fromIDLDeserializable(
              obj['TxTooOld'],
            ),
      txCreatedInFuture: obj.containsKey('TxCreatedInFuture'),
      txDuplicate: obj['TxDuplicate'] == null
          ? null
          : TransferErrorTxDuplicate.fromIDLDeserializable(
              obj['TxDuplicate'],
            ),
    );
  }

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

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
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

  Map<String, dynamic> toJson() {
    final badFee = this.badFee?.toJson();
    final insufficientFunds = this.insufficientFunds?.toJson();
    final txTooOld = this.txTooOld?.toJson();
    final txCreatedInFuture = this.txCreatedInFuture;
    final txDuplicate = this.txDuplicate?.toJson();
    return {
      if (badFee != null) 'BadFee': badFee,
      if (insufficientFunds != null) 'InsufficientFunds': insufficientFunds,
      if (txTooOld != null) 'TxTooOld': txTooOld,
      if (txCreatedInFuture) 'TxCreatedInFuture': null,
      if (txDuplicate != null) 'TxDuplicate': txDuplicate,
    };
  }

  TransferError copyWith({
    TransferErrorBadFee? badFee,
    TransferErrorInsufficientFunds? insufficientFunds,
    TransferErrorTxTooOld? txTooOld,
    bool? txCreatedInFuture,
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
  bool operator ==(Object other) {
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
    this.ok,
    this.err,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferResult.fromIDLDeserializable(Map obj) {
    return TransferResult(
      ok: obj['Ok'] == null
          ? null
          : obj['Ok'] is BigInt
              ? obj['Ok']
              : BigInt.from(obj['Ok']),
      err: obj['Err'] == null
          ? null
          : TransferError.fromIDLDeserializable(obj['Err']),
    );
  }

  factory TransferResult.fromJson(Map json) {
    return TransferResult(
      ok: json['Ok'] == null
          ? null
          : json['Ok'] is BigInt
              ? json['Ok']
              : json['Ok'] is num
                  ? BigInt.from(json['Ok'])
                  : BigInt.parse('${json['Ok']}'),
      err: json['Err'] == null ? null : TransferError.fromJson(json['Err']),
    );
  }

  /// [ok] defined in Candid: `Ok: BlockIndex`
  final BlockIndex? ok;

  /// [err] defined in Candid: `Err: TransferError`
  final TransferError? err;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final ok = this.ok;
    final err = this.err;
    return {
      if (ok != null) 'Ok': ok,
      if (err != null) 'Err': err,
    };
  }

  Map<String, dynamic> toJson() {
    final ok = this.ok.toString();
    final err = this.err;
    return {
      if (ok != null) 'Ok': ok,
      if (err != null) 'Err': err,
    };
  }

  TransferResult copyWith({
    BlockIndex? ok,
    TransferError? err,
  }) {
    return TransferResult(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(Object other) {
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
  const AccountBalanceArgs({required this.account});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory AccountBalanceArgs.fromIDLDeserializable(Map obj) {
    return AccountBalanceArgs(
      account: obj['account'] is Uint8List
          ? obj['account']
          : Uint8List.fromList((obj['account'] as List).cast()),
    );
  }

  factory AccountBalanceArgs.fromJson(Map json) {
    return AccountBalanceArgs(
      account: json['account'] is Uint8List
          ? json['account']
          : Uint8List.fromList((json['account'] as List).cast()),
    );
  }

  /// [account] defined in Candid: `account: AccountIdentifier`
  final AccountIdentifier account;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final account = this.account;
    return {
      'account': account,
    };
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    return {
      'account': account,
    };
  }

  AccountBalanceArgs copyWith({AccountIdentifier? account}) {
    return AccountBalanceArgs(
      account: account ?? this.account,
    );
  }

  @override
  bool operator ==(Object other) {
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

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferFeeArg.fromIDLDeserializable(List<dynamic> tuple) {
    return TransferFeeArg();
  }

  factory TransferFeeArg.fromJson(List<dynamic> tuple) {
    return TransferFeeArg();
  }

  /// An extra method for the serialization with `packages:agent_dart`.
  List<dynamic> toIDLSerializable() {
    return [];
  }

  List<dynamic> toJson() {
    return [];
  }

  TransferFeeArg copyWith() {
    return TransferFeeArg();
  }

  @override
  bool operator ==(Object other) {
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
  const TransferFee({required this.transferFee});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferFee.fromIDLDeserializable(Map obj) {
    return TransferFee(
      transferFee: Tokens.fromIDLDeserializable(obj['transfer_fee']),
    );
  }

  factory TransferFee.fromJson(Map json) {
    return TransferFee(
      transferFee: Tokens.fromJson(json['transfer_fee']),
    );
  }

  /// [transferFee] defined in Candid: `transfer_fee: Tokens`
  final Tokens transferFee;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final transferFee = this.transferFee;
    return {
      'transfer_fee': transferFee,
    };
  }

  Map<String, dynamic> toJson() {
    final transferFee = this.transferFee.toJson();
    return {
      'transfer_fee': transferFee,
    };
  }

  TransferFee copyWith({Tokens? transferFee}) {
    return TransferFee(
      transferFee: transferFee ?? this.transferFee,
    );
  }

  @override
  bool operator ==(Object other) {
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
  const Archive({required this.canisterId});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Archive.fromIDLDeserializable(Map obj) {
    return Archive(
      canisterId: Principal.from(obj['canister_id']),
    );
  }

  factory Archive.fromJson(Map json) {
    return Archive(
      canisterId: Principal.from(json['canister_id']),
    );
  }

  /// [canisterId] defined in Candid: `canister_id: principal`
  final Principal canisterId;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final canisterId = this.canisterId;
    return {
      'canister_id': canisterId,
    };
  }

  Map<String, dynamic> toJson() {
    final canisterId = this.canisterId;
    return {
      'canister_id': canisterId,
    };
  }

  Archive copyWith({Principal? canisterId}) {
    return Archive(
      canisterId: canisterId ?? this.canisterId,
    );
  }

  @override
  bool operator ==(Object other) {
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
  const Archives({required this.archives});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Archives.fromIDLDeserializable(Map obj) {
    return Archives(
      archives: (obj['archives'] as List).map((e) {
        return Archive.fromIDLDeserializable(e);
      }).toList(),
    );
  }

  factory Archives.fromJson(Map json) {
    return Archives(
      archives: (json['archives'] as List).map((e) {
        return Archive.fromJson(e);
      }).toList(),
    );
  }

  /// [archives] defined in Candid: `archives: vec Archive`
  final List<Archive> archives;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final archives = this.archives;
    return {
      'archives': archives,
    };
  }

  Map<String, dynamic> toJson() {
    final archives = this.archives;
    return {
      'archives': archives,
    };
  }

  Archives copyWith({List<Archive>? archives}) {
    return Archives(
      archives: archives ?? this.archives,
    );
  }

  @override
  bool operator ==(Object other) {
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
