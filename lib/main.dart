import 'dart:convert';

import 'package:data_api/add_data.dart';
import 'package:data_api/user.dart';
import 'package:flutter/material.dart';

import 'get_data.dart';

//deserialize-User.fromJson(Map<String,dynamic)
// var u=User((b)=>b..userId=''..id=''..)
// u=u.rebuild((b)=>b.id='');
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetData(),

    );
  }
}


// If  data is not null '!'
// if data is null '?' assign the alternate non nullable value with '??'