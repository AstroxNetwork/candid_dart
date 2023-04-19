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

class XtcIDLActor {
  const XtcIDLActor._();

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
  ///   approve: (principal, nat) -> (TxReceipt)
  /// ```
  static Future<TxReceipt> approve(
    CanisterActor actor,
    ApproveArg arg,
  ) async {
    final dat = arg.toJson();
    final ret = await actor.getFunc('approve')!(dat);
    return TxReceipt.fromJson(ret);
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
  ///   historySize: () -> (nat) query
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
  ///   nameErc20: () -> (text) query
  /// ```
  static Future<String> nameErc20(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('nameErc20')!(dat);
    return ret;
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
  ///   transferErc20: (principal, nat) -> (TxReceiptLegacy)
  /// ```
  static Future<TxReceiptLegacy> transferErc20(
    CanisterActor actor,
    TransferErc20Arg arg,
  ) async {
    final dat = arg.toJson();
    final ret = await actor.getFunc('transferErc20')!(dat);
    return TxReceiptLegacy.fromJson(ret);
  }

  /// ```Candid
  ///   transfer: (principal, nat) -> (TxReceipt)
  /// ```
  static Future<TxReceipt> transfer(
    CanisterActor actor,
    TransferArg arg,
  ) async {
    final dat = arg.toJson();
    final ret = await actor.getFunc('transfer')!(dat);
    return TxReceipt.fromJson(ret);
  }

  /// ```Candid
  ///   transferFrom: (principal, principal, nat) -> (TxReceipt)
  /// ```
  static Future<TxReceipt> transferFrom(
    CanisterActor actor,
    TransferFromArg arg,
  ) async {
    final dat = arg.toJson();
    final ret = await actor.getFunc('transferFrom')!(dat);
    return TxReceipt.fromJson(ret);
  }

  /// ```Candid
  ///   mint: (principal, nat) -> (MintResult)
  /// ```
  static Future<MintResult> mint(
    CanisterActor actor,
    MintArg arg,
  ) async {
    final dat = arg.toJson();
    final ret = await actor.getFunc('mint')!(dat);
    return MintResult.fromJson(ret);
  }

  /// ```Candid
  ///   isBlockUsed: (nat64) -> (bool) query
  /// ```
  static Future<bool> isBlockUsed(
    CanisterActor actor,
    BigInt arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('isBlockUsed')!(dat);
    return ret;
  }

  /// ```Candid
  ///   getBlockUsed: () -> (vec nat64) query
  /// ```
  static Future<List<BigInt>> getBlockUsed(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('getBlockUsed')!(dat);
    return (ret as List).map((e) {
      return e is BigInt ? e : BigInt.from(e);
    }).toList();
  }

  /// ```Candid
  ///   get_map_block_used: (nat64) -> (opt nat64) query
  /// ```
  static Future<BigInt?> getMapBlockUsed(
    CanisterActor actor,
    BigInt arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('get_map_block_used')!(dat);
    return (ret as List).map((e) {
      return e == null
          ? null
          : e is BigInt
              ? e
              : BigInt.from(e);
    }).firstOrNull;
  }

  /// ```Candid
  ///   mint_by_icp: (opt vec nat8, nat64) -> (TxReceipt)
  /// ```
  static Future<TxReceipt> mintByIcp(
    CanisterActor actor,
    MintByIcpArg arg,
  ) async {
    final dat = arg.toJson();
    final ret = await actor.getFunc('mint_by_icp')!(dat);
    return TxReceipt.fromJson(ret);
  }

  /// ```Candid
  ///   mint_by_icp_recover: (opt vec nat8, nat64, principal) -> (TxReceipt)
  /// ```
  static Future<TxReceipt> mintByIcpRecover(
    CanisterActor actor,
    MintByIcpRecoverArg arg,
  ) async {
    final dat = arg.toJson();
    final ret = await actor.getFunc('mint_by_icp_recover')!(dat);
    return TxReceipt.fromJson(ret);
  }

  /// ```Candid
  ///   burn: (record { canister_id: principal; amount: nat64 }) -> (BurnResult)
  /// ```
  static Future<BurnResult> burn(
    CanisterActor actor,
    BurnArg0 arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('burn')!(dat);
    return BurnResult.fromJson(ret);
  }

  /// ```Candid
  ///   balance: (opt principal) -> (amount: nat64)
  /// ```
  static Future<BigInt> balance(
    CanisterActor actor, [
    Principal? arg,
  ]) async {
    final dat = [
      [if (arg != null) arg]
    ];
    final ret = await actor.getFunc('balance')!(dat);
    return ret is BigInt ? ret : BigInt.from(ret);
  }

  /// ```Candid
  ///   events: (record { offset: opt nat64; limit: nat16 }) -> (EventsConnection) query
  /// ```
  static Future<EventsConnection> events(
    CanisterActor actor,
    EventsArg0 arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('events')!(dat);
    return EventsConnection.fromJson(ret);
  }

  /// ```Candid
  ///   halt: () -> ()
  /// ```
  static Future<void> halt(
    CanisterActor actor,
  ) async {
    const dat = [];
    await actor.getFunc('halt')!(dat);
  }

  /// ```Candid
  ///   stats: () -> (Stats) query
  /// ```
  static Future<Stats> stats(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('stats')!(dat);
    return Stats.fromJson(ret);
  }

  /// ```Candid
  ///   wallet_balance: () -> (record { amount: nat64 }) query
  /// ```
  static Future<WalletBalanceRet0> walletBalance(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('wallet_balance')!(dat);
    return WalletBalanceRet0.fromJson(
      ret,
    );
  }

  /// ```Candid
  ///   wallet_create_canister: (record { cycles: nat64; controller: opt principal }) -> (CreateResult)
  /// ```
  static Future<CreateResult> walletCreateCanister(
    CanisterActor actor,
    WalletCreateCanisterArg0 arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('wallet_create_canister')!(dat);
    return CreateResult.fromJson(ret);
  }

  /// ```Candid
  ///   wallet_create_wallet: (record { cycles: nat64; controller: opt principal }) -> (CreateResult)
  /// ```
  static Future<CreateResult> walletCreateWallet(
    CanisterActor actor,
    WalletCreateWalletArg0 arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('wallet_create_wallet')!(dat);
    return CreateResult.fromJson(ret);
  }

  /// ```Candid
  ///   wallet_call: (record { canister: principal; method_name: text; args: blob; cycles: nat64 }) -> (ResultCall)
  /// ```
  static Future<ResultCall> walletCall(
    CanisterActor actor,
    WalletCallArg0 arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('wallet_call')!(dat);
    return ResultCall.fromJson(ret);
  }
}

class XtcIDLService {
  XtcIDLService({
    required this.canisterId,
    required this.uri,
    this.identity,
    this.createActorMethod,
    this.debug = true,
  }) : idl = XtcIDL.idl;

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
    return XtcIDLActor.allowance(
      actor,
      arg,
    );
  }

  Future<TxReceipt> approve(
    ApproveArg arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.approve(
      actor,
      arg,
    );
  }

  Future<BigInt> balanceOf(
    Principal arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.balanceOf(
      actor,
      arg,
    );
  }

  Future<int> decimals() async {
    final actor = await getActor();
    return XtcIDLActor.decimals(
      actor,
    );
  }

  Future<Metadata> getMetadata() async {
    final actor = await getActor();
    return XtcIDLActor.getMetadata(
      actor,
    );
  }

  Future<BigInt> historySize() async {
    final actor = await getActor();
    return XtcIDLActor.historySize(
      actor,
    );
  }

  Future<String> logo() async {
    final actor = await getActor();
    return XtcIDLActor.logo(
      actor,
    );
  }

  Future<String> nameErc20() async {
    final actor = await getActor();
    return XtcIDLActor.nameErc20(
      actor,
    );
  }

  Future<String> name() async {
    final actor = await getActor();
    return XtcIDLActor.name(
      actor,
    );
  }

  Future<String> symbol() async {
    final actor = await getActor();
    return XtcIDLActor.symbol(
      actor,
    );
  }

  Future<BigInt> totalSupply() async {
    final actor = await getActor();
    return XtcIDLActor.totalSupply(
      actor,
    );
  }

  Future<TxReceiptLegacy> transferErc20(
    TransferErc20Arg arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.transferErc20(
      actor,
      arg,
    );
  }

  Future<TxReceipt> transfer(
    TransferArg arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.transfer(
      actor,
      arg,
    );
  }

  Future<TxReceipt> transferFrom(
    TransferFromArg arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.transferFrom(
      actor,
      arg,
    );
  }

  Future<MintResult> mint(
    MintArg arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.mint(
      actor,
      arg,
    );
  }

  Future<bool> isBlockUsed(
    BigInt arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.isBlockUsed(
      actor,
      arg,
    );
  }

  Future<List<BigInt>> getBlockUsed() async {
    final actor = await getActor();
    return XtcIDLActor.getBlockUsed(
      actor,
    );
  }

  Future<BigInt?> getMapBlockUsed(
    BigInt arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.getMapBlockUsed(
      actor,
      arg,
    );
  }

  Future<TxReceipt> mintByIcp(
    MintByIcpArg arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.mintByIcp(
      actor,
      arg,
    );
  }

  Future<TxReceipt> mintByIcpRecover(
    MintByIcpRecoverArg arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.mintByIcpRecover(
      actor,
      arg,
    );
  }

  Future<BurnResult> burn(
    BurnArg0 arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.burn(
      actor,
      arg,
    );
  }

  Future<BigInt> balance([
    Principal? arg,
  ]) async {
    final actor = await getActor();
    return XtcIDLActor.balance(
      actor,
      arg,
    );
  }

  Future<EventsConnection> events(
    EventsArg0 arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.events(
      actor,
      arg,
    );
  }

  Future<void> halt() async {
    final actor = await getActor();
    return XtcIDLActor.halt(
      actor,
    );
  }

  Future<Stats> stats() async {
    final actor = await getActor();
    return XtcIDLActor.stats(
      actor,
    );
  }

  Future<WalletBalanceRet0> walletBalance() async {
    final actor = await getActor();
    return XtcIDLActor.walletBalance(
      actor,
    );
  }

  Future<CreateResult> walletCreateCanister(
    WalletCreateCanisterArg0 arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.walletCreateCanister(
      actor,
      arg,
    );
  }

  Future<CreateResult> walletCreateWallet(
    WalletCreateWalletArg0 arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.walletCreateWallet(
      actor,
      arg,
    );
  }

  Future<ResultCall> walletCall(
    WalletCallArg0 arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.walletCall(
      actor,
      arg,
    );
  }
}

class XtcIDL {
  const XtcIDL._();

