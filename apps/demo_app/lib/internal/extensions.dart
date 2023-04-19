import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:intl/intl.dart';

extension DecimalExtension on Decimal {
  String currencyFormat({
    String? pattern,
    int zeroDecimals = 0,
    int poundDecimals = 0,
    bool kSeparator = true,
  }) {
    if (pattern != null) {
      return NumberFormat(pattern, 'en_US').format(DecimalIntl(this));
    }
    assert(zeroDecimals >= 0 && poundDecimals >= 0);
    if (zeroDecimals > 0 || poundDecimals > 0) {
      pattern = kSeparator
          ? '#,##0.'
              .padRight(6 + zeroDecimals, '0')
              .padRight(6 + zeroDecimals + poundDecimals, '#')
          : '0.'
              .padRight(2 + zeroDecimals, '0')
              .padRight(2 + zeroDecimals + poundDecimals, '#');
    } else {
      pattern = kSeparator ? '#,##0' : '0';
    }
    return NumberFormat(pattern, 'en_US').format(DecimalIntl(this));
  }
}

extension BigIntExtension on BigInt {
  String currencyFormatWithDecimals({
    int decimals = 0,
    bool kSeparator = true,
  }) {
    assert(decimals >= 0);
    final decimal = withDecimals(decimals);
    final poundDecimals = decimals - 2;
    return decimal.currencyFormat(
      zeroDecimals: 2,
      poundDecimals: poundDecimals > 0 ? poundDecimals : 0,
      kSeparator: kSeparator,
    );
  }

  Decimal withDecimals(int decimals) {
    return (Decimal.fromBigInt(this) / decimals.tokenDecimalsToDecimal())
        .toDecimal(scaleOnInfinitePrecision: decimals);
  }
}

extension IntExtension on int {
  BigInt tokenDecimalsToBigInt() {
    assert(this >= 0);
    return BigInt.parse('1'.padRight(this + 1, '0'));
  }

  Decimal tokenDecimalsToDecimal() {
    return Decimal.fromBigInt(tokenDecimalsToBigInt());
  }
}

extension NumExtension<T extends num> on T {
  T coerceAtLeast(T minimumValue) {
    return this < minimumValue ? minimumValue : this;
  }

  T coerceAtMost(T maximumValue) {
    return this > maximumValue ? maximumValue : this;
  }
}

extension FutureOrExtension<T> on Iterable<FutureOr<T>> {
  Future<List<T>> waitOr({
    bool eagerError = false,
    void Function(T successValue)? cleanUp,
  }) {
    return Future.wait(
      map((e) => e is Future<T> ? e : Future.value(e)),
      eagerError: eagerError,
      cleanUp: cleanUp,
    );
  }
}

extension IterableFuture<T> on Iterable<Future<T>> {
  Future<List<T>> wait({
    bool eagerError = false,
    void Function(T successValue)? cleanUp,
  }) {
    return Future.wait(this, eagerError: eagerError, cleanUp: cleanUp);
  }
}
