import 'package:ColocApp/Models/Request.dart';
import 'package:ColocApp/Service/DatabaseService.dart';
import 'package:flutter/material.dart';
import 'package:ColocApp/Views/Menu/Menu.dart';
import 'package:provider/provider.dart';
import 'AddRequest.dart';
import 'RequestList.dart';
class MyRequests extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Request>>.value(
        value: DatabaseService().requests,
              child: Scaffold(
          drawer: Menu(),
          appBar: AppBar(
            title: Text('My Requests'),
            
            backgroundColor: Colors.blueAccent,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.add),
                label: Text('Add request'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                      AddRequest()
                    ),
                  );
                  }
              ),
            ],
          ),
          //body: RequestList()
        ),
      );
   
  }
}