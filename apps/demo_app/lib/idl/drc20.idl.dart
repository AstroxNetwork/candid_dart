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

class Drc20IDLActor {
  const Drc20IDLActor._();

  /// ```Candid
  ///   standard: () -> (text) query
  /// ```
  static Future<String> standard(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'standard';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   drc20_balanceOf: (Address) -> (Amount) query
  /// ```
  static Future<Amount> drc20BalanceOf(
    CanisterActor actor,
    Address arg,
  ) async {
    final request = [arg];
    const method = 'drc20_balanceOf';
    final response = await actor.getFunc(method)!(request);
    return response is BigInt ? response : BigInt.from(response);
  }

  /// ```Candid
  ///   drc20_decimals: () -> (nat8) query
  /// ```
  static Future<int> drc20Decimals(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'drc20_decimals';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   drc20_fee: () -> (Amount) query
  /// ```
  static Future<Amount> drc20Fee(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'drc20_fee';
    final response = await actor.getFunc(method)!(request);
    return response is BigInt ? response : BigInt.from(response);
  }

  /// ```Candid
  ///   drc20_metadata: () -> (vec Metadata) query
  /// ```
  static Future<List<Metadata>> drc20Metadata(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'drc20_metadata';
    final response = await actor.getFunc(method)!(request);
    return (response as List).map((e) {
      return Metadata.fromIDLDeserializable(e);
    }).toList();
  }

  /// ```Candid
  ///   drc20_name: () -> (text) query
  /// ```
  static Future<String> drc20Name(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'drc20_name';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   drc20_symbol: () -> (text) query
  /// ```
  static Future<String> drc20Symbol(
    CanisterActor actor,
  ) async {
    const request = [];
    const method = 'drc20_symbol';
    final response = await actor.getFunc(method)!(request);
    return response;
  }

  /// ```Candid
  ///   drc20_transfer: (To, Amount, opt Nonce, Sa: opt vec nat8, opt Data) -> (TxnResult)
  /// ```
  static Future<TxnResult> drc20Transfer(
    CanisterActor actor,
    Drc20TransferArg arg,
  ) async {
    final request = arg.toJson();
    const method = 'drc20_transfer';
    final response = await actor.getFunc(method)!(request);
    return TxnResult.fromIDLDeserializable(response);
  }
}

class Drc20IDLService {
  Drc20IDLService({
    required this.canisterId,
    required this.uri,
    this.identity,
    this.createActorMethod,
    this.debug = true,
  }) : idl = Drc20IDL.idl;

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
  ///   standard: () -> (text) query
  /// ```
  Future<String> standard() async {
    final actor = await getActor();
    return Drc20IDLActor.standard(
      actor,
    );
  }

  /// ```Candid
  ///   drc20_balanceOf: (Address) -> (Amount) query
  /// ```
  Future<Amount> drc20BalanceOf(
    Address arg,
  ) async {
    final actor = await getActor();
    return Drc20IDLActor.drc20BalanceOf(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   drc20_decimals: () -> (nat8) query
  /// ```
  Future<int> drc20Decimals() async {
    final actor = await getActor();
    return Drc20IDLActor.drc20Decimals(
      actor,
    );
  }

  /// ```Candid
  ///   drc20_fee: () -> (Amount) query
  /// ```
  Future<Amount> drc20Fee() async {
    final actor = await getActor();
    return Drc20IDLActor.drc20Fee(
      actor,
    );
  }

  /// ```Candid
  ///   drc20_metadata: () -> (vec Metadata) query
  /// ```
  Future<List<Metadata>> drc20Metadata() async {
    final actor = await getActor();
    return Drc20IDLActor.drc20Metadata(
      actor,
    );
  }

  /// ```Candid
  ///   drc20_name: () -> (text) query
  /// ```
  Future<String> drc20Name() async {
    final actor = await getActor();
    return Drc20IDLActor.drc20Name(
      actor,
    );
  }

  /// ```Candid
  ///   drc20_symbol: () -> (text) query
  /// ```
  Future<String> drc20Symbol() async {
    final actor = await getActor();
    return Drc20IDLActor.drc20Symbol(
      actor,
    );
  }

  /// ```Candid
  ///   drc20_transfer: (To, Amount, opt Nonce, Sa: opt vec nat8, opt Data) -> (TxnResult)
  /// ```
  Future<TxnResult> drc20Transfer(
    Drc20TransferArg arg,
  ) async {
    final actor = await getActor();
    return Drc20IDLActor.drc20Transfer(
      actor,
      arg,
    );
  }
}

class Drc20IDL {
  const Drc20IDL._();

  /// [_TxnResult] defined in Candid
  /// ```Candid
  ///   type TxnResult = variant { err: record { code: variant { DuplicateExecutedTransfer; InsufficientAllowance; InsufficientBalance; InsufficientGas; LockedTransferExpired; NoLockedTransfer; NonceError; UndefinedError }; message: text }; ok: Txid };
  /// ```
  static final VariantClass _TxnResult = IDL.Variant({
    'err': IDL.Record({
      'code': IDL.Variant({
        'DuplicateExecutedTransfer': IDL.Null,
        'InsufficientAllowance': IDL.Null,
        'InsufficientBalance': IDL.Null,
        'InsufficientGas': IDL.Null,
        'LockedTransferExpired': IDL.Null,
        'NoLockedTransfer': IDL.Null,
        'NonceError': IDL.Null,
        'UndefinedError': IDL.Null,
      }),
      'message': IDL.Text,
    }),
    'ok': _Txid,
  });

  /// [_Txid] defined in Candid
  /// ```Candid
  ///   type Txid = blob;
  /// ```
  static final _Txid = IDL.Vec(IDL.Nat8);

  /// [_To] defined in Candid
  /// ```Candid
  ///   type To = text;
  /// ```
  static final _To = IDL.Text;

  /// [_Nonce] defined in Candid
  /// ```Candid
  ///   type Nonce = nat;
  /// ```
  static final _Nonce = IDL.Nat;

  /// [_Metadata] defined in Candid
  /// ```Candid
  ///   type Metadata = record { content: text; name: text };
  /// ```
  static final RecordClass _Metadata = IDL.Record({
    'content': IDL.Text,
    'name': IDL.Text,
  });

  /// [_Data] defined in Candid
  /// ```Candid
  ///   type Data = blob;
  /// ```
  static final _Data = IDL.Vec(IDL.Nat8);

  /// [_Amount] defined in Candid
  /// ```Candid
  ///   type Amount = nat;
  /// ```
  static final _Amount = IDL.Nat;

  /// [_Address] defined in Candid
  /// ```Candid
  ///   type Address = text;
  /// ```
  static final _Address = IDL.Text;

  static final ServiceClass idl = IDL.Service({
    'standard': IDL.Func(
      [],
      [IDL.Text],
      ['query'],
    ),
    'drc20_balanceOf': IDL.Func(
      [_Address],
      [_Amount],
      ['query'],
    ),
    'drc20_decimals': IDL.Func(
      [],
      [IDL.Nat8],
      ['query'],
    ),
    'drc20_fee': IDL.Func(
      [],
      [_Amount],
      ['query'],
    ),
    'drc20_metadata': IDL.Func(
      [],
      [
        IDL.Vec(
          _Metadata,
        )
      ],
      ['query'],
    ),
    'drc20_name': IDL.Func(
      [],
      [IDL.Text],
      ['query'],
    ),
    'drc20_symbol': IDL.Func(
      [],
      [IDL.Text],
      ['query'],
    ),
    'drc20_transfer': IDL.Func(
      [
        _To,
        _Amount,
        IDL.Opt(
          _Nonce,
        ),
        IDL.Opt(
          IDL.Vec(
            IDL.Nat8,
          ),
        ),
        IDL.Opt(
          _Data,
        )
      ],
      [_TxnResult],
      [],
    ),
  });
}

/// [TxnResultErrCode] defined in Candid
/// ```Candid
///   variant { DuplicateExecutedTransfer; InsufficientAllowance; InsufficientBalance; InsufficientGas; LockedTransferExpired; NoLockedTransfer; NonceError; UndefinedError }
/// ```
enum TxnResultErrCode {
  /// [duplicateExecutedTransfer] defined in Candid: `DuplicateExecutedTransfer`
  duplicateExecutedTransfer('DuplicateExecutedTransfer'),

  /// [insufficientAllowance] defined in Candid: `InsufficientAllowance`
  insufficientAllowance('InsufficientAllowance'),

  /// [insufficientBalance] defined in Candid: `InsufficientBalance`
  insufficientBalance('InsufficientBalance'),

  /// [insufficientGas] defined in Candid: `InsufficientGas`
  insufficientGas('InsufficientGas'),

  /// [lockedTransferExpired] defined in Candid: `LockedTransferExpired`
  lockedTransferExpired('LockedTransferExpired'),

  /// [noLockedTransfer] defined in Candid: `NoLockedTransfer`
  noLockedTransfer('NoLockedTransfer'),

  /// [nonceError] defined in Candid: `NonceError`
  nonceError('NonceError'),

  /// [undefinedError] defined in Candid: `UndefinedError`
  undefinedError('UndefinedError');

  const TxnResultErrCode(this.name);

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TxnResultErrCode.fromIDLDeserializable(Map obj) {
    final key = obj.keys.first;
    return TxnResultErrCode.values.firstWhere((e) => e.name == key);
  }

  factory TxnResultErrCode.fromJson(Map json) {
    final key = json.keys.first;
    return TxnResultErrCode.values.firstWhere((e) => e.name == key);
  }

  final String name;

  bool get isDuplicateExecutedTransfer =>
      this == TxnResultErrCode.duplicateExecutedTransfer;

  bool get isInsufficientAllowance =>
      this == TxnResultErrCode.insufficientAllowance;

  bool get isInsufficientBalance =>
      this == TxnResultErrCode.insufficientBalance;

  bool get isInsufficientGas => this == TxnResultErrCode.insufficientGas;

  bool get isLockedTransferExpired =>
      this == TxnResultErrCode.lockedTransferExpired;

  bool get isNoLockedTransfer => this == TxnResultErrCode.noLockedTransfer;

  bool get isNonceError => this == TxnResultErrCode.nonceError;

  bool get isUndefinedError => this == TxnResultErrCode.undefinedError;

  Map<String, Null> toJson() {
    return {name: null};
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TxnResultErr] defined in Candid
/// ```Candid
///   record { code: variant { DuplicateExecutedTransfer; InsufficientAllowance; InsufficientBalance; InsufficientGas; LockedTransferExpired; NoLockedTransfer; NonceError; UndefinedError }; message: text }
/// ```
@immutable
class TxnResultErr {
  const TxnResultErr({
    required this.code,
    required this.message,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TxnResultErr.fromIDLDeserializable(Map obj) {
    return TxnResultErr(
      code: TxnResultErrCode.fromIDLDeserializable(
        obj['code'],
      ),
      message: obj['message'],
    );
  }

  factory TxnResultErr.fromJson(Map json) {
    return TxnResultErr(
      code: TxnResultErrCode.fromJson(
        json['code'],
      ),
      message: json['message'],
    );
  }

  /// [code] defined in Candid: `code: variant { DuplicateExecutedTransfer; InsufficientAllowance; InsufficientBalance; InsufficientGas; LockedTransferExpired; NoLockedTransfer; NonceError; UndefinedError }`
  final TxnResultErrCode code;

  /// [message] defined in Candid: `message: text`
  final String message;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final code = this.code;
    final message = this.message;
    return {
      'code': code,
      'message': message,
    };
  }

  Map<String, dynamic> toJson() {
    final code = this.code.toJson();
    final message = this.message;
    return {
      'code': code,
      'message': message,
    };
  }

  TxnResultErr copyWith({
    TxnResultErrCode? code,
    String? message,
  }) {
    return TxnResultErr(
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TxnResultErr &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, code, message]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [TxnResult] defined in Candid
/// ```Candid
///   variant { err: record { code: variant { DuplicateExecutedTransfer; InsufficientAllowance; InsufficientBalance; InsufficientGas; LockedTransferExpired; NoLockedTransfer; NonceError; UndefinedError }; message: text }; ok: Txid }
/// ```
@immutable
class TxnResult {
  const TxnResult({
    this.err,
    this.ok,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory TxnResult.fromIDLDeserializable(Map obj) {
    return TxnResult(
      err: obj['err'] == null
          ? null
          : TxnResultErr.fromIDLDeserializable(
              obj['err'],
            ),
      ok: obj['ok'] == null
          ? null
          : obj['ok'] is Uint8List
              ? obj['ok']
              : Uint8List.fromList((obj['ok'] as List).cast()),
    );
  }

  factory TxnResult.fromJson(Map json) {
    return TxnResult(
      err: json['err'] == null
          ? null
          : TxnResultErr.fromJson(
              json['err'],
            ),
      ok: json['ok'] == null
          ? null
          : json['ok'] is Uint8List
              ? json['ok']
              : Uint8List.fromList((json['ok'] as List).cast()),
    );
  }

  /// [err] defined in Candid: `err: record { code: variant { DuplicateExecutedTransfer; InsufficientAllowance; InsufficientBalance; InsufficientGas; LockedTransferExpired; NoLockedTransfer; NonceError; UndefinedError }; message: text }`
  final TxnResultErr? err;

  /// [ok] defined in Candid: `ok: Txid`
  final Txid? ok;

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
    final err = this.err?.toJson();
    final ok = this.ok;
    return {
      if (err != null) 'err': err,
      if (ok != null) 'ok': ok,
    };
  }

  TxnResult copyWith({
    TxnResultErr? err,
    Txid? ok,
  }) {
    return TxnResult(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TxnResult &&
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

/// [Metadata] defined in Candid
/// ```Candid
///   record { content: text; name: text }
/// ```
@immutable
class Metadata {
  const Metadata({
    required this.content,
    required this.name,
  });

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Metadata.fromIDLDeserializable(Map obj) {
    return Metadata(
      content: obj['content'],
      name: obj['name'],
    );
  }

  factory Metadata.fromJson(Map json) {
    return Metadata(
      content: json['content'],
      name: json['name'],
    );
  }

  /// [content] defined in Candid: `content: text`
  final String content;

  /// [name] defined in Candid: `name: text`
  final String name;

  /// An extra method for the serialization with `packages:agent_dart`.
  Map<String, dynamic> toIDLSerializable() {
    final content = this.content;
    final name = this.name;
    return {
      'content': content,
      'name': name,
    };
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final name = this.name;
    return {
      'content': content,
      'name': name,
    };
  }

  Metadata copyWith({
    String? content,
    String? name,
  }) {
    return Metadata(
      content: content ?? this.content,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Metadata &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, content, name]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Drc20TransferArg] defined in Candid
/// ```Candid
///   (To, Amount, opt Nonce, Sa: opt vec nat8, opt Data)
/// ```
@immutable
class Drc20TransferArg {
  const Drc20TransferArg(
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
  );

  /// An extra method for the deserialization with `packages:agent_dart`.
  factory Drc20TransferArg.fromIDLDeserializable(List<dynamic> tuple) {
    return Drc20TransferArg(
      tuple[0],
      tuple[1] is BigInt ? tuple[1] : BigInt.from(tuple[1]),
      (tuple[2] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      (tuple[3] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      (tuple[4] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
    );
  }

  factory Drc20TransferArg.fromJson(List<dynamic> tuple) {
    return Drc20TransferArg(
      tuple[0],
      tuple[1] is BigInt
          ? tuple[1]
          : tuple[1] is num
              ? BigInt.from(tuple[1])
              : BigInt.parse('${tuple[1]}'),
      (tuple[2] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : e is num
                    ? BigInt.from(e)
                    : BigInt.parse('${e}');
      }).firstOrNull,
      (tuple[3] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
      (tuple[4] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList((e as List).cast());
      }).firstOrNull,
    );
  }

  /// [item1] defined in Candid: `To`
  final To item1;

  /// [item2] defined in Candid: `Amount`
  final Amount item2;

  /// [item3] defined in Candid: `opt Nonce`
  final Nonce? item3;

  /// [item4] defined in Candid: `Sa: opt vec nat8`
  final Uint8List? item4;

  /// [item5] defined in Candid: `opt Data`
  final Data? item5;

  /// An extra method for the serialization with `packages:agent_dart`.
  List<dynamic> toIDLSerializable() {
    final item1 = this.item1;
    final item2 = this.item2;
    final item3 = this.item3;
    final item4 = this.item4;
    final item5 = this.item5;
    return [
      item1,
      item2,
      [if (item3 != null) item3],
      [if (item4 != null) item4],
      [if (item5 != null) item5],
    ];
  }

  List<dynamic> toJson() {
    final item1 = this.item1;
    final item2 = this.item2.toString();
    final item3 = this.item3?.toString();
    final item4 = this.item4;
    final item5 = this.item5;
    return [
      item1,
      item2,
      [if (item3 != null) item3],
      [if (item4 != null) item4],
      [if (item5 != null) item5],
    ];
  }

  Drc20TransferArg copyWith({
    To? item1,
    Amount? item2,
    Nonce? item3,
    Uint8List? item4,
    Data? item5,
  }) {
    return Drc20TransferArg(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
      item4 ?? this.item4,
      item5 ?? this.item5,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Drc20TransferArg &&
            (identical(other.item1, item1) || other.item1 == item1) &&
            (identical(other.item2, item2) || other.item2 == item2) &&
            (identical(other.item3, item3) || other.item3 == item3) &&
            (identical(other.item4, item4) || other.item4 == item4) &&
            (identical(other.item5, item5) || other.item5 == item5));
  }

  @override
  int get hashCode =>
      Object.hashAll([runtimeType, item1, item2, item3, item4, item5]);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Txid] defined in Candid
/// ```Candid
///   type Txid = blob;
/// ```
typedef Txid = Uint8List;

/// [To] defined in Candid
/// ```Candid
///   type To = text;
/// ```
typedef To = String;

/// [Nonce] defined in Candid
/// ```Candid
///   type Nonce = nat;
/// ```
typedef Nonce = BigInt;

/// [Data] defined in Candid
/// ```Candid
///   type Data = blob;
/// ```
typedef Data = Uint8List;

/// [Amount] defined in Candid
/// ```Candid
///   type Amount = nat;
/// ```
typedef Amount = BigInt;

/// [Address] defined in Candid
/// ```Candid
///   type Address = text;
/// ```
typedef Address = String;