  /// [_Metadata] defined in Candid
  /// ```Candid
  ///   type Metadata = record { decimals: nat8; fee: nat; logo: text; name: text; owner: principal; symbol: text; totalSupply: nat };
  /// ```
  static final RecordClass _Metadata = IDL.Record({
    'decimals': IDL.Nat8,
    'fee': IDL.Nat,
    'logo': IDL.Text,
    'name': IDL.Text,
    'owner': IDL.Principal,
    'symbol': IDL.Text,
    'totalSupply': IDL.Nat,
  });

  /// [_TxError] defined in Candid
  /// ```Candid
  ///   type TxError = variant { InsufficientAllowance; InsufficientBalance; ErrorOperationStyle; Unauthorized; LedgerTrap; ErrorTo; Other; BlockUsed; FetchRateFailed; NotifyDfxFailed; UnexpectedCyclesResponse; AmountTooSmall; InsufficientXTCFee };
  /// ```
  static final VariantClass _TxError = IDL.Variant({
    'InsufficientAllowance': IDL.Null,
    'InsufficientBalance': IDL.Null,
    'ErrorOperationStyle': IDL.Null,
    'Unauthorized': IDL.Null,
    'LedgerTrap': IDL.Null,
    'ErrorTo': IDL.Null,
    'Other': IDL.Null,
    'BlockUsed': IDL.Null,
    'FetchRateFailed': IDL.Null,
    'NotifyDfxFailed': IDL.Null,
    'UnexpectedCyclesResponse': IDL.Null,
    'AmountTooSmall': IDL.Null,
    'InsufficientXTCFee': IDL.Null,
  });

  /// [_TxReceipt] defined in Candid
  /// ```Candid
  ///   type TxReceipt = variant { Ok: nat; Err: TxError };
  /// ```
  static final VariantClass _TxReceipt = IDL.Variant({
    'Ok': IDL.Nat,
    'Err': _TxError,
  });

  /// [_TransactionId] defined in Candid
  /// ```Candid
  ///   type TransactionId = nat64;
  /// ```
  static final _TransactionId = IDL.Nat64;

  /// [_BurnError] defined in Candid
  /// ```Candid
  ///   type BurnError = variant { InsufficientBalance; InvalidTokenContract; NotSufficientLiquidity };
  /// ```
  static final VariantClass _BurnError = IDL.Variant({
    'InsufficientBalance': IDL.Null,
    'InvalidTokenContract': IDL.Null,
    'NotSufficientLiquidity': IDL.Null,
  });

  /// [_BurnResult] defined in Candid
  /// ```Candid
  ///   type BurnResult = variant { Ok: TransactionId; Err: BurnError };
  /// ```
  static final VariantClass _BurnResult = IDL.Variant({
    'Ok': _TransactionId,
    'Err': _BurnError,
  });

  /// [_TxReceiptLegacy] defined in Candid
  /// ```Candid
  ///   type TxReceiptLegacy = variant { Err: variant { InsufficientAllowance; InsufficientBalance }; Ok: nat };
  /// ```
  static final VariantClass _TxReceiptLegacy = IDL.Variant({
    'Err': IDL.Variant({
      'InsufficientAllowance': IDL.Null,
      'InsufficientBalance': IDL.Null,
    }),
    'Ok': IDL.Nat,
  });

  /// [_MintError] defined in Candid
  /// ```Candid
  ///   type MintError = variant { NotSufficientLiquidity };
  /// ```
  static final VariantClass _MintError = IDL.Variant({
    'NotSufficientLiquidity': IDL.Null,
  });

  /// [_MintResult] defined in Candid
  /// ```Candid
  ///   type MintResult = variant { Ok: TransactionId; Err: MintError };
  /// ```
  static final VariantClass _MintResult = IDL.Variant({
    'Ok': _TransactionId,
    'Err': _MintError,
  });

  /// [_ResultCall] defined in Candid
  /// ```Candid
  ///   type ResultCall = variant { Ok: record { returnKey: blob }; Err: text };
  /// ```
  static final VariantClass _ResultCall = IDL.Variant({
    'Ok': IDL.Record({
      'returnKey': IDL.Vec(IDL.Nat8),
    }),
    'Err': IDL.Text,
  });

  /// [_CreateResult] defined in Candid
  /// ```Candid
  ///   type CreateResult = variant { Ok: record { canister_id: principal }; Err: text };
  /// ```
  static final VariantClass _CreateResult = IDL.Variant({
    'Ok': IDL.Record({
      'canister_id': IDL.Principal,
    }),
    'Err': IDL.Text,
  });

  /// [_EventDetail] defined in Candid
  /// ```Candid
  ///   type EventDetail = variant { Transfer: record { from: principal; to: principal }; Mint: record { to: principal }; Burn: record { from: principal; to: principal }; CanisterCalled: record { from: principal; canister: principal; method_name: text }; CanisterCreated: record { from: principal; canister: principal }; TransferFrom: record { caller: principal; from: principal; to: principal }; Approve: record { from: principal; to: principal } };
  /// ```
  static final VariantClass _EventDetail = IDL.Variant({
    'Transfer': IDL.Record({
      'from': IDL.Principal,
      'to': IDL.Principal,
    }),
    'Mint': IDL.Record({
      'to': IDL.Principal,
    }),
    'Burn': IDL.Record({
      'from': IDL.Principal,
      'to': IDL.Principal,
    }),
    'CanisterCalled': IDL.Record({
      'from': IDL.Principal,
      'canister': IDL.Principal,
      'method_name': IDL.Text,
    }),
    'CanisterCreated': IDL.Record({
      'from': IDL.Principal,
      'canister': IDL.Principal,
    }),
    'TransferFrom': IDL.Record({
      'caller': IDL.Principal,
      'from': IDL.Principal,
      'to': IDL.Principal,
    }),
    'Approve': IDL.Record({
      'from': IDL.Principal,
      'to': IDL.Principal,
    }),
  });

  /// [_TransactionStatus] defined in Candid
  /// ```Candid
  ///   type TransactionStatus = variant { SUCCEEDED; FAILED };
  /// ```
  static final VariantClass _TransactionStatus = IDL.Variant({
    'SUCCEEDED': IDL.Null,
    'FAILED': IDL.Null,
  });

  /// [_Event] defined in Candid
  /// ```Candid
  ///   type Event = record { fee: nat64; kind: EventDetail; cycles: nat64; timestamp: nat64; status: TransactionStatus };
  /// ```
  static final RecordClass _Event = IDL.Record({
    'fee': IDL.Nat64,
    'kind': _EventDetail,
    'cycles': IDL.Nat64,
    'timestamp': IDL.Nat64,
    'status': _TransactionStatus,
  });

  /// [_EventsConnection] defined in Candid
  /// ```Candid
  ///   type EventsConnection = record { data: vec Event; next_offset: TransactionId; next_canister_id: opt principal };
  /// ```
  static final RecordClass _EventsConnection = IDL.Record({
    'data': IDL.Vec(
      _Event,
    ),
    'next_offset': _TransactionId,
    'next_canister_id': IDL.Opt(
      IDL.Principal,
    ),
  });

  /// [_Stats] defined in Candid
  /// ```Candid
  ///   type Stats = record { supply: nat; fee: nat; history_events: nat64; balance: nat64; transfers_count: nat64; transfers_from_count: nat64; approvals_count: nat64; mints_count: nat64; burns_count: nat64; proxy_calls_count: nat64; canisters_created_count: nat64 };
  /// ```
  static final RecordClass _Stats = IDL.Record({
    'supply': IDL.Nat,
    'fee': IDL.Nat,
    'history_events': IDL.Nat64,
    'balance': IDL.Nat64,
    'transfers_count': IDL.Nat64,
    'transfers_from_count': IDL.Nat64,
    'approvals_count': IDL.Nat64,
    'mints_count': IDL.Nat64,
    'burns_count': IDL.Nat64,
    'proxy_calls_count': IDL.Nat64,
    'canisters_created_count': IDL.Nat64,
  });

