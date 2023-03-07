import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'user.dart';


class UpdateData extends StatefulWidget {
   User user;
  UpdateData({Key?key,required this.user,}) : super(key: key);

  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  final _idController =TextEditingController();
  final _titleController=TextEditingController();
  
  @override
  initState() {
    _idController.text=widget.user.id.toString();
    _titleController.text=widget.user.title;
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User'),),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          TextFormField(
            controller: _idController,
          ),
          TextFormField(
            controller: _titleController,
          ),
          SizedBox(height: 12,),
          ElevatedButton(onPressed: (){
            updateUser(id: widget.user.id);
          }, child: Text('Update'),),

        ],
      ),
    );
  }
  void updateUser({required int id}) async {
    var url=Uri.parse('https://jsonplaceholder.typicode.com/todos/$id');
    var response=await http.put(url);
    if(response.statusCode == 200){
      await ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:Text('User Updated Successfully!'),
            backgroundColor: Colors.greenAccent,
          ),
      );
      Navigator.pop(context);

    }
  }
}
