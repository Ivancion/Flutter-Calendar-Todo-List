import 'package:intl/intl.dart';

class DateConverter {
  String dateToYMMMFormat(DateTime date) {
    final df = DateFormat.yMMMM();
    return df.format(date);
  }

  String dateToYMMMMDFormat(DateTime date) {
    final df = DateFormat.yMMMMd();
    return df.format(date);
  }

  String convertTimeToTwoDigitsForm(int hours, int minutes) {
    final df = DateFormat('HH:mm');
    final date = DateTime(2022, 1, 1, hours, minutes);
    return df.format(date);
  }

  int convertStringTimeToInt(String time) {
    return time[0] == '0' ? int.parse(time.substring(1)) : int.parse(time);
  }
}
