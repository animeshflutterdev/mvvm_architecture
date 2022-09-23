import 'package:flutter/material.dart';
import 'package:new_mvvm/utils/routes/route.dart';
import 'package:new_mvvm/utils/routes/routes_name.dart';
import 'package:new_mvvm/view/login.dart';
import 'package:new_mvvm/view_model/auth_view_mode.dart';
import 'package:new_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
