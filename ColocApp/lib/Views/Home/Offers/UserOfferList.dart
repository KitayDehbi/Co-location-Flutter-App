import 'package:ColocApp/Models/Offer.dart';
import 'package:ColocApp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'UserOfferTile.dart';

class UserOfferList extends StatefulWidget {
  @override
  _UserOfferListState createState() => _UserOfferListState();
}

class _UserOfferListState extends State<UserOfferList> {
  @override
  Widget build(BuildContext context) {
    

    final offers = Provider.of<List<Offer>>(context);
    
    List<Offer> userOffer= new List<Offer>();
    final u = Provider.of<User>(context);
    
    for (var offer in offers) {
      
     if(offer.uid==u.uid) 
     userOffer.add(offer);
    }
    return ListView.builder(
      itemCount: userOffer.length,
      itemBuilder: (context, index) {
        
        return UserOfferTile(offer: userOffer[index]);
      },
    );
  }
}