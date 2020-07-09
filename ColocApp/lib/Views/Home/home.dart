import 'package:ColocApp/Service/Auth.dart';
import 'package:flutter/material.dart';
import 'package:ColocApp/Views/Menu/Menu.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text('CoLoc'),
          
          backgroundColor: Colors.blueAccent,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
               
                
              },
            ),
          ],
        ),
      ),
    );
  }
}