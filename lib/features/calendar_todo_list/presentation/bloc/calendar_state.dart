import 'package:equatable/equatable.dart';

class CalendarState extends Equatable {
  final CalendarProperties dateProperties;
  final String titleDate;

  const CalendarState({
    required this.dateProperties,
    required this.titleDate,
  });

  @override
  List<Object> get props => [dateProperties];

  CalendarState copyWith({
    CalendarProperties? dateProperties,
    String? titleDate,
  }) {
    return CalendarState(
      dateProperties: dateProperties ?? this.dateProperties,
      titleDate: titleDate ?? this.titleDate,
    );
  }
}

class CalendarProperties extends Equatable {
  final DateTime _currentDate;
  late final List<List<DateTime>> calendarPagedates;

  int get _currentMonthDays =>
      DateTime(_currentDate.year, _currentDate.month + 1, 0).day;

  int get _previousMonthDays =>
      DateTime(_currentDate.year, _currentDate.month, 0).day;

  int get currentYear => _currentDate.year;

  int get currentMonth => _currentDate.month;

  int get previousMonth => _currentDate.month - 1;

  int get nextMonth => _currentDate.month + 1;

  int get _currentMonthFirstDayPosition =>
      DateTime(_currentDate.year, _currentDate.month, 1).weekday;

  void _createCalendarPageDates() {
    List<DateTime> dates = [];
    for (int i = 0; i < _currentMonthFirstDayPosition - 1; i++) {
      final firstDateOfPreviousMonth =
          _previousMonthDays - _currentMonthFirstDayPosition + 2;
      dates.add(
          DateTime(currentYear, previousMonth, firstDateOfPreviousMonth + i));
    }

    for (int i = 1; i <= _currentMonthDays; i++) {
      dates.add(DateTime(currentYear, currentMonth, i));
    }

    final listLength = dates.length;
    for (int i = 1; i <= 42 - listLength; i++) {
      dates.add(DateTime(currentYear, nextMonth, i));
    }

    List<List<DateTime>> datesByRow = List.generate(6, (index) => []);

    for (int i = 0; i < 6; i++) {
      datesByRow[i].addAll(dates.sublist(0, 7));

      if (dates.isNotEmpty) {
        dates.removeRange(0, 7);
      }
    }

    calendarPagedates = datesByRow;
  }

  CalendarProperties(this._currentDate) {
    _createCalendarPageDates();
  }

  @override
  List<Object?> get props => [_currentDate];
}
