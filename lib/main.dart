import 'package:database_intro/models/user.dart';
import 'package:database_intro/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

List _users;

void main() async {
  var db = new DatabaseHelper();
  _users = await db.getAllUsers();
  runApp(new MaterialApp(
    home: new Home(),
    title: "DataBase",
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("DataBase"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: new ListView.builder(
        itemCount: _users.length,
        itemBuilder: (BuildContext context, int position)
        {
            return new Card(
              color: Colors.white,
              elevation: 4.0,
              child: new ListTile(
                title: new Text("User: ${User.fromMap(_users[position]).username}"),
                subtitle: new Text("Id: ${User.fromMap(_users[position]).id}"),
                onTap:()=> debugPrint("${User.fromMap(_users[position]).password}"),

              ),
            );

        },
      ),
    );
  }
}
