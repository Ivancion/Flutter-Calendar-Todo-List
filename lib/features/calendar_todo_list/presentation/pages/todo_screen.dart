import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/todo_bloc.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/todo_events.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/todo_state.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/todo_time_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodoBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(bloc.dateTitle),
        centerTitle: true,
      ),
      body: const _TodoList(),
      bottomSheet: const _BottomSheet(),
    );
  }
}

class _TodoList extends StatelessWidget {
  const _TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodoBloc>();
    return BlocBuilder<TodoBloc, TodoState>(
      bloc: bloc,
      builder: (context, state) {
        if (state.tasks.isEmpty) {
          return const Center(
            child: Text(
              'No data yet',
              style: TextStyle(fontSize: 24),
            ),
          );
        }
        return ListView.builder(
          itemCount: state.tasks.length,
          itemBuilder: ((context, index) {
            final item = state.tasks[index];
            final time = bloc.dateConverter
                .convertTimeToTwoDigitsForm(item.date.hour, item.date.minute);
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                bloc.add(DeleteTodoEvent(id: item.id));
              },
              child: Card(
                child: ListTile(
                  title: Text(item.taskName),
                  subtitle: Text(time),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodoBloc>();
    final timeBloc = context.read<TodoTimeBloc>();
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButtonHideUnderline(
            child: StreamBuilder<String>(
              stream: timeBloc.hoursStream,
              builder: ((context, snapshot) {
                return DropdownButton<String>(
                  value: snapshot.data,
                  items: timeBloc.hoursList.map(_builtMenuItem).toList(),
                  onChanged: ((value) => timeBloc.hoursSink(value!)),
                );
              }),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: DropdownButtonHideUnderline(
            child: StreamBuilder<String>(
              stream: timeBloc.minutesStream,
              builder: (context, snapshot) {
                return DropdownButton<String>(
                  value: snapshot.data,
                  items: timeBloc.minutesList.map(_builtMenuItem).toList(),
                  onChanged: ((value) => timeBloc.minutesSink(value!)),
                );
              },
            ),
          ),
        ),
        StreamBuilder<Time>(
          stream: timeBloc.timeStream,
          builder: (context, snapshot) {
            final hour = snapshot.data?.hour ?? 0;
            final minute = snapshot.data?.minute ?? 0;
            return Expanded(
              child: TextField(
                onSubmitted: (String value) {
                  bloc.add(
                    SaveTodoEvent(
                      task: value,
                      hour: hour,
                      minute: minute,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }

  DropdownMenuItem<String> _builtMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item.toString(),
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
