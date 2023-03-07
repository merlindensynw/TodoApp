import 'dart:convert';

import 'package:data_api/add_data.dart';
import 'package:data_api/delete_data.dart';
import 'package:data_api/update_data.dart';
import 'package:data_api/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetData extends StatefulWidget {
  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  Future<List<User>> getUserData() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('User Data'),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AppData()));
            }, icon: Icon(Icons.add))
          ],
        ),
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
            future: getUserData(),
            builder: (context, AsyncSnapshot<List<User>> snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text('Loading...'),
                  ),
                );
              } else
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UpdateData(user: snapshot.data![i]),
                              fullscreenDialog: true,
                            ),
                          );
                        },
                          title: Text(snapshot.data![i].title),
                          subtitle: Text(snapshot.data![i].id.toString()),
                          trailing: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              deletedata(
                                user: snapshot.data![i],
                                context: context,
                              );
                            },
                          ));
                    });
            },
          ),
        ),
      ),
    );
  }
}
