


import 'package:data_api/service.dart';
import 'package:flutter/material.dart';


class AppData extends StatefulWidget {
  const AppData({Key? key}) : super(key: key);

  @override
  _AppDataState createState() => _AppDataState();
}

class _AppDataState extends State<AppData> {
  Service service=Service();
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
              onPressed:() {
                service.send(id: int.parse(_id.text), title: _title.text);
              },child: Text("Add Data"),
            ),
          ],
        ),
      ),
    );
  }


}
