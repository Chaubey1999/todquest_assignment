import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studio_projects/View/user_list_screen.dart';
import 'package:studio_projects/View/user_list_search.dart';

import '../Utils/database_helper.dart';

class UserInformationScreen extends StatefulWidget {
  @override
  _UserInformationScreenState createState() => _UserInformationScreenState();
}

void insertUser(String name, String email, String source) async {
  final Database db = await DatabaseHelper.instance.database;
  final user = {
    DatabaseHelper.columnName: name,
    DatabaseHelper.columnEmail: email,
    DatabaseHelper.columnSource: source
  };
  await db.insert(DatabaseHelper.table, user);
}


class _UserInformationScreenState extends State<UserInformationScreen> {
   TextEditingController  _nameController = TextEditingController();
   TextEditingController  _emailController = TextEditingController();
   TextEditingController  _sourceController = TextEditingController();

  final List<String> _sources = [
    'Facebook',
    'Instagram',
    'Organic',
    'Friend',
    'Google'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please fill in your information:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) => _nameController.text = value,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) => _emailController.text = value,
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Where are you coming from?'),
              value: "Facebook",
              items: _sources.map((source) {
                return DropdownMenuItem(
                  value: source,
                  child: Text(source),
                );
              }).toList(),
              onChanged: (value) => _sourceController.text = value!,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                insertUser(_nameController.text!, _emailController.text!, _sourceController.text!);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserSearchScreen()));
                _nameController.clear();
                _emailController.clear();
                _sourceController.clear();
                // Do something with the user's information here
                // print('Name: $_name');
                // print('Email: $_email');
                // print('Source: $_source');
              },
            )
          ],
        ),
      ),
    );
  }
   void dispose(){
     _nameController.dispose();
     _emailController.dispose();
     _sourceController.dispose();
     super.dispose();
   }
}
