// coverage:ignore-file
// ignore_for_file: type=lint, depend_on_referenced_packages, unnecessary_null_comparison, unnecessary_non_null_assertion, unused_field, unused_import
// ======================================
// GENERATED CODE - DO NOT MODIFY BY HAND
// ======================================

import 'dart:async';
import 'package:agent_dart_base/agent_dart_base.dart';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

class IcpSwapUsdtIDLActor {
  const IcpSwapUsdtIDLActor._();

  /// ```Candid
  ///   cycleAvailable: () -> (NatResult) query
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
  ///   deleteToken: (text) -> ()
  /// ```
  static Future<void> deleteToken(
    CanisterActor actor,
    String arg,
  ) async {
    final request = [arg];
    const method = 'deleteToken';
    await actor.getFunc(method)!(request);
  }

  /// ```Candid
  ///   getAllToken: (opt nat) -> (vec PublicTokenOverview) query
  /// ```
  static Future<List<PublicTokenOverview>> getAllToken(
    CanisterActor actor, [
    BigInt? arg,
  ]) async {
    final request = [
      [if (arg != null) arg]
    ];
    const method = 'getAllToken';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
      return PublicTokenOverview.fromIDLDeserializable(e);
    }).toList();
  }

  /// ```Candid
  ///   getBaseDataStructureCanister: () -> (text) query
  /// ```
  static Future<String> getBaseDataStructureCanister(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'getBaseDataStructureCanister';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   getLastID: (nat) -> (vec record { text; nat }) query
  /// ```
  static Future<List<GetLastIDRet0Item>> getLastID(
    CanisterActor actor,
    BigInt arg,
  ) async {
    final request = [arg];
    const method = 'getLastID';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
      return GetLastIDRet0Item(
        e[0],
        e[1] is BigInt ? e[1] : BigInt.from(e[1]),
      );
    }).toList();
  }

  /// ```Candid
  ///   getPoolsForToken: (text) -> (vec PoolInfo) query
  /// ```
  static Future<List<PoolInfo>> getPoolsForToken(
    CanisterActor actor,
    String arg,
  ) async {
    final request = [arg];
    const method = 'getPoolsForToken';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
      return PoolInfo.fromIDLDeserializable(e);
    }).toList();
  }

  /// ```Candid
  ///   getRollIndex: () -> (nat) query
  /// ```
  static Future<BigInt> getRollIndex(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'getRollIndex';
    final response = await actor.getFunc(method)!(request);
    return response is BigInt ? response : BigInt.from(response);
  }

  /// ```Candid
  ///   getStartHeartBeatStatus: () -> (bool) query
  /// ```
  static Future<bool> getStartHeartBeatStatus(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'getStartHeartBeatStatus';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   getToken: (text) -> (PublicTokenOverview) query
  /// ```
  static Future<PublicTokenOverview> getToken(
    CanisterActor actor,
    String arg,
  ) async {
    final request = [arg];
    const method = 'getToken';
    final response = await actor.getFunc(method)!(request);
    return PublicTokenOverview.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   getTokenChartData: (text, nat, nat) -> (vec PublicTokenChartDayData) query
  /// ```
  static Future<List<PublicTokenChartDayData>> getTokenChartData(
    CanisterActor actor,
    GetTokenChartDataArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'getTokenChartData';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
      return PublicTokenChartDayData.fromIDLDeserializable(e);
    }).toList();
  }

  /// ```Candid
  ///   getTokenPricesData: (text, int, int, nat) -> (vec PublicTokenPricesData) query
  /// ```
  static Future<List<PublicTokenPricesData>> getTokenPricesData(
    CanisterActor actor,
    GetTokenPricesDataArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'getTokenPricesData';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
      return PublicTokenPricesData.fromIDLDeserializable(e);
    }).toList();
  }

  /// ```Candid
  ///   getTokenTransactions: (text, nat, nat) -> (vec TransactionsType) query
  /// ```
  static Future<List<TransactionsType>> getTokenTransactions(
    CanisterActor actor,
    GetTokenTransactionsArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'getTokenTransactions';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
      return TransactionsType.fromIDLDeserializable(e);
    }).toList();
  }

  /// ```Candid
  ///   getTvlRecord: (nat) -> (vec record { text; vec float64 }) query
  /// ```
  static Future<List<GetTvlRecordRet0Item>> getTvlRecord(
    CanisterActor actor,
    BigInt arg,
  ) async {
    final request = [arg];
    const method = 'getTvlRecord';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
      return GetTvlRecordRet0Item(
        e[0],
        (e[1] as List).cast<double>(),
      );
    }).toList();
  }

  /// ```Candid
  ///   reset: () -> ()
  /// ```
  static Future<void> reset(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'reset';
    await actor.getFunc(method)!(request);
  }

  /// ```Candid
  ///   rollBackData: (vec TransactionsType) -> ()
  /// ```
  static Future<void> rollBackData(
    CanisterActor actor,
    List<TransactionsType> arg,
  ) async {
    final request = [arg];
    const method = 'rollBackData';
    await actor.getFunc(method)!(request);
  }

  /// ```Candid
  ///   rollBackStatus: (bool) -> () query
  /// ```
  static Future<void> rollBackStatus(
    CanisterActor actor,
    bool arg,
  ) async {
    final request = [arg];
    const method = 'rollBackStatus';
    await actor.getFunc(method)!(request);
  }

  /// ```Candid
  ///   saveTransactions: (TransactionsType, bool) -> ()
  /// ```
  static Future<void> saveTransactions(
    CanisterActor actor,
    SaveTransactionsArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'saveTransactions';
    await actor.getFunc(method)!(request);
  }

  /// ```Candid
  ///   setBaseDataStructureCanister: (text) -> ()
  /// ```
  static Future<void> setBaseDataStructureCanister(
    CanisterActor actor,
    String arg,
  ) async {
    final request = [arg];
    const method = 'setBaseDataStructureCanister';
    await actor.getFunc(method)!(request);
  }
}

