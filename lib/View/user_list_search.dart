import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:studio_projects/View/user_information_screen.dart';

import '../Model/user_model.dart';
import '../Utils/database_helper.dart';

class UserSearchScreen extends StatefulWidget {
  @override
  _UserSearchScreenState createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;
  List<User> userList = [];
  List<String> filterList = ['All', 'Facebook', 'Instagram', 'Organic', 'Friend', 'Google'];
  String selectedFilter = 'All';
  String searchText = '';

  @override
  void initState() {
    super.initState();
    _refreshUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
            icon: Icon(Icons.arrow_back_ios)
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserInformationScreen()));
          }, icon: Icon(Icons.add,size: 30,))
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    value: selectedFilter,
                    items: filterList.map((filter) {
                      return DropdownMenuItem(
                        value: filter,
                        child: Text(filter),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFilter = value!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by name or email',
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    _refreshUserList();
                  },
                  child: Text('Refresh'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                User user = userList[index];
                if (selectedFilter != 'All' && user.source != selectedFilter) {
                  return SizedBox.shrink();
                }
                if (searchText.isNotEmpty && !user.name!.toLowerCase().contains(searchText.toLowerCase()) &&
                    !user.email!.toLowerCase().contains(searchText.toLowerCase())) {
                  return SizedBox.shrink();
                }
                return ListTile(
                  title: Text(user.name??""),
                  subtitle: Text(user.email??""),
                  trailing: Text(user.source??""),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _refreshUserList() async {
    final Database db = await databaseHelper.database;
    List<Map<String, dynamic>> maps = await db.query(DatabaseHelper.table);
    setState(() {
      userList = List.generate(
        maps.length,
            (index) {
          return User(
            id: maps[index][DatabaseHelper.columnId],
            name: maps[index][DatabaseHelper.columnName],
            email: maps[index][DatabaseHelper.columnEmail],
            source: maps[index][DatabaseHelper.columnSource],
          );
        },
      );
    });
  }
}
