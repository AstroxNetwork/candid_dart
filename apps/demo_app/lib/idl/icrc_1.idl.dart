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

class Icrc1IDLActor {
  const Icrc1IDLActor._();

  /// ```Candid
  ///   icrc1_balance_of: (Account) -> (nat) query
  /// ```
  static Future<BigInt> icrc1BalanceOf(
    CanisterActor actor,
    Account arg,
  ) async {
    final request = [arg];
    const method = 'icrc1_balance_of';
    final response = await actor.getFunc(method)!(request);
    return response is BigInt ? response : BigInt.from(response);
  }

  /// ```Candid
  ///   icrc1_decimals: () -> (nat8) query
  /// ```
  static Future<int> icrc1Decimals(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'icrc1_decimals';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   icrc1_fee: () -> (nat) query
  /// ```
  static Future<BigInt> icrc1Fee(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'icrc1_fee';
    final response = await actor.getFunc(method)!(request);
    return response is BigInt ? response : BigInt.from(response);
  }

  /// ```Candid
  ///   icrc1_metadata: () -> (vec record { text; Value }) query
  /// ```
  static Future<List<Icrc1MetadataRet0Item>> icrc1Metadata(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'icrc1_metadata';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
      return Icrc1MetadataRet0Item(
        e[0],
        Value.fromIDLDeserializable(e[1]),
      );
    }).toList();
  }

  /// ```Candid
  ///   icrc1_minting_account: () -> (opt Account) query
  /// ```
  static Future<Account?> icrc1MintingAccount(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'icrc1_minting_account';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
      return e == null ? null : Account.fromIDLDeserializable(e);
    }).firstOrNull;
  }

  /// ```Candid
  ///   icrc1_name: () -> (text) query
  /// ```
  static Future<String> icrc1Name(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'icrc1_name';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   icrc1_supported_standards: () -> (vec StandardRecord) query
  /// ```
  static Future<List<StandardRecord>> icrc1SupportedStandards(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'icrc1_supported_standards';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
      return StandardRecord.fromIDLDeserializable(e);
    }).toList();
  }

  /// ```Candid
  ///   icrc1_symbol: () -> (text) query
  /// ```
  static Future<String> icrc1Symbol(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'icrc1_symbol';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   icrc1_total_supply: () -> (nat) query
  /// ```
  static Future<BigInt> icrc1TotalSupply(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'icrc1_total_supply';
    final response = await actor.getFunc(method)!(request);
    return response is BigInt ? response : BigInt.from(response);
  }

  /// ```Candid
  ///   icrc1_transfer: (TransferArg) -> (Result)
  /// ```
  static Future<Result> icrc1Transfer(
    CanisterActor actor,
    TransferArg arg,
  ) async {
    final request = [arg];
    const method = 'icrc1_transfer';
    final response = await actor.getFunc(method)!(request);
    return Result.fromIDLDeserializable(response);
  }
}