class IcpSwapUsdtIDLService {
  IcpSwapUsdtIDLService({
    required this.canisterId,
    required this.uri,
    this.identity,
    this.createActorMethod,
    this.debug = true,
  }) : idl = IcpSwapUsdtIDL.idl;

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
  ///   cycleAvailable: () -> (NatResult) query
  /// ```
  Future<NatResult> cycleAvailable() async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.cycleAvailable(
      actor,
    );
  }

  /// ```Candid
  ///   cycleBalance: () -> (NatResult) query
  /// ```
  Future<NatResult> cycleBalance() async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.cycleBalance(
      actor,
    );
  }

  /// ```Candid
  ///   deleteToken: (text) -> ()
  /// ```
  Future<void> deleteToken(
    String arg,
  ) async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.deleteToken(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   getAllToken: (opt nat) -> (vec PublicTokenOverview) query
  /// ```
  Future<List<PublicTokenOverview>> getAllToken([
    BigInt? arg,
  ]) async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.getAllToken(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   getBaseDataStructureCanister: () -> (text) query
  /// ```
  Future<String> getBaseDataStructureCanister() async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.getBaseDataStructureCanister(
      actor,
    );
  }

  /// ```Candid
  ///   getLastID: (nat) -> (vec record { text; nat }) query
  /// ```
  Future<List<GetLastIDRet0Item>> getLastID(
    BigInt arg,
  ) async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.getLastID(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   getPoolsForToken: (text) -> (vec PoolInfo) query
  /// ```
  Future<List<PoolInfo>> getPoolsForToken(
    String arg,
  ) async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.getPoolsForToken(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   getRollIndex: () -> (nat) query
  /// ```
  Future<BigInt> getRollIndex() async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.getRollIndex(
      actor,
    );
  }

  /// ```Candid
  ///   getStartHeartBeatStatus: () -> (bool) query
  /// ```
  Future<bool> getStartHeartBeatStatus() async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.getStartHeartBeatStatus(
      actor,
    );
  }

  /// ```Candid
  ///   getToken: (text) -> (PublicTokenOverview) query
  /// ```
  Future<PublicTokenOverview> getToken(
    String arg,
  ) async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.getToken(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   getTokenChartData: (text, nat, nat) -> (vec PublicTokenChartDayData) query
  /// ```
  Future<List<PublicTokenChartDayData>> getTokenChartData(
    GetTokenChartDataArg arg,
  ) async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.getTokenChartData(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   getTokenPricesData: (text, int, int, nat) -> (vec PublicTokenPricesData) query
  /// ```
  Future<List<PublicTokenPricesData>> getTokenPricesData(
    GetTokenPricesDataArg arg,
  ) async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.getTokenPricesData(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   getTokenTransactions: (text, nat, nat) -> (vec TransactionsType) query
  /// ```
  Future<List<TransactionsType>> getTokenTransactions(
    GetTokenTransactionsArg arg,
  ) async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.getTokenTransactions(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   getTvlRecord: (nat) -> (vec record { text; vec float64 }) query
  /// ```
  Future<List<GetTvlRecordRet0Item>> getTvlRecord(
    BigInt arg,
  ) async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.getTvlRecord(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   reset: () -> ()
  /// ```
  Future<void> reset() async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.reset(
      actor,
    );
  }

  /// ```Candid
  ///   rollBackData: (vec TransactionsType) -> ()
  /// ```
  Future<void> rollBackData(
    List<TransactionsType> arg,
  ) async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.rollBackData(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   rollBackStatus: (bool) -> () query
  /// ```
  Future<void> rollBackStatus(
    bool arg,
  ) async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.rollBackStatus(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   saveTransactions: (TransactionsType, bool) -> ()
  /// ```
  Future<void> saveTransactions(
    SaveTransactionsArg arg,
  ) async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.saveTransactions(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   setBaseDataStructureCanister: (text) -> ()
  /// ```
  Future<void> setBaseDataStructureCanister(
    String arg,
  ) async {
    final actor = await getActor();
    return IcpSwapUsdtIDLActor.setBaseDataStructureCanister(
      actor,
      arg,
    );
  }
}

class IcpSwapUsdtIDL {
  const IcpSwapUsdtIDL._();

  /// [_TransactionsType] defined in Candid
  /// ```Candid
  ///   type TransactionsType = record { action: TransactionType; amountToken0: float64; amountToken1: float64; amountUSD: float64; exchangePrice: float64; exchangeRate: float64; from: text; hash: text; liquidityChange: nat; liquidityTotal: nat; poolFee: nat; poolId: text; recipient: text; sender: text; tick: int; timestamp: int; to: text; token0ChangeAmount: float64; token0Decimals: float64; token0Fee: float64; token0Id: text; token0Price: float64; token0Standard: text; token0Symbol: text; token1ChangeAmount: float64; token1Decimals: float64; token1Fee: float64; token1Id: text; token1Price: float64; token1Standard: text; token1Symbol: text };
  /// ```
  static final RecordClass _TransactionsType = IDL.Record({
    'action': _TransactionType,
    'amountToken0': IDL.Float64,
    'amountToken1': IDL.Float64,
    'amountUSD': IDL.Float64,
    'exchangePrice': IDL.Float64,
    'exchangeRate': IDL.Float64,
    'from': IDL.Text,
    'hash': IDL.Text,
    'liquidityChange': IDL.Nat,
    'liquidityTotal': IDL.Nat,
    'poolFee': IDL.Nat,
    'poolId': IDL.Text,
    'recipient': IDL.Text,
    'sender': IDL.Text,
    'tick': IDL.Int,
    'timestamp': IDL.Int,
    'to': IDL.Text,
    'token0ChangeAmount': IDL.Float64,
    'token0Decimals': IDL.Float64,
    'token0Fee': IDL.Float64,
    'token0Id': IDL.Text,
    'token0Price': IDL.Float64,
    'token0Standard': IDL.Text,
    'token0Symbol': IDL.Text,
    'token1ChangeAmount': IDL.Float64,
    'token1Decimals': IDL.Float64,
    'token1Fee': IDL.Float64,
    'token1Id': IDL.Text,
    'token1Price': IDL.Float64,
    'token1Standard': IDL.Text,
    'token1Symbol': IDL.Text,
  });

  /// [_TransactionType] defined in Candid
  /// ```Candid
  ///   type TransactionType = variant { addLiquidity; claim; decreaseLiquidity; increaseLiquidity; swap };
  /// ```
  static final VariantClass _TransactionType = IDL.Variant({
    'addLiquidity': IDL.Null,
    'claim': IDL.Null,
    'decreaseLiquidity': IDL.Null,
    'increaseLiquidity': IDL.Null,
    'swap': IDL.Null,
  });

  /// [_PublicTokenPricesData] defined in Candid
  /// ```Candid
  ///   type PublicTokenPricesData = record { close: float64; high: float64; id: int; low: float64; open: float64; timestamp: int };
  /// ```
  static final RecordClass _PublicTokenPricesData = IDL.Record({
    'close': IDL.Float64,
    'high': IDL.Float64,
    'id': IDL.Int,
    'low': IDL.Float64,
    'open': IDL.Float64,
    'timestamp': IDL.Int,
  });

  /// [_PublicTokenOverview] defined in Candid
  /// ```Candid
  ///   type PublicTokenOverview = record { address: text; feesUSD: float64; id: nat; name: text; priceUSD: float64; priceUSDChange: float64; priceUSDChangeWeek: float64; standard: text; symbol: text; totalVolumeUSD: float64; tvlToken: float64; tvlUSD: float64; tvlUSDChange: float64; txCount: int; volumeUSD: float64; volumeUSDChange: float64; volumeUSDWeek: float64 };
  /// ```
  static final RecordClass _PublicTokenOverview = IDL.Record({
    'address': IDL.Text,
    'feesUSD': IDL.Float64,
    'id': IDL.Nat,
    'name': IDL.Text,
    'priceUSD': IDL.Float64,
    'priceUSDChange': IDL.Float64,
    'priceUSDChangeWeek': IDL.Float64,
    'standard': IDL.Text,
    'symbol': IDL.Text,
    'totalVolumeUSD': IDL.Float64,
    'tvlToken': IDL.Float64,
    'tvlUSD': IDL.Float64,
    'tvlUSDChange': IDL.Float64,
    'txCount': IDL.Int,
    'volumeUSD': IDL.Float64,
    'volumeUSDChange': IDL.Float64,
    'volumeUSDWeek': IDL.Float64,
  });

  /// [_PublicTokenChartDayData] defined in Candid
  /// ```Candid
  ///   type PublicTokenChartDayData = record { id: int; timestamp: int; tvlUSD: float64; txCount: int; volumeUSD: float64 };
  /// ```
  static final RecordClass _PublicTokenChartDayData = IDL.Record({
    'id': IDL.Int,
    'timestamp': IDL.Int,
    'tvlUSD': IDL.Float64,
    'txCount': IDL.Int,
    'volumeUSD': IDL.Float64,
  });

  /// [_PoolInfo] defined in Candid
  /// ```Candid
  ///   type PoolInfo = record { fee: int; pool: text; token0Decimals: float64; token0Id: text; token0Price: float64; token0Symbol: text; token1Decimals: float64; token1Id: text; token1Price: float64; token1Symbol: text };
  /// ```
  static final RecordClass _PoolInfo = IDL.Record({
    'fee': IDL.Int,
    'pool': IDL.Text,
    'token0Decimals': IDL.Float64,
    'token0Id': IDL.Text,
    'token0Price': IDL.Float64,
    'token0Symbol': IDL.Text,
    'token1Decimals': IDL.Float64,
    'token1Id': IDL.Text,
    'token1Price': IDL.Float64,
    'token1Symbol': IDL.Text,
  });

  /// [_NatResult] defined in Candid
  /// ```Candid
  ///   type NatResult = variant { err: text; ok: nat };
  /// ```
  static final VariantClass _NatResult = IDL.Variant({
    'err': IDL.Text,
    'ok': IDL.Nat,
  });

  static final ServiceClass idl = IDL.Service({
    'cycleAvailable': IDL.Func(
      [],
      [_NatResult],
      ['query'],
    ),
    'cycleBalance': IDL.Func(
      [],
      [_NatResult],
      ['query'],
    ),
    'deleteToken': IDL.Func(
      [IDL.Text],
      [],
      [],
    ),
    'getAllToken': IDL.Func(
      [
        IDL.Opt(
          IDL.Nat,
        )
      ],
      [
        IDL.Vec(
          _PublicTokenOverview,
        )
      ],
      ['query'],
    ),
    'getBaseDataStructureCanister': IDL.Func(
      [],
      [IDL.Text],
      ['query'],
    ),
    'getLastID': IDL.Func(
      [IDL.Nat],
      [
        IDL.Vec(
          IDL.Tuple([
            IDL.Text,
            IDL.Nat,
          ]),
        )
      ],
      ['query'],
    ),
    'getPoolsForToken': IDL.Func(
      [IDL.Text],
      [
        IDL.Vec(
          _PoolInfo,
        )
      ],
      ['query'],
    ),
    'getRollIndex': IDL.Func(
      [],
      [IDL.Nat],
      ['query'],
    ),
    'getStartHeartBeatStatus': IDL.Func(
      [],
      [IDL.Bool],
      ['query'],
    ),
    'getToken': IDL.Func(
      [IDL.Text],
      [_PublicTokenOverview],
      ['query'],
    ),
    'getTokenChartData': IDL.Func(
      [IDL.Text, IDL.Nat, IDL.Nat],
      [
        IDL.Vec(
          _PublicTokenChartDayData,
        )
      ],
      ['query'],
    ),
    'getTokenPricesData': IDL.Func(
      [IDL.Text, IDL.Int, IDL.Int, IDL.Nat],
      [
        IDL.Vec(
          _PublicTokenPricesData,
        )
      ],
      ['query'],
    ),
    'getTokenTransactions': IDL.Func(
      [IDL.Text, IDL.Nat, IDL.Nat],
      [
        IDL.Vec(
          _TransactionsType,
        )
      ],
      ['query'],
    ),
    'getTvlRecord': IDL.Func(
      [IDL.Nat],
      [
        IDL.Vec(
          IDL.Tuple([
            IDL.Text,
            IDL.Vec(
              IDL.Float64,
            ),
          ]),
        )
      ],
      ['query'],
    ),
    'reset': IDL.Func(
      [],
      [],
      [],
    ),
    'rollBackData': IDL.Func(
      [
        IDL.Vec(
          _TransactionsType,
        )
      ],
      [],
      [],
    ),
    'rollBackStatus': IDL.Func(
      [IDL.Bool],
      [],
      ['query'],
    ),
    'saveTransactions': IDL.Func(
      [_TransactionsType, IDL.Bool],
      [],
      [],
    ),
    'setBaseDataStructureCanister': IDL.Func(
      [IDL.Text],
      [],
      [],
    ),
  });
}

/// [GetLastIDRet0Item] defined in Candid
/// ```Candid
///   record { text; nat }
/// ```
@immutable
class GetLastIDRet0Item {
  const GetLastIDRet0Item(
    this.item1,
    this.item2,
  );

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory GetLastIDRet0Item.fromIDLDeserializable(List<dynamic> tuple) {
    return GetLastIDRet0Item(
      tuple[0],
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
    );
  }

  factory GetLastIDRet0Item.fromJson(List<dynamic> tuple) {
    return GetLastIDRet0Item(
      tuple[0],
      tuple[1] is BigInt
          ? tuple[1]
          : tuple[1] is num
              ? BigInt.from(tuple[1])
              : BigInt.parse('${tuple[1]}'),
    );
  }

  /// [item1] defined in Candid: `text`
  final String item1;

  /// [item2] defined in Candid: `nat`
  final BigInt item2;

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
    final item2 = this.item2.toString();
    return [
      item1,
      item2,
    ];
  }

  GetLastIDRet0Item copyWith({
    String? item1,
    BigInt? item2,
  }) {
    return GetLastIDRet0Item(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetLastIDRet0Item &&
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

/// [GetTvlRecordRet0Item] defined in Candid
/// ```Candid
///   record { text; vec float64 }
/// ```
@immutable
class GetTvlRecordRet0Item {
  const GetTvlRecordRet0Item(
    this.item1,
    this.item2,
  );

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory GetTvlRecordRet0Item.fromIDLDeserializable(List<dynamic> tuple) {
    return GetTvlRecordRet0Item(
      tuple[0],
      (tuple[1] as List).cast<double>(),
    );
  }

  factory GetTvlRecordRet0Item.fromJson(List<dynamic> tuple) {
    return GetTvlRecordRet0Item(
      tuple[0],
      (tuple[1] as List).cast<double>(),
    );
  }

  /// [item1] defined in Candid: `text`
  final String item1;

  /// [item2] defined in Candid: `vec float64`
  final List<double> item2;

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

  GetTvlRecordRet0Item copyWith({
    String? item1,
    List<double>? item2,
  }) {
    return GetTvlRecordRet0Item(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetTvlRecordRet0Item &&
            (identical(other.item1, item1) || other.item1 == item1) &&
            const DeepCollectionEquality().equals(other.item2, item2));
  }

  @override
  int get hashCode => Object.hashAll(
      [runtimeType, item1, const DeepCollectionEquality().hash(item2)]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransactionsType] defined in Candid
/// ```Candid
///   record { action: TransactionType; amountToken0: float64; amountToken1: float64; amountUSD: float64; exchangePrice: float64; exchangeRate: float64; from: text; hash: text; liquidityChange: nat; liquidityTotal: nat; poolFee: nat; poolId: text; recipient: text; sender: text; tick: int; timestamp: int; to: text; token0ChangeAmount: float64; token0Decimals: float64; token0Fee: float64; token0Id: text; token0Price: float64; token0Standard: text; token0Symbol: text; token1ChangeAmount: float64; token1Decimals: float64; token1Fee: float64; token1Id: text; token1Price: float64; token1Standard: text; token1Symbol: text }
/// ```
@immutable
class TransactionsType {
  const TransactionsType({
    required this.action,
    required this.amountToken0,
    required this.amountToken1,
    required this.amountUSD,
    required this.exchangePrice,
    required this.exchangeRate,
    required this.from,
    required this.hash,
    required this.liquidityChange,
    required this.liquidityTotal,
    required this.poolFee,
    required this.poolId,
    required this.recipient,
    required this.sender,
    required this.tick,
    required this.timestamp,
    required this.to,
    required this.token0ChangeAmount,
    required this.token0Decimals,
    required this.token0Fee,
    required this.token0Id,
    required this.token0Price,
    required this.token0Standard,
    required this.token0Symbol,
    required this.token1ChangeAmount,
    required this.token1Decimals,
    required this.token1Fee,
    required this.token1Id,
    required this.token1Price,
    required this.token1Standard,
    required this.token1Symbol,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransactionsType.fromIDLDeserializable(Map obj) {
    return TransactionsType(
      action: TransactionType.fromIDLDeserializable(obj['action']),
      amountToken0: obj['amountToken0'],
      amountToken1: obj['amountToken1'],
      amountUSD: obj['amountUSD'],
      exchangePrice: obj['exchangePrice'],
      exchangeRate: obj['exchangeRate'],
      from: obj['from'],
      hash: obj['hash'],
      liquidityChange: obj['liquidityChange'] is BigInt
          ? obj['liquidityChange']
          : BigInt.from(obj['liquidityChange']),
      liquidityTotal: obj['liquidityTotal'] is BigInt
          ? obj['liquidityTotal']
          : BigInt.from(obj['liquidityTotal']),
      poolFee: obj['poolFee'] is BigInt
          ? obj['poolFee']
          : BigInt.from(obj['poolFee']),
      poolId: obj['poolId'],
      recipient: obj['recipient'],
      sender: obj['sender'],
      tick: obj['tick'] is BigInt ? obj['tick'] : BigInt.from(obj['tick']),
      timestamp: obj['timestamp'] is BigInt
          ? obj['timestamp']
          : BigInt.from(obj['timestamp']),
      to: obj['to'],
      token0ChangeAmount: obj['token0ChangeAmount'],
      token0Decimals: obj['token0Decimals'],
      token0Fee: obj['token0Fee'],
      token0Id: obj['token0Id'],
      token0Price: obj['token0Price'],
      token0Standard: obj['token0Standard'],
      token0Symbol: obj['token0Symbol'],
      token1ChangeAmount: obj['token1ChangeAmount'],
      token1Decimals: obj['token1Decimals'],
      token1Fee: obj['token1Fee'],
      token1Id: obj['token1Id'],
      token1Price: obj['token1Price'],
      token1Standard: obj['token1Standard'],
      token1Symbol: obj['token1Symbol'],
    );
  }

  factory TransactionsType.fromJson(Map json) {
    return TransactionsType(
      action: TransactionType.fromJson(json['action']),
      amountToken0: json['amountToken0'],
      amountToken1: json['amountToken1'],
      amountUSD: json['amountUSD'],
      exchangePrice: json['exchangePrice'],
      exchangeRate: json['exchangeRate'],
      from: json['from'],
      hash: json['hash'],
      liquidityChange: json['liquidityChange'] is BigInt
          ? json['liquidityChange']
          : json['liquidityChange'] is num
              ? BigInt.from(json['liquidityChange'])
              : BigInt.parse('${json['liquidityChange']}'),
      liquidityTotal: json['liquidityTotal'] is BigInt
          ? json['liquidityTotal']
          : json['liquidityTotal'] is num
              ? BigInt.from(json['liquidityTotal'])
              : BigInt.parse('${json['liquidityTotal']}'),
      poolFee: json['poolFee'] is BigInt
          ? json['poolFee']
          : json['poolFee'] is num
              ? BigInt.from(json['poolFee'])
              : BigInt.parse('${json['poolFee']}'),
      poolId: json['poolId'],
      recipient: json['recipient'],
      sender: json['sender'],
      tick: json['tick'] is BigInt
          ? json['tick']
          : json['tick'] is num
              ? BigInt.from(json['tick'])
              : BigInt.parse('${json['tick']}'),
      timestamp: json['timestamp'] is BigInt
          ? json['timestamp']
          : json['timestamp'] is num
              ? BigInt.from(json['timestamp'])
              : BigInt.parse('${json['timestamp']}'),
      to: json['to'],
      token0ChangeAmount: json['token0ChangeAmount'],
      token0Decimals: json['token0Decimals'],
      token0Fee: json['token0Fee'],
      token0Id: json['token0Id'],
      token0Price: json['token0Price'],
      token0Standard: json['token0Standard'],
      token0Symbol: json['token0Symbol'],
      token1ChangeAmount: json['token1ChangeAmount'],
      token1Decimals: json['token1Decimals'],
      token1Fee: json['token1Fee'],
      token1Id: json['token1Id'],
      token1Price: json['token1Price'],
      token1Standard: json['token1Standard'],
      token1Symbol: json['token1Symbol'],
    );
  }

  /// [action] defined in Candid: `action: TransactionType`
  final TransactionType action;

  /// [amountToken0] defined in Candid: `amountToken0: float64`
  final double amountToken0;

  /// [amountToken1] defined in Candid: `amountToken1: float64`
  final double amountToken1;

  /// [amountUSD] defined in Candid: `amountUSD: float64`
  final double amountUSD;

  /// [exchangePrice] defined in Candid: `exchangePrice: float64`
  final double exchangePrice;

  /// [exchangeRate] defined in Candid: `exchangeRate: float64`
  final double exchangeRate;

  /// [from] defined in Candid: `from: text`
  final String from;

  /// [hash] defined in Candid: `hash: text`
  final String hash;

  /// [liquidityChange] defined in Candid: `liquidityChange: nat`
  final BigInt liquidityChange;

  /// [liquidityTotal] defined in Candid: `liquidityTotal: nat`
  final BigInt liquidityTotal;

  /// [poolFee] defined in Candid: `poolFee: nat`
  final BigInt poolFee;

  /// [poolId] defined in Candid: `poolId: text`
  final String poolId;

  /// [recipient] defined in Candid: `recipient: text`
  final String recipient;

  /// [sender] defined in Candid: `sender: text`
  final String sender;

  /// [tick] defined in Candid: `tick: int`
  final BigInt tick;

  /// [timestamp] defined in Candid: `timestamp: int`
  final BigInt timestamp;

  /// [to] defined in Candid: `to: text`
  final String to;

  /// [token0ChangeAmount] defined in Candid: `token0ChangeAmount: float64`
  final double token0ChangeAmount;

  /// [token0Decimals] defined in Candid: `token0Decimals: float64`
  final double token0Decimals;

  /// [token0Fee] defined in Candid: `token0Fee: float64`
  final double token0Fee;

  /// [token0Id] defined in Candid: `token0Id: text`
  final String token0Id;

  /// [token0Price] defined in Candid: `token0Price: float64`
  final double token0Price;

  /// [token0Standard] defined in Candid: `token0Standard: text`
  final String token0Standard;

  /// [token0Symbol] defined in Candid: `token0Symbol: text`
  final String token0Symbol;

  /// [token1ChangeAmount] defined in Candid: `token1ChangeAmount: float64`
  final double token1ChangeAmount;

  /// [token1Decimals] defined in Candid: `token1Decimals: float64`
  final double token1Decimals;

  /// [token1Fee] defined in Candid: `token1Fee: float64`
  final double token1Fee;

  /// [token1Id] defined in Candid: `token1Id: text`
  final String token1Id;

  /// [token1Price] defined in Candid: `token1Price: float64`
  final double token1Price;

  /// [token1Standard] defined in Candid: `token1Standard: text`
  final String token1Standard;

  /// [token1Symbol] defined in Candid: `token1Symbol: text`
  final String token1Symbol;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final action = this.action;
    final amountToken0 = this.amountToken0;
    final amountToken1 = this.amountToken1;
    final amountUSD = this.amountUSD;
    final exchangePrice = this.exchangePrice;
    final exchangeRate = this.exchangeRate;
    final from = this.from;
    final hash = this.hash;
    final liquidityChange = this.liquidityChange;
    final liquidityTotal = this.liquidityTotal;
    final poolFee = this.poolFee;
    final poolId = this.poolId;
    final recipient = this.recipient;
    final sender = this.sender;
    final tick = this.tick;
    final timestamp = this.timestamp;
    final to = this.to;
    final token0ChangeAmount = this.token0ChangeAmount;
    final token0Decimals = this.token0Decimals;
    final token0Fee = this.token0Fee;
    final token0Id = this.token0Id;
    final token0Price = this.token0Price;
    final token0Standard = this.token0Standard;
    final token0Symbol = this.token0Symbol;
    final token1ChangeAmount = this.token1ChangeAmount;
    final token1Decimals = this.token1Decimals;
    final token1Fee = this.token1Fee;
    final token1Id = this.token1Id;
    final token1Price = this.token1Price;
    final token1Standard = this.token1Standard;
    final token1Symbol = this.token1Symbol;
    return {
      'action': action,
      'amountToken0': amountToken0,
      'amountToken1': amountToken1,
      'amountUSD': amountUSD,
      'exchangePrice': exchangePrice,
      'exchangeRate': exchangeRate,
      'from': from,
      'hash': hash,
      'liquidityChange': liquidityChange,
      'liquidityTotal': liquidityTotal,
      'poolFee': poolFee,
      'poolId': poolId,
      'recipient': recipient,
      'sender': sender,
      'tick': tick,
      'timestamp': timestamp,
      'to': to,
      'token0ChangeAmount': token0ChangeAmount,
      'token0Decimals': token0Decimals,
      'token0Fee': token0Fee,
      'token0Id': token0Id,
      'token0Price': token0Price,
      'token0Standard': token0Standard,
      'token0Symbol': token0Symbol,
      'token1ChangeAmount': token1ChangeAmount,
      'token1Decimals': token1Decimals,
      'token1Fee': token1Fee,
      'token1Id': token1Id,
      'token1Price': token1Price,
      'token1Standard': token1Standard,
      'token1Symbol': token1Symbol,
    };
  }

  Map<String, dynamic> toJson() {
    final action = this.action.toJson();
    final amountToken0 = this.amountToken0;
    final amountToken1 = this.amountToken1;
    final amountUSD = this.amountUSD;
    final exchangePrice = this.exchangePrice;
    final exchangeRate = this.exchangeRate;
    final from = this.from;
    final hash = this.hash;
    final liquidityChange = this.liquidityChange.toString();
    final liquidityTotal = this.liquidityTotal.toString();
    final poolFee = this.poolFee.toString();
    final poolId = this.poolId;
    final recipient = this.recipient;
    final sender = this.sender;
    final tick = this.tick.toString();
    final timestamp = this.timestamp.toString();
    final to = this.to;
    final token0ChangeAmount = this.token0ChangeAmount;
    final token0Decimals = this.token0Decimals;
    final token0Fee = this.token0Fee;
    final token0Id = this.token0Id;
    final token0Price = this.token0Price;
    final token0Standard = this.token0Standard;
    final token0Symbol = this.token0Symbol;
    final token1ChangeAmount = this.token1ChangeAmount;
    final token1Decimals = this.token1Decimals;
    final token1Fee = this.token1Fee;
    final token1Id = this.token1Id;
    final token1Price = this.token1Price;
    final token1Standard = this.token1Standard;
    final token1Symbol = this.token1Symbol;
    return {
      'action': action,
      'amountToken0': amountToken0,
      'amountToken1': amountToken1,
      'amountUSD': amountUSD,
      'exchangePrice': exchangePrice,
      'exchangeRate': exchangeRate,
      'from': from,
      'hash': hash,
      'liquidityChange': liquidityChange,
      'liquidityTotal': liquidityTotal,
      'poolFee': poolFee,
      'poolId': poolId,
      'recipient': recipient,
      'sender': sender,
      'tick': tick,
      'timestamp': timestamp,
      'to': to,
      'token0ChangeAmount': token0ChangeAmount,
      'token0Decimals': token0Decimals,
      'token0Fee': token0Fee,
      'token0Id': token0Id,
      'token0Price': token0Price,
      'token0Standard': token0Standard,
      'token0Symbol': token0Symbol,
      'token1ChangeAmount': token1ChangeAmount,
      'token1Decimals': token1Decimals,
      'token1Fee': token1Fee,
      'token1Id': token1Id,
      'token1Price': token1Price,
      'token1Standard': token1Standard,
      'token1Symbol': token1Symbol,
    };
  }

  TransactionsType copyWith({
    TransactionType? action,
    double? amountToken0,
    double? amountToken1,
    double? amountUSD,
    double? exchangePrice,
    double? exchangeRate,
    String? from,
    String? hash,
    BigInt? liquidityChange,
    BigInt? liquidityTotal,
    BigInt? poolFee,
    String? poolId,
    String? recipient,
    String? sender,
    BigInt? tick,
    BigInt? timestamp,
    String? to,
    double? token0ChangeAmount,
    double? token0Decimals,
    double? token0Fee,
    String? token0Id,
    double? token0Price,
    String? token0Standard,
    String? token0Symbol,
    double? token1ChangeAmount,
    double? token1Decimals,
    double? token1Fee,
    String? token1Id,
    double? token1Price,
    String? token1Standard,
    String? token1Symbol,
  }) {
    return TransactionsType(
      action: action ?? this.action,
      amountToken0: amountToken0 ?? this.amountToken0,
      amountToken1: amountToken1 ?? this.amountToken1,
      amountUSD: amountUSD ?? this.amountUSD,
      exchangePrice: exchangePrice ?? this.exchangePrice,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      from: from ?? this.from,
      hash: hash ?? this.hash,
      liquidityChange: liquidityChange ?? this.liquidityChange,
      liquidityTotal: liquidityTotal ?? this.liquidityTotal,
      poolFee: poolFee ?? this.poolFee,
      poolId: poolId ?? this.poolId,
      recipient: recipient ?? this.recipient,
      sender: sender ?? this.sender,
      tick: tick ?? this.tick,
      timestamp: timestamp ?? this.timestamp,
      to: to ?? this.to,
      token0ChangeAmount: token0ChangeAmount ?? this.token0ChangeAmount,
      token0Decimals: token0Decimals ?? this.token0Decimals,
      token0Fee: token0Fee ?? this.token0Fee,
      token0Id: token0Id ?? this.token0Id,
      token0Price: token0Price ?? this.token0Price,
      token0Standard: token0Standard ?? this.token0Standard,
      token0Symbol: token0Symbol ?? this.token0Symbol,
      token1ChangeAmount: token1ChangeAmount ?? this.token1ChangeAmount,
      token1Decimals: token1Decimals ?? this.token1Decimals,
      token1Fee: token1Fee ?? this.token1Fee,
      token1Id: token1Id ?? this.token1Id,
      token1Price: token1Price ?? this.token1Price,
      token1Standard: token1Standard ?? this.token1Standard,
      token1Symbol: token1Symbol ?? this.token1Symbol,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransactionsType &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.amountToken0, amountToken0) ||
                other.amountToken0 == amountToken0) &&
            (identical(other.amountToken1, amountToken1) ||
                other.amountToken1 == amountToken1) &&
            (identical(other.amountUSD, amountUSD) ||
                other.amountUSD == amountUSD) &&
            (identical(other.exchangePrice, exchangePrice) ||
                other.exchangePrice == exchangePrice) &&
            (identical(other.exchangeRate, exchangeRate) ||
                other.exchangeRate == exchangeRate) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.liquidityChange, liquidityChange) ||
                other.liquidityChange == liquidityChange) &&
            (identical(other.liquidityTotal, liquidityTotal) ||
                other.liquidityTotal == liquidityTotal) &&
            (identical(other.poolFee, poolFee) || other.poolFee == poolFee) &&
            (identical(other.poolId, poolId) || other.poolId == poolId) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.tick, tick) || other.tick == tick) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.token0ChangeAmount, token0ChangeAmount) ||
                other.token0ChangeAmount == token0ChangeAmount) &&
            (identical(other.token0Decimals, token0Decimals) ||
                other.token0Decimals == token0Decimals) &&
            (identical(other.token0Fee, token0Fee) ||
                other.token0Fee == token0Fee) &&
            (identical(other.token0Id, token0Id) ||
                other.token0Id == token0Id) &&
            (identical(other.token0Price, token0Price) ||
                other.token0Price == token0Price) &&
            (identical(other.token0Standard, token0Standard) ||
                other.token0Standard == token0Standard) &&
            (identical(other.token0Symbol, token0Symbol) ||
                other.token0Symbol == token0Symbol) &&
            (identical(other.token1ChangeAmount, token1ChangeAmount) ||
                other.token1ChangeAmount == token1ChangeAmount) &&
            (identical(other.token1Decimals, token1Decimals) ||
                other.token1Decimals == token1Decimals) &&
            (identical(other.token1Fee, token1Fee) ||
                other.token1Fee == token1Fee) &&
            (identical(other.token1Id, token1Id) ||
                other.token1Id == token1Id) &&
            (identical(other.token1Price, token1Price) ||
                other.token1Price == token1Price) &&
            (identical(other.token1Standard, token1Standard) ||
                other.token1Standard == token1Standard) &&
            (identical(other.token1Symbol, token1Symbol) ||
                other.token1Symbol == token1Symbol));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        action,
        amountToken0,
        amountToken1,
        amountUSD,
        exchangePrice,
        exchangeRate,
        from,
        hash,
        liquidityChange,
        liquidityTotal,
        poolFee,
        poolId,
        recipient,
        sender,
        tick,
        timestamp,
        to,
        token0ChangeAmount,
        token0Decimals,
        token0Fee,
        token0Id,
        token0Price,
        token0Standard,
        token0Symbol,
        token1ChangeAmount,
        token1Decimals,
        token1Fee,
        token1Id,
        token1Price,
        token1Standard,
        token1Symbol
      ]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransactionType] defined in Candid
/// ```Candid
///   variant { addLiquidity; claim; decreaseLiquidity; increaseLiquidity; swap }
/// ```
enum TransactionType {
  /// [addLiquidity] defined in Candid: `addLiquidity`
  addLiquidity('addLiquidity'),

  /// [claim] defined in Candid: `claim`
  claim('claim'),

  /// [decreaseLiquidity] defined in Candid: `decreaseLiquidity`
  decreaseLiquidity('decreaseLiquidity'),

  /// [increaseLiquidity] defined in Candid: `increaseLiquidity`
  increaseLiquidity('increaseLiquidity'),

  /// [swap] defined in Candid: `swap`
  swap('swap');

  const TransactionType(this.name);

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransactionType.fromIDLDeserializable(Map obj) {
    final key = obj.keys.first;
    return TransactionType.values.firstWhere((e) => e.name == key);
  }

  factory TransactionType.fromJson(Map json) {
    final key = json.keys.first;
    return TransactionType.values.firstWhere((e) => e.name == key);
  }

  final String name;

  bool get isAddLiquidity => this == TransactionType.addLiquidity;

  bool get isClaim => this == TransactionType.claim;

  bool get isDecreaseLiquidity => this == TransactionType.decreaseLiquidity;

  bool get isIncreaseLiquidity => this == TransactionType.increaseLiquidity;

  bool get isSwap => this == TransactionType.swap;

  Map<String, Null> toJson() {
    return {name: null};
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [PublicTokenPricesData] defined in Candid
/// ```Candid
///   record { close: float64; high: float64; id: int; low: float64; open: float64; timestamp: int }
/// ```
@immutable
class PublicTokenPricesData {
  const PublicTokenPricesData({
    required this.close,
    required this.high,
    required this.id,
    required this.low,
    required this.open,
    required this.timestamp,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory PublicTokenPricesData.fromIDLDeserializable(Map obj) {
    return PublicTokenPricesData(
      close: obj['close'],
      high: obj['high'],
      id: obj['id'] is BigInt ? obj['id'] : BigInt.from(obj['id']),
      low: obj['low'],
      open: obj['open'],
      timestamp: obj['timestamp'] is BigInt
          ? obj['timestamp']
          : BigInt.from(obj['timestamp']),
    );
  }

  factory PublicTokenPricesData.fromJson(Map json) {
    return PublicTokenPricesData(
      close: json['close'],
      high: json['high'],
      id: json['id'] is BigInt
          ? json['id']
          : json['id'] is num
              ? BigInt.from(json['id'])
              : BigInt.parse('${json['id']}'),
      low: json['low'],
      open: json['open'],
      timestamp: json['timestamp'] is BigInt
          ? json['timestamp']
          : json['timestamp'] is num
              ? BigInt.from(json['timestamp'])
              : BigInt.parse('${json['timestamp']}'),
    );
  }

  /// [close] defined in Candid: `close: float64`
  final double close;

  /// [high] defined in Candid: `high: float64`
  final double high;

  /// [id] defined in Candid: `id: int`
  final BigInt id;

  /// [low] defined in Candid: `low: float64`
  final double low;

  /// [open] defined in Candid: `open: float64`
  final double open;

  /// [timestamp] defined in Candid: `timestamp: int`
  final BigInt timestamp;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final close = this.close;
    final high = this.high;
    final id = this.id;
    final low = this.low;
    final open = this.open;
    final timestamp = this.timestamp;
    return {
      'close': close,
      'high': high,
      'id': id,
      'low': low,
      'open': open,
      'timestamp': timestamp,
    };
  }

  Map<String, dynamic> toJson() {
    final close = this.close;
    final high = this.high;
    final id = this.id.toString();
    final low = this.low;
    final open = this.open;
    final timestamp = this.timestamp.toString();
    return {
      'close': close,
      'high': high,
      'id': id,
      'low': low,
      'open': open,
      'timestamp': timestamp,
    };
  }

  PublicTokenPricesData copyWith({
    double? close,
    double? high,
    BigInt? id,
    double? low,
    double? open,
    BigInt? timestamp,
  }) {
    return PublicTokenPricesData(
      close: close ?? this.close,
      high: high ?? this.high,
      id: id ?? this.id,
      low: low ?? this.low,
      open: open ?? this.open,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PublicTokenPricesData &&
            (identical(other.close, close) || other.close == close) &&
            (identical(other.high, high) || other.high == high) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.low, low) || other.low == low) &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode =>
      Object.hashAll([runtimeType, close, high, id, low, open, timestamp]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [PublicTokenOverview] defined in Candid
/// ```Candid
///   record { address: text; feesUSD: float64; id: nat; name: text; priceUSD: float64; priceUSDChange: float64; priceUSDChangeWeek: float64; standard: text; symbol: text; totalVolumeUSD: float64; tvlToken: float64; tvlUSD: float64; tvlUSDChange: float64; txCount: int; volumeUSD: float64; volumeUSDChange: float64; volumeUSDWeek: float64 }
/// ```
@immutable
class PublicTokenOverview {
  const PublicTokenOverview({
    required this.address,
    required this.feesUSD,
    required this.id,
    required this.name,
    required this.priceUSD,
    required this.priceUSDChange,
    required this.priceUSDChangeWeek,
    required this.standard,
    required this.symbol,
    required this.totalVolumeUSD,
    required this.tvlToken,
    required this.tvlUSD,
    required this.tvlUSDChange,
    required this.txCount,
    required this.volumeUSD,
    required this.volumeUSDChange,
    required this.volumeUSDWeek,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory PublicTokenOverview.fromIDLDeserializable(Map obj) {
    return PublicTokenOverview(
      address: obj['address'],
      feesUSD: obj['feesUSD'],
      id: obj['id'] is BigInt ? obj['id'] : BigInt.from(obj['id']),
      name: obj['name'],
      priceUSD: obj['priceUSD'],
      priceUSDChange: obj['priceUSDChange'],
      priceUSDChangeWeek: obj['priceUSDChangeWeek'],
      standard: obj['standard'],
      symbol: obj['symbol'],
      totalVolumeUSD: obj['totalVolumeUSD'],
      tvlToken: obj['tvlToken'],
      tvlUSD: obj['tvlUSD'],
      tvlUSDChange: obj['tvlUSDChange'],
      txCount: obj['txCount'] is BigInt
          ? obj['txCount']
          : BigInt.from(obj['txCount']),
      volumeUSD: obj['volumeUSD'],
      volumeUSDChange: obj['volumeUSDChange'],
      volumeUSDWeek: obj['volumeUSDWeek'],
    );
  }

  factory PublicTokenOverview.fromJson(Map json) {
    return PublicTokenOverview(
      address: json['address'],
      feesUSD: json['feesUSD'],
      id: json['id'] is BigInt
          ? json['id']
          : json['id'] is num
              ? BigInt.from(json['id'])
              : BigInt.parse('${json['id']}'),
      name: json['name'],
      priceUSD: json['priceUSD'],
      priceUSDChange: json['priceUSDChange'],
      priceUSDChangeWeek: json['priceUSDChangeWeek'],
      standard: json['standard'],
      symbol: json['symbol'],
      totalVolumeUSD: json['totalVolumeUSD'],
      tvlToken: json['tvlToken'],
      tvlUSD: json['tvlUSD'],
      tvlUSDChange: json['tvlUSDChange'],
      txCount: json['txCount'] is BigInt
          ? json['txCount']
          : json['txCount'] is num
              ? BigInt.from(json['txCount'])
              : BigInt.parse('${json['txCount']}'),
      volumeUSD: json['volumeUSD'],
      volumeUSDChange: json['volumeUSDChange'],
      volumeUSDWeek: json['volumeUSDWeek'],
    );
  }

  /// [address] defined in Candid: `address: text`
  final String address;

  /// [feesUSD] defined in Candid: `feesUSD: float64`
  final double feesUSD;

  /// [id] defined in Candid: `id: nat`
  final BigInt id;

  /// [name] defined in Candid: `name: text`
  final String name;

  /// [priceUSD] defined in Candid: `priceUSD: float64`
  final double priceUSD;

  /// [priceUSDChange] defined in Candid: `priceUSDChange: float64`
  final double priceUSDChange;

  /// [priceUSDChangeWeek] defined in Candid: `priceUSDChangeWeek: float64`
  final double priceUSDChangeWeek;

  /// [standard] defined in Candid: `standard: text`
  final String standard;

  /// [symbol] defined in Candid: `symbol: text`
  final String symbol;

  /// [totalVolumeUSD] defined in Candid: `totalVolumeUSD: float64`
  final double totalVolumeUSD;

  /// [tvlToken] defined in Candid: `tvlToken: float64`
  final double tvlToken;

  /// [tvlUSD] defined in Candid: `tvlUSD: float64`
  final double tvlUSD;

  /// [tvlUSDChange] defined in Candid: `tvlUSDChange: float64`
  final double tvlUSDChange;

  /// [txCount] defined in Candid: `txCount: int`
  final BigInt txCount;

  /// [volumeUSD] defined in Candid: `volumeUSD: float64`
  final double volumeUSD;

  /// [volumeUSDChange] defined in Candid: `volumeUSDChange: float64`
  final double volumeUSDChange;

  /// [volumeUSDWeek] defined in Candid: `volumeUSDWeek: float64`
  final double volumeUSDWeek;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final address = this.address;
    final feesUSD = this.feesUSD;
    final id = this.id;
    final name = this.name;
    final priceUSD = this.priceUSD;
    final priceUSDChange = this.priceUSDChange;
    final priceUSDChangeWeek = this.priceUSDChangeWeek;
    final standard = this.standard;
    final symbol = this.symbol;
    final totalVolumeUSD = this.totalVolumeUSD;
    final tvlToken = this.tvlToken;
    final tvlUSD = this.tvlUSD;
    final tvlUSDChange = this.tvlUSDChange;
    final txCount = this.txCount;
    final volumeUSD = this.volumeUSD;
    final volumeUSDChange = this.volumeUSDChange;
    final volumeUSDWeek = this.volumeUSDWeek;
    return {
      'address': address,
      'feesUSD': feesUSD,
      'id': id,
      'name': name,
      'priceUSD': priceUSD,
      'priceUSDChange': priceUSDChange,
      'priceUSDChangeWeek': priceUSDChangeWeek,
      'standard': standard,
      'symbol': symbol,
      'totalVolumeUSD': totalVolumeUSD,
      'tvlToken': tvlToken,
      'tvlUSD': tvlUSD,
      'tvlUSDChange': tvlUSDChange,
      'txCount': txCount,
      'volumeUSD': volumeUSD,
      'volumeUSDChange': volumeUSDChange,
      'volumeUSDWeek': volumeUSDWeek,
    };
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final feesUSD = this.feesUSD;
    final id = this.id.toString();
    final name = this.name;
    final priceUSD = this.priceUSD;
    final priceUSDChange = this.priceUSDChange;
    final priceUSDChangeWeek = this.priceUSDChangeWeek;
    final standard = this.standard;
    final symbol = this.symbol;
    final totalVolumeUSD = this.totalVolumeUSD;
    final tvlToken = this.tvlToken;
    final tvlUSD = this.tvlUSD;
    final tvlUSDChange = this.tvlUSDChange;
    final txCount = this.txCount.toString();
    final volumeUSD = this.volumeUSD;
    final volumeUSDChange = this.volumeUSDChange;
    final volumeUSDWeek = this.volumeUSDWeek;
    return {
      'address': address,
      'feesUSD': feesUSD,
      'id': id,
      'name': name,
      'priceUSD': priceUSD,
      'priceUSDChange': priceUSDChange,
      'priceUSDChangeWeek': priceUSDChangeWeek,
      'standard': standard,
      'symbol': symbol,
      'totalVolumeUSD': totalVolumeUSD,
      'tvlToken': tvlToken,
      'tvlUSD': tvlUSD,
      'tvlUSDChange': tvlUSDChange,
      'txCount': txCount,
      'volumeUSD': volumeUSD,
      'volumeUSDChange': volumeUSDChange,
      'volumeUSDWeek': volumeUSDWeek,
    };
  }

  PublicTokenOverview copyWith({
    String? address,
    double? feesUSD,
    BigInt? id,
    String? name,
    double? priceUSD,
    double? priceUSDChange,
    double? priceUSDChangeWeek,
    String? standard,
    String? symbol,
    double? totalVolumeUSD,
    double? tvlToken,
    double? tvlUSD,
    double? tvlUSDChange,
    BigInt? txCount,
    double? volumeUSD,
    double? volumeUSDChange,
    double? volumeUSDWeek,
  }) {
    return PublicTokenOverview(
      address: address ?? this.address,
      feesUSD: feesUSD ?? this.feesUSD,
      id: id ?? this.id,
      name: name ?? this.name,
      priceUSD: priceUSD ?? this.priceUSD,
      priceUSDChange: priceUSDChange ?? this.priceUSDChange,
      priceUSDChangeWeek: priceUSDChangeWeek ?? this.priceUSDChangeWeek,
      standard: standard ?? this.standard,
      symbol: symbol ?? this.symbol,
      totalVolumeUSD: totalVolumeUSD ?? this.totalVolumeUSD,
      tvlToken: tvlToken ?? this.tvlToken,
      tvlUSD: tvlUSD ?? this.tvlUSD,
      tvlUSDChange: tvlUSDChange ?? this.tvlUSDChange,
      txCount: txCount ?? this.txCount,
      volumeUSD: volumeUSD ?? this.volumeUSD,
      volumeUSDChange: volumeUSDChange ?? this.volumeUSDChange,
      volumeUSDWeek: volumeUSDWeek ?? this.volumeUSDWeek,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PublicTokenOverview &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.feesUSD, feesUSD) || other.feesUSD == feesUSD) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.priceUSD, priceUSD) ||
                other.priceUSD == priceUSD) &&
            (identical(other.priceUSDChange, priceUSDChange) ||
                other.priceUSDChange == priceUSDChange) &&
            (identical(other.priceUSDChangeWeek, priceUSDChangeWeek) ||
                other.priceUSDChangeWeek == priceUSDChangeWeek) &&
            (identical(other.standard, standard) ||
                other.standard == standard) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.totalVolumeUSD, totalVolumeUSD) ||
                other.totalVolumeUSD == totalVolumeUSD) &&
            (identical(other.tvlToken, tvlToken) ||
                other.tvlToken == tvlToken) &&
            (identical(other.tvlUSD, tvlUSD) || other.tvlUSD == tvlUSD) &&
            (identical(other.tvlUSDChange, tvlUSDChange) ||
                other.tvlUSDChange == tvlUSDChange) &&
            (identical(other.txCount, txCount) || other.txCount == txCount) &&
            (identical(other.volumeUSD, volumeUSD) ||
                other.volumeUSD == volumeUSD) &&
            (identical(other.volumeUSDChange, volumeUSDChange) ||
                other.volumeUSDChange == volumeUSDChange) &&
            (identical(other.volumeUSDWeek, volumeUSDWeek) ||
                other.volumeUSDWeek == volumeUSDWeek));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        address,
        feesUSD,
        id,
        name,
        priceUSD,
        priceUSDChange,
        priceUSDChangeWeek,
        standard,
        symbol,
        totalVolumeUSD,
        tvlToken,
        tvlUSD,
        tvlUSDChange,
        txCount,
        volumeUSD,
        volumeUSDChange,
        volumeUSDWeek
      ]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [PublicTokenChartDayData] defined in Candid
/// ```Candid
///   record { id: int; timestamp: int; tvlUSD: float64; txCount: int; volumeUSD: float64 }
/// ```
@immutable
class PublicTokenChartDayData {
  const PublicTokenChartDayData({
    required this.id,
    required this.timestamp,
    required this.tvlUSD,
    required this.txCount,
    required this.volumeUSD,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory PublicTokenChartDayData.fromIDLDeserializable(Map obj) {
    return PublicTokenChartDayData(
      id: obj['id'] is BigInt ? obj['id'] : BigInt.from(obj['id']),
      timestamp: obj['timestamp'] is BigInt
          ? obj['timestamp']
          : BigInt.from(obj['timestamp']),
      tvlUSD: obj['tvlUSD'],
      txCount: obj['txCount'] is BigInt
          ? obj['txCount']
          : BigInt.from(obj['txCount']),
      volumeUSD: obj['volumeUSD'],
    );
  }

  factory PublicTokenChartDayData.fromJson(Map json) {
    return PublicTokenChartDayData(
      id: json['id'] is BigInt
          ? json['id']
          : json['id'] is num
              ? BigInt.from(json['id'])
              : BigInt.parse('${json['id']}'),
      timestamp: json['timestamp'] is BigInt
          ? json['timestamp']
          : json['timestamp'] is num
              ? BigInt.from(json['timestamp'])
              : BigInt.parse('${json['timestamp']}'),
      tvlUSD: json['tvlUSD'],
      txCount: json['txCount'] is BigInt
          ? json['txCount']
          : json['txCount'] is num
              ? BigInt.from(json['txCount'])
              : BigInt.parse('${json['txCount']}'),
      volumeUSD: json['volumeUSD'],
    );
  }

  /// [id] defined in Candid: `id: int`
  final BigInt id;

  /// [timestamp] defined in Candid: `timestamp: int`
  final BigInt timestamp;

  /// [tvlUSD] defined in Candid: `tvlUSD: float64`
  final double tvlUSD;

  /// [txCount] defined in Candid: `txCount: int`
  final BigInt txCount;

  /// [volumeUSD] defined in Candid: `volumeUSD: float64`
  final double volumeUSD;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final id = this.id;
    final timestamp = this.timestamp;
    final tvlUSD = this.tvlUSD;
    final txCount = this.txCount;
    final volumeUSD = this.volumeUSD;
    return {
      'id': id,
      'timestamp': timestamp,
      'tvlUSD': tvlUSD,
      'txCount': txCount,
      'volumeUSD': volumeUSD,
    };
  }

  Map<String, dynamic> toJson() {
    final id = this.id.toString();
    final timestamp = this.timestamp.toString();
    final tvlUSD = this.tvlUSD;
    final txCount = this.txCount.toString();
    final volumeUSD = this.volumeUSD;
    return {
      'id': id,
      'timestamp': timestamp,
      'tvlUSD': tvlUSD,
      'txCount': txCount,
      'volumeUSD': volumeUSD,
    };
  }

  PublicTokenChartDayData copyWith({
    BigInt? id,
    BigInt? timestamp,
    double? tvlUSD,
    BigInt? txCount,
    double? volumeUSD,
  }) {
    return PublicTokenChartDayData(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      tvlUSD: tvlUSD ?? this.tvlUSD,
      txCount: txCount ?? this.txCount,
      volumeUSD: volumeUSD ?? this.volumeUSD,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PublicTokenChartDayData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.tvlUSD, tvlUSD) || other.tvlUSD == tvlUSD) &&
            (identical(other.txCount, txCount) || other.txCount == txCount) &&
            (identical(other.volumeUSD, volumeUSD) ||
                other.volumeUSD == volumeUSD));
  }

  @override
  int get hashCode =>
      Object.hashAll([runtimeType, id, timestamp, tvlUSD, txCount, volumeUSD]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [PoolInfo] defined in Candid
/// ```Candid
///   record { fee: int; pool: text; token0Decimals: float64; token0Id: text; token0Price: float64; token0Symbol: text; token1Decimals: float64; token1Id: text; token1Price: float64; token1Symbol: text }
/// ```
@immutable
class PoolInfo {
  const PoolInfo({
    required this.fee,
    required this.pool,
    required this.token0Decimals,
    required this.token0Id,
    required this.token0Price,
    required this.token0Symbol,
    required this.token1Decimals,
    required this.token1Id,
    required this.token1Price,
    required this.token1Symbol,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory PoolInfo.fromIDLDeserializable(Map obj) {
    return PoolInfo(
      fee: obj['fee'] is BigInt ? obj['fee'] : BigInt.from(obj['fee']),
      pool: obj['pool'],
      token0Decimals: obj['token0Decimals'],
      token0Id: obj['token0Id'],
      token0Price: obj['token0Price'],
      token0Symbol: obj['token0Symbol'],
      token1Decimals: obj['token1Decimals'],
      token1Id: obj['token1Id'],
      token1Price: obj['token1Price'],
      token1Symbol: obj['token1Symbol'],
    );
  }

  factory PoolInfo.fromJson(Map json) {
    return PoolInfo(
      fee: json['fee'] is BigInt
          ? json['fee']
          : json['fee'] is num
              ? BigInt.from(json['fee'])
              : BigInt.parse('${json['fee']}'),
      pool: json['pool'],
      token0Decimals: json['token0Decimals'],
      token0Id: json['token0Id'],
      token0Price: json['token0Price'],
      token0Symbol: json['token0Symbol'],
      token1Decimals: json['token1Decimals'],
      token1Id: json['token1Id'],
      token1Price: json['token1Price'],
      token1Symbol: json['token1Symbol'],
    );
  }

  /// [fee] defined in Candid: `fee: int`
  final BigInt fee;

  /// [pool] defined in Candid: `pool: text`
  final String pool;

  /// [token0Decimals] defined in Candid: `token0Decimals: float64`
  final double token0Decimals;

  /// [token0Id] defined in Candid: `token0Id: text`
  final String token0Id;

  /// [token0Price] defined in Candid: `token0Price: float64`
  final double token0Price;

  /// [token0Symbol] defined in Candid: `token0Symbol: text`
  final String token0Symbol;

  /// [token1Decimals] defined in Candid: `token1Decimals: float64`
  final double token1Decimals;

  /// [token1Id] defined in Candid: `token1Id: text`
  final String token1Id;

  /// [token1Price] defined in Candid: `token1Price: float64`
  final double token1Price;

  /// [token1Symbol] defined in Candid: `token1Symbol: text`
  final String token1Symbol;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final fee = this.fee;
    final pool = this.pool;
    final token0Decimals = this.token0Decimals;
    final token0Id = this.token0Id;
    final token0Price = this.token0Price;
    final token0Symbol = this.token0Symbol;
    final token1Decimals = this.token1Decimals;
    final token1Id = this.token1Id;
    final token1Price = this.token1Price;
    final token1Symbol = this.token1Symbol;
    return {
      'fee': fee,
      'pool': pool,
      'token0Decimals': token0Decimals,
      'token0Id': token0Id,
      'token0Price': token0Price,
      'token0Symbol': token0Symbol,
      'token1Decimals': token1Decimals,
      'token1Id': token1Id,
      'token1Price': token1Price,
      'token1Symbol': token1Symbol,
    };
  }

  Map<String, dynamic> toJson() {
    final fee = this.fee.toString();
    final pool = this.pool;
    final token0Decimals = this.token0Decimals;
    final token0Id = this.token0Id;
    final token0Price = this.token0Price;
    final token0Symbol = this.token0Symbol;
    final token1Decimals = this.token1Decimals;
    final token1Id = this.token1Id;
    final token1Price = this.token1Price;
    final token1Symbol = this.token1Symbol;
    return {
      'fee': fee,
      'pool': pool,
      'token0Decimals': token0Decimals,
      'token0Id': token0Id,
      'token0Price': token0Price,
      'token0Symbol': token0Symbol,
      'token1Decimals': token1Decimals,
      'token1Id': token1Id,
      'token1Price': token1Price,
      'token1Symbol': token1Symbol,
    };
  }

  PoolInfo copyWith({
    BigInt? fee,
    String? pool,
    double? token0Decimals,
    String? token0Id,
    double? token0Price,
    String? token0Symbol,
    double? token1Decimals,
    String? token1Id,
    double? token1Price,
    String? token1Symbol,
  }) {
    return PoolInfo(
      fee: fee ?? this.fee,
      pool: pool ?? this.pool,
      token0Decimals: token0Decimals ?? this.token0Decimals,
      token0Id: token0Id ?? this.token0Id,
      token0Price: token0Price ?? this.token0Price,
      token0Symbol: token0Symbol ?? this.token0Symbol,
      token1Decimals: token1Decimals ?? this.token1Decimals,
      token1Id: token1Id ?? this.token1Id,
      token1Price: token1Price ?? this.token1Price,
      token1Symbol: token1Symbol ?? this.token1Symbol,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PoolInfo &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.pool, pool) || other.pool == pool) &&
            (identical(other.token0Decimals, token0Decimals) ||
                other.token0Decimals == token0Decimals) &&
            (identical(other.token0Id, token0Id) ||
                other.token0Id == token0Id) &&
            (identical(other.token0Price, token0Price) ||
                other.token0Price == token0Price) &&
            (identical(other.token0Symbol, token0Symbol) ||
                other.token0Symbol == token0Symbol) &&
            (identical(other.token1Decimals, token1Decimals) ||
                other.token1Decimals == token1Decimals) &&
            (identical(other.token1Id, token1Id) ||
                other.token1Id == token1Id) &&
            (identical(other.token1Price, token1Price) ||
                other.token1Price == token1Price) &&
            (identical(other.token1Symbol, token1Symbol) ||
                other.token1Symbol == token1Symbol));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        fee,
        pool,
        token0Decimals,
        token0Id,
        token0Price,
        token0Symbol,
        token1Decimals,
        token1Id,
        token1Price,
        token1Symbol
      ]);

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

/// [GetTokenChartDataArg] defined in Candid
/// ```Candid
///   (text, nat, nat)
/// ```
@immutable
class GetTokenChartDataArg {
  const GetTokenChartDataArg(
    this.item1,
    this.item2,
    this.item3,
  );

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory GetTokenChartDataArg.fromIDLDeserializable(List<dynamic> tuple) {
    return GetTokenChartDataArg(
      tuple[0],
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
      tuple[2] is BigInt ? tuple[2] : BigInt.from(tuple[2]),
    );
  }

  factory GetTokenChartDataArg.fromJson(List<dynamic> tuple) {
    return GetTokenChartDataArg(
      tuple[0],
      tuple[1] is BigInt
          ? tuple[1]
          : tuple[1] is num
              ? BigInt.from(tuple[1])
              : BigInt.parse('${tuple[1]}'),
      tuple[2] is BigInt
          ? tuple[2]
          : tuple[2] is num
              ? BigInt.from(tuple[2])
              : BigInt.parse('${tuple[2]}'),
    );
  }

  /// [item1] defined in Candid: `text`
  final String item1;

  /// [item2] defined in Candid: `nat`
  final BigInt item2;

  /// [item3] defined in Candid: `nat`
  final BigInt item3;

  /// An extra method for the serialization with `packages:agent_dart`.
  List<dynamic> toIDLSerializable() {
    final item1 = this.item1;
    final item2 = this.item2;
    final item3 = this.item3;
    return [
      item1,
      item2,
      item3,
    ];
  }

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2.toString();
    final item3 = this.item3.toString();
    return [
      item1,
      item2,
      item3,
    ];
  }

  GetTokenChartDataArg copyWith({
    String? item1,
    BigInt? item2,
    BigInt? item3,
  }) {
    return GetTokenChartDataArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetTokenChartDataArg &&
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

/// [GetTokenPricesDataArg] defined in Candid
/// ```Candid
///   (text, int, int, nat)
/// ```
@immutable
class GetTokenPricesDataArg {
  const GetTokenPricesDataArg(
    this.item1,
    this.item2,
    this.item3,
    this.item4,
  );

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory GetTokenPricesDataArg.fromIDLDeserializable(List<dynamic> tuple) {
    return GetTokenPricesDataArg(
      tuple[0],
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
      tuple[2] is BigInt ? tuple[2] : BigInt.from(tuple[2]),
      tuple[3] is BigInt ? tuple[3] : BigInt.from(tuple[3]),
    );
  }

  factory GetTokenPricesDataArg.fromJson(List<dynamic> tuple) {
    return GetTokenPricesDataArg(
      tuple[0],
      tuple[1] is BigInt
          ? tuple[1]
          : tuple[1] is num
              ? BigInt.from(tuple[1])
              : BigInt.parse('${tuple[1]}'),
      tuple[2] is BigInt
          ? tuple[2]
          : tuple[2] is num
              ? BigInt.from(tuple[2])
              : BigInt.parse('${tuple[2]}'),
      tuple[3] is BigInt
          ? tuple[3]
          : tuple[3] is num
              ? BigInt.from(tuple[3])
              : BigInt.parse('${tuple[3]}'),
    );
  }

  /// [item1] defined in Candid: `text`
  final String item1;

  /// [item2] defined in Candid: `int`
  final BigInt item2;

  /// [item3] defined in Candid: `int`
  final BigInt item3;

  /// [item4] defined in Candid: `nat`
  final BigInt item4;

  /// An extra method for the serialization with `packages:agent_dart`.
  List<dynamic> toIDLSerializable() {
    final item1 = this.item1;
    final item2 = this.item2;
    final item3 = this.item3;
    final item4 = this.item4;
    return [
      item1,
      item2,
      item3,
      item4,
    ];
  }

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2.toString();
    final item3 = this.item3.toString();
    final item4 = this.item4.toString();
    return [
      item1,
      item2,
      item3,
      item4,
    ];
  }

  GetTokenPricesDataArg copyWith({
    String? item1,
    BigInt? item2,
    BigInt? item3,
    BigInt? item4,
  }) {
    return GetTokenPricesDataArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
      item4 ?? this.item4,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetTokenPricesDataArg &&
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

/// [GetTokenTransactionsArg] defined in Candid
/// ```Candid
///   (text, nat, nat)
/// ```
@immutable
class GetTokenTransactionsArg {
  const GetTokenTransactionsArg(
    this.item1,
    this.item2,
    this.item3,
  );

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory GetTokenTransactionsArg.fromIDLDeserializable(List<dynamic> tuple) {
    return GetTokenTransactionsArg(
      tuple[0],
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
      tuple[2] is BigInt ? tuple[2] : BigInt.from(tuple[2]),
    );
  }

  factory GetTokenTransactionsArg.fromJson(List<dynamic> tuple) {
    return GetTokenTransactionsArg(
      tuple[0],
      tuple[1] is BigInt
          ? tuple[1]
          : tuple[1] is num
              ? BigInt.from(tuple[1])
              : BigInt.parse('${tuple[1]}'),
      tuple[2] is BigInt
          ? tuple[2]
          : tuple[2] is num
              ? BigInt.from(tuple[2])
              : BigInt.parse('${tuple[2]}'),
    );
  }

  /// [item1] defined in Candid: `text`
  final String item1;

  /// [item2] defined in Candid: `nat`
  final BigInt item2;

  /// [item3] defined in Candid: `nat`
  final BigInt item3;

  /// An extra method for the serialization with `packages:agent_dart`.
  List<dynamic> toIDLSerializable() {
    final item1 = this.item1;
    final item2 = this.item2;
    final item3 = this.item3;
    return [
      item1,
      item2,
      item3,
    ];
  }

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2.toString();
    final item3 = this.item3.toString();
    return [
      item1,
      item2,
      item3,
    ];
  }

  GetTokenTransactionsArg copyWith({
    String? item1,
    BigInt? item2,
    BigInt? item3,
  }) {
    return GetTokenTransactionsArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetTokenTransactionsArg &&
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

/// [SaveTransactionsArg] defined in Candid
/// ```Candid
///   (TransactionsType, bool)
/// ```
@immutable
class SaveTransactionsArg {
  const SaveTransactionsArg(
    this.item1,
    this.item2,
  );

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory SaveTransactionsArg.fromIDLDeserializable(List<dynamic> tuple) {
    return SaveTransactionsArg(
      TransactionsType.fromIDLDeserializable(tuple[0]),
      tuple[1],
    );
  }

  factory SaveTransactionsArg.fromJson(List<dynamic> tuple) {
    return SaveTransactionsArg(
      TransactionsType.fromJson(tuple[0]),
      tuple[1],
    );
  }

  /// [item1] defined in Candid: `TransactionsType`
  final TransactionsType item1;

  /// [item2] defined in Candid: `bool`
  final bool item2;

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
    final item1 = this.item1.toJson();
    final item2 = this.item2;
    return [
      item1,
      item2,
    ];
  }

  SaveTransactionsArg copyWith({
    TransactionsType? item1,
    bool? item2,
  }) {
    return SaveTransactionsArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaveTransactionsArg &&
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
