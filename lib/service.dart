import 'dart:convert';

import 'package:data_api/update_data.dart';
import 'package:data_api/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'get_data.dart';

class Service {
  Future<List<User>> getUserData({required BuildContext context}) async {
    var response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'todos'));
    final List jsonData = jsonDecode(response.body) as List<dynamic>;
    List<User> users = [];
    for (final u in jsonData) {
      User user = User.fromJson(u);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  void deletedata({required User user, required BuildContext context}) async {
    var url =
        Uri.parse('https://jsonplaceholder.typicode.com/todos/${user.id}');
    var response = await http.delete(url);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('${user.id} deleted sucessfully'),
        ),
      );
    }
  }

  void updateUser({required int id, required BuildContext context}) async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/$id');
    var response = await http.put(url);
    if (response.statusCode == 200) {
      await ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User Updated Successfully!'),
          backgroundColor: Colors.greenAccent,
        ),
      );
      Navigator.pop(context);
    }
  }

  void send(
      {required int id,
      required String title,
      required BuildContext context}) async {
    User user = User(
      (UserBuilder b) => b
        ..id = id
        ..title = title
        ..userId = id
        ..completed = true,
    );
    var response = await http.post(
        Uri.parse("https://jsonplaceholder.typicode.com/todos"),
        body: jsonEncode(user.toJson()));
    print(response.body);
    Navigator.push(context, MaterialPageRoute(builder: (context) => GetData()));
  }
}
