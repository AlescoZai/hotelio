import 'package:intl/intl.dart';

class AppFormat {
  static String date(String stringDate) {
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('d MM yyyy', 'en_US').format(dateTime);
  }

  static String dateMonth(String stringDate) {
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('d MM', 'en_US').format(dateTime);
  }

  static String currency(double number) {
    return NumberFormat.currency(
      decimalDigits: 0,
      locale: 'en_US',
      symbol: '\$'
    ).format(number);
  }
}

