import 'dart:convert';

import 'package:data_api/get_data.dart';
import 'package:data_api/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData extends StatefulWidget {
  const AppData({Key? key}) : super(key: key);

  @override
  _AppDataState createState() => _AppDataState();
}

class _AppDataState extends State<AppData> {
  TextEditingController _title = TextEditingController();
  TextEditingController _id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _title,
              decoration: InputDecoration(labelText: "Title"),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _id,
              decoration: InputDecoration(labelText: "Id"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: send,
              child: Text("Add Data"),
            )
          ],
        ),
      ),
    );
  }

  void send() async {
    User user = User(
      (UserBuilder b) => b
        ..id = int.parse(_id.text)
        ..title = _title.text
        ..userId = int.parse(_id.text)
        ..completed = true,
    );
    var response = await http.post(
        Uri.parse("https://jsonplaceholder.typicode.com/todos"),
        body: jsonEncode(user.toJson()));
    print(response.body);
    Navigator.push(context, MaterialPageRoute(builder: (context) => GetData()));
  }
}
