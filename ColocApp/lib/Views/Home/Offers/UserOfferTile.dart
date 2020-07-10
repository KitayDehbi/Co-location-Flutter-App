import 'package:ColocApp/Models/Offer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserOfferTile extends StatelessWidget {
  final Offer offer;
  UserOfferTile({this.offer});
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
                                .collection('Offers')
                                .document(offer.id)
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
          title: Text(offer.price.toString()+ 'DH'),
          subtitle: Text(offer.description),
          onLongPress: () {
            _showDialog();
          },
        
          onTap: () {
            showDialog(
                context: context,
                child: new SimpleDialog(
                  title: new Text(
                    offer.user_name,
                    textAlign: TextAlign.center,
                    style :TextStyle(  
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                      
                    )),
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text(" Address : "+offer.address) ,
                    ),
                     ListTile(
                      leading: Icon(Icons.monetization_on),
                      title :Text(" Price : "+offer.price.toString()+" DH"),
                    ),
                    ListTile(
                      leading: Icon(Icons.group),
                      title :Text(" Capacity  : "+offer.capacity.toString() +" Person"),
                    ),
                    ListTile(
                      leading: Icon(Icons.aspect_ratio),
                      title :Text(" Area : "+offer.surface.toString()+" M²"),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title :Text(" Phone : "+offer.user_phone)
                    ),
                    ListTile(
                      leading: Icon(Icons.mail),
                      title :Text(" email : "+offer.user_email)
                    ),
                    
                  ])
                   
                    
                    
                
                  
              );
          },
        ),
      ),
    );
  }
}
