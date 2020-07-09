  
import 'package:ColocApp/Models/Request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserRequestTile extends StatelessWidget {

  final Request request;
  UserRequestTile({ this.request });
  final db = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Delete"),
          content: new Text("Do you want to delete this Offer ? "),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("yes"),
              onPressed: () async{
                 await db
                                .collection('Requests')
                                .document(request.id)
                                .delete();
                                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
           
          ),
          title: Text(request.maxBudget.toString()),
          subtitle: Text(request.comment),
          onTap: () {
            showDialog(
                context: context,
                child: new SimpleDialog(
                  title: new Text(
                    request.user_name,
                    textAlign: TextAlign.center,
                    style :TextStyle(  
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                      
                    )),
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text(" Max budget : "+request.maxBudget.toString()+" DH") ,
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title :Text(" Phone : "+request.user_phone)
                    ),
                    ListTile(
                      leading: Icon(Icons.mail),
                      title :Text(" email : "+request.user_email)
                    ),
                    
                  ]) 
              );
              
          },
          onLongPress:() {_showDialog();}
        ),
      ),
    );
  }
}