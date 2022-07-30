import 'package:calendar_todo_list/core/utils/date_converter.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/usecases/watch_todos.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/calendar_events.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/calendar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final GetTodos _watchTodos;
  final DateConverter _dateConverter;

  CalendarBloc(this._watchTodos, this._dateConverter)
      : super(
          CalendarState(
            dateProperties: CalendarProperties(
              DateTime.now(),
            ),
            titleDate: _dateConverter.dateToYMMMFormat(
              DateTime.now(),
            ),
          ),
        ) {
    on<CalendarEvent>((event, emit) {
      if (event == CalendarEvent.showNextMonth) {
        _showNextMonth(event, emit);
      } else if (event == CalendarEvent.showPreviousMonth) {
        _showPreviousMonth(event, emit);
      }
    });
  }

  void _showNextMonth(CalendarEvent event, Emitter<CalendarState> emit) {
    final newMonth = DateTime(state.dateProperties.currentYear,
        state.dateProperties.currentMonth + 1);
    emit(_getUpdatedState(newMonth));
  }

  void _showPreviousMonth(CalendarEvent event, Emitter<CalendarState> emit) {
    final newMonth = DateTime(state.dateProperties.currentYear,
        state.dateProperties.currentMonth - 1);
    emit(_getUpdatedState(newMonth));
  }

  CalendarState _getUpdatedState(DateTime newMonthDate) {
    final titleDate = _dateConverter.dateToYMMMFormat(newMonthDate);
    final dateProperties = CalendarProperties(newMonthDate);

    return state.copyWith(dateProperties: dateProperties, titleDate: titleDate);
  }

  Stream<int> watchTodosLength(DateTime date) {
    return _watchTodos(WatchParams(date)).asyncMap((list) => list.length);
  }
}
