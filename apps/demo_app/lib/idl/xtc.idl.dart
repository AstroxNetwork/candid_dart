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

class XtcIDLActor {
  const XtcIDLActor._();

  /// ```Candid
  ///   allowance: (principal, principal) -> (nat) query
  /// ```
  static Future<BigInt> allowance(
    CanisterActor actor,
    AllowanceArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'allowance';
    final response = await actor.getFunc(method)!(request);
    return response is BigInt ? response : BigInt.from(response);
  }

  /// ```Candid
  ///   approve: (principal, nat) -> (TxReceipt)
  /// ```
  static Future<TxReceipt> approve(
    CanisterActor actor,
    ApproveArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'approve';
    final response = await actor.getFunc(method)!(request);
    return TxReceipt.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   balanceOf: (principal) -> (nat) query
  /// ```
  static Future<BigInt> balanceOf(
    CanisterActor actor,
    Principal arg,
  ) async {
    final request = [arg];
    const method = 'balanceOf';
    final response = await actor.getFunc(method)!(request);
    return response is BigInt ? response : BigInt.from(response);
  }

  /// ```Candid
  ///   decimals: () -> (nat8) query
  /// ```
  static Future<int> decimals(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'decimals';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   getMetadata: () -> (Metadata) query
  /// ```
  static Future<Metadata> getMetadata(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'getMetadata';
    final response = await actor.getFunc(method)!(request);
    return Metadata.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   historySize: () -> (nat) query
  /// ```
  static Future<BigInt> historySize(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'historySize';
    final response = await actor.getFunc(method)!(request);
    return response is BigInt ? response : BigInt.from(response);
  }

  /// ```Candid
  ///   logo: () -> (text) query
  /// ```
  static Future<String> logo(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'logo';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   nameErc20: () -> (text) query
  /// ```
  static Future<String> nameErc20(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'nameErc20';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   name: () -> (text) query
  /// ```
  static Future<String> name(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'name';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   symbol: () -> (text) query
  /// ```
  static Future<String> symbol(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'symbol';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   totalSupply: () -> (nat) query
  /// ```
  static Future<BigInt> totalSupply(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'totalSupply';
    final response = await actor.getFunc(method)!(request);
    return response is BigInt ? response : BigInt.from(response);
  }

  /// ```Candid
  ///   transferErc20: (principal, nat) -> (TxReceiptLegacy)
  /// ```
  static Future<TxReceiptLegacy> transferErc20(
    CanisterActor actor,
    TransferErc20Arg arg,
  ) async {
    final request = arg.toJson();
    const method = 'transferErc20';
    final response = await actor.getFunc(method)!(request);
    return TxReceiptLegacy.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   transfer: (principal, nat) -> (TxReceipt)
  /// ```
  static Future<TxReceipt> transfer(
    CanisterActor actor,
    TransferArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'transfer';
    final response = await actor.getFunc(method)!(request);
    return TxReceipt.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   transferFrom: (principal, principal, nat) -> (TxReceipt)
  /// ```
  static Future<TxReceipt> transferFrom(
    CanisterActor actor,
    TransferFromArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'transferFrom';
    final response = await actor.getFunc(method)!(request);
    return TxReceipt.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   mint: (principal, nat) -> (MintResult)
  /// ```
  static Future<MintResult> mint(
    CanisterActor actor,
    MintArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'mint';
    final response = await actor.getFunc(method)!(request);
    return MintResult.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   isBlockUsed: (nat64) -> (bool) query
  /// ```
  static Future<bool> isBlockUsed(
    CanisterActor actor,
    BigInt arg,
  ) async {
    final request = [arg];
    const method = 'isBlockUsed';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   getBlockUsed: () -> (vec nat64) query
  /// ```
  static Future<List<BigInt>> getBlockUsed(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'getBlockUsed';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
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
    final request = [arg];
    const method = 'get_map_block_used';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
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
    final request = arg.toJson();
    const method = 'mint_by_icp';
    final response = await actor.getFunc(method)!(request);
    return TxReceipt.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   mint_by_icp_recover: (opt vec nat8, nat64, principal) -> (TxReceipt)
  /// ```
  static Future<TxReceipt> mintByIcpRecover(
    CanisterActor actor,
    MintByIcpRecoverArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'mint_by_icp_recover';
    final response = await actor.getFunc(method)!(request);
    return TxReceipt.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   burn: (record { canister_id: principal; amount: nat64 }) -> (BurnResult)
  /// ```
  static Future<BurnResult> burn(
    CanisterActor actor,
    BurnArg0 arg,
  ) async {
    final request = [arg];
    const method = 'burn';
    final response = await actor.getFunc(method)!(request);
    return BurnResult.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   balance: (opt principal) -> (amount: nat64)
  /// ```
  static Future<BigInt> balance(
    CanisterActor actor, [
    Principal? arg,
  ]) async {
    final request = [
      [if (arg != null) arg]
    ];
    const method = 'balance';
    final response = await actor.getFunc(method)!(request);
    return response is BigInt ? response : BigInt.from(response);
  }

  /// ```Candid
  ///   events: (record { offset: opt nat64; limit: nat16 }) -> (EventsConnection) query
  /// ```
  static Future<EventsConnection> events(
    CanisterActor actor,
    EventsArg0 arg,
  ) async {
    final request = [arg];
    const method = 'events';
    final response = await actor.getFunc(method)!(request);
    return EventsConnection.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   halt: () -> ()
  /// ```
  static Future<void> halt(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'halt';
    await actor.getFunc(method)!(request);
  }

  /// ```Candid
  ///   stats: () -> (Stats) query
  /// ```
  static Future<Stats> stats(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'stats';
    final response = await actor.getFunc(method)!(request);
    return Stats.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   wallet_balance: () -> (record { amount: nat64 }) query
  /// ```
  static Future<WalletBalanceRet0> walletBalance(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'wallet_balance';
    final response = await actor.getFunc(method)!(request);
    return WalletBalanceRet0.fromIDLDeserializable(
      response,
    );
  }

  /// ```Candid
  ///   wallet_create_canister: (record { cycles: nat64; controller: opt principal }) -> (CreateResult)
  /// ```
  static Future<CreateResult> walletCreateCanister(
    CanisterActor actor,
    WalletCreateCanisterArg0 arg,
  ) async {
    final request = [arg];
    const method = 'wallet_create_canister';
    final response = await actor.getFunc(method)!(request);
    return CreateResult.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   wallet_create_wallet: (record { cycles: nat64; controller: opt principal }) -> (CreateResult)
  /// ```
  static Future<CreateResult> walletCreateWallet(
    CanisterActor actor,
    WalletCreateWalletArg0 arg,
  ) async {
    final request = [arg];
    const method = 'wallet_create_wallet';
    final response = await actor.getFunc(method)!(request);
    return CreateResult.fromIDLDeserializable(response);
  }

  /// ```Candid
  ///   wallet_call: (record { canister: principal; method_name: text; args: blob; cycles: nat64 }) -> (ResultCall)
  /// ```
  static Future<ResultCall> walletCall(
    CanisterActor actor,
    WalletCallArg0 arg,
  ) async {
    final request = [arg];
    const method = 'wallet_call';
    final response = await actor.getFunc(method)!(request);
    return ResultCall.fromIDLDeserializable(response);
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

  /// ```Candid
  ///   allowance: (principal, principal) -> (nat) query
  /// ```
  Future<BigInt> allowance(
    AllowanceArg arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.allowance(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   approve: (principal, nat) -> (TxReceipt)
  /// ```
  Future<TxReceipt> approve(
    ApproveArg arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.approve(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   balanceOf: (principal) -> (nat) query
  /// ```
  Future<BigInt> balanceOf(
    Principal arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.balanceOf(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   decimals: () -> (nat8) query
  /// ```
  Future<int> decimals() async {
    final actor = await getActor();
    return XtcIDLActor.decimals(
      actor,
    );
  }

  /// ```Candid
  ///   getMetadata: () -> (Metadata) query
  /// ```
  Future<Metadata> getMetadata() async {
    final actor = await getActor();
    return XtcIDLActor.getMetadata(
      actor,
    );
  }

  /// ```Candid
  ///   historySize: () -> (nat) query
  /// ```
  Future<BigInt> historySize() async {
    final actor = await getActor();
    return XtcIDLActor.historySize(
      actor,
    );
  }

  /// ```Candid
  ///   logo: () -> (text) query
  /// ```
  Future<String> logo() async {
    final actor = await getActor();
    return XtcIDLActor.logo(
      actor,
    );
  }

  /// ```Candid
  ///   nameErc20: () -> (text) query
  /// ```
  Future<String> nameErc20() async {
    final actor = await getActor();
    return XtcIDLActor.nameErc20(
      actor,
    );
  }

  /// ```Candid
  ///   name: () -> (text) query
  /// ```
  Future<String> name() async {
    final actor = await getActor();
    return XtcIDLActor.name(
      actor,
    );
  }

  /// ```Candid
  ///   symbol: () -> (text) query
  /// ```
  Future<String> symbol() async {
    final actor = await getActor();
    return XtcIDLActor.symbol(
      actor,
    );
  }

  /// ```Candid
  ///   totalSupply: () -> (nat) query
  /// ```
  Future<BigInt> totalSupply() async {
    final actor = await getActor();
    return XtcIDLActor.totalSupply(
      actor,
    );
  }

  /// ```Candid
  ///   transferErc20: (principal, nat) -> (TxReceiptLegacy)
  /// ```
  Future<TxReceiptLegacy> transferErc20(
    TransferErc20Arg arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.transferErc20(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   transfer: (principal, nat) -> (TxReceipt)
  /// ```
  Future<TxReceipt> transfer(
    TransferArg arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.transfer(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   transferFrom: (principal, principal, nat) -> (TxReceipt)
  /// ```
  Future<TxReceipt> transferFrom(
    TransferFromArg arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.transferFrom(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   mint: (principal, nat) -> (MintResult)
  /// ```
  Future<MintResult> mint(
    MintArg arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.mint(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   isBlockUsed: (nat64) -> (bool) query
  /// ```
  Future<bool> isBlockUsed(
    BigInt arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.isBlockUsed(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   getBlockUsed: () -> (vec nat64) query
  /// ```
  Future<List<BigInt>> getBlockUsed() async {
    final actor = await getActor();
    return XtcIDLActor.getBlockUsed(
      actor,
    );
  }

  /// ```Candid
  ///   get_map_block_used: (nat64) -> (opt nat64) query
  /// ```
  Future<BigInt?> getMapBlockUsed(
    BigInt arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.getMapBlockUsed(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   mint_by_icp: (opt vec nat8, nat64) -> (TxReceipt)
  /// ```
  Future<TxReceipt> mintByIcp(
    MintByIcpArg arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.mintByIcp(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   mint_by_icp_recover: (opt vec nat8, nat64, principal) -> (TxReceipt)
  /// ```
  Future<TxReceipt> mintByIcpRecover(
    MintByIcpRecoverArg arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.mintByIcpRecover(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   burn: (record { canister_id: principal; amount: nat64 }) -> (BurnResult)
  /// ```
  Future<BurnResult> burn(
    BurnArg0 arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.burn(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   balance: (opt principal) -> (amount: nat64)
  /// ```
  Future<BigInt> balance([
    Principal? arg,
  ]) async {
    final actor = await getActor();
    return XtcIDLActor.balance(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   events: (record { offset: opt nat64; limit: nat16 }) -> (EventsConnection) query
  /// ```
  Future<EventsConnection> events(
    EventsArg0 arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.events(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   halt: () -> ()
  /// ```
  Future<void> halt() async {
    final actor = await getActor();
    return XtcIDLActor.halt(
      actor,
    );
  }

  /// ```Candid
  ///   stats: () -> (Stats) query
  /// ```
  Future<Stats> stats() async {
    final actor = await getActor();
    return XtcIDLActor.stats(
      actor,
    );
  }

  /// ```Candid
  ///   wallet_balance: () -> (record { amount: nat64 }) query
  /// ```
  Future<WalletBalanceRet0> walletBalance() async {
    final actor = await getActor();
    return XtcIDLActor.walletBalance(
      actor,
    );
  }

  /// ```Candid
  ///   wallet_create_canister: (record { cycles: nat64; controller: opt principal }) -> (CreateResult)
  /// ```
  Future<CreateResult> walletCreateCanister(
    WalletCreateCanisterArg0 arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.walletCreateCanister(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   wallet_create_wallet: (record { cycles: nat64; controller: opt principal }) -> (CreateResult)
  /// ```
  Future<CreateResult> walletCreateWallet(
    WalletCreateWalletArg0 arg,
  ) async {
    final actor = await getActor();
    return XtcIDLActor.walletCreateWallet(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   wallet_call: (record { canister: principal; method_name: text; args: blob; cycles: nat64 }) -> (ResultCall)
  /// ```
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
    required this.canisterId,
    required this.amount,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory BurnArg0.fromIDLDeserializable(Map obj) {
    return BurnArg0(
      canisterId: Principal.from(obj['canister_id']),
      amount:
          obj['amount'] is BigInt ? obj['amount'] : BigInt.from(obj['amount']),
    );
  }

  factory BurnArg0.fromJson(Map json) {
    return BurnArg0(
      canisterId: Principal.from(json['canister_id']),
      amount: json['amount'] is BigInt
          ? json['amount']
          : json['amount'] is num
              ? BigInt.from(json['amount'])
              : BigInt.parse('${json['amount']}'),
    );
  }

  /// [canisterId] defined in Candid: `canister_id: principal`
  final Principal canisterId;

  /// [amount] defined in Candid: `amount: nat64`
  final BigInt amount;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final canisterId = this.canisterId;
    final amount = this.amount;
    return {
      'canister_id': canisterId,
      'amount': amount,
    };
  }

  Map<String, dynamic> toJson() {
    final canisterId = this.canisterId;
    final amount = this.amount.toString();
    return {
      'canister_id': canisterId,
      'amount': amount,
    };
  }

  BurnArg0 copyWith({
    Principal? canisterId,
    BigInt? amount,
  }) {
    return BurnArg0(
      canisterId: canisterId ?? this.canisterId,
      amount: amount ?? this.amount,
    );
  }

  @override
  bool operator ==(Object other) {
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
    this.offset,
    required this.limit,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory EventsArg0.fromIDLDeserializable(Map obj) {
    return EventsArg0(
      offset: (obj['offset'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      limit: obj['limit'],
    );
  }

  factory EventsArg0.fromJson(Map json) {
    return EventsArg0(
      offset: (json['offset'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : e is num
                    ? BigInt.from(e)
                    : BigInt.parse('${e}');
      }).firstOrNull,
      limit: json['limit'],
    );
  }

  /// [offset] defined in Candid: `offset: opt nat64`
  final BigInt? offset;

  /// [limit] defined in Candid: `limit: nat16`
  final int limit;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final offset = this.offset;
    final limit = this.limit;
    return {
      'offset': [if (offset != null) offset],
      'limit': limit,
    };
  }

  Map<String, dynamic> toJson() {
    final offset = this.offset?.toString();
    final limit = this.limit;
    return {
      'offset': [if (offset != null) offset],
      'limit': limit,
    };
  }

  EventsArg0 copyWith({
    BigInt? offset,
    int? limit,
  }) {
    return EventsArg0(
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
    );
  }

  @override
  bool operator ==(Object other) {
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
  const WalletBalanceRet0({required this.amount});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory WalletBalanceRet0.fromIDLDeserializable(Map obj) {
    return WalletBalanceRet0(
      amount:
          obj['amount'] is BigInt ? obj['amount'] : BigInt.from(obj['amount']),
    );
  }

  factory WalletBalanceRet0.fromJson(Map json) {
    return WalletBalanceRet0(
      amount: json['amount'] is BigInt
          ? json['amount']
          : json['amount'] is num
              ? BigInt.from(json['amount'])
              : BigInt.parse('${json['amount']}'),
    );
  }

  /// [amount] defined in Candid: `amount: nat64`
  final BigInt amount;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final amount = this.amount;
    return {
      'amount': amount,
    };
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount.toString();
    return {
      'amount': amount,
    };
  }

  WalletBalanceRet0 copyWith({BigInt? amount}) {
    return WalletBalanceRet0(
      amount: amount ?? this.amount,
    );
  }

  @override
  bool operator ==(Object other) {
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
    required this.cycles,
    this.controller,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory WalletCreateCanisterArg0.fromIDLDeserializable(Map obj) {
    return WalletCreateCanisterArg0(
      cycles:
          obj['cycles'] is BigInt ? obj['cycles'] : BigInt.from(obj['cycles']),
      controller: (obj['controller'] as List).map((e) {
        return e == null ? null : Principal.from(e);
      }).firstOrNull,
    );
  }

  factory WalletCreateCanisterArg0.fromJson(Map json) {
    return WalletCreateCanisterArg0(
      cycles: json['cycles'] is BigInt
          ? json['cycles']
          : json['cycles'] is num
              ? BigInt.from(json['cycles'])
              : BigInt.parse('${json['cycles']}'),
      controller: (json['controller'] as List).map((e) {
        return e == null ? null : Principal.from(e);
      }).firstOrNull,
    );
  }

  /// [cycles] defined in Candid: `cycles: nat64`
  final BigInt cycles;

  /// [controller] defined in Candid: `controller: opt principal`
  final Principal? controller;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final cycles = this.cycles;
    final controller = this.controller;
    return {
      'cycles': cycles,
      'controller': [if (controller != null) controller],
    };
  }

  Map<String, dynamic> toJson() {
    final cycles = this.cycles.toString();
    final controller = this.controller;
    return {
      'cycles': cycles,
      'controller': [if (controller != null) controller],
    };
  }

  WalletCreateCanisterArg0 copyWith({
    BigInt? cycles,
    Principal? controller,
  }) {
    return WalletCreateCanisterArg0(
      cycles: cycles ?? this.cycles,
      controller: controller ?? this.controller,
    );
  }

  @override
  bool operator ==(Object other) {
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
    required this.canister,
    required this.methodName,
    required this.args,
    required this.cycles,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory WalletCallArg0.fromIDLDeserializable(Map obj) {
    return WalletCallArg0(
      canister: Principal.from(obj['canister']),
      methodName: obj['method_name'],
      args: obj['args'] is Uint8List
          ? obj['args']
          : Uint8List.fromList((obj['args'] as List).cast()),
      cycles:
          obj['cycles'] is BigInt ? obj['cycles'] : BigInt.from(obj['cycles']),
    );
  }

  factory WalletCallArg0.fromJson(Map json) {
    return WalletCallArg0(
      canister: Principal.from(json['canister']),
      methodName: json['method_name'],
      args: json['args'] is Uint8List
          ? json['args']
          : Uint8List.fromList((json['args'] as List).cast()),
      cycles: json['cycles'] is BigInt
          ? json['cycles']
          : json['cycles'] is num
              ? BigInt.from(json['cycles'])
              : BigInt.parse('${json['cycles']}'),
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

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
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

  Map<String, dynamic> toJson() {
    final canister = this.canister;
    final methodName = this.methodName;
    final args = this.args;
    final cycles = this.cycles.toString();
    return {
      'canister': canister,
      'method_name': methodName,
      'args': args,
      'cycles': cycles,
    };
  }

  WalletCallArg0 copyWith({
    Principal? canister,
    String? methodName,
    Uint8List? args,
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
  bool operator ==(Object other) {
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
    required this.decimals,
    required this.fee,
    required this.logo,
    required this.name,
    required this.owner,
    required this.symbol,
    required this.totalSupply,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Metadata.fromIDLDeserializable(Map obj) {
    return Metadata(
      decimals: obj['decimals'],
      fee: obj['fee'] is BigInt ? obj['fee'] : BigInt.from(obj['fee']),
      logo: obj['logo'],
      name: obj['name'],
      owner: Principal.from(obj['owner']),
      symbol: obj['symbol'],
      totalSupply: obj['totalSupply'] is BigInt
          ? obj['totalSupply']
          : BigInt.from(obj['totalSupply']),
    );
  }

  factory Metadata.fromJson(Map json) {
    return Metadata(
      decimals: json['decimals'],
      fee: json['fee'] is BigInt
          ? json['fee']
          : json['fee'] is num
              ? BigInt.from(json['fee'])
              : BigInt.parse('${json['fee']}'),
      logo: json['logo'],
      name: json['name'],
      owner: Principal.from(json['owner']),
      symbol: json['symbol'],
      totalSupply: json['totalSupply'] is BigInt
          ? json['totalSupply']
          : json['totalSupply'] is num
              ? BigInt.from(json['totalSupply'])
              : BigInt.parse('${json['totalSupply']}'),
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

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
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

  Map<String, dynamic> toJson() {
    final decimals = this.decimals;
    final fee = this.fee.toString();
    final logo = this.logo;
    final name = this.name;
    final owner = this.owner;
    final symbol = this.symbol;
    final totalSupply = this.totalSupply.toString();
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
    int? decimals,
    BigInt? fee,
    String? logo,
    String? name,
    Principal? owner,
    String? symbol,
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
  bool operator ==(Object other) {
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

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TxError.fromIDLDeserializable(Map obj) {
    final key = obj.keys.first;
    return TxError.values.firstWhere((e) => e.name == key);
  }

  factory TxError.fromJson(Map json) {
    final key = json.keys.first;
    return TxError.values.firstWhere((e) => e.name == key);
  }

  final String name;

  bool get isInsufficientAllowance => this == TxError.insufficientAllowance;

  bool get isInsufficientBalance => this == TxError.insufficientBalance;

  bool get isErrorOperationStyle => this == TxError.errorOperationStyle;

  bool get isUnauthorized => this == TxError.unauthorized;

  bool get isLedgerTrap => this == TxError.ledgerTrap;

  bool get isErrorTo => this == TxError.errorTo;

  bool get isOther => this == TxError.other;

  bool get isBlockUsed => this == TxError.blockUsed;

  bool get isFetchRateFailed => this == TxError.fetchRateFailed;

  bool get isNotifyDfxFailed => this == TxError.notifyDfxFailed;

  bool get isUnexpectedCyclesResponse =>
      this == TxError.unexpectedCyclesResponse;

  bool get isAmountTooSmall => this == TxError.amountTooSmall;

  bool get isInsufficientXTCFee => this == TxError.insufficientXTCFee;

  Map<String, Null> toJson() {
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
    this.ok,
    this.err,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TxReceipt.fromIDLDeserializable(Map obj) {
    return TxReceipt(
      ok: obj['Ok'] == null
          ? null
          : obj['Ok'] is BigInt
              ? obj['Ok']
              : BigInt.from(obj['Ok']),
      err:
          obj['Err'] == null ? null : TxError.fromIDLDeserializable(obj['Err']),
    );
  }

  factory TxReceipt.fromJson(Map json) {
    return TxReceipt(
      ok: json['Ok'] == null
          ? null
          : json['Ok'] is BigInt
              ? json['Ok']
              : json['Ok'] is num
                  ? BigInt.from(json['Ok'])
                  : BigInt.parse('${json['Ok']}'),
      err: json['Err'] == null ? null : TxError.fromJson(json['Err']),
    );
  }

  /// [ok] defined in Candid: `Ok: nat`
  final BigInt? ok;

  /// [err] defined in Candid: `Err: TxError`
  final TxError? err;

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
    final err = this.err?.toJson();
    return {
      if (ok != null) 'Ok': ok,
      if (err != null) 'Err': err,
    };
  }

  TxReceipt copyWith({
    BigInt? ok,
    TxError? err,
  }) {
    return TxReceipt(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(Object other) {
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

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory BurnError.fromIDLDeserializable(Map obj) {
    final key = obj.keys.first;
    return BurnError.values.firstWhere((e) => e.name == key);
  }

  factory BurnError.fromJson(Map json) {
    final key = json.keys.first;
    return BurnError.values.firstWhere((e) => e.name == key);
  }

  final String name;

  bool get isInsufficientBalance => this == BurnError.insufficientBalance;

  bool get isInvalidTokenContract => this == BurnError.invalidTokenContract;

  bool get isNotSufficientLiquidity => this == BurnError.notSufficientLiquidity;

  Map<String, Null> toJson() {
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
    this.ok,
    this.err,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory BurnResult.fromIDLDeserializable(Map obj) {
    return BurnResult(
      ok: obj['Ok'] == null
          ? null
          : obj['Ok'] is BigInt
              ? obj['Ok']
              : BigInt.from(obj['Ok']),
      err: obj['Err'] == null
          ? null
          : BurnError.fromIDLDeserializable(obj['Err']),
    );
  }

  factory BurnResult.fromJson(Map json) {
    return BurnResult(
      ok: json['Ok'] == null
          ? null
          : json['Ok'] is BigInt
              ? json['Ok']
              : json['Ok'] is num
                  ? BigInt.from(json['Ok'])
                  : BigInt.parse('${json['Ok']}'),
      err: json['Err'] == null ? null : BurnError.fromJson(json['Err']),
    );
  }

  /// [ok] defined in Candid: `Ok: TransactionId`
  final TransactionId? ok;

  /// [err] defined in Candid: `Err: BurnError`
  final BurnError? err;

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
    final err = this.err?.toJson();
    return {
      if (ok != null) 'Ok': ok,
      if (err != null) 'Err': err,
    };
  }

  BurnResult copyWith({
    TransactionId? ok,
    BurnError? err,
  }) {
    return BurnResult(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(Object other) {
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

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TxReceiptLegacyErr.fromIDLDeserializable(Map obj) {
    final key = obj.keys.first;
    return TxReceiptLegacyErr.values.firstWhere((e) => e.name == key);
  }

  factory TxReceiptLegacyErr.fromJson(Map json) {
    final key = json.keys.first;
    return TxReceiptLegacyErr.values.firstWhere((e) => e.name == key);
  }

  final String name;

  bool get isInsufficientAllowance =>
      this == TxReceiptLegacyErr.insufficientAllowance;

  bool get isInsufficientBalance =>
      this == TxReceiptLegacyErr.insufficientBalance;

  Map<String, Null> toJson() {
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
    this.err,
    this.ok,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TxReceiptLegacy.fromIDLDeserializable(Map obj) {
    return TxReceiptLegacy(
      err: obj['Err'] == null
          ? null
          : TxReceiptLegacyErr.fromIDLDeserializable(
              obj['Err'],
            ),
      ok: obj['Ok'] == null
          ? null
          : obj['Ok'] is BigInt
              ? obj['Ok']
              : BigInt.from(obj['Ok']),
    );
  }

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
              : json['Ok'] is num
                  ? BigInt.from(json['Ok'])
                  : BigInt.parse('${json['Ok']}'),
    );
  }

  /// [err] defined in Candid: `Err: variant { InsufficientAllowance; InsufficientBalance }`
  final TxReceiptLegacyErr? err;

  /// [ok] defined in Candid: `Ok: nat`
  final BigInt? ok;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final err = this.err;
    final ok = this.ok;
    return {
      if (err != null) 'Err': err,
      if (ok != null) 'Ok': ok,
    };
  }

  Map<String, dynamic> toJson() {
    final err = this.err?.toJson();
    final ok = this.ok.toString();
    return {
      if (err != null) 'Err': err,
      if (ok != null) 'Ok': ok,
    };
  }

  TxReceiptLegacy copyWith({
    TxReceiptLegacyErr? err,
    BigInt? ok,
  }) {
    return TxReceiptLegacy(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(Object other) {
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

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory MintError.fromIDLDeserializable(Map obj) {
    final key = obj.keys.first;
    return MintError.values.firstWhere((e) => e.name == key);
  }

  factory MintError.fromJson(Map json) {
    final key = json.keys.first;
    return MintError.values.firstWhere((e) => e.name == key);
  }

  final String name;

  bool get isNotSufficientLiquidity => this == MintError.notSufficientLiquidity;

  Map<String, Null> toJson() {
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
    this.ok,
    this.err,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory MintResult.fromIDLDeserializable(Map obj) {
    return MintResult(
      ok: obj['Ok'] == null
          ? null
          : obj['Ok'] is BigInt
              ? obj['Ok']
              : BigInt.from(obj['Ok']),
      err: obj['Err'] == null
          ? null
          : MintError.fromIDLDeserializable(obj['Err']),
    );
  }

  factory MintResult.fromJson(Map json) {
    return MintResult(
      ok: json['Ok'] == null
          ? null
          : json['Ok'] is BigInt
              ? json['Ok']
              : json['Ok'] is num
                  ? BigInt.from(json['Ok'])
                  : BigInt.parse('${json['Ok']}'),
      err: json['Err'] == null ? null : MintError.fromJson(json['Err']),
    );
  }

  /// [ok] defined in Candid: `Ok: TransactionId`
  final TransactionId? ok;

  /// [err] defined in Candid: `Err: MintError`
  final MintError? err;

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
    final err = this.err?.toJson();
    return {
      if (ok != null) 'Ok': ok,
      if (err != null) 'Err': err,
    };
  }

  MintResult copyWith({
    TransactionId? ok,
    MintError? err,
  }) {
    return MintResult(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(Object other) {
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
  const ResultCallOk({required this.returnKey});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory ResultCallOk.fromIDLDeserializable(Map obj) {
    return ResultCallOk(
      returnKey: obj['returnKey'] is Uint8List
          ? obj['returnKey']
          : Uint8List.fromList((obj['returnKey'] as List).cast()),
    );
  }

  factory ResultCallOk.fromJson(Map json) {
    return ResultCallOk(
      returnKey: json['returnKey'] is Uint8List
          ? json['returnKey']
          : Uint8List.fromList((json['returnKey'] as List).cast()),
    );
  }

  /// [returnKey] defined in Candid: `returnKey: blob`
  final Uint8List returnKey;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final returnKey = this.returnKey;
    return {
      'returnKey': returnKey,
    };
  }

  Map<String, dynamic> toJson() {
    final returnKey = this.returnKey;
    return {
      'returnKey': returnKey,
    };
  }

  ResultCallOk copyWith({Uint8List? returnKey}) {
    return ResultCallOk(
      returnKey: returnKey ?? this.returnKey,
    );
  }

  @override
  bool operator ==(Object other) {
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
    this.ok,
    this.err,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory ResultCall.fromIDLDeserializable(Map obj) {
    return ResultCall(
      ok: obj['Ok'] == null
          ? null
          : ResultCallOk.fromIDLDeserializable(
              obj['Ok'],
            ),
      err: obj['Err'],
    );
  }

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
    final ok = this.ok?.toJson();
    final err = this.err;
    return {
      if (ok != null) 'Ok': ok,
      if (err != null) 'Err': err,
    };
  }

  ResultCall copyWith({
    ResultCallOk? ok,
    String? err,
  }) {
    return ResultCall(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(Object other) {
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
  const CreateResultOk({required this.canisterId});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory CreateResultOk.fromIDLDeserializable(Map obj) {
    return CreateResultOk(
      canisterId: Principal.from(obj['canister_id']),
    );
  }

  factory CreateResultOk.fromJson(Map json) {
    return CreateResultOk(
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

  CreateResultOk copyWith({Principal? canisterId}) {
    return CreateResultOk(
      canisterId: canisterId ?? this.canisterId,
    );
  }

  @override
  bool operator ==(Object other) {
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
    this.ok,
    this.err,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory CreateResult.fromIDLDeserializable(Map obj) {
    return CreateResult(
      ok: obj['Ok'] == null
          ? null
          : CreateResultOk.fromIDLDeserializable(
              obj['Ok'],
            ),
      err: obj['Err'],
    );
  }

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
    final ok = this.ok?.toJson();
    final err = this.err;
    return {
      if (ok != null) 'Ok': ok,
      if (err != null) 'Err': err,
    };
  }

  CreateResult copyWith({
    CreateResultOk? ok,
    String? err,
  }) {
    return CreateResult(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(Object other) {
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
    required this.from,
    required this.to,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory EventDetailTransfer.fromIDLDeserializable(Map obj) {
    return EventDetailTransfer(
      from: Principal.from(obj['from']),
      to: Principal.from(obj['to']),
    );
  }

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

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final from = this.from;
    final to = this.to;
    return {
      'from': from,
      'to': to,
    };
  }

  Map<String, dynamic> toJson() {
    final from = this.from;
    final to = this.to;
    return {
      'from': from,
      'to': to,
    };
  }

  EventDetailTransfer copyWith({
    Principal? from,
    Principal? to,
  }) {
    return EventDetailTransfer(
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  @override
  bool operator ==(Object other) {
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
  const EventDetailMint({required this.to});

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory EventDetailMint.fromIDLDeserializable(Map obj) {
    return EventDetailMint(
      to: Principal.from(obj['to']),
    );
  }

  factory EventDetailMint.fromJson(Map json) {
    return EventDetailMint(
      to: Principal.from(json['to']),
    );
  }

  /// [to] defined in Candid: `to: principal`
  final Principal to;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final to = this.to;
    return {
      'to': to,
    };
  }

  Map<String, dynamic> toJson() {
    final to = this.to;
    return {
      'to': to,
    };
  }

  EventDetailMint copyWith({Principal? to}) {
    return EventDetailMint(
      to: to ?? this.to,
    );
  }

  @override
  bool operator ==(Object other) {
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
    required this.from,
    required this.canister,
    required this.methodName,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory EventDetailCanisterCalled.fromIDLDeserializable(Map obj) {
    return EventDetailCanisterCalled(
      from: Principal.from(obj['from']),
      canister: Principal.from(obj['canister']),
      methodName: obj['method_name'],
    );
  }

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

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final from = this.from;
    final canister = this.canister;
    final methodName = this.methodName;
    return {
      'from': from,
      'canister': canister,
      'method_name': methodName,
    };
  }

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
    Principal? from,
    Principal? canister,
    String? methodName,
  }) {
    return EventDetailCanisterCalled(
      from: from ?? this.from,
      canister: canister ?? this.canister,
      methodName: methodName ?? this.methodName,
    );
  }

  @override
  bool operator ==(Object other) {
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
    required this.from,
    required this.canister,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory EventDetailCanisterCreated.fromIDLDeserializable(Map obj) {
    return EventDetailCanisterCreated(
      from: Principal.from(obj['from']),
      canister: Principal.from(obj['canister']),
    );
  }

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

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final from = this.from;
    final canister = this.canister;
    return {
      'from': from,
      'canister': canister,
    };
  }

  Map<String, dynamic> toJson() {
    final from = this.from;
    final canister = this.canister;
    return {
      'from': from,
      'canister': canister,
    };
  }

  EventDetailCanisterCreated copyWith({
    Principal? from,
    Principal? canister,
  }) {
    return EventDetailCanisterCreated(
      from: from ?? this.from,
      canister: canister ?? this.canister,
    );
  }

  @override
  bool operator ==(Object other) {
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
    required this.caller,
    required this.from,
    required this.to,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory EventDetailTransferFrom.fromIDLDeserializable(Map obj) {
    return EventDetailTransferFrom(
      caller: Principal.from(obj['caller']),
      from: Principal.from(obj['from']),
      to: Principal.from(obj['to']),
    );
  }

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

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final caller = this.caller;
    final from = this.from;
    final to = this.to;
    return {
      'caller': caller,
      'from': from,
      'to': to,
    };
  }

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
    Principal? caller,
    Principal? from,
    Principal? to,
  }) {
    return EventDetailTransferFrom(
      caller: caller ?? this.caller,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  @override
  bool operator ==(Object other) {
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
    this.transfer,
    this.mint,
    this.burn,
    this.canisterCalled,
    this.canisterCreated,
    this.transferFrom,
    this.approve,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory EventDetail.fromIDLDeserializable(Map obj) {
    return EventDetail(
      transfer: obj['Transfer'] == null
          ? null
          : EventDetailTransfer.fromIDLDeserializable(
              obj['Transfer'],
            ),
      mint: obj['Mint'] == null
          ? null
          : EventDetailMint.fromIDLDeserializable(
              obj['Mint'],
            ),
      burn: obj['Burn'] == null
          ? null
          : EventDetailBurn.fromIDLDeserializable(
              obj['Burn'],
            ),
      canisterCalled: obj['CanisterCalled'] == null
          ? null
          : EventDetailCanisterCalled.fromIDLDeserializable(
              obj['CanisterCalled'],
            ),
      canisterCreated: obj['CanisterCreated'] == null
          ? null
          : EventDetailCanisterCreated.fromIDLDeserializable(
              obj['CanisterCreated'],
            ),
      transferFrom: obj['TransferFrom'] == null
          ? null
          : EventDetailTransferFrom.fromIDLDeserializable(
              obj['TransferFrom'],
            ),
      approve: obj['Approve'] == null
          ? null
          : EventDetailApprove.fromIDLDeserializable(
              obj['Approve'],
            ),
    );
  }

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

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
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

  Map<String, dynamic> toJson() {
    final transfer = this.transfer?.toJson();
    final mint = this.mint?.toJson();
    final burn = this.burn;
    final canisterCalled = this.canisterCalled?.toJson();
    final canisterCreated = this.canisterCreated?.toJson();
    final transferFrom = this.transferFrom?.toJson();
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
    EventDetailTransfer? transfer,
    EventDetailMint? mint,
    EventDetailBurn? burn,
    EventDetailCanisterCalled? canisterCalled,
    EventDetailCanisterCreated? canisterCreated,
    EventDetailTransferFrom? transferFrom,
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
  bool operator ==(Object other) {
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

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransactionStatus.fromIDLDeserializable(Map obj) {
    final key = obj.keys.first;
    return TransactionStatus.values.firstWhere((e) => e.name == key);
  }

  factory TransactionStatus.fromJson(Map json) {
    final key = json.keys.first;
    return TransactionStatus.values.firstWhere((e) => e.name == key);
  }

  final String name;

  bool get isSucceeded => this == TransactionStatus.succeeded;

  bool get isFailed => this == TransactionStatus.failed;

  Map<String, Null> toJson() {
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
    required this.fee,
    required this.kind,
    required this.cycles,
    required this.timestamp,
    required this.status,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Event.fromIDLDeserializable(Map obj) {
    return Event(
      fee: obj['fee'] is BigInt ? obj['fee'] : BigInt.from(obj['fee']),
      kind: EventDetail.fromIDLDeserializable(obj['kind']),
      cycles:
          obj['cycles'] is BigInt ? obj['cycles'] : BigInt.from(obj['cycles']),
      timestamp: obj['timestamp'] is BigInt
          ? obj['timestamp']
          : BigInt.from(obj['timestamp']),
      status: TransactionStatus.fromIDLDeserializable(obj['status']),
    );
  }

  factory Event.fromJson(Map json) {
    return Event(
      fee: json['fee'] is BigInt
          ? json['fee']
          : json['fee'] is num
              ? BigInt.from(json['fee'])
              : BigInt.parse('${json['fee']}'),
      kind: EventDetail.fromJson(json['kind']),
      cycles: json['cycles'] is BigInt
          ? json['cycles']
          : json['cycles'] is num
              ? BigInt.from(json['cycles'])
              : BigInt.parse('${json['cycles']}'),
      timestamp: json['timestamp'] is BigInt
          ? json['timestamp']
          : json['timestamp'] is num
              ? BigInt.from(json['timestamp'])
              : BigInt.parse('${json['timestamp']}'),
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

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
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

  Map<String, dynamic> toJson() {
    final fee = this.fee.toString();
    final kind = this.kind;
    final cycles = this.cycles.toString();
    final timestamp = this.timestamp.toString();
    final status = this.status.toJson();
    return {
      'fee': fee,
      'kind': kind,
      'cycles': cycles,
      'timestamp': timestamp,
      'status': status,
    };
  }

  Event copyWith({
    BigInt? fee,
    EventDetail? kind,
    BigInt? cycles,
    BigInt? timestamp,
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
  bool operator ==(Object other) {
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
    required this.data,
    required this.nextOffset,
    this.nextCanisterId,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory EventsConnection.fromIDLDeserializable(Map obj) {
    return EventsConnection(
      data: (obj['data'] as List).map((e) {
        return Event.fromIDLDeserializable(e);
      }).toList(),
      nextOffset: obj['next_offset'] is BigInt
          ? obj['next_offset']
          : BigInt.from(obj['next_offset']),
      nextCanisterId: (obj['next_canister_id'] as List).map((e) {
        return e == null ? null : Principal.from(e);
      }).firstOrNull,
    );
  }

  factory EventsConnection.fromJson(Map json) {
    return EventsConnection(
      data: (json['data'] as List).map((e) {
        return Event.fromJson(e);
      }).toList(),
      nextOffset: json['next_offset'] is BigInt
          ? json['next_offset']
          : json['next_offset'] is num
              ? BigInt.from(json['next_offset'])
              : BigInt.parse('${json['next_offset']}'),
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

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final data = this.data;
    final nextOffset = this.nextOffset;
    final nextCanisterId = this.nextCanisterId;
    return {
      'data': data,
      'next_offset': nextOffset,
      'next_canister_id': [if (nextCanisterId != null) nextCanisterId],
    };
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    final nextOffset = this.nextOffset.toString();
    final nextCanisterId = this.nextCanisterId;
    return {
      'data': data,
      'next_offset': nextOffset,
      'next_canister_id': [if (nextCanisterId != null) nextCanisterId],
    };
  }

  EventsConnection copyWith({
    List<Event>? data,
    TransactionId? nextOffset,
    Principal? nextCanisterId,
  }) {
    return EventsConnection(
      data: data ?? this.data,
      nextOffset: nextOffset ?? this.nextOffset,
      nextCanisterId: nextCanisterId ?? this.nextCanisterId,
    );
  }

  @override
  bool operator ==(Object other) {
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
    required this.supply,
    required this.fee,
    required this.historyEvents,
    required this.balance,
    required this.transfersCount,
    required this.transfersFromCount,
    required this.approvalsCount,
    required this.mintsCount,
    required this.burnsCount,
    required this.proxyCallsCount,
    required this.canistersCreatedCount,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Stats.fromIDLDeserializable(Map obj) {
    return Stats(
      supply:
          obj['supply'] is BigInt ? obj['supply'] : BigInt.from(obj['supply']),
      fee: obj['fee'] is BigInt ? obj['fee'] : BigInt.from(obj['fee']),
      historyEvents: obj['history_events'] is BigInt
          ? obj['history_events']
          : BigInt.from(obj['history_events']),
      balance: obj['balance'] is BigInt
          ? obj['balance']
          : BigInt.from(obj['balance']),
      transfersCount: obj['transfers_count'] is BigInt
          ? obj['transfers_count']
          : BigInt.from(obj['transfers_count']),
      transfersFromCount: obj['transfers_from_count'] is BigInt
          ? obj['transfers_from_count']
          : BigInt.from(obj['transfers_from_count']),
      approvalsCount: obj['approvals_count'] is BigInt
          ? obj['approvals_count']
          : BigInt.from(obj['approvals_count']),
      mintsCount: obj['mints_count'] is BigInt
          ? obj['mints_count']
          : BigInt.from(obj['mints_count']),
      burnsCount: obj['burns_count'] is BigInt
          ? obj['burns_count']
          : BigInt.from(obj['burns_count']),
      proxyCallsCount: obj['proxy_calls_count'] is BigInt
          ? obj['proxy_calls_count']
          : BigInt.from(obj['proxy_calls_count']),
      canistersCreatedCount: obj['canisters_created_count'] is BigInt
          ? obj['canisters_created_count']
          : BigInt.from(obj['canisters_created_count']),
    );
  }

  factory Stats.fromJson(Map json) {
    return Stats(
      supply: json['supply'] is BigInt
          ? json['supply']
          : json['supply'] is num
              ? BigInt.from(json['supply'])
              : BigInt.parse('${json['supply']}'),
      fee: json['fee'] is BigInt
          ? json['fee']
          : json['fee'] is num
              ? BigInt.from(json['fee'])
              : BigInt.parse('${json['fee']}'),
      historyEvents: json['history_events'] is BigInt
          ? json['history_events']
          : json['history_events'] is num
              ? BigInt.from(json['history_events'])
              : BigInt.parse('${json['history_events']}'),
      balance: json['balance'] is BigInt
          ? json['balance']
          : json['balance'] is num
              ? BigInt.from(json['balance'])
              : BigInt.parse('${json['balance']}'),
      transfersCount: json['transfers_count'] is BigInt
          ? json['transfers_count']
          : json['transfers_count'] is num
              ? BigInt.from(json['transfers_count'])
              : BigInt.parse('${json['transfers_count']}'),
      transfersFromCount: json['transfers_from_count'] is BigInt
          ? json['transfers_from_count']
          : json['transfers_from_count'] is num
              ? BigInt.from(json['transfers_from_count'])
              : BigInt.parse('${json['transfers_from_count']}'),
      approvalsCount: json['approvals_count'] is BigInt
          ? json['approvals_count']
          : json['approvals_count'] is num
              ? BigInt.from(json['approvals_count'])
              : BigInt.parse('${json['approvals_count']}'),
      mintsCount: json['mints_count'] is BigInt
          ? json['mints_count']
          : json['mints_count'] is num
              ? BigInt.from(json['mints_count'])
              : BigInt.parse('${json['mints_count']}'),
      burnsCount: json['burns_count'] is BigInt
          ? json['burns_count']
          : json['burns_count'] is num
              ? BigInt.from(json['burns_count'])
              : BigInt.parse('${json['burns_count']}'),
      proxyCallsCount: json['proxy_calls_count'] is BigInt
          ? json['proxy_calls_count']
          : json['proxy_calls_count'] is num
              ? BigInt.from(json['proxy_calls_count'])
              : BigInt.parse('${json['proxy_calls_count']}'),
      canistersCreatedCount: json['canisters_created_count'] is BigInt
          ? json['canisters_created_count']
          : json['canisters_created_count'] is num
              ? BigInt.from(json['canisters_created_count'])
              : BigInt.parse('${json['canisters_created_count']}'),
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

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
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

  Map<String, dynamic> toJson() {
    final supply = this.supply.toString();
    final fee = this.fee.toString();
    final historyEvents = this.historyEvents.toString();
    final balance = this.balance.toString();
    final transfersCount = this.transfersCount.toString();
    final transfersFromCount = this.transfersFromCount.toString();
    final approvalsCount = this.approvalsCount.toString();
    final mintsCount = this.mintsCount.toString();
    final burnsCount = this.burnsCount.toString();
    final proxyCallsCount = this.proxyCallsCount.toString();
    final canistersCreatedCount = this.canistersCreatedCount.toString();
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
    BigInt? supply,
    BigInt? fee,
    BigInt? historyEvents,
    BigInt? balance,
    BigInt? transfersCount,
    BigInt? transfersFromCount,
    BigInt? approvalsCount,
    BigInt? mintsCount,
    BigInt? burnsCount,
    BigInt? proxyCallsCount,
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
  bool operator ==(Object other) {
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

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory AllowanceArg.fromIDLDeserializable(List<dynamic> tuple) {
    return AllowanceArg(
      Principal.from(tuple[0]),
      Principal.from(tuple[1]),
    );
  }

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

  AllowanceArg copyWith({
    Principal? item1,
    Principal? item2,
  }) {
    return AllowanceArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(Object other) {
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

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory ApproveArg.fromIDLDeserializable(List<dynamic> tuple) {
    return ApproveArg(
      Principal.from(tuple[0]),
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
    );
  }

  factory ApproveArg.fromJson(List<dynamic> tuple) {
    return ApproveArg(
      Principal.from(tuple[0]),
      tuple[1] is BigInt
          ? tuple[1]
          : tuple[1] is num
              ? BigInt.from(tuple[1])
              : BigInt.parse('${tuple[1]}'),
    );
  }

  /// [item1] defined in Candid: `principal`
  final Principal item1;

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

  ApproveArg copyWith({
    Principal? item1,
    BigInt? item2,
  }) {
    return ApproveArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(Object other) {
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

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferErc20Arg.fromIDLDeserializable(List<dynamic> tuple) {
    return TransferErc20Arg(
      Principal.from(tuple[0]),
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
    );
  }

  factory TransferErc20Arg.fromJson(List<dynamic> tuple) {
    return TransferErc20Arg(
      Principal.from(tuple[0]),
      tuple[1] is BigInt
          ? tuple[1]
          : tuple[1] is num
              ? BigInt.from(tuple[1])
              : BigInt.parse('${tuple[1]}'),
    );
  }

  /// [item1] defined in Candid: `principal`
  final Principal item1;

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

  TransferErc20Arg copyWith({
    Principal? item1,
    BigInt? item2,
  }) {
    return TransferErc20Arg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(Object other) {
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

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferArg.fromIDLDeserializable(List<dynamic> tuple) {
    return TransferArg(
      Principal.from(tuple[0]),
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
    );
  }

  factory TransferArg.fromJson(List<dynamic> tuple) {
    return TransferArg(
      Principal.from(tuple[0]),
      tuple[1] is BigInt
          ? tuple[1]
          : tuple[1] is num
              ? BigInt.from(tuple[1])
              : BigInt.parse('${tuple[1]}'),
    );
  }

  /// [item1] defined in Candid: `principal`
  final Principal item1;

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

  TransferArg copyWith({
    Principal? item1,
    BigInt? item2,
  }) {
    return TransferArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(Object other) {
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

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TransferFromArg.fromIDLDeserializable(List<dynamic> tuple) {
    return TransferFromArg(
      Principal.from(tuple[0]),
      Principal.from(tuple[1]),
      tuple[2] is BigInt ? tuple[2] : BigInt.from(tuple[2]),
    );
  }

  factory TransferFromArg.fromJson(List<dynamic> tuple) {
    return TransferFromArg(
      Principal.from(tuple[0]),
      Principal.from(tuple[1]),
      tuple[2] is BigInt
          ? tuple[2]
          : tuple[2] is num
              ? BigInt.from(tuple[2])
              : BigInt.parse('${tuple[2]}'),
    );
  }

  /// [item1] defined in Candid: `principal`
  final Principal item1;

  /// [item2] defined in Candid: `principal`
  final Principal item2;

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
    final item2 = this.item2;
    final item3 = this.item3.toString();
    return [
      item1,
      item2,
      item3,
    ];
  }

  TransferFromArg copyWith({
    Principal? item1,
    Principal? item2,
    BigInt? item3,
  }) {
    return TransferFromArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
    );
  }

  @override
  bool operator ==(Object other) {
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

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory MintArg.fromIDLDeserializable(List<dynamic> tuple) {
    return MintArg(
      Principal.from(tuple[0]),
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
    );
  }

  factory MintArg.fromJson(List<dynamic> tuple) {
    return MintArg(
      Principal.from(tuple[0]),
      tuple[1] is BigInt
          ? tuple[1]
          : tuple[1] is num
              ? BigInt.from(tuple[1])
              : BigInt.parse('${tuple[1]}'),
    );
  }

  /// [item1] defined in Candid: `principal`
  final Principal item1;

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

  MintArg copyWith({
    Principal? item1,
    BigInt? item2,
  }) {
    return MintArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(Object other) {
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

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory MintByIcpArg.fromIDLDeserializable(List<dynamic> tuple) {
    return MintByIcpArg(
      (tuple[0] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
    );
  }

  factory MintByIcpArg.fromJson(List<dynamic> tuple) {
    return MintByIcpArg(
      (tuple[0] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      tuple[1] is BigInt
          ? tuple[1]
          : tuple[1] is num
              ? BigInt.from(tuple[1])
              : BigInt.parse('${tuple[1]}'),
    );
  }

  /// [item1] defined in Candid: `opt vec nat8`
  final Uint8List? item1;

  /// [item2] defined in Candid: `nat64`
  final BigInt item2;

  /// An extra method for the serialization with `packages:agent_dart`.
  List<dynamic> toIDLSerializable() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      [if (item1 != null) item1],
      item2,
    ];
  }

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2.toString();
    return [
      [if (item1 != null) item1],
      item2,
    ];
  }

  MintByIcpArg copyWith({
    Uint8List? item1,
    BigInt? item2,
  }) {
    return MintByIcpArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(Object other) {
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

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory MintByIcpRecoverArg.fromIDLDeserializable(List<dynamic> tuple) {
    return MintByIcpRecoverArg(
      (tuple[0] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
      Principal.from(tuple[2]),
    );
  }

  factory MintByIcpRecoverArg.fromJson(List<dynamic> tuple) {
    return MintByIcpRecoverArg(
      (tuple[0] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      tuple[1] is BigInt
          ? tuple[1]
          : tuple[1] is num
              ? BigInt.from(tuple[1])
              : BigInt.parse('${tuple[1]}'),
      Principal.from(tuple[2]),
    );
  }

  /// [item1] defined in Candid: `opt vec nat8`
  final Uint8List? item1;

  /// [item2] defined in Candid: `nat64`
  final BigInt item2;

  /// [item3] defined in Candid: `principal`
  final Principal item3;

  /// An extra method for the serialization with `packages:agent_dart`.
  List<dynamic> toIDLSerializable() {
    final item1 = this.item1;
    final item2 = this.item2;
    final item3 = this.item3;
    return [
      [if (item1 != null) item1],
      item2,
      item3,
    ];
  }

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2.toString();
    final item3 = this.item3;
    return [
      [if (item1 != null) item1],
      item2,
      item3,
    ];
  }

  MintByIcpRecoverArg copyWith({
    Uint8List? item1,
    BigInt? item2,
    Principal? item3,
  }) {
    return MintByIcpRecoverArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
    );
  }

  @override
  bool operator ==(Object other) {
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