  static final ServiceClass idl = IDL.Service({
    'allowance': IDL.Func(
      [IDL.Principal, IDL.Principal],
      [IDL.Nat],
      ['query'],
    ),
    'approve': IDL.Func(
      [IDL.Principal, IDL.Nat],
      [_TxReceipt],
      [],
    ),
    'balanceOf': IDL.Func(
      [IDL.Principal],
      [IDL.Nat],
      ['query'],
    ),
    'decimals': IDL.Func(
      [],
      [IDL.Nat8],
      ['query'],
    ),
    'getMetadata': IDL.Func(
      [],
      [_Metadata],
      ['query'],
    ),
    'historySize': IDL.Func(
      [],
      [IDL.Nat],
      ['query'],
    ),
    'logo': IDL.Func(
      [],
      [IDL.Text],
      ['query'],
    ),
    'nameErc20': IDL.Func(
      [],
      [IDL.Text],
      ['query'],
    ),
    'name': IDL.Func(
      [],
      [IDL.Text],
      ['query'],
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
    'transferErc20': IDL.Func(
      [IDL.Principal, IDL.Nat],
      [_TxReceiptLegacy],
      [],
    ),
    'transfer': IDL.Func(
      [IDL.Principal, IDL.Nat],
      [_TxReceipt],
      [],
    ),
    'transferFrom': IDL.Func(
      [IDL.Principal, IDL.Principal, IDL.Nat],
      [_TxReceipt],
      [],
    ),
    'mint': IDL.Func(
      [IDL.Principal, IDL.Nat],
      [_MintResult],
      [],
    ),
    'isBlockUsed': IDL.Func(
      [IDL.Nat64],
      [IDL.Bool],
      ['query'],
    ),
    'getBlockUsed': IDL.Func(
      [],
      [
        IDL.Vec(
          IDL.Nat64,
        )
      ],
      ['query'],
    ),
    'get_map_block_used': IDL.Func(
      [IDL.Nat64],
      [
        IDL.Opt(
          IDL.Nat64,
        )
      ],
      ['query'],
    ),
    'mint_by_icp': IDL.Func(
      [
        IDL.Opt(
          IDL.Vec(
            IDL.Nat8,
          ),
        ),
        IDL.Nat64
      ],
      [_TxReceipt],
      [],
    ),
    'mint_by_icp_recover': IDL.Func(
      [
        IDL.Opt(
          IDL.Vec(
            IDL.Nat8,
          ),
        ),
        IDL.Nat64,
        IDL.Principal
      ],
      [_TxReceipt],
      [],
    ),
    'burn': IDL.Func(
      [
        IDL.Record({
          'canister_id': IDL.Principal,
          'amount': IDL.Nat64,
        })
      ],
      [_BurnResult],
      [],
    ),
    'balance': IDL.Func(
      [
        IDL.Opt(
          IDL.Principal,
        )
      ],
      [IDL.Nat64],
      [],
    ),
    'events': IDL.Func(
      [
        IDL.Record({
          'offset': IDL.Opt(
            IDL.Nat64,
          ),
          'limit': IDL.Nat16,
        })
      ],
      [_EventsConnection],
      ['query'],
    ),
    'halt': IDL.Func(
      [],
      [],
      [],
    ),
    'stats': IDL.Func(
      [],
      [_Stats],
      ['query'],
    ),
    'wallet_balance': IDL.Func(
      [],
      [
        IDL.Record({
          'amount': IDL.Nat64,
        })
      ],
      ['query'],
    ),
    'wallet_create_canister': IDL.Func(
      [
        IDL.Record({
          'cycles': IDL.Nat64,
          'controller': IDL.Opt(
            IDL.Principal,
          ),
        })
      ],
      [_CreateResult],
      [],
    ),
    'wallet_create_wallet': IDL.Func(
      [
        IDL.Record({
          'cycles': IDL.Nat64,
          'controller': IDL.Opt(
            IDL.Principal,
          ),
        })
      ],
      [_CreateResult],
      [],
    ),
    'wallet_call': IDL.Func(
      [
        IDL.Record({
          'canister': IDL.Principal,
          'method_name': IDL.Text,
          'args': IDL.Vec(IDL.Nat8),
          'cycles': IDL.Nat64,
        })
      ],
      [_ResultCall],
      [],
    ),
  });
}

/// [BurnArg0] defined in Candid
/// ```Candid
///   record { canister_id: principal; amount: nat64 }
/// ```
@immutable
class BurnArg0 {
  const BurnArg0({
    /// [canisterId] defined in Candid: `canister_id: principal`
    required this.canisterId,

    /// [amount] defined in Candid: `amount: nat64`
    required this.amount,
  });

  factory BurnArg0.fromJson(Map json) {
    return BurnArg0(
      canisterId: Principal.from(json['canister_id']),
      amount: json['amount'] is BigInt
          ? json['amount']
          : BigInt.from(json['amount']),
    );
  }

  /// [canisterId] defined in Candid: `canister_id: principal`
  final Principal canisterId;

  /// [amount] defined in Candid: `amount: nat64`
  final BigInt amount;

  Map<String, dynamic> toJson() {
    final canisterId = this.canisterId;
    final amount = this.amount;
    return {
      'canister_id': canisterId,
      'amount': amount,
    };
  }

