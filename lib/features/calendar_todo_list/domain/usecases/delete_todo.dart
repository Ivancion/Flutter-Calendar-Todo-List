import 'package:calendar_todo_list/core/usecases/future_usecase.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/repositories/todo_repository.dart';
import 'package:equatable/equatable.dart';

class DeleteTodo extends FutureUseCase<void, DeleteParams> {
  final TodoRepository repository;

  DeleteTodo(this.repository);

  @override
  Future<void> call(DeleteParams params) async {
    return await repository.deleteTodo(params.id);
  }
}

class DeleteParams extends Equatable {
  final int id;

  const DeleteParams(this.id);

  @override
  List<Object?> get props => [id];
}
