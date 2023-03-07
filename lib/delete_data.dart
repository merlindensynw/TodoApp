

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:data_api/user.dart';
import 'package:flutter/material.dart';


void deletedata({required User user,required BuildContext context}) async{
  var url=Uri.parse('https://jsonplaceholder.typicode.com/todos/${user.id}');
  var response=await http.delete(url);
  if(response.statusCode==200) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text('${user.id} deleted sucessfully'),

      ),
    );
  }
  }
