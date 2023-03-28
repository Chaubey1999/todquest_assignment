import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studio_projects/View/user_list_search.dart';

import '../Model/user_model.dart';
import '../Utils/database_helper.dart';


class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() async {
    final Database db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(DatabaseHelper.table);
    setState(() {
      _users = List.generate(
        maps.length,
            (i) {
          return User(
            id: maps[i]['id'],
            name: maps[i]['name'],
            email: maps[i]['email'],
            source: maps[i]['source'],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UserSearchScreen()));
          }, icon: Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
      itemCount: _users.length,
      itemBuilder: (context, index) {
        final user = _users[index];
        return ListTile(
          title: Text(user.name??""),
          subtitle: Text(user.email??""),
          trailing: Text(user.source??""),
        );
      },
        ),
    );
  }
}
