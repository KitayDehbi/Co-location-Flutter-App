import 'package:ColocApp/Models/User.dart';
import 'package:ColocApp/Views/Authentication/Authenticate.dart';
import 'package:ColocApp/Views/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }
    
  }
}