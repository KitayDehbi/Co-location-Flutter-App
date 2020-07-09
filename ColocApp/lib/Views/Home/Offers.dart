import 'package:ColocApp/Models/Offer.dart';
import 'package:ColocApp/Service/Auth.dart';
import 'package:ColocApp/Service/DatabaseService.dart';
import 'package:ColocApp/Views/Home/AddOffer.dart';
import 'package:flutter/material.dart';
import 'package:ColocApp/Views/Menu/Menu.dart';
import 'package:provider/provider.dart';

import 'OfferList.dart';

class Offers extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Offer>>.value(
        value: DatabaseService().offers,
              child: Scaffold(
          drawer: Menu(),
          appBar: AppBar(
            title: Text('All Offers'),
            
            backgroundColor: Colors.blueAccent,
            elevation: 0.0,
           
          ),
          body: OfferList()
        ),
      );
   
  }
}