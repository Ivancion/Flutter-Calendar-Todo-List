import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/todo_events.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calendar_todo_list/core/utils/date_converter.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/entities/todo.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/usecases/delete_todo.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/usecases/save_todo.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/usecases/watch_todos.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodos watchTodos;
  final SaveTodo saveTodo;
  final DeleteTodo deleteTodo;
  final DateConverter dateConverter;

  final DateTime currentDate;

  String get dateTitle => dateConverter.dateToYMMMMDFormat(currentDate);

  TodoBloc({
    required this.watchTodos,
    required this.saveTodo,
    required this.deleteTodo,
    required this.dateConverter,
    required this.currentDate,
  }) : super(const TodoState.initial()) {
    on<TodoEvent>((event, emit) async {
      if (event is LoadTodosEvent) {
        await _onLoadTodos(event, emit);
      } else if (event is SaveTodoEvent) {
        _onSaveTodo(event, emit);
      } else if (event is DeleteTodoEvent) {
        _onDeleteTodo(event, emit);
      }
    });
    add(LoadTodosEvent());
  }

  Future<void> _onLoadTodos(
      LoadTodosEvent event, Emitter<TodoState> emit) async {
    await emit.forEach(
      watchTodos(WatchParams(currentDate)),
      onData: (List<Todo> list) {
        final newList = List<Todo>.from(list);
        return state.copyWith(tasks: newList);
      },
    );
  }

  Future<void> _onSaveTodo(SaveTodoEvent event, Emitter<TodoState> emit) async {
    final date = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
      event.hour,
      event.minute,
    );

    await saveTodo(SaveParams(date, event.task));
  }

  Future<void> _onDeleteTodo(
      DeleteTodoEvent event, Emitter<TodoState> emit) async {
    await deleteTodo(DeleteParams(event.id));
  }
}
