
import 'dart:async';

import 'package:data_api/service.dart';
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
  Service service=Service();
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
            service.updateUser(id:int.parse(_idController.text));
          }, child: Text('Update'),),

        ],
      ),
    );
  }

}
