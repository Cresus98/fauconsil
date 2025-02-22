
import 'package:intl/intl.dart';

String date_format(DateTime date) {
  return DateFormat('dd/MM/yyyy')
      .format(DateTime(date.year, date.month, date.day));
}