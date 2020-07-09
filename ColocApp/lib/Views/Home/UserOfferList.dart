import 'package:ColocApp/Models/Offer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'OfferTile.dart';

class UserOfferList extends StatefulWidget {
  @override
  _UserOfferListState createState() => _UserOfferListState();
}

class _UserOfferListState extends State<UserOfferList> {
  
  @override
  Widget build(BuildContext context) {

    final offers = Provider.of<List<Offer>>(context);
    List<Offer> userOffer= new List<Offer>();

    FirebaseAuth.instance.currentUser().then((user) {
    for (var offer in offers) {
      if (offer.uid == user.uid){
        print('object');
        print(user.uid);
          userOffer.add(offer);
      }
    }
    });
    return ListView.builder(
      itemCount: userOffer.length,
      itemBuilder: (context, index) {
        return OfferTile(offer: userOffer[index]);
      },
    );
  }
}