import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final int id;
  final DateTime date;
  final String taskName;

  const Todo({
    required this.id,
    required this.date,
    required this.taskName,
  });

  @override
  List<Object?> get props => [id, date, taskName];
}
