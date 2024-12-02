import 'package:flutter/material.dart';
import '../screens/user_list_screen.dart';

class AppRoutes {
  static const String userList = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case userList:
        return MaterialPageRoute(builder: (_) => UserListScreen());
      default:
        return MaterialPageRoute(builder: (_) => UserListScreen());
    }
  }
}