import 'package:agent_dart/agent_dart.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';

import '../idl/icp_swap_usdt.idl.dart';
import 'extensions.dart';
import 'services.dart';

enum TokenStandard {
  ICP('ICP'),
  XTC('XTC'),
  DIP20('DIP20'),
  EXT('EXT'),
  DRC20('DRC20'),
  ICRC1('ICRC-1'),
  ;

  const TokenStandard(this.name);

  factory TokenStandard.of(String name) {
    if (name.startsWith('ICRC')) {
      return TokenStandard.ICRC1;
    }
    return TokenStandard.values
        .firstWhere((e) => e.name == name.split('-').first);
  }

  final String name;
}

class Token extends ChangeNotifier implements ValueListenable<Token> {
  Token({
    required this.name,
    required this.symbol,
    required this.desc,
    required this.standard,
    required this.canisterId,
    required this.decimals,
    required this.fee,
    required this.totalSupply,
    PublicTokenOverview? price,
  }) : _price = price;
  final String name;
  final String symbol;
  final String desc;
  final TokenStandard standard;
  final String canisterId;
  final int decimals;
  final BigInt fee;
  final BigInt totalSupply;

  @override
  Token get value => this;

  late final TokenService service = TokenService.of(this);

  Decimal? _balance;
  PublicTokenOverview? _price;
  String? _logo;

  Decimal? get balance => _balance;

  PublicTokenOverview? get price => _price;

  set price(PublicTokenOverview? value) {
    _price = value;
    notifyListeners();
  }

  String? get logo => _logo;

  Principal? _principal;

  bool _loading = false;

  bool get loading => _loading;

  Future<Token> getLogo() async {
    _logo = await service.getLogo();
    notifyListeners();
    return this;
  }

  Future<Token> getBalance(Principal principal) async {
    _principal = principal;
    _loading = true;
    notifyListeners();
    try {
      final value = await service.getBalance(principal);
      if (_principal != principal) {
        return this;
      }
      _balance = value;
    } finally {
      if (_principal == principal) {
        _loading = false;
        notifyListeners();
      }
    }
    return this;
  }

  String get formatBalance => (_balance ?? Decimal.zero).currencyFormat(
        zeroDecimals: 2,
        poundDecimals: (decimals - 2).coerceAtLeast(0),
      );

  String get formatBalanceWithUSDT => ((_balance ?? Decimal.zero) *
              Decimal.parse((_price?.priceUSD ?? 0.0).toString()))
          .currencyFormat(
        zeroDecimals: 2,
        poundDecimals: 2,
      );

  Map<ChartType, CharData> _charts = {};

  Map<ChartType, CharData> get charts => _charts;

  Future<void> loadCharts() async {
    final charts = await USDTProvider().getTokenChartData(
      GetTokenChartDataArg(canisterId, BigInt.from(0), BigInt.from(30)),
    );
    final volumeUSD = CharData(ChartType.volumeUSD);
    final tvlUSD = CharData(ChartType.tvlUSD);
    final txCount = CharData(ChartType.tvlUSD);
    for (final item in charts) {
      final txc = Decimal.fromBigInt(item.txCount);
      final tvl = Decimal.parse(item.tvlUSD.toString());
      final vol = Decimal.parse(item.volumeUSD.toString());
      volumeUSD.values.add(Decimal.parse(vol.toString()));
      tvlUSD.values.add(Decimal.parse(tvl.toString()));
      txCount.values.add(Decimal.parse(txc.toString()));
      volumeUSD.minY = volumeUSD.minY > vol ? vol : volumeUSD.minY;
      tvlUSD.minY = tvlUSD.minY > tvl ? tvl : tvlUSD.minY;
      txCount.minY = txCount.minY > txc ? txc : txCount.minY;
      volumeUSD.maxY = volumeUSD.maxY < vol ? vol : volumeUSD.maxY;
      tvlUSD.maxY = tvlUSD.maxY < tvl ? tvl : tvlUSD.maxY;
      txCount.maxY = txCount.maxY < txc ? txc : txCount.maxY;
    }
    volumeUSD.minIndex =
        volumeUSD.values.indexWhere((e) => e == volumeUSD.minY);
    txCount.minIndex = txCount.values.indexWhere((e) => e == txCount.minY);
    tvlUSD.minIndex = tvlUSD.values.indexWhere((e) => e == tvlUSD.minY);
    volumeUSD.maxIndex =
        volumeUSD.values.indexWhere((e) => e == volumeUSD.maxY);
    txCount.maxIndex = txCount.values.indexWhere((e) => e == txCount.maxY);
    tvlUSD.maxIndex = tvlUSD.values.indexWhere((e) => e == tvlUSD.maxY);
    _charts = {
      ChartType.txCount: txCount,
      ChartType.volumeUSD: volumeUSD,
      ChartType.tvlUSD: tvlUSD,
    };
    notifyListeners();
  }
}

enum ChartType {
  volumeUSD('Volume USD'),
  tvlUSD('TVL USD'),
  txCount('TX Count'),
  ;

  const ChartType(this.name);

  final String name;
}

class CharData {
  CharData(this.type);

  final ChartType type;
  late Decimal minY = Decimal.fromInt(double.maxFinite.toInt());
  late Decimal maxY = minY;
  int minIndex = -1;
  int maxIndex = -1;
  List<Decimal> values = [];
}
