import 'package:calendar_todo_list/features/calendar_todo_list/domain/entities/todo.dart';

abstract class TodoRepository {
  Stream<List<Todo>> watchTodos(DateTime date);

  Future<void> saveTodo({
    required DateTime date,
    required String task,
  });

  Future<void> deleteTodo(int id);
}
