import 'package:calendar_todo_list/core/utils/date_converter.dart';
import 'package:rxdart/rxdart.dart';

class TodoTimeBloc {
  final DateConverter dateConverter;

  TodoTimeBloc(this.dateConverter);

  static final List<String> _hoursList = List.generate(24, (index) {
    if (index < 10) {
      return '0$index';
    } else {
      return '$index';
    }
  });

  static final List<String> _minutesList = List.generate(60, (index) {
    if (index < 10) {
      return '0$index';
    } else {
      return '$index';
    }
  });

  List<String> get hoursList => _hoursList;
  List<String> get minutesList => _minutesList;

  final _hours = BehaviorSubject<String>.seeded(_hoursList[0]);
  final _minutes = BehaviorSubject<String>.seeded(_minutesList[0]);

  Stream<String> get hoursStream => _hours.stream;
  Function(String str) get hoursSink => _hours.sink.add;
  String get hoursValue => _hours.stream.value;

  Stream<String> get minutesStream => _minutes.stream;
  Function(String str) get minutesSink => _minutes.sink.add;
  String get minutesValue => _minutes.stream.value;

  Stream<Time> get timeStream {
    return Rx.zip2(
      hoursStream,
      minutesStream,
      (String hourValue, String minuteValue) {
        return Time(
          hour: dateConverter.convertStringTimeToInt(hourValue),
          minute: dateConverter.convertStringTimeToInt(minuteValue),
        );
      },
    );
  }

  void dispose() {
    _hours.close();
    _minutes.close();
  }
}

class Time {
  final int hour;
  final int minute;

  Time({
    required this.hour,
    required this.minute,
  });
}
