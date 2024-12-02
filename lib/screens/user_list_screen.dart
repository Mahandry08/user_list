import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/user_controller.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Provider.of<UserController>(context, listen: false).fetchUsers();
  });
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Liste des utilisateurs')),
    body: Consumer<UserController>(
      builder: (context, userController, child) {
        if (userController.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(userController.users[index].name),
              subtitle: Text(userController.users[index].email),
              onTap: () {
                // Navigate to user details or perform an action
              },
            );
          },
        );
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Provider.of<UserController>(context, listen: false).fetchUsers();
      },
      child: Icon(Icons.refresh),
    ),
  );
}
}