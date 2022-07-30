import 'package:calendar_todo_list/features/calendar_todo_list/data/models/todo_model.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/data/todos_db/daos/todos_dao.dart';

abstract class TodoLocalDataSource {
  Stream<List<TodoModel>> watchTodos(DateTime date);

  Future<void> saveTodo({
    required DateTime date,
    required String task,
  });

  Future<void> deleteTodo(int id);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final TodosDao dao;

  TodoLocalDataSourceImpl(this.dao);

  @override
  Future<void> deleteTodo(int id) {
    return dao.deleteTodo(id);
  }

  @override
  Future<void> saveTodo({required DateTime date, required String task}) {
    return dao.saveTodo(date, task);
  }

  @override
  Stream<List<TodoModel>> watchTodos(DateTime date) {
    return dao.watchTodos(date);
  }
}
