import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/calendar_bloc.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/todo_bloc.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/todo_time_bloc.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/pages/calendar_screen.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/pages/todo_screen.dart';
import 'package:calendar_todo_list/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

abstract class NavigationRouteNames {
  static const calendarScreen = 'calendar_screen';
  static const todoScreen = 'todo_screen';
}

class Navigation {
  final initialRoute = NavigationRouteNames.calendarScreen;
  final routes = {
    NavigationRouteNames.calendarScreen: (_) => BlocProvider(
          create: (context) => sl<CalendarBloc>(),
          child: const CalendarScreen(),
        ),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRouteNames.todoScreen:
        final currentDate = settings.arguments as DateTime;
        return MaterialPageRoute(
          builder: (context) => MultiProvider(
            providers: [
              Provider<TodoTimeBloc>(
                create: (_) => sl<TodoTimeBloc>(),
                dispose: (_, value) => value.dispose(),
              ),
              BlocProvider(
                create: (context) => TodoBloc(
                  watchTodos: sl(),
                  saveTodo: sl(),
                  deleteTodo: sl(),
                  dateConverter: sl(),
                  currentDate: currentDate,
                ),
              ),
            ],
            child: const TodoScreen(),
          ),
        );
      default:
        const wiget = Text('Navigation Error');
        return MaterialPageRoute(builder: (context) => wiget);
    }
  }
}
