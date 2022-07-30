import 'package:calendar_todo_list/core/utils/date_converter.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/data/datasources/local_data_source/todo_local_data_source.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/data/repositories/todo_repository_impl.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/data/todos_db/database/todos_database.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/repositories/todo_repository.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/usecases/delete_todo.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/usecases/save_todo.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/domain/usecases/watch_todos.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/calendar_bloc.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/bloc/todo_time_bloc.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/navigation/navigation.dart';
import 'package:calendar_todo_list/main.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // App
  sl.registerFactory(() => MyApp(navigation: sl()));

  // Features - Calendar Todo List
  // Bloc
  sl.registerFactory(() => CalendarBloc(sl(), sl()));
  sl.registerFactory(() => TodoTimeBloc(sl()));

  //Use cases
  sl.registerLazySingleton(() => GetTodos(sl()));
  sl.registerLazySingleton(() => SaveTodo(sl()));
  sl.registerLazySingleton(() => DeleteTodo(sl()));

  //Repository
  sl.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(localDataSource: sl()));

  //Data sources
  sl.registerLazySingleton<TodoLocalDataSource>(
      () => TodoLocalDataSourceImpl(sl()));

  //Database
  sl.registerLazySingleton(() => TodosDatabase().todosDao);

  // Presentation
  sl.registerFactory(() => Navigation());

  // Core
  sl.registerLazySingleton(() => DateConverter());
}
