import 'package:calendar_todo_list/features/calendar_todo_list/domain/entities/todo.dart';

class TodoModel extends Todo {
  const TodoModel({
    required int id,
    required DateTime date,
    required String taskName,
  }) : super(id: id, date: date, taskName: taskName);
}
