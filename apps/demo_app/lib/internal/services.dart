import 'package:agent_dart/agent_dart.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';
import 'package:oktoast/oktoast.dart';

import '../idl/dip20.idl.dart';
import '../idl/drc20.idl.dart';
import '../idl/ext.idl.dart';
import '../idl/icp_swap_tokens.idl.dart';
import '../idl/icp_swap_usdt.idl.dart';
import '../idl/icrc_1.idl.dart';
import '../idl/ledger.idl.dart';
import '../idl/wicp.idl.dart';
import '../idl/xtc.idl.dart';
import 'extensions.dart';
import 'token.dart';

final agentUrl = Uri.parse('https://ic0.app');

class USDTProvider extends IcpSwapUsdtIDLService {
  USDTProvider()
      : super(uri: agentUrl, canisterId: '4qix3-5iaaa-aaaag-qbljq-cai');
}

class TokenProvider extends IcpSwapTokensIDLService {
  TokenProvider()
      : super(uri: agentUrl, canisterId: '5hl3d-3aaaa-aaaan-qapta-cai');
}

class TokenManager extends ChangeNotifier
    implements ValueListenable<TokenManager> {

  TokenManager(this._tokenProvider, this._usdtProvider);
  final TokenProvider _tokenProvider;
  final USDTProvider _usdtProvider;

  List<Token> _tokens = [];
  final Map<String, PublicTokenOverview> _prices = {};

  List<Token> get tokens => _tokens;

  Future<void> refresh() {
    return [loadToken(), loadPrices()].wait();
  }

  Future<void> loadToken() async {
    final rep = await _tokenProvider.getList();
    if (rep.err != null) {
      showToast(rep.err!);
      return;
    }
    final tokens = [...rep.ok!];
    tokens.sort((a, b) => a.rank - b.rank);
    _tokens = tokens
        .map(
          (e) => Token(
            name: e.name,
            symbol: e.symbol,
            desc: e.introduction,
            standard: TokenStandard.of(e.standard),
            canisterId: e.canisterId,
            decimals: e.decimals.toInt(),
            fee: e.fee,
            totalSupply: e.totalSupply,
            price: _prices[e.symbol],
          )..getLogo(),
        )
        .toList();
    _tokens.insert(
      0,
      Token(
        name: 'Internet Computer',
        symbol: 'ICP',
        desc:
            'Internet Computer (ICP) is a decentralized blockchain network that was officially launched in May 2021 by the DFINITY Foundation with a global goal to push the boundaries of Internet functionality and support smart contract development at a larger scale. Among the advantages of the project include a skilled team of crypto enthusiasts and the capability for smart contracts, allowing developers to create dApps. Moreover, ICP supports almost endless scalability and a high level of security maintained through a system of checks.',
        standard: TokenStandard.ICP,
        canisterId: 'ryjl3-tyaaa-aaaaa-aaaba-cai',
        decimals: 8,
        fee: BigInt.from(10000),
        totalSupply: BigInt.zero,
        price: _prices['ICP'],
      ),
    );
    notifyListeners();
  }

  Future<void> loadPrices() async {
    final list = await _usdtProvider.getAllToken();
    for (final token in list) {
      _prices[token.symbol] = token;
    }
    for (final token in _tokens) {
      final price = _prices[token.symbol];
      if (price != null) {
        token.price = price;
      }
    }
    notifyListeners();
  }

  @override
  TokenManager get value => this;
}

abstract class TokenService {

  const TokenService(this.token);
  factory TokenService.of(Token token) {
    switch (token.standard) {
      case TokenStandard.ICP:
        return LedgerTokenService(token);
      case TokenStandard.XTC:
        return XtcTokenService(token);
      case TokenStandard.DIP20:
        return Dip20TokenService(token);
      case TokenStandard.EXT:
        return ExtTokenService(token);
      case TokenStandard.DRC20:
        return Drc20TokenService(token);
      case TokenStandard.ICRC1:
        return Icrc1TokenService(token);
    }
  }

  final Token token;

  Future<Decimal> getBalance(Principal principal);

  Future<String?> getLogo();
}

class Dip20TokenService extends Dip20IDLService implements TokenService {
  Dip20TokenService(
    this.token, {
    super.identity,
  }) : super(canisterId: token.canisterId, uri: agentUrl);

  @override
  final Token token;

  @override
  Future<Decimal> getBalance(Principal principal) async {
    final balance = await balanceOf(principal);
    return balance.withDecimals(token.decimals);
  }

  @override
  Future<String> getLogo() {
    return logo();
  }
}

class Drc20TokenService extends Drc20IDLService implements TokenService {
  Drc20TokenService(
    this.token, {
    super.identity,
  }) : super(canisterId: token.canisterId, uri: agentUrl);

  @override
  final Token token;

  @override
  Future<Decimal> getBalance(Principal principal) async {
    final balance = await drc20BalanceOf(principal.toText());
    return balance.withDecimals(token.decimals);
  }

  @override
  Future<String?> getLogo() {
    return Future.value();
  }
}

class Icrc1TokenService extends Icrc1IDLService implements TokenService {
  Icrc1TokenService(
    this.token, {
    super.identity,
  }) : super(canisterId: token.canisterId, uri: agentUrl);

  @override
  final Token token;

  @override
  Future<Decimal> getBalance(Principal principal) async {
    final balance = await icrc1BalanceOf(Account(owner: principal));
    return balance.withDecimals(token.decimals);
  }

  @override
  Future<String?> getLogo() {
    return Future.value();
  }
}

class WicpTokenService extends WicpIDLService implements TokenService {
  WicpTokenService(
    this.token, {
    super.identity,
  }) : super(canisterId: token.canisterId, uri: agentUrl);

  @override
  final Token token;

  @override
  Future<Decimal> getBalance(Principal principal) async {
    final balance = await balanceOf(principal);
    return balance.withDecimals(token.decimals);
  }

  @override
  Future<String?> getLogo() async {
    final metadata = await getMetadata();
    return metadata.logo;
  }
}

class XtcTokenService extends XtcIDLService implements TokenService {
  XtcTokenService(
    this.token, {
    super.identity,
  }) : super(canisterId: token.canisterId, uri: agentUrl);

  @override
  final Token token;

  @override
  Future<Decimal> getBalance(Principal principal) async {
    final balance = await balanceOf(principal);
    return balance.withDecimals(token.decimals);
  }

  @override
  Future<String?> getLogo() async {
    final metadata = await getMetadata();
    return metadata.logo;
  }
}

class LedgerTokenService extends LedgerIDLService implements TokenService {
  LedgerTokenService(
    this.token, {
    super.identity,
  }) : super(canisterId: token.canisterId, uri: agentUrl);

  @override
  final Token token;

  @override
  Future<Decimal> getBalance(Principal principal) async {
    final tokens = await accountBalance(
      AccountBalanceArgs(account: principal.toAccountId()),
    );
    return tokens.e8s.withDecimals(token.decimals);
  }

  @override
  Future<String?> getLogo() {
    return Future.value();
  }
}

class ExtTokenService extends ExtIDLService implements TokenService {
  ExtTokenService(
    this.token, {
    super.identity,
  }) : super(canisterId: token.canisterId, uri: agentUrl);

  @override
  final Token token;

  @override
  Future<Decimal> getBalance(Principal principal) async {
    final b = await balance(
      BalanceRequest(
        token: token.canisterId,
        user: User(principal: principal),
      ),
    );
    return b.ok!.withDecimals(token.decimals);
  }

  @override
  Future<String?> getLogo() {
    return Future.value();
  }
}