class Icrc1IDLService {
  Icrc1IDLService({
    required this.canisterId,
    required this.uri,
    this.identity,
    this.createActorMethod,
    this.debug = true,
  }) : idl = Icrc1IDL.idl;

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
  ///   icrc1_balance_of: (Account) -> (nat) query
  /// ```
  Future<BigInt> icrc1BalanceOf(
    Account arg,
  ) async {
    final actor = await getActor();
    return Icrc1IDLActor.icrc1BalanceOf(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   icrc1_decimals: () -> (nat8) query
  /// ```
  Future<int> icrc1Decimals() async {
    final actor = await getActor();
    return Icrc1IDLActor.icrc1Decimals(
      actor,
    );
  }

  /// ```Candid
  ///   icrc1_fee: () -> (nat) query
  /// ```
  Future<BigInt> icrc1Fee() async {
    final actor = await getActor();
    return Icrc1IDLActor.icrc1Fee(
      actor,
    );
  }

  /// ```Candid
  ///   icrc1_metadata: () -> (vec record { text; Value }) query
  /// ```
  Future<List<Icrc1MetadataRet0Item>> icrc1Metadata() async {
    final actor = await getActor();
    return Icrc1IDLActor.icrc1Metadata(
      actor,
    );
  }

  /// ```Candid
  ///   icrc1_minting_account: () -> (opt Account) query
  /// ```
  Future<Account?> icrc1MintingAccount() async {
    final actor = await getActor();
    return Icrc1IDLActor.icrc1MintingAccount(
      actor,
    );
  }

  /// ```Candid
  ///   icrc1_name: () -> (text) query
  /// ```
  Future<String> icrc1Name() async {
    final actor = await getActor();
    return Icrc1IDLActor.icrc1Name(
      actor,
    );
  }

  /// ```Candid
  ///   icrc1_supported_standards: () -> (vec StandardRecord) query
  /// ```
  Future<List<StandardRecord>> icrc1SupportedStandards() async {
    final actor = await getActor();
    return Icrc1IDLActor.icrc1SupportedStandards(
      actor,
    );
  }

  /// ```Candid
  ///   icrc1_symbol: () -> (text) query
  /// ```
  Future<String> icrc1Symbol() async {
    final actor = await getActor();
    return Icrc1IDLActor.icrc1Symbol(
      actor,
    );
  }

  /// ```Candid
  ///   icrc1_total_supply: () -> (nat) query
  /// ```
  Future<BigInt> icrc1TotalSupply() async {
    final actor = await getActor();
    return Icrc1IDLActor.icrc1TotalSupply(
      actor,
    );
  }

  /// ```Candid
  ///   icrc1_transfer: (TransferArg) -> (Result)
  /// ```
  Future<Result> icrc1Transfer(
    TransferArg arg,
  ) async {
    final actor = await getActor();
    return Icrc1IDLActor.icrc1Transfer(
      actor,
      arg,
    );
  }
}

class Icrc1IDL {
  const Icrc1IDL._();

  /// [_Account] defined in Candid
  /// ```Candid
  ///   type Account = record { owner: principal; subaccount: opt vec nat8 };
  /// ```
  static final RecordClass _Account = IDL.Record({
    'owner': IDL.Principal,
    'subaccount': IDL.Opt(
      IDL.Vec(
        IDL.Nat8,
      ),
    ),
  });

  /// [_ArchivedTransactionRange] defined in Candid
  /// ```Candid
  ///   type ArchivedTransactionRange = record { callback: func (GetTransactionsRequest) -> (record { transactions: vec Transaction }) query; start: nat; length: nat };
  /// ```
  static final RecordClass _ArchivedTransactionRange = IDL.Record({
    'callback': IDL.Func(
      [_GetTransactionsRequest],
      [
        IDL.Record({
          'transactions': IDL.Vec(
            _Transaction,
          ),
        })
      ],
      ['query'],
    ),
    'start': IDL.Nat,
    'length': IDL.Nat,
  });

  /// [_Burn] defined in Candid
  /// ```Candid
  ///   type Burn = record { from: Account; memo: opt vec nat8; created_at_time: opt nat64; amount: nat };
  /// ```
  static final RecordClass _Burn = IDL.Record({
    'from': _Account,
    'memo': IDL.Opt(
      IDL.Vec(
        IDL.Nat8,
      ),
    ),
    'created_at_time': IDL.Opt(
      IDL.Nat64,
    ),
    'amount': IDL.Nat,
  });

  /// [_GetTransactionsRequest] defined in Candid
  /// ```Candid
  ///   type GetTransactionsRequest = record { start: nat; length: nat };
  /// ```
  static final RecordClass _GetTransactionsRequest = IDL.Record({
    'start': IDL.Nat,
    'length': IDL.Nat,
  });

  /// [_GetTransactionsResponse] defined in Candid
  /// ```Candid
  ///   type GetTransactionsResponse = record { first_index: nat; log_length: nat; transactions: vec Transaction; archived_transactions: vec ArchivedTransactionRange };
  /// ```
  static final RecordClass _GetTransactionsResponse = IDL.Record({
    'first_index': IDL.Nat,
    'log_length': IDL.Nat,
    'transactions': IDL.Vec(
      _Transaction,
    ),
    'archived_transactions': IDL.Vec(
      _ArchivedTransactionRange,
    ),
  });

  /// [_Mint] defined in Candid
  /// ```Candid
  ///   type Mint = record { to: Account; memo: opt vec nat8; created_at_time: opt nat64; amount: nat };
  /// ```
  static final RecordClass _Mint = IDL.Record({
    'to': _Account,
    'memo': IDL.Opt(
      IDL.Vec(
        IDL.Nat8,
      ),
    ),
    'created_at_time': IDL.Opt(
      IDL.Nat64,
    ),
    'amount': IDL.Nat,
  });

  /// [_Result] defined in Candid
  /// ```Candid
  ///   type Result = variant { Ok: nat; Err: TransferError };
  /// ```
  static final VariantClass _Result = IDL.Variant({
    'Ok': IDL.Nat,
    'Err': _TransferError,
  });

  /// [_StandardRecord] defined in Candid
  /// ```Candid
  ///   type StandardRecord = record { url: text; name: text };
  /// ```
  static final RecordClass _StandardRecord = IDL.Record({
    'url': IDL.Text,
    'name': IDL.Text,
  });

  /// [_Transaction] defined in Candid
  /// ```Candid
  ///   type Transaction = record { burn: opt Burn; kind: text; mint: opt Mint; timestamp: nat64; transfer: opt Transfer };
  /// ```
  static final RecordClass _Transaction = IDL.Record({
    'burn': IDL.Opt(
      _Burn,
    ),
    'kind': IDL.Text,
    'mint': IDL.Opt(
      _Mint,
    ),
    'timestamp': IDL.Nat64,
    'transfer': IDL.Opt(
      _Transfer,
    ),
  });

  /// [_Transfer] defined in Candid
  /// ```Candid
  ///   type Transfer = record { to: Account; fee: opt nat; from: Account; memo: opt vec nat8; created_at_time: opt nat64; amount: nat };
  /// ```
  static final RecordClass _Transfer = IDL.Record({
    'to': _Account,
    'fee': IDL.Opt(
      IDL.Nat,
    ),
    'from': _Account,
    'memo': IDL.Opt(
      IDL.Vec(
        IDL.Nat8,
      ),
    ),
    'created_at_time': IDL.Opt(
      IDL.Nat64,
    ),
    'amount': IDL.Nat,
  });

  /// [_TransferArg] defined in Candid
  /// ```Candid
  ///   type TransferArg = record { to: Account; fee: opt nat; memo: opt vec nat8; from_subaccount: opt vec nat8; created_at_time: opt nat64; amount: nat };
  /// ```
  static final RecordClass _TransferArg = IDL.Record({
    'to': _Account,
    'fee': IDL.Opt(
      IDL.Nat,
    ),
    'memo': IDL.Opt(
      IDL.Vec(
        IDL.Nat8,
      ),
    ),
    'from_subaccount': IDL.Opt(
      IDL.Vec(
        IDL.Nat8,
      ),
    ),
    'created_at_time': IDL.Opt(
      IDL.Nat64,
    ),
    'amount': IDL.Nat,
  });

  /// [_TransferError] defined in Candid
  /// ```Candid
  ///   type TransferError = variant { GenericError: record { message: text; error_code: nat }; TemporarilyUnavailable; BadBurn: record { min_burn_amount: nat }; Duplicate: record { duplicate_of: nat }; BadFee: record { expected_fee: nat }; CreatedInFuture: record { ledger_time: nat64 }; TooOld; InsufficientFunds: record { balance: nat } };
  /// ```
  static final VariantClass _TransferError = IDL.Variant({
    'GenericError': IDL.Record({
      'message': IDL.Text,
      'error_code': IDL.Nat,
    }),
    'TemporarilyUnavailable': IDL.Null,
    'BadBurn': IDL.Record({
      'min_burn_amount': IDL.Nat,
    }),
    'Duplicate': IDL.Record({
      'duplicate_of': IDL.Nat,
    }),
    'BadFee': IDL.Record({
      'expected_fee': IDL.Nat,
    }),
    'CreatedInFuture': IDL.Record({
      'ledger_time': IDL.Nat64,
    }),
    'TooOld': IDL.Null,
    'InsufficientFunds': IDL.Record({
      'balance': IDL.Nat,
    }),
  });

  /// [_Value] defined in Candid
  /// ```Candid
  ///   type Value = variant { Int: int; Nat: nat; Blob: vec nat8; Text: text };
  /// ```
  static final VariantClass _Value = IDL.Variant({
    'Int': IDL.Int,
    'Nat': IDL.Nat,
    'Blob': IDL.Vec(
      IDL.Nat8,
    ),
    'Text': IDL.Text,
  });

  static final ServiceClass idl = IDL.Service({
    'get_transactions': IDL.Func(
      [_GetTransactionsRequest],
      [_GetTransactionsResponse],
      ['query'],
    ),
    'icrc1_balance_of': IDL.Func(
      [_Account],
      [IDL.Nat],
      ['query'],
    ),
    'icrc1_decimals': IDL.Func(
      [],
      [IDL.Nat8],
      ['query'],
    ),
    'icrc1_fee': IDL.Func(
      [],
      [IDL.Nat],
      ['query'],
    ),
    'icrc1_metadata': IDL.Func(
      [],
      [
        IDL.Vec(
          IDL.Tuple([
            IDL.Text,
            _Value,
          ]),
        )
      ],
      ['query'],
    ),
    'icrc1_minting_account': IDL.Func(
      [],
      [
        IDL.Opt(
          _Account,
        )
      ],
      ['query'],
    ),
    'icrc1_name': IDL.Func(
      [],
      [IDL.Text],
      ['query'],
    ),
    'icrc1_supported_standards': IDL.Func(
      [],
      [
        IDL.Vec(
          _StandardRecord,
        )
      ],
      ['query'],
    ),
    'icrc1_symbol': IDL.Func(
      [],
      [IDL.Text],
      ['query'],
    ),
    'icrc1_total_supply': IDL.Func(
      [],
      [IDL.Nat],
      ['query'],
    ),
    'icrc1_transfer': IDL.Func(
      [_TransferArg],
      [_Result],
      [],
    ),
  });
}

/// [Icrc1MetadataRet0Item] defined in Candid
/// ```Candid
///   record { text; Value }
/// ```
@immutable
class Icrc1MetadataRet0Item {
  const Icrc1MetadataRet0Item(
    this.item1,
    this.item2,
  );

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Icrc1MetadataRet0Item.fromIDLDeserializable(List<dynamic> tuple) {
    return Icrc1MetadataRet0Item(
      tuple[0],
      Value.fromJson(tuple[1]),
    );
  }

  factory Icrc1MetadataRet0Item.fromJson(List<dynamic> tuple) {
    return Icrc1MetadataRet0Item(
      tuple[0],
      Value.fromJson(tuple[1]),
    );
  }

  /// [item1] defined in Candid: `text`
  final String item1;

  /// [item2] defined in Candid: `Value`
  final Value item2;

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
    final item2 = this.item2;
    return [
      item1,
      item2,
    ];
  }

  Icrc1MetadataRet0Item copyWith({
    String? item1,
    Value? item2,
  }) {
    return Icrc1MetadataRet0Item(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Icrc1MetadataRet0Item &&
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

/// [Account] defined in Candid
/// ```Candid
///   record { owner: principal; subaccount: opt vec nat8 }
/// ```
@immutable
class Account {
  const Account({
    required this.owner,
    this.subaccount,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Account.fromIDLDeserializable(Map obj) {
    return Account(
      owner: Principal.from(obj['owner']),
      subaccount: (obj['subaccount'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
    );
  }

  factory Account.fromJson(Map json) {
    return Account(
      owner: Principal.from(json['owner']),
      subaccount: (json['subaccount'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
    );
  }

  /// [owner] defined in Candid: `owner: principal`
  final Principal owner;

  /// [subaccount] defined in Candid: `subaccount: opt vec nat8`
  final Uint8List? subaccount;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final owner = this.owner;
    final subaccount = this.subaccount;
    return {
      'owner': owner,
      'subaccount': [if (subaccount != null) subaccount],
    };
  }

  Map<String, dynamic> toJson() {
    final owner = this.owner;
    final subaccount = this.subaccount;
    return {
      'owner': owner,
      'subaccount': [if (subaccount != null) subaccount],
    };
  }

  Account copyWith({
    Principal? owner,
    Uint8List? subaccount,
  }) {
    return Account(
      owner: owner ?? this.owner,
      subaccount: subaccount ?? this.subaccount,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Account &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.subaccount, subaccount) ||
                other.subaccount == subaccount));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, owner, subaccount]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [ArchivedTransactionRangeCallbackRet0] defined in Candid
/// ```Candid
///   record { transactions: vec Transaction }
/// ```
@immutable
class ArchivedTransactionRangeCallbackRet0 {
  const ArchivedTransactionRangeCallbackRet0({required this.transactions});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory ArchivedTransactionRangeCallbackRet0.fromIDLDeserializable(Map obj) {
    return ArchivedTransactionRangeCallbackRet0(
      transactions: (obj['transactions'] as List).map((e) {
        return Transaction.fromIDLDeserializable(e);
      }).toList(),
    );
  }

  factory ArchivedTransactionRangeCallbackRet0.fromJson(Map json) {
    return ArchivedTransactionRangeCallbackRet0(
      transactions: (json['transactions'] as List).map((e) {
        return Transaction.fromJson(e);
      }).toList(),
    );
  }

  /// [transactions] defined in Candid: `transactions: vec Transaction`
  final List<Transaction> transactions;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final transactions = this.transactions;
    return {
      'transactions': transactions,
    };
  }

  Map<String, dynamic> toJson() {
    final transactions = this.transactions;
    return {
      'transactions': transactions,
    };
  }

  ArchivedTransactionRangeCallbackRet0 copyWith(
      {List<Transaction>? transactions}) {
    return ArchivedTransactionRangeCallbackRet0(
      transactions: transactions ?? this.transactions,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ArchivedTransactionRangeCallbackRet0 &&
            const DeepCollectionEquality()
                .equals(other.transactions, transactions));
  }

  @override
  int get hashCode => Object.hashAll(
      [runtimeType, const DeepCollectionEquality().hash(transactions)]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Burn] defined in Candid
/// ```Candid
///   record { from: Account; memo: opt vec nat8; created_at_time: opt nat64; amount: nat }
/// ```
@immutable
class Burn {
  const Burn({
    required this.from,
    this.memo,
    this.createdAtTime,
    required this.amount,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Burn.fromIDLDeserializable(Map obj) {
    return Burn(
      from: Account.fromIDLDeserializable(obj['from']),
      memo: (obj['memo'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      createdAtTime: (obj['created_at_time'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      amount:
          obj['amount'] is BigInt ? obj['amount'] : BigInt.from(obj['amount']),
    );
  }

  factory Burn.fromJson(Map json) {
    return Burn(
      from: Account.fromJson(json['from']),
      memo: (json['memo'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      createdAtTime: (json['created_at_time'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : e is num
                    ? BigInt.from(e)
                    : BigInt.parse('${e}');
      }).firstOrNull,
      amount: json['amount'] is BigInt
          ? json['amount']
          : json['amount'] is num
              ? BigInt.from(json['amount'])
              : BigInt.parse('${json['amount']}'),
    );
  }

  /// [from] defined in Candid: `from: Account`
  final Account from;

  /// [memo] defined in Candid: `memo: opt vec nat8`
  final Uint8List? memo;

  /// [createdAtTime] defined in Candid: `created_at_time: opt nat64`
  final BigInt? createdAtTime;

  /// [amount] defined in Candid: `amount: nat`
  final BigInt amount;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final from = this.from;
    final memo = this.memo;
    final createdAtTime = this.createdAtTime;
    final amount = this.amount;
    return {
      'from': from,
      'memo': [if (memo != null) memo],
      'created_at_time': [if (createdAtTime != null) createdAtTime],
      'amount': amount,
    };
  }

  Map<String, dynamic> toJson() {
    final from = this.from.toJson();
    final memo = this.memo;
    final createdAtTime = this.createdAtTime?.toString();
    final amount = this.amount.toString();
    return {
      'from': from,
      'memo': [if (memo != null) memo],
      'created_at_time': [if (createdAtTime != null) createdAtTime],
      'amount': amount,
    };
  }

  Burn copyWith({
    Account? from,
    Uint8List? memo,
    BigInt? createdAtTime,
    BigInt? amount,
  }) {
    return Burn(
      from: from ?? this.from,
      memo: memo ?? this.memo,
      createdAtTime: createdAtTime ?? this.createdAtTime,
      amount: amount ?? this.amount,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Burn &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.createdAtTime, createdAtTime) ||
                other.createdAtTime == createdAtTime) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode =>
      Object.hashAll([runtimeType, from, memo, createdAtTime, amount]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [GetTransactionsRequest] defined in Candid
/// ```Candid
///   record { start: nat; length: nat }
/// ```
@immutable
class GetTransactionsRequest {
  const GetTransactionsRequest({
    required this.start,
    required this.length,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory GetTransactionsRequest.fromIDLDeserializable(Map obj) {
    return GetTransactionsRequest(
      start: obj['start'] is BigInt ? obj['start'] : BigInt.from(obj['start']),
      length:
          obj['length'] is BigInt ? obj['length'] : BigInt.from(obj['length']),
    );
  }

  factory GetTransactionsRequest.fromJson(Map json) {
    return GetTransactionsRequest(
      start: json['start'] is BigInt
          ? json['start']
          : json['start'] is num
              ? BigInt.from(json['start'])
              : BigInt.parse('${json['start']}'),
      length: json['length'] is BigInt
          ? json['length']
          : json['length'] is num
              ? BigInt.from(json['length'])
              : BigInt.parse('${json['length']}'),
    );
  }

  /// [start] defined in Candid: `start: nat`
  final BigInt start;

  /// [length] defined in Candid: `length: nat`
  final BigInt length;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final start = this.start;
    final length = this.length;
    return {
      'start': start,
      'length': length,
    };
  }

  Map<String, dynamic> toJson() {
    final start = this.start.toString();
    final length = this.length.toString();
    return {
      'start': start,
      'length': length,
    };
  }

  GetTransactionsRequest copyWith({
    BigInt? start,
    BigInt? length,
  }) {
    return GetTransactionsRequest(
      start: start ?? this.start,
      length: length ?? this.length,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetTransactionsRequest &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.length, length) || other.length == length));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, start, length]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Mint] defined in Candid
/// ```Candid
///   record { to: Account; memo: opt vec nat8; created_at_time: opt nat64; amount: nat }
/// ```
@immutable
class Mint {
  const Mint({
    required this.to,
    this.memo,
    this.createdAtTime,
    required this.amount,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Mint.fromIDLDeserializable(Map obj) {
    return Mint(
      to: Account.fromIDLDeserializable(obj['to']),
      memo: (obj['memo'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      createdAtTime: (obj['created_at_time'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      amount:
          obj['amount'] is BigInt ? obj['amount'] : BigInt.from(obj['amount']),
    );
  }

  factory Mint.fromJson(Map json) {
    return Mint(
      to: Account.fromJson(json['to']),
      memo: (json['memo'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      createdAtTime: (json['created_at_time'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : e is num
                    ? BigInt.from(e)
                    : BigInt.parse('${e}');
      }).firstOrNull,
      amount: json['amount'] is BigInt
          ? json['amount']
          : json['amount'] is num
              ? BigInt.from(json['amount'])
              : BigInt.parse('${json['amount']}'),
    );
  }

  /// [to] defined in Candid: `to: Account`
  final Account to;

  /// [memo] defined in Candid: `memo: opt vec nat8`
  final Uint8List? memo;

  /// [createdAtTime] defined in Candid: `created_at_time: opt nat64`
  final BigInt? createdAtTime;

  /// [amount] defined in Candid: `amount: nat`
  final BigInt amount;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final to = this.to;
    final memo = this.memo;
    final createdAtTime = this.createdAtTime;
    final amount = this.amount;
    return {
      'to': to,
      'memo': [if (memo != null) memo],
      'created_at_time': [if (createdAtTime != null) createdAtTime],
      'amount': amount,
    };
  }

  Map<String, dynamic> toJson() {
    final to = this.to.toJson();
    final memo = this.memo;
    final createdAtTime = this.createdAtTime?.toString();
    final amount = this.amount.toString();
    return {
      'to': to,
      'memo': [if (memo != null) memo],
      'created_at_time': [if (createdAtTime != null) createdAtTime],
      'amount': amount,
    };
  }

  Mint copyWith({
    Account? to,
    Uint8List? memo,
    BigInt? createdAtTime,
    BigInt? amount,
  }) {
    return Mint(
      to: to ?? this.to,
      memo: memo ?? this.memo,
      createdAtTime: createdAtTime ?? this.createdAtTime,
      amount: amount ?? this.amount,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Mint &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.createdAtTime, createdAtTime) ||
                other.createdAtTime == createdAtTime) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode =>
      Object.hashAll([runtimeType, to, memo, createdAtTime, amount]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Result] defined in Candid
/// ```Candid
///   variant { Ok: nat; Err: TransferError }
/// ```
@immutable
class Result {
  const Result({
    this.ok,
    this.err,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Result.fromIDLDeserializable(Map obj) {
    return Result(
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

  factory Result.fromJson(Map json) {
    return Result(
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

  /// [ok] defined in Candid: `Ok: nat`
  final BigInt? ok;

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

  Result copyWith({
    BigInt? ok,
    TransferError? err,
  }) {
    return Result(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(Object other) {
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

/// [StandardRecord] defined in Candid
/// ```Candid
///   record { url: text; name: text }
/// ```
@immutable
class StandardRecord {
  const StandardRecord({
    required this.url,
    required this.name,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory StandardRecord.fromIDLDeserializable(Map obj) {
    return StandardRecord(
      url: obj['url'],
      name: obj['name'],
    );
  }

  factory StandardRecord.fromJson(Map json) {
    return StandardRecord(
      url: json['url'],
      name: json['name'],
    );
  }

  /// [url] defined in Candid: `url: text`
  final String url;

  /// [name] defined in Candid: `name: text`
  final String name;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final url = this.url;
    final name = this.name;
    return {
      'url': url,
      'name': name,
    };
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    final name = this.name;
    return {
      'url': url,
      'name': name,
    };
  }

  StandardRecord copyWith({
    String? url,
    String? name,
  }) {
    return StandardRecord(
      url: url ?? this.url,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StandardRecord &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, url, name]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Transaction] defined in Candid
/// ```Candid
///   record { burn: opt Burn; kind: text; mint: opt Mint; timestamp: nat64; transfer: opt Transfer }
/// ```
@immutable
class Transaction {
  const Transaction({
    this.burn,
    required this.kind,
    this.mint,
    required this.timestamp,
    this.transfer,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Transaction.fromIDLDeserializable(Map obj) {
    return Transaction(
      burn: (obj['burn'] as List).map((e) {
        return e == null ? null : Burn.fromIDLDeserializable(e);
      }).firstOrNull,
      kind: obj['kind'],
      mint: (obj['mint'] as List).map((e) {
        return e == null ? null : Mint.fromIDLDeserializable(e);
      }).firstOrNull,
      timestamp: obj['timestamp'] is BigInt
          ? obj['timestamp']
          : BigInt.from(obj['timestamp']),
      transfer: (obj['transfer'] as List).map((e) {
        return e == null ? null : Transfer.fromIDLDeserializable(e);
      }).firstOrNull,
    );
  }

  factory Transaction.fromJson(Map json) {
    return Transaction(
      burn: (json['burn'] as List).map((e) {
        return e == null ? null : Burn.fromJson(e);
      }).firstOrNull,
      kind: json['kind'],
      mint: (json['mint'] as List).map((e) {
        return e == null ? null : Mint.fromJson(e);
      }).firstOrNull,
      timestamp: json['timestamp'] is BigInt
          ? json['timestamp']
          : json['timestamp'] is num
              ? BigInt.from(json['timestamp'])
              : BigInt.parse('${json['timestamp']}'),
      transfer: (json['transfer'] as List).map((e) {
        return e == null ? null : Transfer.fromJson(e);
      }).firstOrNull,
    );
  }

  /// [burn] defined in Candid: `burn: opt Burn`
  final Burn? burn;

  /// [kind] defined in Candid: `kind: text`
  final String kind;

  /// [mint] defined in Candid: `mint: opt Mint`
  final Mint? mint;

  /// [timestamp] defined in Candid: `timestamp: nat64`
  final BigInt timestamp;

  /// [transfer] defined in Candid: `transfer: opt Transfer`
  final Transfer? transfer;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final burn = this.burn;
    final kind = this.kind;
    final mint = this.mint;
    final timestamp = this.timestamp;
    final transfer = this.transfer;
    return {
      'burn': [if (burn != null) burn],
      'kind': kind,
      'mint': [if (mint != null) mint],
      'timestamp': timestamp,
      'transfer': [if (transfer != null) transfer],
    };
  }

  Map<String, dynamic> toJson() {
    final burn = this.burn;
    final kind = this.kind;
    final mint = this.mint;
    final timestamp = this.timestamp.toString();
    final transfer = this.transfer;
    return {
      'burn': [if (burn != null) burn],
      'kind': kind,
      'mint': [if (mint != null) mint],
      'timestamp': timestamp,
      'transfer': [if (transfer != null) transfer],
    };
  }

  Transaction copyWith({
    Burn? burn,
    String? kind,
    Mint? mint,
    BigInt? timestamp,
    Transfer? transfer,
  }) {
    return Transaction(
      burn: burn ?? this.burn,
      kind: kind ?? this.kind,
      mint: mint ?? this.mint,
      timestamp: timestamp ?? this.timestamp,
      transfer: transfer ?? this.transfer,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Transaction &&
            (identical(other.burn, burn) || other.burn == burn) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.mint, mint) || other.mint == mint) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.transfer, transfer) ||
                other.transfer == transfer));
  }

  @override
  int get hashCode =>
      Object.hashAll([runtimeType, burn, kind, mint, timestamp, transfer]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Transfer] defined in Candid
/// ```Candid
///   record { to: Account; fee: opt nat; from: Account; memo: opt vec nat8; created_at_time: opt nat64; amount: nat }
/// ```
@immutable
class Transfer {
  const Transfer({
    required this.to,
    this.fee,
    required this.from,
    this.memo,
    this.createdAtTime,
    required this.amount,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Transfer.fromIDLDeserializable(Map obj) {
    return Transfer(
      to: Account.fromIDLDeserializable(obj['to']),
      fee: (obj['fee'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      from: Account.fromIDLDeserializable(obj['from']),
      memo: (obj['memo'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      createdAtTime: (obj['created_at_time'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      amount:
          obj['amount'] is BigInt ? obj['amount'] : BigInt.from(obj['amount']),
    );
  }

  factory Transfer.fromJson(Map json) {
    return Transfer(
      to: Account.fromJson(json['to']),
      fee: (json['fee'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : e is num
                    ? BigInt.from(e)
                    : BigInt.parse('${e}');
      }).firstOrNull,
      from: Account.fromJson(json['from']),
      memo: (json['memo'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      createdAtTime: (json['created_at_time'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : e is num
                    ? BigInt.from(e)
                    : BigInt.parse('${e}');
      }).firstOrNull,
      amount: json['amount'] is BigInt
          ? json['amount']
          : json['amount'] is num
              ? BigInt.from(json['amount'])
              : BigInt.parse('${json['amount']}'),
    );
  }

  /// [to] defined in Candid: `to: Account`
  final Account to;

  /// [fee] defined in Candid: `fee: opt nat`
  final BigInt? fee;

  /// [from] defined in Candid: `from: Account`
  final Account from;

  /// [memo] defined in Candid: `memo: opt vec nat8`
  final Uint8List? memo;

  /// [createdAtTime] defined in Candid: `created_at_time: opt nat64`
  final BigInt? createdAtTime;

  /// [amount] defined in Candid: `amount: nat`
  final BigInt amount;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final to = this.to;
    final fee = this.fee;
    final from = this.from;
    final memo = this.memo;
    final createdAtTime = this.createdAtTime;
    final amount = this.amount;
    return {
      'to': to,
      'fee': [if (fee != null) fee],
      'from': from,
      'memo': [if (memo != null) memo],
      'created_at_time': [if (createdAtTime != null) createdAtTime],
      'amount': amount,
    };
  }

  Map<String, dynamic> toJson() {
    final to = this.to.toJson();
    final fee = this.fee?.toString();
    final from = this.from.toJson();
    final memo = this.memo;
    final createdAtTime = this.createdAtTime?.toString();
    final amount = this.amount.toString();
    return {
      'to': to,
      'fee': [if (fee != null) fee],
      'from': from,
      'memo': [if (memo != null) memo],
      'created_at_time': [if (createdAtTime != null) createdAtTime],
      'amount': amount,
    };
  }

  Transfer copyWith({
    Account? to,
    BigInt? fee,
    Account? from,
    Uint8List? memo,
    BigInt? createdAtTime,
    BigInt? amount,
  }) {
    return Transfer(
      to: to ?? this.to,
      fee: fee ?? this.fee,
      from: from ?? this.from,
      memo: memo ?? this.memo,
      createdAtTime: createdAtTime ?? this.createdAtTime,
      amount: amount ?? this.amount,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Transfer &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.createdAtTime, createdAtTime) ||
                other.createdAtTime == createdAtTime) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode =>
      Object.hashAll([runtimeType, to, fee, from, memo, createdAtTime, amount]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransferArg] defined in Candid
/// ```Candid
///   record { to: Account; fee: opt nat; memo: opt vec nat8; from_subaccount: opt vec nat8; created_at_time: opt nat64; amount: nat }
/// ```
@immutable
class TransferArg {
  const TransferArg({
    required this.to,
    this.fee,
    this.memo,
    this.fromSubaccount,
    this.createdAtTime,
    required this.amount,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferArg.fromIDLDeserializable(Map obj) {
    return TransferArg(
      to: Account.fromIDLDeserializable(obj['to']),
      fee: (obj['fee'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      memo: (obj['memo'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      fromSubaccount: (obj['from_subaccount'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      createdAtTime: (obj['created_at_time'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      amount:
          obj['amount'] is BigInt ? obj['amount'] : BigInt.from(obj['amount']),
    );
  }

  factory TransferArg.fromJson(Map json) {
    return TransferArg(
      to: Account.fromJson(json['to']),
      fee: (json['fee'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : e is num
                    ? BigInt.from(e)
                    : BigInt.parse('${e}');
      }).firstOrNull,
      memo: (json['memo'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      fromSubaccount: (json['from_subaccount'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      createdAtTime: (json['created_at_time'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : e is num
                    ? BigInt.from(e)
                    : BigInt.parse('${e}');
      }).firstOrNull,
      amount: json['amount'] is BigInt
          ? json['amount']
          : json['amount'] is num
              ? BigInt.from(json['amount'])
              : BigInt.parse('${json['amount']}'),
    );
  }

  /// [to] defined in Candid: `to: Account`
  final Account to;

  /// [fee] defined in Candid: `fee: opt nat`
  final BigInt? fee;

  /// [memo] defined in Candid: `memo: opt vec nat8`
  final Uint8List? memo;

  /// [fromSubaccount] defined in Candid: `from_subaccount: opt vec nat8`
  final Uint8List? fromSubaccount;

  /// [createdAtTime] defined in Candid: `created_at_time: opt nat64`
  final BigInt? createdAtTime;

  /// [amount] defined in Candid: `amount: nat`
  final BigInt amount;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final to = this.to;
    final fee = this.fee;
    final memo = this.memo;
    final fromSubaccount = this.fromSubaccount;
    final createdAtTime = this.createdAtTime;
    final amount = this.amount;
    return {
      'to': to,
      'fee': [if (fee != null) fee],
      'memo': [if (memo != null) memo],
      'from_subaccount': [if (fromSubaccount != null) fromSubaccount],
      'created_at_time': [if (createdAtTime != null) createdAtTime],
      'amount': amount,
    };
  }

  Map<String, dynamic> toJson() {
    final to = this.to.toJson();
    final fee = this.fee?.toString();
    final memo = this.memo;
    final fromSubaccount = this.fromSubaccount;
    final createdAtTime = this.createdAtTime?.toString();
    final amount = this.amount.toString();
    return {
      'to': to,
      'fee': [if (fee != null) fee],
      'memo': [if (memo != null) memo],
      'from_subaccount': [if (fromSubaccount != null) fromSubaccount],
      'created_at_time': [if (createdAtTime != null) createdAtTime],
      'amount': amount,
    };
  }

  TransferArg copyWith({
    Account? to,
    BigInt? fee,
    Uint8List? memo,
    Uint8List? fromSubaccount,
    BigInt? createdAtTime,
    BigInt? amount,
  }) {
    return TransferArg(
      to: to ?? this.to,
      fee: fee ?? this.fee,
      memo: memo ?? this.memo,
      fromSubaccount: fromSubaccount ?? this.fromSubaccount,
      createdAtTime: createdAtTime ?? this.createdAtTime,
      amount: amount ?? this.amount,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferArg &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.fromSubaccount, fromSubaccount) ||
                other.fromSubaccount == fromSubaccount) &&
            (identical(other.createdAtTime, createdAtTime) ||
                other.createdAtTime == createdAtTime) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hashAll(
      [runtimeType, to, fee, memo, fromSubaccount, createdAtTime, amount]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransferErrorGenericError] defined in Candid
/// ```Candid
///   record { message: text; error_code: nat }
/// ```
@immutable
class TransferErrorGenericError {
  const TransferErrorGenericError({
    required this.message,
    required this.errorCode,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferErrorGenericError.fromIDLDeserializable(Map obj) {
    return TransferErrorGenericError(
      message: obj['message'],
      errorCode: obj['error_code'] is BigInt
          ? obj['error_code']
          : BigInt.from(obj['error_code']),
    );
  }

  factory TransferErrorGenericError.fromJson(Map json) {
    return TransferErrorGenericError(
      message: json['message'],
      errorCode: json['error_code'] is BigInt
          ? json['error_code']
          : json['error_code'] is num
              ? BigInt.from(json['error_code'])
              : BigInt.parse('${json['error_code']}'),
    );
  }

  /// [message] defined in Candid: `message: text`
  final String message;

  /// [errorCode] defined in Candid: `error_code: nat`
  final BigInt errorCode;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final message = this.message;
    final errorCode = this.errorCode;
    return {
      'message': message,
      'error_code': errorCode,
    };
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final errorCode = this.errorCode.toString();
    return {
      'message': message,
      'error_code': errorCode,
    };
  }

  TransferErrorGenericError copyWith({
    String? message,
    BigInt? errorCode,
  }) {
    return TransferErrorGenericError(
      message: message ?? this.message,
      errorCode: errorCode ?? this.errorCode,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferErrorGenericError &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, message, errorCode]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransferErrorBadBurn] defined in Candid
/// ```Candid
///   record { min_burn_amount: nat }
/// ```
@immutable
class TransferErrorBadBurn {
  const TransferErrorBadBurn({required this.minBurnAmount});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferErrorBadBurn.fromIDLDeserializable(Map obj) {
    return TransferErrorBadBurn(
      minBurnAmount: obj['min_burn_amount'] is BigInt
          ? obj['min_burn_amount']
          : BigInt.from(obj['min_burn_amount']),
    );
  }

  factory TransferErrorBadBurn.fromJson(Map json) {
    return TransferErrorBadBurn(
      minBurnAmount: json['min_burn_amount'] is BigInt
          ? json['min_burn_amount']
          : json['min_burn_amount'] is num
              ? BigInt.from(json['min_burn_amount'])
              : BigInt.parse('${json['min_burn_amount']}'),
    );
  }

  /// [minBurnAmount] defined in Candid: `min_burn_amount: nat`
  final BigInt minBurnAmount;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final minBurnAmount = this.minBurnAmount;
    return {
      'min_burn_amount': minBurnAmount,
    };
  }

  Map<String, dynamic> toJson() {
    final minBurnAmount = this.minBurnAmount.toString();
    return {
      'min_burn_amount': minBurnAmount,
    };
  }

  TransferErrorBadBurn copyWith({BigInt? minBurnAmount}) {
    return TransferErrorBadBurn(
      minBurnAmount: minBurnAmount ?? this.minBurnAmount,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferErrorBadBurn &&
            (identical(other.minBurnAmount, minBurnAmount) ||
                other.minBurnAmount == minBurnAmount));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, minBurnAmount]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransferErrorDuplicate] defined in Candid
/// ```Candid
///   record { duplicate_of: nat }
/// ```
@immutable
class TransferErrorDuplicate {
  const TransferErrorDuplicate({required this.duplicateOf});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferErrorDuplicate.fromIDLDeserializable(Map obj) {
    return TransferErrorDuplicate(
      duplicateOf: obj['duplicate_of'] is BigInt
          ? obj['duplicate_of']
          : BigInt.from(obj['duplicate_of']),
    );
  }

  factory TransferErrorDuplicate.fromJson(Map json) {
    return TransferErrorDuplicate(
      duplicateOf: json['duplicate_of'] is BigInt
          ? json['duplicate_of']
          : json['duplicate_of'] is num
              ? BigInt.from(json['duplicate_of'])
              : BigInt.parse('${json['duplicate_of']}'),
    );
  }

  /// [duplicateOf] defined in Candid: `duplicate_of: nat`
  final BigInt duplicateOf;

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

  TransferErrorDuplicate copyWith({BigInt? duplicateOf}) {
    return TransferErrorDuplicate(
      duplicateOf: duplicateOf ?? this.duplicateOf,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferErrorDuplicate &&
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

/// [TransferErrorBadFee] defined in Candid
/// ```Candid
///   record { expected_fee: nat }
/// ```
@immutable
class TransferErrorBadFee {
  const TransferErrorBadFee({required this.expectedFee});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferErrorBadFee.fromIDLDeserializable(Map obj) {
    return TransferErrorBadFee(
      expectedFee: obj['expected_fee'] is BigInt
          ? obj['expected_fee']
          : BigInt.from(obj['expected_fee']),
    );
  }

  factory TransferErrorBadFee.fromJson(Map json) {
    return TransferErrorBadFee(
      expectedFee: json['expected_fee'] is BigInt
          ? json['expected_fee']
          : json['expected_fee'] is num
              ? BigInt.from(json['expected_fee'])
              : BigInt.parse('${json['expected_fee']}'),
    );
  }

  /// [expectedFee] defined in Candid: `expected_fee: nat`
  final BigInt expectedFee;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final expectedFee = this.expectedFee;
    return {
      'expected_fee': expectedFee,
    };
  }

  Map<String, dynamic> toJson() {
    final expectedFee = this.expectedFee.toString();
    return {
      'expected_fee': expectedFee,
    };
  }

  TransferErrorBadFee copyWith({BigInt? expectedFee}) {
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

/// [TransferErrorCreatedInFuture] defined in Candid
/// ```Candid
///   record { ledger_time: nat64 }
/// ```
@immutable
class TransferErrorCreatedInFuture {
  const TransferErrorCreatedInFuture({required this.ledgerTime});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferErrorCreatedInFuture.fromIDLDeserializable(Map obj) {
    return TransferErrorCreatedInFuture(
      ledgerTime: obj['ledger_time'] is BigInt
          ? obj['ledger_time']
          : BigInt.from(obj['ledger_time']),
    );
  }

  factory TransferErrorCreatedInFuture.fromJson(Map json) {
    return TransferErrorCreatedInFuture(
      ledgerTime: json['ledger_time'] is BigInt
          ? json['ledger_time']
          : json['ledger_time'] is num
              ? BigInt.from(json['ledger_time'])
              : BigInt.parse('${json['ledger_time']}'),
    );
  }

  /// [ledgerTime] defined in Candid: `ledger_time: nat64`
  final BigInt ledgerTime;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final ledgerTime = this.ledgerTime;
    return {
      'ledger_time': ledgerTime,
    };
  }

  Map<String, dynamic> toJson() {
    final ledgerTime = this.ledgerTime.toString();
    return {
      'ledger_time': ledgerTime,
    };
  }

  TransferErrorCreatedInFuture copyWith({BigInt? ledgerTime}) {
    return TransferErrorCreatedInFuture(
      ledgerTime: ledgerTime ?? this.ledgerTime,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferErrorCreatedInFuture &&
            (identical(other.ledgerTime, ledgerTime) ||
                other.ledgerTime == ledgerTime));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, ledgerTime]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransferErrorInsufficientFunds] defined in Candid
/// ```Candid
///   record { balance: nat }
/// ```
@immutable
class TransferErrorInsufficientFunds {
  const TransferErrorInsufficientFunds({required this.balance});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferErrorInsufficientFunds.fromIDLDeserializable(Map obj) {
    return TransferErrorInsufficientFunds(
      balance: obj['balance'] is BigInt
          ? obj['balance']
          : BigInt.from(obj['balance']),
    );
  }

  factory TransferErrorInsufficientFunds.fromJson(Map json) {
    return TransferErrorInsufficientFunds(
      balance: json['balance'] is BigInt
          ? json['balance']
          : json['balance'] is num
              ? BigInt.from(json['balance'])
              : BigInt.parse('${json['balance']}'),
    );
  }

  /// [balance] defined in Candid: `balance: nat`
  final BigInt balance;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final balance = this.balance;
    return {
      'balance': balance,
    };
  }

  Map<String, dynamic> toJson() {
    final balance = this.balance.toString();
    return {
      'balance': balance,
    };
  }

  TransferErrorInsufficientFunds copyWith({BigInt? balance}) {
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

/// [TransferError] defined in Candid
/// ```Candid
///   variant { GenericError: record { message: text; error_code: nat }; TemporarilyUnavailable; BadBurn: record { min_burn_amount: nat }; Duplicate: record { duplicate_of: nat }; BadFee: record { expected_fee: nat }; CreatedInFuture: record { ledger_time: nat64 }; TooOld; InsufficientFunds: record { balance: nat } }
/// ```
@immutable
class TransferError {
  const TransferError({
    this.genericError,
    this.temporarilyUnavailable = false,
    this.badBurn,
    this.duplicate,
    this.badFee,
    this.createdInFuture,
    this.tooOld = false,
    this.insufficientFunds,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferError.fromIDLDeserializable(Map obj) {
    return TransferError(
      genericError: obj['GenericError'] == null
          ? null
          : TransferErrorGenericError.fromIDLDeserializable(
              obj['GenericError'],
            ),
      temporarilyUnavailable: obj.containsKey('TemporarilyUnavailable'),
      badBurn: obj['BadBurn'] == null
          ? null
          : TransferErrorBadBurn.fromIDLDeserializable(
              obj['BadBurn'],
            ),
      duplicate: obj['Duplicate'] == null
          ? null
          : TransferErrorDuplicate.fromIDLDeserializable(
              obj['Duplicate'],
            ),
      badFee: obj['BadFee'] == null
          ? null
          : TransferErrorBadFee.fromIDLDeserializable(
              obj['BadFee'],
            ),
      createdInFuture: obj['CreatedInFuture'] == null
          ? null
          : TransferErrorCreatedInFuture.fromIDLDeserializable(
              obj['CreatedInFuture'],
            ),
      tooOld: obj.containsKey('TooOld'),
      insufficientFunds: obj['InsufficientFunds'] == null
          ? null
          : TransferErrorInsufficientFunds.fromIDLDeserializable(
              obj['InsufficientFunds'],
            ),
    );
  }

  factory TransferError.fromJson(Map json) {
    return TransferError(
      genericError: json['GenericError'] == null
          ? null
          : TransferErrorGenericError.fromJson(
              json['GenericError'],
            ),
      temporarilyUnavailable: json.containsKey('TemporarilyUnavailable'),
      badBurn: json['BadBurn'] == null
          ? null
          : TransferErrorBadBurn.fromJson(
              json['BadBurn'],
            ),
      duplicate: json['Duplicate'] == null
          ? null
          : TransferErrorDuplicate.fromJson(
              json['Duplicate'],
            ),
      badFee: json['BadFee'] == null
          ? null
          : TransferErrorBadFee.fromJson(
              json['BadFee'],
            ),
      createdInFuture: json['CreatedInFuture'] == null
          ? null
          : TransferErrorCreatedInFuture.fromJson(
              json['CreatedInFuture'],
            ),
      tooOld: json.containsKey('TooOld'),
      insufficientFunds: json['InsufficientFunds'] == null
          ? null
          : TransferErrorInsufficientFunds.fromJson(
              json['InsufficientFunds'],
            ),
    );
  }

  /// [genericError] defined in Candid: `GenericError: record { message: text; error_code: nat }`
  final TransferErrorGenericError? genericError;

  /// [temporarilyUnavailable] defined in Candid: `TemporarilyUnavailable`
  final bool temporarilyUnavailable;

  /// [badBurn] defined in Candid: `BadBurn: record { min_burn_amount: nat }`
  final TransferErrorBadBurn? badBurn;

  /// [duplicate] defined in Candid: `Duplicate: record { duplicate_of: nat }`
  final TransferErrorDuplicate? duplicate;

  /// [badFee] defined in Candid: `BadFee: record { expected_fee: nat }`
  final TransferErrorBadFee? badFee;

  /// [createdInFuture] defined in Candid: `CreatedInFuture: record { ledger_time: nat64 }`
  final TransferErrorCreatedInFuture? createdInFuture;

  /// [tooOld] defined in Candid: `TooOld`
  final bool tooOld;

  /// [insufficientFunds] defined in Candid: `InsufficientFunds: record { balance: nat }`
  final TransferErrorInsufficientFunds? insufficientFunds;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final genericError = this.genericError;
    final temporarilyUnavailable = this.temporarilyUnavailable;
    final badBurn = this.badBurn;
    final duplicate = this.duplicate;
    final badFee = this.badFee;
    final createdInFuture = this.createdInFuture;
    final tooOld = this.tooOld;
    final insufficientFunds = this.insufficientFunds;
    return {
      if (genericError != null) 'GenericError': genericError,
      if (temporarilyUnavailable) 'TemporarilyUnavailable': null,
      if (badBurn != null) 'BadBurn': badBurn,
      if (duplicate != null) 'Duplicate': duplicate,
      if (badFee != null) 'BadFee': badFee,
      if (createdInFuture != null) 'CreatedInFuture': createdInFuture,
      if (tooOld) 'TooOld': null,
      if (insufficientFunds != null) 'InsufficientFunds': insufficientFunds,
    };
  }

  Map<String, dynamic> toJson() {
    final genericError = this.genericError?.toJson();
    final temporarilyUnavailable = this.temporarilyUnavailable;
    final badBurn = this.badBurn?.toJson();
    final duplicate = this.duplicate?.toJson();
    final badFee = this.badFee?.toJson();
    final createdInFuture = this.createdInFuture?.toJson();
    final tooOld = this.tooOld;
    final insufficientFunds = this.insufficientFunds?.toJson();
    return {
      if (genericError != null) 'GenericError': genericError,
      if (temporarilyUnavailable) 'TemporarilyUnavailable': null,
      if (badBurn != null) 'BadBurn': badBurn,
      if (duplicate != null) 'Duplicate': duplicate,
      if (badFee != null) 'BadFee': badFee,
      if (createdInFuture != null) 'CreatedInFuture': createdInFuture,
      if (tooOld) 'TooOld': null,
      if (insufficientFunds != null) 'InsufficientFunds': insufficientFunds,
    };
  }

  TransferError copyWith({
    TransferErrorGenericError? genericError,
    bool? temporarilyUnavailable,
    TransferErrorBadBurn? badBurn,
    TransferErrorDuplicate? duplicate,
    TransferErrorBadFee? badFee,
    TransferErrorCreatedInFuture? createdInFuture,
    bool? tooOld,
    TransferErrorInsufficientFunds? insufficientFunds,
  }) {
    return TransferError(
      genericError: genericError ?? this.genericError,
      temporarilyUnavailable:
          temporarilyUnavailable ?? this.temporarilyUnavailable,
      badBurn: badBurn ?? this.badBurn,
      duplicate: duplicate ?? this.duplicate,
      badFee: badFee ?? this.badFee,
      createdInFuture: createdInFuture ?? this.createdInFuture,
      tooOld: tooOld ?? this.tooOld,
      insufficientFunds: insufficientFunds ?? this.insufficientFunds,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferError &&
            (identical(other.genericError, genericError) ||
                other.genericError == genericError) &&
            (identical(other.temporarilyUnavailable, temporarilyUnavailable) ||
                other.temporarilyUnavailable == temporarilyUnavailable) &&
            (identical(other.badBurn, badBurn) || other.badBurn == badBurn) &&
            (identical(other.duplicate, duplicate) ||
                other.duplicate == duplicate) &&
            (identical(other.badFee, badFee) || other.badFee == badFee) &&
            (identical(other.createdInFuture, createdInFuture) ||
                other.createdInFuture == createdInFuture) &&
            (identical(other.tooOld, tooOld) || other.tooOld == tooOld) &&
            (identical(other.insufficientFunds, insufficientFunds) ||
                other.insufficientFunds == insufficientFunds));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        genericError,
        temporarilyUnavailable,
        badBurn,
        duplicate,
        badFee,
        createdInFuture,
        tooOld,
        insufficientFunds
      ]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Value] defined in Candid
/// ```Candid
///   variant { Int: int; Nat: nat; Blob: vec nat8; Text: text }
/// ```
@immutable
class Value {
  const Value({
    this.int_,
    this.nat,
    this.blob,
    this.text,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Value.fromIDLDeserializable(Map obj) {
    return Value(
      int_: obj['Int'] == null
          ? null
          : obj['Int'] is BigInt
              ? obj['Int']
              : BigInt.from(obj['Int']),
      nat: obj['Nat'] == null
          ? null
          : obj['Nat'] is BigInt
              ? obj['Nat']
              : BigInt.from(obj['Nat']),
      blob: obj['Blob'] == null
          ? null
          : obj['Blob'] is Uint8List
              ? obj['Blob']
              : Uint8List.fromList((obj['Blob'] as List).cast()),
      text: obj['Text'],
    );
  }

  factory Value.fromJson(Map json) {
    return Value(
      int_: json['Int'] == null
          ? null
          : json['Int'] is BigInt
              ? json['Int']
              : json['Int'] is num
                  ? BigInt.from(json['Int'])
                  : BigInt.parse('${json['Int']}'),
      nat: json['Nat'] == null
          ? null
          : json['Nat'] is BigInt
              ? json['Nat']
              : json['Nat'] is num
                  ? BigInt.from(json['Nat'])
                  : BigInt.parse('${json['Nat']}'),
      blob: json['Blob'] == null
          ? null
          : json['Blob'] is Uint8List
              ? json['Blob']
              : Uint8List.fromList((json['Blob'] as List).cast()),
      text: json['Text'],
    );
  }

  /// [int_] defined in Candid: `Int: int`
  final BigInt? int_;

  /// [nat] defined in Candid: `Nat: nat`
  final BigInt? nat;

  /// [blob] defined in Candid: `Blob: vec nat8`
  final Uint8List? blob;

  /// [text] defined in Candid: `Text: text`
  final String? text;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final int_ = this.int_;
    final nat = this.nat;
    final blob = this.blob;
    final text = this.text;
    return {
      if (int_ != null) 'Int': int_,
      if (nat != null) 'Nat': nat,
      if (blob != null) 'Blob': blob,
      if (text != null) 'Text': text,
    };
  }

  Map<String, dynamic> toJson() {
    final int_ = this.int_.toString();
    final nat = this.nat.toString();
    final blob = this.blob;
    final text = this.text;
    return {
      if (int_ != null) 'Int': int_,
      if (nat != null) 'Nat': nat,
      if (blob != null) 'Blob': blob,
      if (text != null) 'Text': text,
    };
  }

  Value copyWith({
    BigInt? int_,
    BigInt? nat,
    Uint8List? blob,
    String? text,
  }) {
    return Value(
      int_: int_ ?? this.int_,
      nat: nat ?? this.nat,
      blob: blob ?? this.blob,
      text: text ?? this.text,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Value &&
            (identical(other.int_, int_) || other.int_ == int_) &&
            (identical(other.nat, nat) || other.nat == nat) &&
            (identical(other.blob, blob) || other.blob == blob) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, int_, nat, blob, text]);

  @override
  String toString() {
    return toJson().toString();
  }
}
