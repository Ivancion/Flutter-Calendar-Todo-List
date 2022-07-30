import 'package:calendar_todo_list/features/calendar_todo_list/data/datasources/local_data_source/todo_local_data_source.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/entities/todo.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl({required this.localDataSource});

  @override
  Future<void> deleteTodo(int id) {
    return localDataSource.deleteTodo(id);
  }

  @override
  Future<void> saveTodo({required DateTime date, required String task}) {
    return localDataSource.saveTodo(date: date, task: task);
  }

  @override
  Stream<List<Todo>> watchTodos(DateTime date) {
    return localDataSource.watchTodos(date);
  }
}
