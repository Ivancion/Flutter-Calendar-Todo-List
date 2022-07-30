import 'package:calendar_todo_list/features/calendar_todo_list/presentation/navigation/navigation.dart';
import 'package:calendar_todo_list/features/calendar_todo_list/presentation/pages/calendar_screen.dart';
import 'package:calendar_todo_list/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(di.sl<MyApp>()));
}

class MyApp extends StatelessWidget {
  final Navigation navigation;
  const MyApp({Key? key, required this.navigation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CalendarScreen(),
      routes: navigation.routes,
      initialRoute: navigation.initialRoute,
      onGenerateRoute: navigation.onGenerateRoute,
    );
  }
}
