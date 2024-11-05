import 'dart:ui';

import 'package:intl/intl.dart';

List<FontVariation> variableFontWeight(double weight) {
  return [FontVariation('wght', weight)];
}

String formatCurrency(double? amount, {String symbol = ''}) {
  if (amount == null) return 'N/A';

  return NumberFormat.currency(
    locale: 'en_US',
    symbol: symbol,
    decimalDigits: 2,
  ).format(amount);
}

String formatDate(DateTime? date, {String? format}) {
  if (date == null) return 'N/A';

  if (format != null) {
    return DateFormat(format).format(date);
  }

  return DateFormat.yMMMd().format(date);
}

String capitalizeString(String s, {String sparator = '_'}) {
  if (s.isEmpty) return '';
  final words = s.split(sparator);
  final capitalized = words.map((word) {
    return word[0].toUpperCase() + word.substring(1);
  });
  return capitalized.join(' ');
}
