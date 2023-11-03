import 'package:intl/intl.dart';

class Formatter {
  static String formatDate(String date) {
    final DateFormat formatter = DateFormat('dd - MMMM - yyyy');
    final String formatted = formatter.format(DateTime.parse(date));

    return formatted;
  }
}
