import 'package:calendar_todo_list/core/error/failures.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/entities/todo.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepository {
  Stream<Either<Failure, Todo>> watchTodos(DateTime date);

  Future<Either<Failure, void>> saveTodo({
    required DateTime date,
    required String task,
  });

  Future<Either<Failure, void>> deleteTodo(int id);
}