  BurnArg0 copyWith({
    /// [canisterId] defined in Candid: `canister_id: principal`
    Principal? canisterId,

    /// [amount] defined in Candid: `amount: nat64`
    BigInt? amount,
  }) {
    return BurnArg0(
      canisterId: canisterId ?? this.canisterId,
      amount: amount ?? this.amount,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BurnArg0 &&
            (identical(other.canisterId, canisterId) ||
                other.canisterId == canisterId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, canisterId, amount]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EventsArg0] defined in Candid
/// ```Candid
///   record { offset: opt nat64; limit: nat16 }
/// ```
@immutable
class EventsArg0 {
  const EventsArg0({
    /// [offset] defined in Candid: `offset: opt nat64`
    this.offset,

    /// [limit] defined in Candid: `limit: nat16`
    required this.limit,
  });

  factory EventsArg0.fromJson(Map json) {
    return EventsArg0(
      offset: (json['offset'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      limit: json['limit'],
    );
  }

  /// [offset] defined in Candid: `offset: opt nat64`
  final BigInt? offset;

  /// [limit] defined in Candid: `limit: nat16`
  final int limit;

  Map<String, dynamic> toJson() {
    final offset = this.offset;
    final limit = this.limit;
    return {
      'offset': [if (offset != null) offset],
      'limit': limit,
    };
  }

  EventsArg0 copyWith({
    /// [offset] defined in Candid: `offset: opt nat64`
    BigInt? offset,

    /// [limit] defined in Candid: `limit: nat16`
    int? limit,
  }) {
    return EventsArg0(
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventsArg0 &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, offset, limit]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [WalletBalanceRet0] defined in Candid
/// ```Candid
///   record { amount: nat64 }
/// ```
@immutable
class WalletBalanceRet0 {
  const WalletBalanceRet0(
      {
      /// [amount] defined in Candid: `amount: nat64`
      required this.amount});

  factory WalletBalanceRet0.fromJson(Map json) {
    return WalletBalanceRet0(
      amount: json['amount'] is BigInt
          ? json['amount']
          : BigInt.from(json['amount']),
    );
  }

  /// [amount] defined in Candid: `amount: nat64`
  final BigInt amount;

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    return {
      'amount': amount,
    };
  }

  WalletBalanceRet0 copyWith(
      {
      /// [amount] defined in Candid: `amount: nat64`
      BigInt? amount}) {
    return WalletBalanceRet0(
      amount: amount ?? this.amount,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WalletBalanceRet0 &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, amount]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [WalletCreateCanisterArg0] defined in Candid
/// ```Candid
///   record { cycles: nat64; controller: opt principal }
/// ```
@immutable
class WalletCreateCanisterArg0 {
  const WalletCreateCanisterArg0({
    /// [cycles] defined in Candid: `cycles: nat64`
    required this.cycles,

    /// [controller] defined in Candid: `controller: opt principal`
    this.controller,
  });

  factory WalletCreateCanisterArg0.fromJson(Map json) {
    return WalletCreateCanisterArg0(
      cycles: json['cycles'] is BigInt
          ? json['cycles']
          : BigInt.from(json['cycles']),
      controller: (json['controller'] as List).map((e) {
        return e == null ? null : Principal.from(e);
      }).firstOrNull,
    );
  }

  /// [cycles] defined in Candid: `cycles: nat64`
  final BigInt cycles;

  /// [controller] defined in Candid: `controller: opt principal`
  final Principal? controller;

  Map<String, dynamic> toJson() {
    final cycles = this.cycles;
    final controller = this.controller;
    return {
      'cycles': cycles,
      'controller': [if (controller != null) controller],
    };
  }

  WalletCreateCanisterArg0 copyWith({
    /// [cycles] defined in Candid: `cycles: nat64`
    BigInt? cycles,

    /// [controller] defined in Candid: `controller: opt principal`
    Principal? controller,
  }) {
    return WalletCreateCanisterArg0(
      cycles: cycles ?? this.cycles,
      controller: controller ?? this.controller,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WalletCreateCanisterArg0 &&
            (identical(other.cycles, cycles) || other.cycles == cycles) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, cycles, controller]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [WalletCreateWalletArg0] defined in Candid
/// ```Candid
///   record { cycles: nat64; controller: opt principal }
/// ```
typedef WalletCreateWalletArg0 = WalletCreateCanisterArg0;

/// [WalletCallArg0] defined in Candid
/// ```Candid
///   record { canister: principal; method_name: text; args: blob; cycles: nat64 }
/// ```
@immutable
class WalletCallArg0 {
  const WalletCallArg0({
    /// [canister] defined in Candid: `canister: principal`
    required this.canister,

    /// [methodName] defined in Candid: `method_name: text`
    required this.methodName,

    /// [args] defined in Candid: `args: blob`
    required this.args,

    /// [cycles] defined in Candid: `cycles: nat64`
    required this.cycles,
  });

  factory WalletCallArg0.fromJson(Map json) {
    return WalletCallArg0(
      canister: Principal.from(json['canister']),
      methodName: json['method_name'],
      args: json['args'] is Uint8List
          ? json['args']
          : Uint8List.fromList(json['args']),
      cycles: json['cycles'] is BigInt
          ? json['cycles']
          : BigInt.from(json['cycles']),
    );
  }

  /// [canister] defined in Candid: `canister: principal`
  final Principal canister;

  /// [methodName] defined in Candid: `method_name: text`
  final String methodName;

  /// [args] defined in Candid: `args: blob`
  final Uint8List args;

  /// [cycles] defined in Candid: `cycles: nat64`
  final BigInt cycles;

  Map<String, dynamic> toJson() {
    final canister = this.canister;
    final methodName = this.methodName;
    final args = this.args;
    final cycles = this.cycles;
    return {
      'canister': canister,
      'method_name': methodName,
      'args': args,
      'cycles': cycles,
    };
  }

  WalletCallArg0 copyWith({
    /// [canister] defined in Candid: `canister: principal`
    Principal? canister,

    /// [methodName] defined in Candid: `method_name: text`
    String? methodName,

    /// [args] defined in Candid: `args: blob`
    Uint8List? args,

    /// [cycles] defined in Candid: `cycles: nat64`
    BigInt? cycles,
  }) {
    return WalletCallArg0(
      canister: canister ?? this.canister,
      methodName: methodName ?? this.methodName,
      args: args ?? this.args,
      cycles: cycles ?? this.cycles,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WalletCallArg0 &&
            (identical(other.canister, canister) ||
                other.canister == canister) &&
            (identical(other.methodName, methodName) ||
                other.methodName == methodName) &&
            (identical(other.args, args) || other.args == args) &&
            (identical(other.cycles, cycles) || other.cycles == cycles));
  }

  @override
  int get hashCode =>
      Object.hashAll([runtimeType, canister, methodName, args, cycles]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Metadata] defined in Candid
/// ```Candid
///   record { decimals: nat8; fee: nat; logo: text; name: text; owner: principal; symbol: text; totalSupply: nat }
/// ```
@immutable
class Metadata {
  const Metadata({
    /// [decimals] defined in Candid: `decimals: nat8`
    required this.decimals,

    /// [fee] defined in Candid: `fee: nat`
    required this.fee,

    /// [logo] defined in Candid: `logo: text`
    required this.logo,

    /// [name] defined in Candid: `name: text`
    required this.name,

    /// [owner] defined in Candid: `owner: principal`
    required this.owner,

    /// [symbol] defined in Candid: `symbol: text`
    required this.symbol,

    /// [totalSupply] defined in Candid: `totalSupply: nat`
    required this.totalSupply,
  });

  factory Metadata.fromJson(Map json) {
    return Metadata(
      decimals: json['decimals'],
      fee: json['fee'] is BigInt ? json['fee'] : BigInt.from(json['fee']),
      logo: json['logo'],
      name: json['name'],
      owner: Principal.from(json['owner']),
      symbol: json['symbol'],
      totalSupply: json['totalSupply'] is BigInt
          ? json['totalSupply']
          : BigInt.from(json['totalSupply']),
    );
  }

  /// [decimals] defined in Candid: `decimals: nat8`
  final int decimals;

  /// [fee] defined in Candid: `fee: nat`
  final BigInt fee;

  /// [logo] defined in Candid: `logo: text`
  final String logo;

  /// [name] defined in Candid: `name: text`
  final String name;

  /// [owner] defined in Candid: `owner: principal`
  final Principal owner;

  /// [symbol] defined in Candid: `symbol: text`
  final String symbol;

  /// [totalSupply] defined in Candid: `totalSupply: nat`
  final BigInt totalSupply;

  Map<String, dynamic> toJson() {
    final decimals = this.decimals;
    final fee = this.fee;
    final logo = this.logo;
    final name = this.name;
    final owner = this.owner;
    final symbol = this.symbol;
    final totalSupply = this.totalSupply;
    return {
      'decimals': decimals,
      'fee': fee,
      'logo': logo,
      'name': name,
      'owner': owner,
      'symbol': symbol,
      'totalSupply': totalSupply,
    };
  }

  Metadata copyWith({
    /// [decimals] defined in Candid: `decimals: nat8`
    int? decimals,

    /// [fee] defined in Candid: `fee: nat`
    BigInt? fee,

    /// [logo] defined in Candid: `logo: text`
    String? logo,

    /// [name] defined in Candid: `name: text`
    String? name,

    /// [owner] defined in Candid: `owner: principal`
    Principal? owner,

    /// [symbol] defined in Candid: `symbol: text`
    String? symbol,

    /// [totalSupply] defined in Candid: `totalSupply: nat`
    BigInt? totalSupply,
  }) {
    return Metadata(
      decimals: decimals ?? this.decimals,
      fee: fee ?? this.fee,
      logo: logo ?? this.logo,
      name: name ?? this.name,
      owner: owner ?? this.owner,
      symbol: symbol ?? this.symbol,
      totalSupply: totalSupply ?? this.totalSupply,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Metadata &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.totalSupply, totalSupply) ||
                other.totalSupply == totalSupply));
  }

  @override
  int get hashCode => Object.hashAll(
      [runtimeType, decimals, fee, logo, name, owner, symbol, totalSupply]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TxError] defined in Candid
/// ```Candid
///   variant { InsufficientAllowance; InsufficientBalance; ErrorOperationStyle; Unauthorized; LedgerTrap; ErrorTo; Other; BlockUsed; FetchRateFailed; NotifyDfxFailed; UnexpectedCyclesResponse; AmountTooSmall; InsufficientXTCFee }
/// ```
enum TxError {
  /// [insufficientAllowance] defined in Candid: `InsufficientAllowance`
  insufficientAllowance('InsufficientAllowance'),

  /// [insufficientBalance] defined in Candid: `InsufficientBalance`
  insufficientBalance('InsufficientBalance'),

  /// [errorOperationStyle] defined in Candid: `ErrorOperationStyle`
  errorOperationStyle('ErrorOperationStyle'),

  /// [unauthorized] defined in Candid: `Unauthorized`
  unauthorized('Unauthorized'),

  /// [ledgerTrap] defined in Candid: `LedgerTrap`
  ledgerTrap('LedgerTrap'),

  /// [errorTo] defined in Candid: `ErrorTo`
  errorTo('ErrorTo'),

  /// [other] defined in Candid: `Other`
  other('Other'),

  /// [blockUsed] defined in Candid: `BlockUsed`
  blockUsed('BlockUsed'),

  /// [fetchRateFailed] defined in Candid: `FetchRateFailed`
  fetchRateFailed('FetchRateFailed'),

  /// [notifyDfxFailed] defined in Candid: `NotifyDfxFailed`
  notifyDfxFailed('NotifyDfxFailed'),

  /// [unexpectedCyclesResponse] defined in Candid: `UnexpectedCyclesResponse`
  unexpectedCyclesResponse('UnexpectedCyclesResponse'),

  /// [amountTooSmall] defined in Candid: `AmountTooSmall`
  amountTooSmall('AmountTooSmall'),

  /// [insufficientXTCFee] defined in Candid: `InsufficientXTCFee`
  insufficientXTCFee('InsufficientXTCFee');

  const TxError(this.name);

  factory TxError.fromJson(Map json) {
    final key = json.keys.first;
    return TxError.values.firstWhere((e) => e.name == key);
  }

  final String name;

  Map<String, dynamic> toJson() {
    return {name: null};
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TxReceipt] defined in Candid
/// ```Candid
///   variant { Ok: nat; Err: TxError }
/// ```
@immutable
class TxReceipt {
  const TxReceipt({
    /// [ok] defined in Candid: `Ok: nat`
    this.ok,

    /// [err] defined in Candid: `Err: TxError`
    this.err,
  });

  factory TxReceipt.fromJson(Map json) {
    return TxReceipt(
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

  TxReceipt copyWith({
    /// [ok] defined in Candid: `Ok: nat`
    BigInt? ok,

    /// [err] defined in Candid: `Err: TxError`
    TxError? err,
  }) {
    return TxReceipt(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TxReceipt &&
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

/// [BurnError] defined in Candid
/// ```Candid
///   variant { InsufficientBalance; InvalidTokenContract; NotSufficientLiquidity }
/// ```
enum BurnError {
  /// [insufficientBalance] defined in Candid: `InsufficientBalance`
  insufficientBalance('InsufficientBalance'),

  /// [invalidTokenContract] defined in Candid: `InvalidTokenContract`
  invalidTokenContract('InvalidTokenContract'),

  /// [notSufficientLiquidity] defined in Candid: `NotSufficientLiquidity`
  notSufficientLiquidity('NotSufficientLiquidity');

  const BurnError(this.name);

  factory BurnError.fromJson(Map json) {
    final key = json.keys.first;
    return BurnError.values.firstWhere((e) => e.name == key);
  }

  final String name;

  Map<String, dynamic> toJson() {
    return {name: null};
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [BurnResult] defined in Candid
/// ```Candid
///   variant { Ok: TransactionId; Err: BurnError }
/// ```
@immutable
class BurnResult {
  const BurnResult({
    /// [ok] defined in Candid: `Ok: TransactionId`
    this.ok,

    /// [err] defined in Candid: `Err: BurnError`
    this.err,
  });

  factory BurnResult.fromJson(Map json) {
    return BurnResult(
      ok: json['Ok'] is BigInt ? json['Ok'] : BigInt.from(json['Ok']),
      err: json['Err'] == null ? null : BurnError.fromJson(json['Err']),
    );
  }

  /// [ok] defined in Candid: `Ok: TransactionId`
  final TransactionId? ok;

  /// [err] defined in Candid: `Err: BurnError`
  final BurnError? err;

  Map<String, dynamic> toJson() {
    final ok = this.ok;
    final err = this.err;
    return {
      if (ok != null) 'Ok': ok,
      if (err != null) 'Err': err,
    };
  }

  BurnResult copyWith({
    /// [ok] defined in Candid: `Ok: TransactionId`
    TransactionId? ok,

    /// [err] defined in Candid: `Err: BurnError`
    BurnError? err,
  }) {
    return BurnResult(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BurnResult &&
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

/// [TxReceiptLegacyErr] defined in Candid
/// ```Candid
///   variant { InsufficientAllowance; InsufficientBalance }
/// ```
enum TxReceiptLegacyErr {
  /// [insufficientAllowance] defined in Candid: `InsufficientAllowance`
  insufficientAllowance('InsufficientAllowance'),

  /// [insufficientBalance] defined in Candid: `InsufficientBalance`
  insufficientBalance('InsufficientBalance');

  const TxReceiptLegacyErr(this.name);

  factory TxReceiptLegacyErr.fromJson(Map json) {
    final key = json.keys.first;
    return TxReceiptLegacyErr.values.firstWhere((e) => e.name == key);
  }

  final String name;

  Map<String, dynamic> toJson() {
    return {name: null};
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TxReceiptLegacy] defined in Candid
/// ```Candid
///   variant { Err: variant { InsufficientAllowance; InsufficientBalance }; Ok: nat }
/// ```
@immutable
class TxReceiptLegacy {
  const TxReceiptLegacy({
    /// [err] defined in Candid: `Err: variant { InsufficientAllowance; InsufficientBalance }`
    this.err,

    /// [ok] defined in Candid: `Ok: nat`
    this.ok,
  });

  factory TxReceiptLegacy.fromJson(Map json) {
    return TxReceiptLegacy(
      err: json['Err'] == null
          ? null
          : TxReceiptLegacyErr.fromJson(
              json['Err'],
            ),
      ok: json['Ok'] == null
          ? null
          : json['Ok'] is BigInt
              ? json['Ok']
              : BigInt.from(json['Ok']),
    );
  }

  /// [err] defined in Candid: `Err: variant { InsufficientAllowance; InsufficientBalance }`
  final TxReceiptLegacyErr? err;

  /// [ok] defined in Candid: `Ok: nat`
  final BigInt? ok;

  Map<String, dynamic> toJson() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'Err': err,
      if (ok != null) 'Ok': ok,
    };
  }

  TxReceiptLegacy copyWith({
    /// [err] defined in Candid: `Err: variant { InsufficientAllowance; InsufficientBalance }`
    TxReceiptLegacyErr? err,

    /// [ok] defined in Candid: `Ok: nat`
    BigInt? ok,
  }) {
    return TxReceiptLegacy(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TxReceiptLegacy &&
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

/// [MintError] defined in Candid
/// ```Candid
///   variant { NotSufficientLiquidity }
/// ```
enum MintError {
  /// [notSufficientLiquidity] defined in Candid: `NotSufficientLiquidity`
  notSufficientLiquidity('NotSufficientLiquidity');

  const MintError(this.name);

  factory MintError.fromJson(Map json) {
    final key = json.keys.first;
    return MintError.values.firstWhere((e) => e.name == key);
  }

  final String name;

  Map<String, dynamic> toJson() {
    return {name: null};
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [MintResult] defined in Candid
/// ```Candid
///   variant { Ok: TransactionId; Err: MintError }
/// ```
@immutable
class MintResult {
  const MintResult({
    /// [ok] defined in Candid: `Ok: TransactionId`
    this.ok,

    /// [err] defined in Candid: `Err: MintError`
    this.err,
  });

  factory MintResult.fromJson(Map json) {
    return MintResult(
      ok: json['Ok'] is BigInt ? json['Ok'] : BigInt.from(json['Ok']),
      err: json['Err'] == null ? null : MintError.fromJson(json['Err']),
    );
  }

  /// [ok] defined in Candid: `Ok: TransactionId`
  final TransactionId? ok;

  /// [err] defined in Candid: `Err: MintError`
  final MintError? err;

  Map<String, dynamic> toJson() {
    final ok = this.ok;
    final err = this.err;
    return {
      if (ok != null) 'Ok': ok,
      if (err != null) 'Err': err,
    };
  }

  MintResult copyWith({
    /// [ok] defined in Candid: `Ok: TransactionId`
    TransactionId? ok,

    /// [err] defined in Candid: `Err: MintError`
    MintError? err,
  }) {
    return MintResult(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MintResult &&
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

/// [ResultCallOk] defined in Candid
/// ```Candid
///   record { returnKey: blob }
/// ```
@immutable
class ResultCallOk {
  const ResultCallOk(
      {
      /// [returnKey] defined in Candid: `returnKey: blob`
      required this.returnKey});

  factory ResultCallOk.fromJson(Map json) {
    return ResultCallOk(
      returnKey: json['returnKey'] is Uint8List
          ? json['returnKey']
          : Uint8List.fromList(json['returnKey']),
    );
  }

  /// [returnKey] defined in Candid: `returnKey: blob`
  final Uint8List returnKey;

  Map<String, dynamic> toJson() {
    final returnKey = this.returnKey;
    return {
      'returnKey': returnKey,
    };
  }

  ResultCallOk copyWith(
      {
      /// [returnKey] defined in Candid: `returnKey: blob`
      Uint8List? returnKey}) {
    return ResultCallOk(
      returnKey: returnKey ?? this.returnKey,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResultCallOk &&
            (identical(other.returnKey, returnKey) ||
                other.returnKey == returnKey));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, returnKey]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [ResultCall] defined in Candid
/// ```Candid
///   variant { Ok: record { returnKey: blob }; Err: text }
/// ```
@immutable
class ResultCall {
  const ResultCall({
    /// [ok] defined in Candid: `Ok: record { returnKey: blob }`
    this.ok,

    /// [err] defined in Candid: `Err: text`
    this.err,
  });

  factory ResultCall.fromJson(Map json) {
    return ResultCall(
      ok: json['Ok'] == null
          ? null
          : ResultCallOk.fromJson(
              json['Ok'],
            ),
      err: json['Err'],
    );
  }

  /// [ok] defined in Candid: `Ok: record { returnKey: blob }`
  final ResultCallOk? ok;

  /// [err] defined in Candid: `Err: text`
  final String? err;

  Map<String, dynamic> toJson() {
    final ok = this.ok;
    final err = this.err;
    return {
      if (ok != null) 'Ok': ok,
      if (err != null) 'Err': err,
    };
  }

  ResultCall copyWith({
    /// [ok] defined in Candid: `Ok: record { returnKey: blob }`
    ResultCallOk? ok,

    /// [err] defined in Candid: `Err: text`
    String? err,
  }) {
    return ResultCall(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResultCall &&
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

/// [CreateResultOk] defined in Candid
/// ```Candid
///   record { canister_id: principal }
/// ```
@immutable
class CreateResultOk {
  const CreateResultOk(
      {
      /// [canisterId] defined in Candid: `canister_id: principal`
      required this.canisterId});

  factory CreateResultOk.fromJson(Map json) {
    return CreateResultOk(
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

  CreateResultOk copyWith(
      {
      /// [canisterId] defined in Candid: `canister_id: principal`
      Principal? canisterId}) {
    return CreateResultOk(
      canisterId: canisterId ?? this.canisterId,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateResultOk &&
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

/// [CreateResult] defined in Candid
/// ```Candid
///   variant { Ok: record { canister_id: principal }; Err: text }
/// ```
@immutable
class CreateResult {
  const CreateResult({
    /// [ok] defined in Candid: `Ok: record { canister_id: principal }`
    this.ok,

    /// [err] defined in Candid: `Err: text`
    this.err,
  });

  factory CreateResult.fromJson(Map json) {
    return CreateResult(
      ok: json['Ok'] == null
          ? null
          : CreateResultOk.fromJson(
              json['Ok'],
            ),
      err: json['Err'],
    );
  }

  /// [ok] defined in Candid: `Ok: record { canister_id: principal }`
  final CreateResultOk? ok;

  /// [err] defined in Candid: `Err: text`
  final String? err;

  Map<String, dynamic> toJson() {
    final ok = this.ok;
    final err = this.err;
    return {
      if (ok != null) 'Ok': ok,
      if (err != null) 'Err': err,
    };
  }

  CreateResult copyWith({
    /// [ok] defined in Candid: `Ok: record { canister_id: principal }`
    CreateResultOk? ok,

    /// [err] defined in Candid: `Err: text`
    String? err,
  }) {
    return CreateResult(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateResult &&
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

/// [EventDetailTransfer] defined in Candid
/// ```Candid
///   record { from: principal; to: principal }
/// ```
@immutable
class EventDetailTransfer {
  const EventDetailTransfer({
    /// [from] defined in Candid: `from: principal`
    required this.from,

    /// [to] defined in Candid: `to: principal`
    required this.to,
  });

  factory EventDetailTransfer.fromJson(Map json) {
    return EventDetailTransfer(
      from: Principal.from(json['from']),
      to: Principal.from(json['to']),
    );
  }

  /// [from] defined in Candid: `from: principal`
  final Principal from;

  /// [to] defined in Candid: `to: principal`
  final Principal to;

  Map<String, dynamic> toJson() {
    final from = this.from;
    final to = this.to;
    return {
      'from': from,
      'to': to,
    };
  }

  EventDetailTransfer copyWith({
    /// [from] defined in Candid: `from: principal`
    Principal? from,

    /// [to] defined in Candid: `to: principal`
    Principal? to,
  }) {
    return EventDetailTransfer(
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventDetailTransfer &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, from, to]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EventDetailBurn] defined in Candid
/// ```Candid
///   record { from: principal; to: principal }
/// ```
typedef EventDetailBurn = EventDetailTransfer;

/// [EventDetailApprove] defined in Candid
/// ```Candid
///   record { from: principal; to: principal }
/// ```
typedef EventDetailApprove = EventDetailTransfer;

/// [EventDetailMint] defined in Candid
/// ```Candid
///   record { to: principal }
/// ```
@immutable
class EventDetailMint {
  const EventDetailMint(
      {
      /// [to] defined in Candid: `to: principal`
      required this.to});

  factory EventDetailMint.fromJson(Map json) {
    return EventDetailMint(
      to: Principal.from(json['to']),
    );
  }

  /// [to] defined in Candid: `to: principal`
  final Principal to;

  Map<String, dynamic> toJson() {
    final to = this.to;
    return {
      'to': to,
    };
  }

  EventDetailMint copyWith(
      {
      /// [to] defined in Candid: `to: principal`
      Principal? to}) {
    return EventDetailMint(
      to: to ?? this.to,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventDetailMint &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, to]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EventDetailCanisterCalled] defined in Candid
/// ```Candid
///   record { from: principal; canister: principal; method_name: text }
/// ```
@immutable
class EventDetailCanisterCalled {
  const EventDetailCanisterCalled({
    /// [from] defined in Candid: `from: principal`
    required this.from,

    /// [canister] defined in Candid: `canister: principal`
    required this.canister,

    /// [methodName] defined in Candid: `method_name: text`
    required this.methodName,
  });

  factory EventDetailCanisterCalled.fromJson(Map json) {
    return EventDetailCanisterCalled(
      from: Principal.from(json['from']),
      canister: Principal.from(json['canister']),
      methodName: json['method_name'],
    );
  }

  /// [from] defined in Candid: `from: principal`
  final Principal from;

  /// [canister] defined in Candid: `canister: principal`
  final Principal canister;

  /// [methodName] defined in Candid: `method_name: text`
  final String methodName;

  Map<String, dynamic> toJson() {
    final from = this.from;
    final canister = this.canister;
    final methodName = this.methodName;
    return {
      'from': from,
      'canister': canister,
      'method_name': methodName,
    };
  }

  EventDetailCanisterCalled copyWith({
    /// [from] defined in Candid: `from: principal`
    Principal? from,

    /// [canister] defined in Candid: `canister: principal`
    Principal? canister,

    /// [methodName] defined in Candid: `method_name: text`
    String? methodName,
  }) {
    return EventDetailCanisterCalled(
      from: from ?? this.from,
      canister: canister ?? this.canister,
      methodName: methodName ?? this.methodName,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventDetailCanisterCalled &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.canister, canister) ||
                other.canister == canister) &&
            (identical(other.methodName, methodName) ||
                other.methodName == methodName));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, from, canister, methodName]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EventDetailCanisterCreated] defined in Candid
/// ```Candid
///   record { from: principal; canister: principal }
/// ```
@immutable
class EventDetailCanisterCreated {
  const EventDetailCanisterCreated({
    /// [from] defined in Candid: `from: principal`
    required this.from,

    /// [canister] defined in Candid: `canister: principal`
    required this.canister,
  });

  factory EventDetailCanisterCreated.fromJson(Map json) {
    return EventDetailCanisterCreated(
      from: Principal.from(json['from']),
      canister: Principal.from(json['canister']),
    );
  }

  /// [from] defined in Candid: `from: principal`
  final Principal from;

  /// [canister] defined in Candid: `canister: principal`
  final Principal canister;

  Map<String, dynamic> toJson() {
    final from = this.from;
    final canister = this.canister;
    return {
      'from': from,
      'canister': canister,
    };
  }

  EventDetailCanisterCreated copyWith({
    /// [from] defined in Candid: `from: principal`
    Principal? from,

    /// [canister] defined in Candid: `canister: principal`
    Principal? canister,
  }) {
    return EventDetailCanisterCreated(
      from: from ?? this.from,
      canister: canister ?? this.canister,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventDetailCanisterCreated &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.canister, canister) ||
                other.canister == canister));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, from, canister]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EventDetailTransferFrom] defined in Candid
/// ```Candid
///   record { caller: principal; from: principal; to: principal }
/// ```
@immutable
class EventDetailTransferFrom {
  const EventDetailTransferFrom({
    /// [caller] defined in Candid: `caller: principal`
    required this.caller,

    /// [from] defined in Candid: `from: principal`
    required this.from,

    /// [to] defined in Candid: `to: principal`
    required this.to,
  });

  factory EventDetailTransferFrom.fromJson(Map json) {
    return EventDetailTransferFrom(
      caller: Principal.from(json['caller']),
      from: Principal.from(json['from']),
      to: Principal.from(json['to']),
    );
  }

  /// [caller] defined in Candid: `caller: principal`
  final Principal caller;

  /// [from] defined in Candid: `from: principal`
  final Principal from;

  /// [to] defined in Candid: `to: principal`
  final Principal to;

  Map<String, dynamic> toJson() {
    final caller = this.caller;
    final from = this.from;
    final to = this.to;
    return {
      'caller': caller,
      'from': from,
      'to': to,
    };
  }

  EventDetailTransferFrom copyWith({
    /// [caller] defined in Candid: `caller: principal`
    Principal? caller,

    /// [from] defined in Candid: `from: principal`
    Principal? from,

    /// [to] defined in Candid: `to: principal`
    Principal? to,
  }) {
    return EventDetailTransferFrom(
      caller: caller ?? this.caller,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventDetailTransferFrom &&
            (identical(other.caller, caller) || other.caller == caller) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, caller, from, to]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EventDetail] defined in Candid
/// ```Candid
///   variant { Transfer: record { from: principal; to: principal }; Mint: record { to: principal }; Burn: record { from: principal; to: principal }; CanisterCalled: record { from: principal; canister: principal; method_name: text }; CanisterCreated: record { from: principal; canister: principal }; TransferFrom: record { caller: principal; from: principal; to: principal }; Approve: record { from: principal; to: principal } }
/// ```
@immutable
class EventDetail {
  const EventDetail({
    /// [transfer] defined in Candid: `Transfer: record { from: principal; to: principal }`
    this.transfer,

    /// [mint] defined in Candid: `Mint: record { to: principal }`
    this.mint,

    /// [burn] defined in Candid: `Burn: record { from: principal; to: principal }`
    this.burn,

    /// [canisterCalled] defined in Candid: `CanisterCalled: record { from: principal; canister: principal; method_name: text }`
    this.canisterCalled,

    /// [canisterCreated] defined in Candid: `CanisterCreated: record { from: principal; canister: principal }`
    this.canisterCreated,

    /// [transferFrom] defined in Candid: `TransferFrom: record { caller: principal; from: principal; to: principal }`
    this.transferFrom,

    /// [approve] defined in Candid: `Approve: record { from: principal; to: principal }`
    this.approve,
  });

  factory EventDetail.fromJson(Map json) {
    return EventDetail(
      transfer: json['Transfer'] == null
          ? null
          : EventDetailTransfer.fromJson(
              json['Transfer'],
            ),
      mint: json['Mint'] == null
          ? null
          : EventDetailMint.fromJson(
              json['Mint'],
            ),
      burn: json['Burn'] == null
          ? null
          : EventDetailBurn.fromJson(
              json['Burn'],
            ),
      canisterCalled: json['CanisterCalled'] == null
          ? null
          : EventDetailCanisterCalled.fromJson(
              json['CanisterCalled'],
            ),
      canisterCreated: json['CanisterCreated'] == null
          ? null
          : EventDetailCanisterCreated.fromJson(
              json['CanisterCreated'],
            ),
      transferFrom: json['TransferFrom'] == null
          ? null
          : EventDetailTransferFrom.fromJson(
              json['TransferFrom'],
            ),
      approve: json['Approve'] == null
          ? null
          : EventDetailApprove.fromJson(
              json['Approve'],
            ),
    );
  }

  /// [transfer] defined in Candid: `Transfer: record { from: principal; to: principal }`
  final EventDetailTransfer? transfer;

  /// [mint] defined in Candid: `Mint: record { to: principal }`
  final EventDetailMint? mint;

  /// [burn] defined in Candid: `Burn: record { from: principal; to: principal }`
  final EventDetailBurn? burn;

  /// [canisterCalled] defined in Candid: `CanisterCalled: record { from: principal; canister: principal; method_name: text }`
  final EventDetailCanisterCalled? canisterCalled;

  /// [canisterCreated] defined in Candid: `CanisterCreated: record { from: principal; canister: principal }`
  final EventDetailCanisterCreated? canisterCreated;

  /// [transferFrom] defined in Candid: `TransferFrom: record { caller: principal; from: principal; to: principal }`
  final EventDetailTransferFrom? transferFrom;

  /// [approve] defined in Candid: `Approve: record { from: principal; to: principal }`
  final EventDetailApprove? approve;

  Map<String, dynamic> toJson() {
    final transfer = this.transfer;
    final mint = this.mint;
    final burn = this.burn;
    final canisterCalled = this.canisterCalled;
    final canisterCreated = this.canisterCreated;
    final transferFrom = this.transferFrom;
    final approve = this.approve;
    return {
      if (transfer != null) 'Transfer': transfer,
      if (mint != null) 'Mint': mint,
      if (burn != null) 'Burn': burn,
      if (canisterCalled != null) 'CanisterCalled': canisterCalled,
      if (canisterCreated != null) 'CanisterCreated': canisterCreated,
      if (transferFrom != null) 'TransferFrom': transferFrom,
      if (approve != null) 'Approve': approve,
    };
  }

  EventDetail copyWith({
    /// [transfer] defined in Candid: `Transfer: record { from: principal; to: principal }`
    EventDetailTransfer? transfer,

    /// [mint] defined in Candid: `Mint: record { to: principal }`
    EventDetailMint? mint,

    /// [burn] defined in Candid: `Burn: record { from: principal; to: principal }`
    EventDetailBurn? burn,

    /// [canisterCalled] defined in Candid: `CanisterCalled: record { from: principal; canister: principal; method_name: text }`
    EventDetailCanisterCalled? canisterCalled,

    /// [canisterCreated] defined in Candid: `CanisterCreated: record { from: principal; canister: principal }`
    EventDetailCanisterCreated? canisterCreated,

    /// [transferFrom] defined in Candid: `TransferFrom: record { caller: principal; from: principal; to: principal }`
    EventDetailTransferFrom? transferFrom,

    /// [approve] defined in Candid: `Approve: record { from: principal; to: principal }`
    EventDetailApprove? approve,
  }) {
    return EventDetail(
      transfer: transfer ?? this.transfer,
      mint: mint ?? this.mint,
      burn: burn ?? this.burn,
      canisterCalled: canisterCalled ?? this.canisterCalled,
      canisterCreated: canisterCreated ?? this.canisterCreated,
      transferFrom: transferFrom ?? this.transferFrom,
      approve: approve ?? this.approve,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventDetail &&
            (identical(other.transfer, transfer) ||
                other.transfer == transfer) &&
            (identical(other.mint, mint) || other.mint == mint) &&
            (identical(other.burn, burn) || other.burn == burn) &&
            (identical(other.canisterCalled, canisterCalled) ||
                other.canisterCalled == canisterCalled) &&
            (identical(other.canisterCreated, canisterCreated) ||
                other.canisterCreated == canisterCreated) &&
            (identical(other.transferFrom, transferFrom) ||
                other.transferFrom == transferFrom) &&
            (identical(other.approve, approve) || other.approve == approve));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        transfer,
        mint,
        burn,
        canisterCalled,
        canisterCreated,
        transferFrom,
        approve
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TransactionStatus] defined in Candid
/// ```Candid
///   variant { SUCCEEDED; FAILED }
/// ```
enum TransactionStatus {
  /// [succeeded] defined in Candid: `SUCCEEDED`
  succeeded('SUCCEEDED'),

  /// [failed] defined in Candid: `FAILED`
  failed('FAILED');

  const TransactionStatus(this.name);

  factory TransactionStatus.fromJson(Map json) {
    final key = json.keys.first;
    return TransactionStatus.values.firstWhere((e) => e.name == key);
  }

  final String name;

  Map<String, dynamic> toJson() {
    return {name: null};
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Event] defined in Candid
/// ```Candid
///   record { fee: nat64; kind: EventDetail; cycles: nat64; timestamp: nat64; status: TransactionStatus }
/// ```
@immutable
class Event {
  const Event({
    /// [fee] defined in Candid: `fee: nat64`
    required this.fee,

    /// [kind] defined in Candid: `kind: EventDetail`
    required this.kind,

    /// [cycles] defined in Candid: `cycles: nat64`
    required this.cycles,

    /// [timestamp] defined in Candid: `timestamp: nat64`
    required this.timestamp,

    /// [status] defined in Candid: `status: TransactionStatus`
    required this.status,
  });

  factory Event.fromJson(Map json) {
    return Event(
      fee: json['fee'] is BigInt ? json['fee'] : BigInt.from(json['fee']),
      kind: EventDetail.fromJson(json['kind']),
      cycles: json['cycles'] is BigInt
          ? json['cycles']
          : BigInt.from(json['cycles']),
      timestamp: json['timestamp'] is BigInt
          ? json['timestamp']
          : BigInt.from(json['timestamp']),
      status: TransactionStatus.fromJson(json['status']),
    );
  }

  /// [fee] defined in Candid: `fee: nat64`
  final BigInt fee;

  /// [kind] defined in Candid: `kind: EventDetail`
  final EventDetail kind;

  /// [cycles] defined in Candid: `cycles: nat64`
  final BigInt cycles;

  /// [timestamp] defined in Candid: `timestamp: nat64`
  final BigInt timestamp;

  /// [status] defined in Candid: `status: TransactionStatus`
  final TransactionStatus status;

  Map<String, dynamic> toJson() {
    final fee = this.fee;
    final kind = this.kind;
    final cycles = this.cycles;
    final timestamp = this.timestamp;
    final status = this.status;
    return {
      'fee': fee,
      'kind': kind,
      'cycles': cycles,
      'timestamp': timestamp,
      'status': status,
    };
  }

  Event copyWith({
    /// [fee] defined in Candid: `fee: nat64`
    BigInt? fee,

    /// [kind] defined in Candid: `kind: EventDetail`
    EventDetail? kind,

    /// [cycles] defined in Candid: `cycles: nat64`
    BigInt? cycles,

    /// [timestamp] defined in Candid: `timestamp: nat64`
    BigInt? timestamp,

    /// [status] defined in Candid: `status: TransactionStatus`
    TransactionStatus? status,
  }) {
    return Event(
      fee: fee ?? this.fee,
      kind: kind ?? this.kind,
      cycles: cycles ?? this.cycles,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Event &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.cycles, cycles) || other.cycles == cycles) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hashAll([runtimeType, fee, kind, cycles, timestamp, status]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EventsConnection] defined in Candid
/// ```Candid
///   record { data: vec Event; next_offset: TransactionId; next_canister_id: opt principal }
/// ```
@immutable
class EventsConnection {
  const EventsConnection({
    /// [data] defined in Candid: `data: vec Event`
    required this.data,

    /// [nextOffset] defined in Candid: `next_offset: TransactionId`
    required this.nextOffset,

    /// [nextCanisterId] defined in Candid: `next_canister_id: opt principal`
    this.nextCanisterId,
  });

  factory EventsConnection.fromJson(Map json) {
    return EventsConnection(
      data: (json['data'] as List).map((e) {
        return Event.fromJson(e);
      }).toList(),
      nextOffset: json['next_offset'] is BigInt
          ? json['next_offset']
          : BigInt.from(json['next_offset']),
      nextCanisterId: (json['next_canister_id'] as List).map((e) {
        return e == null ? null : Principal.from(e);
      }).firstOrNull,
    );
  }

  /// [data] defined in Candid: `data: vec Event`
  final List<Event> data;

  /// [nextOffset] defined in Candid: `next_offset: TransactionId`
  final TransactionId nextOffset;

  /// [nextCanisterId] defined in Candid: `next_canister_id: opt principal`
  final Principal? nextCanisterId;

  Map<String, dynamic> toJson() {
    final data = this.data;
    final nextOffset = this.nextOffset;
    final nextCanisterId = this.nextCanisterId;
    return {
      'data': data,
      'next_offset': nextOffset,
      'next_canister_id': [if (nextCanisterId != null) nextCanisterId],
    };
  }

  EventsConnection copyWith({
    /// [data] defined in Candid: `data: vec Event`
    List<Event>? data,

    /// [nextOffset] defined in Candid: `next_offset: TransactionId`
    TransactionId? nextOffset,

    /// [nextCanisterId] defined in Candid: `next_canister_id: opt principal`
    Principal? nextCanisterId,
  }) {
    return EventsConnection(
      data: data ?? this.data,
      nextOffset: nextOffset ?? this.nextOffset,
      nextCanisterId: nextCanisterId ?? this.nextCanisterId,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventsConnection &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.nextOffset, nextOffset) ||
                other.nextOffset == nextOffset) &&
            (identical(other.nextCanisterId, nextCanisterId) ||
                other.nextCanisterId == nextCanisterId));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(data),
        nextOffset,
        nextCanisterId
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Stats] defined in Candid
/// ```Candid
///   record { supply: nat; fee: nat; history_events: nat64; balance: nat64; transfers_count: nat64; transfers_from_count: nat64; approvals_count: nat64; mints_count: nat64; burns_count: nat64; proxy_calls_count: nat64; canisters_created_count: nat64 }
/// ```
@immutable
class Stats {
  const Stats({
    /// [supply] defined in Candid: `supply: nat`
    required this.supply,

    /// [fee] defined in Candid: `fee: nat`
    required this.fee,

    /// [historyEvents] defined in Candid: `history_events: nat64`
    required this.historyEvents,

    /// [balance] defined in Candid: `balance: nat64`
    required this.balance,

    /// [transfersCount] defined in Candid: `transfers_count: nat64`
    required this.transfersCount,

    /// [transfersFromCount] defined in Candid: `transfers_from_count: nat64`
    required this.transfersFromCount,

    /// [approvalsCount] defined in Candid: `approvals_count: nat64`
    required this.approvalsCount,

    /// [mintsCount] defined in Candid: `mints_count: nat64`
    required this.mintsCount,

    /// [burnsCount] defined in Candid: `burns_count: nat64`
    required this.burnsCount,

    /// [proxyCallsCount] defined in Candid: `proxy_calls_count: nat64`
    required this.proxyCallsCount,

    /// [canistersCreatedCount] defined in Candid: `canisters_created_count: nat64`
    required this.canistersCreatedCount,
  });

  factory Stats.fromJson(Map json) {
    return Stats(
      supply: json['supply'] is BigInt
          ? json['supply']
          : BigInt.from(json['supply']),
      fee: json['fee'] is BigInt ? json['fee'] : BigInt.from(json['fee']),
      historyEvents: json['history_events'] is BigInt
          ? json['history_events']
          : BigInt.from(json['history_events']),
      balance: json['balance'] is BigInt
          ? json['balance']
          : BigInt.from(json['balance']),
      transfersCount: json['transfers_count'] is BigInt
          ? json['transfers_count']
          : BigInt.from(json['transfers_count']),
      transfersFromCount: json['transfers_from_count'] is BigInt
          ? json['transfers_from_count']
          : BigInt.from(json['transfers_from_count']),
      approvalsCount: json['approvals_count'] is BigInt
          ? json['approvals_count']
          : BigInt.from(json['approvals_count']),
      mintsCount: json['mints_count'] is BigInt
          ? json['mints_count']
          : BigInt.from(json['mints_count']),
      burnsCount: json['burns_count'] is BigInt
          ? json['burns_count']
          : BigInt.from(json['burns_count']),
      proxyCallsCount: json['proxy_calls_count'] is BigInt
          ? json['proxy_calls_count']
          : BigInt.from(json['proxy_calls_count']),
      canistersCreatedCount: json['canisters_created_count'] is BigInt
          ? json['canisters_created_count']
          : BigInt.from(json['canisters_created_count']),
    );
  }

  /// [supply] defined in Candid: `supply: nat`
  final BigInt supply;

  /// [fee] defined in Candid: `fee: nat`
  final BigInt fee;

  /// [historyEvents] defined in Candid: `history_events: nat64`
  final BigInt historyEvents;

  /// [balance] defined in Candid: `balance: nat64`
  final BigInt balance;

  /// [transfersCount] defined in Candid: `transfers_count: nat64`
  final BigInt transfersCount;

  /// [transfersFromCount] defined in Candid: `transfers_from_count: nat64`
  final BigInt transfersFromCount;

  /// [approvalsCount] defined in Candid: `approvals_count: nat64`
  final BigInt approvalsCount;

  /// [mintsCount] defined in Candid: `mints_count: nat64`
  final BigInt mintsCount;

  /// [burnsCount] defined in Candid: `burns_count: nat64`
  final BigInt burnsCount;

  /// [proxyCallsCount] defined in Candid: `proxy_calls_count: nat64`
  final BigInt proxyCallsCount;

  /// [canistersCreatedCount] defined in Candid: `canisters_created_count: nat64`
  final BigInt canistersCreatedCount;

  Map<String, dynamic> toJson() {
    final supply = this.supply;
    final fee = this.fee;
    final historyEvents = this.historyEvents;
    final balance = this.balance;
    final transfersCount = this.transfersCount;
    final transfersFromCount = this.transfersFromCount;
    final approvalsCount = this.approvalsCount;
    final mintsCount = this.mintsCount;
    final burnsCount = this.burnsCount;
    final proxyCallsCount = this.proxyCallsCount;
    final canistersCreatedCount = this.canistersCreatedCount;
    return {
      'supply': supply,
      'fee': fee,
      'history_events': historyEvents,
      'balance': balance,
      'transfers_count': transfersCount,
      'transfers_from_count': transfersFromCount,
      'approvals_count': approvalsCount,
      'mints_count': mintsCount,
      'burns_count': burnsCount,
      'proxy_calls_count': proxyCallsCount,
      'canisters_created_count': canistersCreatedCount,
    };
  }

  Stats copyWith({
    /// [supply] defined in Candid: `supply: nat`
    BigInt? supply,

    /// [fee] defined in Candid: `fee: nat`
    BigInt? fee,

    /// [historyEvents] defined in Candid: `history_events: nat64`
    BigInt? historyEvents,

    /// [balance] defined in Candid: `balance: nat64`
    BigInt? balance,

    /// [transfersCount] defined in Candid: `transfers_count: nat64`
    BigInt? transfersCount,

    /// [transfersFromCount] defined in Candid: `transfers_from_count: nat64`
    BigInt? transfersFromCount,

    /// [approvalsCount] defined in Candid: `approvals_count: nat64`
    BigInt? approvalsCount,

    /// [mintsCount] defined in Candid: `mints_count: nat64`
    BigInt? mintsCount,

    /// [burnsCount] defined in Candid: `burns_count: nat64`
    BigInt? burnsCount,

    /// [proxyCallsCount] defined in Candid: `proxy_calls_count: nat64`
    BigInt? proxyCallsCount,

    /// [canistersCreatedCount] defined in Candid: `canisters_created_count: nat64`
    BigInt? canistersCreatedCount,
  }) {
    return Stats(
      supply: supply ?? this.supply,
      fee: fee ?? this.fee,
      historyEvents: historyEvents ?? this.historyEvents,
      balance: balance ?? this.balance,
      transfersCount: transfersCount ?? this.transfersCount,
      transfersFromCount: transfersFromCount ?? this.transfersFromCount,
      approvalsCount: approvalsCount ?? this.approvalsCount,
      mintsCount: mintsCount ?? this.mintsCount,
      burnsCount: burnsCount ?? this.burnsCount,
      proxyCallsCount: proxyCallsCount ?? this.proxyCallsCount,
      canistersCreatedCount:
          canistersCreatedCount ?? this.canistersCreatedCount,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Stats &&
            (identical(other.supply, supply) || other.supply == supply) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.historyEvents, historyEvents) ||
                other.historyEvents == historyEvents) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.transfersCount, transfersCount) ||
                other.transfersCount == transfersCount) &&
            (identical(other.transfersFromCount, transfersFromCount) ||
                other.transfersFromCount == transfersFromCount) &&
            (identical(other.approvalsCount, approvalsCount) ||
                other.approvalsCount == approvalsCount) &&
            (identical(other.mintsCount, mintsCount) ||
                other.mintsCount == mintsCount) &&
            (identical(other.burnsCount, burnsCount) ||
                other.burnsCount == burnsCount) &&
            (identical(other.proxyCallsCount, proxyCallsCount) ||
                other.proxyCallsCount == proxyCallsCount) &&
            (identical(other.canistersCreatedCount, canistersCreatedCount) ||
                other.canistersCreatedCount == canistersCreatedCount));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        supply,
        fee,
        historyEvents,
        balance,
        transfersCount,
        transfersFromCount,
        approvalsCount,
        mintsCount,
        burnsCount,
        proxyCallsCount,
        canistersCreatedCount
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

/// [TransferErc20Arg] defined in Candid
/// ```Candid
///   (principal, nat)
/// ```
@immutable
class TransferErc20Arg {
  const TransferErc20Arg(
    this.item1,
    this.item2,
  );

  factory TransferErc20Arg.fromJson(List<dynamic> tuple) {
    return TransferErc20Arg(
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

  TransferErc20Arg copyWith({
    /// [item1] defined in Candid: `principal`
    Principal? item1,

    /// [item2] defined in Candid: `nat`
    BigInt? item2,
  }) {
    return TransferErc20Arg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransferErc20Arg &&
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

/// [MintByIcpArg] defined in Candid
/// ```Candid
///   (opt vec nat8, nat64)
/// ```
@immutable
class MintByIcpArg {
  const MintByIcpArg(
    this.item1,
    this.item2,
  );

  factory MintByIcpArg.fromJson(List<dynamic> tuple) {
    return MintByIcpArg(
      (tuple[0] as List).map((e) {
        return e;
      }).firstOrNull,
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
    );
  }

  /// [item1] defined in Candid: `opt vec nat8`
  final Uint8List? item1;

  /// [item2] defined in Candid: `nat64`
  final BigInt item2;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      [if (item1 != null) item1],
      item2,
    ];
  }

  MintByIcpArg copyWith({
    /// [item1] defined in Candid: `opt vec nat8`
    Uint8List? item1,

    /// [item2] defined in Candid: `nat64`
    BigInt? item2,
  }) {
    return MintByIcpArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MintByIcpArg &&
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

/// [MintByIcpRecoverArg] defined in Candid
/// ```Candid
///   (opt vec nat8, nat64, principal)
/// ```
@immutable
class MintByIcpRecoverArg {
  const MintByIcpRecoverArg(
    this.item1,
    this.item2,
    this.item3,
  );

  factory MintByIcpRecoverArg.fromJson(List<dynamic> tuple) {
    return MintByIcpRecoverArg(
      (tuple[0] as List).map((e) {
        return e;
      }).firstOrNull,
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
      Principal.from(tuple[2]),
    );
  }

  /// [item1] defined in Candid: `opt vec nat8`
  final Uint8List? item1;

  /// [item2] defined in Candid: `nat64`
  final BigInt item2;

  /// [item3] defined in Candid: `principal`
  final Principal item3;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    final item3 = this.item3;
    return [
      [if (item1 != null) item1],
      item2,
      item3,
    ];
  }

  MintByIcpRecoverArg copyWith({
    /// [item1] defined in Candid: `opt vec nat8`
    Uint8List? item1,

    /// [item2] defined in Candid: `nat64`
    BigInt? item2,

    /// [item3] defined in Candid: `principal`
    Principal? item3,
  }) {
    return MintByIcpRecoverArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MintByIcpRecoverArg &&
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

/// [TransactionId] defined in Candid
/// ```Candid
///   type TransactionId = nat64;
/// ```
typedef TransactionId = BigInt;
