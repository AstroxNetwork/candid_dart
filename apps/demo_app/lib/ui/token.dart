import 'dart:async';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../internal/extensions.dart';
import '../internal/token.dart';
import '../widget/placeholder_text.dart';
import '../widget/simple_image.dart';

class TokenDetails extends StatefulWidget {
  const TokenDetails({
    super.key,
    required this.token,
  });

  final Token token;

  @override
  State<TokenDetails> createState() => _TokenDetailsState();
}

class _TokenDetailsState extends State<TokenDetails> {
  late final _token = widget.token;

  late final _selectedChartType = ValueNotifier(ChartType.volumeUSD);

  @override
  void initState() {
    super.initState();
    unawaited(_token.loadCharts());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await _token.loadCharts();
        },
        child: ValueListenableBuilder(
          valueListenable: _token,
          builder: (context, token, child) {
            final priceUSD = _token.price?.priceUSD ?? 0.0;
            final totalVolumeUSD = _token.price?.totalVolumeUSD ?? 0.0;
            final tvlUSD = _token.price?.tvlUSD ?? 0.0;
            final volumeUSD = _token.price?.volumeUSD ?? 0.0;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(_token.name),
                  pinned: true,
                  expandedHeight: 120.0,
                ),
                SliverToBoxAdapter(
                  child: AspectRatio(
                    aspectRatio: 1.6,
                    child: _buildChart(theme, token.charts),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(999.0),
                              child: SimpleImage(
                                _token.logo ?? '',
                                width: 42.0,
                                height: 42.0,
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: Text(
                                _token.symbol,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleLarge
                                    ?.copyWith(height: 1.25),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        _buildField(theme, 'Canister Id', _token.canisterId),
                        const SizedBox(height: 12.0),
                        Row(
                          children: [
                            Expanded(
                              child: _buildField(
                                theme,
                                'USD',
                                '**\$** ${Decimal.parse(priceUSD.toString()).currencyFormat(
                                  zeroDecimals: 2,
                                  poundDecimals: 6,
                                )}',
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: _buildField(
                                theme,
                                'Total Volume',
                                '**\$** ${Decimal.parse(totalVolumeUSD.toString()).currencyFormat(zeroDecimals: 2)}',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          children: [
                            Expanded(
                              child: _buildField(
                                theme,
                                'TVL',
                                '**\$** ${Decimal.parse(tvlUSD.toString()).currencyFormat(
                                  zeroDecimals: 2,
                                )}',
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: _buildField(
                                theme,
                                'Volume',
                                '**\$** ${Decimal.parse(volumeUSD.toString()).currencyFormat(
                                  zeroDecimals: 2,
                                  poundDecimals: 6,
                                )}',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          children: [
                            Expanded(
                              child: _buildField(
                                theme,
                                'Standard',
                                _token.standard.name,
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: _buildField(
                                theme,
                                'Total Supply',
                                _token.totalSupply
                                    .withDecimals(_token.decimals)
                                    .currencyFormat(
                                      zeroDecimals: 2,
                                      poundDecimals: (_token.decimals - 2)
                                          .coerceAtLeast(0),
                                    ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          children: [
                            Expanded(
                              child: _buildField(
                                theme,
                                'Fee',
                                '${_token.fee.withDecimals(_token.decimals).currencyFormat(
                                      zeroDecimals: 2,
                                      poundDecimals: (_token.decimals - 2)
                                          .coerceAtLeast(0),
                                    )} ${_token.symbol}',
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: _buildField(
                                theme,
                                'Decimals',
                                _token.decimals.toString(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        Text(
                          'Introduction',
                          style: theme.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          _token.desc,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).padding.bottom + 36.0,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildChart(
    ThemeData theme,
    Map<ChartType, CharData> charts,
  ) {
    return ValueListenableBuilder(
      valueListenable: _selectedChartType,
      builder: (context, type, child) {
        final control = Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 24.0,
          ),
          child: CupertinoSlidingSegmentedControl<ChartType>(
            children: Map.fromEntries(
              ChartType.values.map(
                (e) {
                  return MapEntry(
                    e,
                    Text(
                      e.name,
                      style: theme.textTheme.labelMedium,
                    ),
                  );
                },
              ),
            ),
            groupValue: type,
            onValueChanged: (v) {
              _selectedChartType.value = v!;
            },
          ),
        );
        if (!charts.containsKey(type)) {
          return Column(
            children: [
              const Expanded(
                child: Center(
                  child: SizedBox(
                    width: 48.0,
                    height: 48.0,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              control,
            ],
          );
        }
        final chart = charts[type]!;
        final maxY = chart.maxY.toDouble();
        final q = maxY / 6.0;
        final bar = _buildLineChartData(theme, chart);
        final isCount = type == ChartType.txCount;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_circle_up_rounded,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        isCount
                            ? chart.maxY.toString()
                            : '\$ ${chart.maxY.currencyFormat(zeroDecimals: 2, poundDecimals: 2)}',
                        style: theme.textTheme.labelLarge?.copyWith(
                          height: 1.25,
                          fontFeatures: [const FontFeature.tabularFigures()],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_circle_down_rounded,
                        color: theme.colorScheme.inversePrimary,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        isCount
                            ? chart.minY.toString()
                            : '\$ ${chart.minY.currencyFormat(zeroDecimals: 2, poundDecimals: 2)}',
                        style: theme.textTheme.labelLarge?.copyWith(
                          height: 1.25,
                          fontFeatures: [const FontFeature.tabularFigures()],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: charts.isEmpty
                  ? const SizedBox.shrink()
                  : LineChart(
                      LineChartData(
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        titlesData: FlTitlesData(show: false),
                        lineTouchData: LineTouchData(enabled: false),
                        maxY: maxY + q,
                        minY: -q,
                        lineBarsData: [bar],
                      ),
                    ),
            ),
            control,
          ],
        );
      },
    );
  }

  LineChartBarData _buildLineChartData(ThemeData theme, CharData chart) {
    final list = <FlSpot>[];
    chart.values.forEachIndexed((index, item) {
      list.add(FlSpot(index.toDouble(), item.toDouble()));
    });
    return LineChartBarData(
      isCurved: true,
      gradient: LinearGradient(
        colors: [
          theme.colorScheme.primary,
          theme.colorScheme.inversePrimary,
        ],
      ),
      barWidth: 3.0,
      isStrokeCapRound: true,
      isStrokeJoinRound: true,
      dotData: FlDotData(
        show: true,
        checkToShowDot: (spot, barData) {
          final index = spot.x.toInt();
          return index == chart.minIndex || index == chart.maxIndex;
        },
        getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
          radius: 6,
          color: spot.x.toInt() == chart.maxIndex
              ? theme.colorScheme.primary
              : theme.colorScheme.inversePrimary,
          strokeWidth: 1.5,
          strokeColor: theme.colorScheme.primaryContainer,
        ),
      ),
      belowBarData: BarAreaData(show: false),
      aboveBarData: BarAreaData(show: false),
      shadow: const Shadow(
        blurRadius: 4.0,
        offset: Offset(0.0, 1.0),
        color: Colors.black26,
      ),
      spots: list,
    );
  }

  Widget _buildField(ThemeData theme, String label, String value) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.bodySmall,
          ),
          PlaceholderText(
            value,
            style: theme.textTheme.titleMedium,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
