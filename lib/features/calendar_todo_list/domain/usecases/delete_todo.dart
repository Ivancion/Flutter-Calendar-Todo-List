import 'package:calendar_todo_list/core/error/failures.dart';
import 'package:calendar_todo_list/core/usecases/future_usecase.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class DeleteTodo extends FutureUseCase<void, Params> {
  final TodoRepository repository;

  DeleteTodo(this.repository);

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await repository.deleteTodo(params.id);
  }
}

class Params extends Equatable {
  final int id;

  const Params(this.id);

  @override
  List<Object?> get props => [id];
}
