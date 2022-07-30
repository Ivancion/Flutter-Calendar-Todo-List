import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/calendar_bloc.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/calendar_events.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/calendar_state.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          _CalendarHeader(),
          _Calendar(),
        ],
      ),
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  const _CalendarHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CalendarBloc>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            bloc.add(CalendarEvent.showPreviousMonth);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        BlocBuilder<CalendarBloc, CalendarState>(
          bloc: bloc,
          builder: (context, state) {
            return Text(
              state.titleDate,
              style: const TextStyle(fontSize: 20),
            );
          },
        ),
        IconButton(
          onPressed: () {
            bloc.add(CalendarEvent.showNextMonth);
          },
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class _Calendar extends StatelessWidget {
  const _Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CalendarBloc>();

    return BlocBuilder<CalendarBloc, CalendarState>(
      bloc: bloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Table(
            children: [
              _buildDaysRow(),
              ...List.generate(6, (rowIndex) {
                return TableRow(
                  children: List.generate(7, (cellIndex) {
                    return _DataCell(
                      date: state.dateProperties.calendarPagedates[rowIndex]
                          [cellIndex],
                    );
                  }),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  TableRow _buildDaysRow() {
    final List<String> list = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return TableRow(
      children: List.generate(
        list.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Center(
              child: Text(
                list[index],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DataCell extends StatelessWidget {
  const _DataCell({Key? key, required this.date}) : super(key: key);
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final cellSize = MediaQuery.of(context).size.width / 7;
    final bloc = context.read<CalendarBloc>();

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(NavigationRouteNames.todoScreen, arguments: date);
      },
      child: StreamBuilder<int>(
        stream: bloc.watchTodosLength(date),
        builder: (context, snapshot) {
          return Stack(
            children: [
              SizedBox(
                height: cellSize,
                width: cellSize,
                child: Center(
                  child: Text(
                    '${date.day}',
                    style: TextStyle(
                        color: date.month ==
                                    bloc.state.dateProperties.previousMonth ||
                                date.month ==
                                    bloc.state.dateProperties.nextMonth
                            ? Colors.grey
                            : Colors.black,
                        fontSize: 16),
                  ),
                ),
              ),
              if (snapshot.data != 0)
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.amber[900]),
                    height: cellSize / 3,
                    width: cellSize / 3,
                    child: Center(
                      child: Text(
                        '${snapshot.data}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
