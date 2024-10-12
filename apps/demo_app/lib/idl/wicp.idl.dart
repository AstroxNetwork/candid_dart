// coverage:ignore-file
// ignore_for_file: type=lint, unnecessary_null_comparison, unnecessary_non_null_assertion, unused_field, unused_import
// ======================================
// GENERATED CODE - DO NOT MODIFY BY HAND
// ======================================

import 'dart:async';
import 'dart:typed_data';
import 'package:agent_dart/agent_dart.dart';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

class WicpIDLActor {
  const WicpIDLActor._();

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
  ///   approve: (principal, nat) -> (Result)
  /// ```
  static Future<Result> approve(
    CanisterActor actor,
    ApproveArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'approve';
    final response = await actor.getFunc(method)!(request);
    return Result.fromJson(response);
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
  ///   getAllowanceSize: () -> (nat64) query
  /// ```
  static Future<BigInt> getAllowanceSize(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'getAllowanceSize';
    final response = await actor.getFunc(method)!(request);
    return response is BigInt ? response : BigInt.from(response);
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
  ///   getHolders: (nat64, nat64) -> (vec record { principal; nat }) query
  /// ```
  static Future<List<GetHoldersRet0Item>> getHolders(
    CanisterActor actor,
    GetHoldersArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'getHolders';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
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
    const request = [];
    const method = 'getMetadata';
    final response = await actor.getFunc(method)!(request);
    return Metadata.fromJson(response);
  }

  /// ```Candid
  ///   getTokenInfo: () -> (TokenInfo) query
  /// ```
  static Future<TokenInfo> getTokenInfo(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'getTokenInfo';
    final response = await actor.getFunc(method)!(request);
    return TokenInfo.fromJson(response);
  }

  /// ```Candid
  ///   getUserApprovals: (principal) -> (vec record { principal; nat }) query
  /// ```
  static Future<List<GetUserApprovalsRet0Item>> getUserApprovals(
    CanisterActor actor,
    Principal arg,
  ) async {
    final request = [arg];
    const method = 'getUserApprovals';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
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
    const request = [];
    const method = 'historySize';
    final response = await actor.getFunc(method)!(request);
    return response is BigInt ? response : BigInt.from(response);
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
  ///   mint: (opt vec nat8, nat64) -> (Result)
  /// ```
  static Future<Result> mint(
    CanisterActor actor,
    MintArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'mint';
    final response = await actor.getFunc(method)!(request);
    return Result.fromJson(response);
  }

  /// ```Candid
  ///   mintFor: (opt vec nat8, nat64, principal) -> (Result)
  /// ```
  static Future<Result> mintFor(
    CanisterActor actor,
    MintForArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'mintFor';
    final response = await actor.getFunc(method)!(request);
    return Result.fromJson(response);
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
  ///   owner: () -> (principal) query
  /// ```
  static Future<Principal> owner(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'owner';
    final response = await actor.getFunc(method)!(request);
    return Principal.from(response);
  }

  /// ```Candid
  ///   setFee: (nat) -> ()
  /// ```
  static Future<void> setFee(
    CanisterActor actor,
    BigInt arg,
  ) async {
    final request = [arg];
    const method = 'setFee';
    await actor.getFunc(method)!(request);
  }

  /// ```Candid
  ///   setFeeTo: (principal) -> ()
  /// ```
  static Future<void> setFeeTo(
    CanisterActor actor,
    Principal arg,
  ) async {
    final request = [arg];
    const method = 'setFeeTo';
    await actor.getFunc(method)!(request);
  }

  /// ```Candid
  ///   setGenesis: () -> (Result)
  /// ```
  static Future<Result> setGenesis(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'setGenesis';
    final response = await actor.getFunc(method)!(request);
    return Result.fromJson(response);
  }

  /// ```Candid
  ///   setLogo: (text) -> ()
  /// ```
  static Future<void> setLogo(
    CanisterActor actor,
    String arg,
  ) async {
    final request = [arg];
    const method = 'setLogo';
    await actor.getFunc(method)!(request);
  }

  /// ```Candid
  ///   setName: (text) -> ()
  /// ```
  static Future<void> setName(
    CanisterActor actor,
    String arg,
  ) async {
    final request = [arg];
    const method = 'setName';
    await actor.getFunc(method)!(request);
  }

  /// ```Candid
  ///   setOwner: (principal) -> ()
  /// ```
  static Future<void> setOwner(
    CanisterActor actor,
    Principal arg,
  ) async {
    final request = [arg];
    const method = 'setOwner';
    await actor.getFunc(method)!(request);
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
  ///   transfer: (principal, nat) -> (Result)
  /// ```
  static Future<Result> transfer(
    CanisterActor actor,
    TransferArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'transfer';
    final response = await actor.getFunc(method)!(request);
    return Result.fromJson(response);
  }

  /// ```Candid
  ///   transferFrom: (principal, principal, nat) -> (Result)
  /// ```
  static Future<Result> transferFrom(
    CanisterActor actor,
    TransferFromArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'transferFrom';
    final response = await actor.getFunc(method)!(request);
    return Result.fromJson(response);
  }

  /// ```Candid
  ///   withdraw: (nat64, text) -> (Result)
  /// ```
  static Future<Result> withdraw(
    CanisterActor actor,
    WithdrawArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'withdraw';
    final response = await actor.getFunc(method)!(request);
    return Result.fromJson(response);
  }
}

class WicpIDLService {
  WicpIDLService({
    required this.canisterId,
    required this.uri,
    this.identity,
    this.createActorMethod,
    this.debug = true,
  }) : idl = WicpIDL.idl;

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
    return WicpIDLActor.allowance(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   approve: (principal, nat) -> (Result)
  /// ```
  Future<Result> approve(
    ApproveArg arg,
  ) async {
    final actor = await getActor();
    return WicpIDLActor.approve(
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
    return WicpIDLActor.balanceOf(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   decimals: () -> (nat8) query
  /// ```
  Future<int> decimals() async {
    final actor = await getActor();
    return WicpIDLActor.decimals(
      actor,
    );
  }

  /// ```Candid
  ///   getAllowanceSize: () -> (nat64) query
  /// ```
  Future<BigInt> getAllowanceSize() async {
    final actor = await getActor();
    return WicpIDLActor.getAllowanceSize(
      actor,
    );
  }

  /// ```Candid
  ///   getBlockUsed: () -> (vec nat64) query
  /// ```
  Future<List<BigInt>> getBlockUsed() async {
    final actor = await getActor();
    return WicpIDLActor.getBlockUsed(
      actor,
    );
  }

  /// ```Candid
  ///   getHolders: (nat64, nat64) -> (vec record { principal; nat }) query
  /// ```
  Future<List<GetHoldersRet0Item>> getHolders(
    GetHoldersArg arg,
  ) async {
    final actor = await getActor();
    return WicpIDLActor.getHolders(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   getMetadata: () -> (Metadata) query
  /// ```
  Future<Metadata> getMetadata() async {
    final actor = await getActor();
    return WicpIDLActor.getMetadata(
      actor,
    );
  }

  /// ```Candid
  ///   getTokenInfo: () -> (TokenInfo) query
  /// ```
  Future<TokenInfo> getTokenInfo() async {
    final actor = await getActor();
    return WicpIDLActor.getTokenInfo(
      actor,
    );
  }

  /// ```Candid
  ///   getUserApprovals: (principal) -> (vec record { principal; nat }) query
  /// ```
  Future<List<GetUserApprovalsRet0Item>> getUserApprovals(
    Principal arg,
  ) async {
    final actor = await getActor();
    return WicpIDLActor.getUserApprovals(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   historySize: () -> (nat64) query
  /// ```
  Future<BigInt> historySize() async {
    final actor = await getActor();
    return WicpIDLActor.historySize(
      actor,
    );
  }

  /// ```Candid
  ///   isBlockUsed: (nat64) -> (bool) query
  /// ```
  Future<bool> isBlockUsed(
    BigInt arg,
  ) async {
    final actor = await getActor();
    return WicpIDLActor.isBlockUsed(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   logo: () -> (text) query
  /// ```
  Future<String> logo() async {
    final actor = await getActor();
    return WicpIDLActor.logo(
      actor,
    );
  }

  /// ```Candid
  ///   mint: (opt vec nat8, nat64) -> (Result)
  /// ```
  Future<Result> mint(
    MintArg arg,
  ) async {
    final actor = await getActor();
    return WicpIDLActor.mint(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   mintFor: (opt vec nat8, nat64, principal) -> (Result)
  /// ```
  Future<Result> mintFor(
    MintForArg arg,
  ) async {
    final actor = await getActor();
    return WicpIDLActor.mintFor(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   name: () -> (text) query
  /// ```
  Future<String> name() async {
    final actor = await getActor();
    return WicpIDLActor.name(
      actor,
    );
  }

  /// ```Candid
  ///   owner: () -> (principal) query
  /// ```
  Future<Principal> owner() async {
    final actor = await getActor();
    return WicpIDLActor.owner(
      actor,
    );
  }

  /// ```Candid
  ///   setFee: (nat) -> ()
  /// ```
  Future<void> setFee(
    BigInt arg,
  ) async {
    final actor = await getActor();
    return WicpIDLActor.setFee(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   setFeeTo: (principal) -> ()
  /// ```
  Future<void> setFeeTo(
    Principal arg,
  ) async {
    final actor = await getActor();
    return WicpIDLActor.setFeeTo(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   setGenesis: () -> (Result)
  /// ```
  Future<Result> setGenesis() async {
    final actor = await getActor();
    return WicpIDLActor.setGenesis(
      actor,
    );
  }

  /// ```Candid
  ///   setLogo: (text) -> ()
  /// ```
  Future<void> setLogo(
    String arg,
  ) async {
    final actor = await getActor();
    return WicpIDLActor.setLogo(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   setName: (text) -> ()
  /// ```
  Future<void> setName(
    String arg,
  ) async {
    final actor = await getActor();
    return WicpIDLActor.setName(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   setOwner: (principal) -> ()
  /// ```
  Future<void> setOwner(
    Principal arg,
  ) async {
    final actor = await getActor();
    return WicpIDLActor.setOwner(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   symbol: () -> (text) query
  /// ```
  Future<String> symbol() async {
    final actor = await getActor();
    return WicpIDLActor.symbol(
      actor,
    );
  }

  /// ```Candid
  ///   totalSupply: () -> (nat) query
  /// ```
  Future<BigInt> totalSupply() async {
    final actor = await getActor();
    return WicpIDLActor.totalSupply(
      actor,
    );
  }

  /// ```Candid
  ///   transfer: (principal, nat) -> (Result)
  /// ```
  Future<Result> transfer(
    TransferArg arg,
  ) async {
    final actor = await getActor();
    return WicpIDLActor.transfer(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   transferFrom: (principal, principal, nat) -> (Result)
  /// ```
  Future<Result> transferFrom(
    TransferFromArg arg,
  ) async {
    final actor = await getActor();
    return WicpIDLActor.transferFrom(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   withdraw: (nat64, text) -> (Result)
  /// ```
  Future<Result> withdraw(
    WithdrawArg arg,
  ) async {
    final actor = await getActor();
    return WicpIDLActor.withdraw(
      actor,
      arg,
    );
  }
}

class WicpIDL {
  const WicpIDL._();

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
  ///   type TxError = variant { InsufficientAllowance; InsufficientBalance; ErrorOperationStyle; Unauthorized; LedgerTrap; ErrorTo; Other; BlockUsed; AmountTooSmall };
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
    'getBlockUsed': IDL.Func(
      [],
      [
        IDL.Vec(
          IDL.Nat64,
        )
      ],
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
    'isBlockUsed': IDL.Func(
      [IDL.Nat64],
      [IDL.Bool],
      ['query'],
    ),
    'logo': IDL.Func(
      [],
      [IDL.Text],
      ['query'],
    ),
    'mint': IDL.Func(
      [
        IDL.Opt(
          IDL.Vec(
            IDL.Nat8,
          ),
        ),
        IDL.Nat64
      ],
      [_Result],
      [],
    ),
    'mintFor': IDL.Func(
      [
        IDL.Opt(
          IDL.Vec(
            IDL.Nat8,
          ),
        ),
        IDL.Nat64,
        IDL.Principal
      ],
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
    'setGenesis': IDL.Func(
      [],
      [_Result],
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
    'withdraw': IDL.Func(
      [IDL.Nat64, IDL.Text],
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
  bool operator ==(Object other) {
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
  bool operator ==(Object other) {
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
  bool operator ==(Object other) {
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
///   variant { InsufficientAllowance; InsufficientBalance; ErrorOperationStyle; Unauthorized; LedgerTrap; ErrorTo; Other; BlockUsed; AmountTooSmall }
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

  /// [amountTooSmall] defined in Candid: `AmountTooSmall`
  amountTooSmall('AmountTooSmall');

  const TxError(this.name);

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

  bool get isAmountTooSmall => this == TxError.amountTooSmall;

  Map<String, dynamic> toJson() {
    return {name: null};
  }

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
  bool operator ==(Object other) {
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
///   (opt vec nat8, nat64)
/// ```
@immutable
class MintArg {
  const MintArg(
    this.item1,
    this.item2,
  );

  factory MintArg.fromJson(List<dynamic> tuple) {
    return MintArg(
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

  MintArg copyWith({
    /// [item1] defined in Candid: `opt vec nat8`
    Uint8List? item1,

    /// [item2] defined in Candid: `nat64`
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

/// [MintForArg] defined in Candid
/// ```Candid
///   (opt vec nat8, nat64, principal)
/// ```
@immutable
class MintForArg {
  const MintForArg(
    this.item1,
    this.item2,
    this.item3,
  );

  factory MintForArg.fromJson(List<dynamic> tuple) {
    return MintForArg(
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

  MintForArg copyWith({
    /// [item1] defined in Candid: `opt vec nat8`
    Uint8List? item1,

    /// [item2] defined in Candid: `nat64`
    BigInt? item2,

    /// [item3] defined in Candid: `principal`
    Principal? item3,
  }) {
    return MintForArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MintForArg &&
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

/// [WithdrawArg] defined in Candid
/// ```Candid
///   (nat64, text)
/// ```
@immutable
class WithdrawArg {
  const WithdrawArg(
    this.item1,
    this.item2,
  );

  factory WithdrawArg.fromJson(List<dynamic> tuple) {
    return WithdrawArg(
      tuple[0] is BigInt ? tuple[0] : BigInt.from(tuple[0]),
      tuple[1],
    );
  }

  /// [item1] defined in Candid: `nat64`
  final BigInt item1;

  /// [item2] defined in Candid: `text`
  final String item2;

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2;
    return [
      item1,
      item2,
    ];
  }

  WithdrawArg copyWith({
    /// [item1] defined in Candid: `nat64`
    BigInt? item1,

    /// [item2] defined in Candid: `text`
    String? item2,
  }) {
    return WithdrawArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WithdrawArg &&
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
