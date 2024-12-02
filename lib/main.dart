import 'package:flutter/material.dart';
import 'package:user_list/controllers/user_controller.dart';
import 'package:user_list/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserController(),
      child: UserListApp(),
    ),
  );
}

class UserListApp extends StatelessWidget {
  const UserListApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A dynamic user list app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.userList,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
