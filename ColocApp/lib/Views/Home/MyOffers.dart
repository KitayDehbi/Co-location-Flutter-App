import 'package:ColocApp/Models/Offer.dart';
import 'package:ColocApp/Service/DatabaseService.dart';
import 'package:flutter/material.dart';
import 'package:ColocApp/Views/Menu/Menu.dart';
import 'package:provider/provider.dart';
import 'AddOffer.dart';

class MyOffers extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Offer>>.value(
        value: DatabaseService().offers,
              child: Scaffold(
          drawer: Menu(),
          appBar: AppBar(
            title: Text('My Offers'),
            
            backgroundColor: Colors.blueAccent,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.add),
                label: Text('Add Offer'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                      AddOffer()
                    ),
                  );
                  }
              ),
            ],
          ),
          //body: UserOfferList()
        ),
      );
   
  }
}