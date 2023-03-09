import 'package:intl/intl.dart';

class Constants {
  static formatNumber(int number) {
    NumberFormat.compactCurrency(
      decimalDigits: 2,
      locale: 'en_IN',
      symbol: '',
    ).format(number);
  }
}
