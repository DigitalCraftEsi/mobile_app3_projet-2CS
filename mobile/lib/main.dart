import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile3/Bloc/PanneBloc.dart';
import 'package:mobile3/UI/Screens/FailuresScreen.dart';
import 'package:mobile3/UI/Screens/MyTasksSkreen.dart';
import 'package:mobile3/UI/Screens/NotificationCenterScreen.dart';
import 'package:mobile3/UI/Screens/TaskDetailsScreen.dart';
import 'package:mobile3/UI/Screens/Welcome.dart';
import 'package:provider/provider.dart';

import 'Bloc/AnomalieBloc.dart';
import 'Bloc/AuthBloc.dart';
import 'Bloc/UserInfosBloc.dart';
import 'UI/Screens/HomeScreen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = FlutterSecureStorage();
  final cookie = await storage.read(key: 'cookie');
  runApp(MultiProvider(child:MyApp(Cookie: cookie,),
    providers: [
      ChangeNotifierProvider<UserInfosBloc>.value(value: UserInfosBloc()),
      ChangeNotifierProvider<AuthBloc>.value(value: AuthBloc()),
      ChangeNotifierProvider<PanneBloc>.value(value: PanneBloc()),
      ChangeNotifierProvider<AnomalieBloc>.value(value: AnomalieBloc()),
    ],
  ));
}
/*void main() {
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final   Cookie;
  const MyApp({Key? key, required this.Cookie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mpb 3',
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}

