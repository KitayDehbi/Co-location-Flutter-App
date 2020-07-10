import 'package:ColocApp/Models/Offer.dart';
import 'package:ColocApp/Views/Menu/Menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapOffer extends StatefulWidget {
  @override
  _MapOfferState createState() => _MapOfferState();
}

class _MapOfferState extends State<MapOffer> {
  final databaseReference = Firestore.instance;
  List<Offer> list = new List<Offer>();
  List<Marker> markers = new List<Marker>();
  _getOffersForomFireSotre() {
    databaseReference.collection("Offers").getDocuments().then((querySnapshot) {
      setState(() {
      querySnapshot.documents.forEach((doc) {
      list.add(new Offer(
          doc.documentID,
          doc.data['user_id'],
          doc.data['address'],
          doc.data['surface'],
          doc.data['capacity'],
          doc.data['price'],
          doc.data['description'],
          doc.data["user_name"],
          doc.data["user_phone"],
          doc.data["user_email"],
          doc.data['lat'],
          doc.data['lng'],
        ));
        });
      });
    });
  }

  List<Marker> setOffersOnMap(List<Offer> list) {
  List<Marker> listMarker = new List<Marker>();

    for (var offer in list) {
      Marker item = new Marker(
          width: 45.0,
          height: 45.0,
          point: new LatLng(offer.lat, offer.lng),
          builder: (context) => new Container(
                  child: IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.redAccent[700],
                iconSize: 45.0,
                onPressed: () {
                  showDialog(
                      context: context,
                      child: new SimpleDialog(
                          title: new Text(offer.user_name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold)),
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.location_on),
                              title: Text(" Address : " + offer.address),
                            ),
                            ListTile(
                              leading: Icon(Icons.monetization_on),
                              title: Text(
                                  " Price : " + offer.price.toString() + " DH"),
                            ),
                            ListTile(
                              leading: Icon(Icons.group),
                              title: Text(" Capacity  : " +
                                  offer.capacity.toString() +
                                  " Person"),
                            ),
                            ListTile(
                              leading: Icon(Icons.aspect_ratio),
                              title: Text(" Area : " +
                                  offer.surface.toString() +
                                  " M²"),
                            ),
                            ListTile(
                                leading: Icon(Icons.phone),
                                title: Text(" Phone : " + offer.user_phone)),
                            ListTile(
                                leading: Icon(Icons.mail),
                                title: Text(" email : " + offer.user_email)),
                          ]));
                },
              )));
      listMarker.add(item);
    }
    return listMarker;
  }

  
  @override
  Widget build(BuildContext context) {
    setState(() {
      _getOffersForomFireSotre();
    markers = setOffersOnMap(list);
    });
    
    return Scaffold(
      appBar: AppBar(
        title: Text(' Offers On Map' ),
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
      ),
      drawer: Menu(),
      body: Material(
        child: FlutterMap(
          options: new MapOptions(
              center: new LatLng(33.9065678, -5.5424542),
              //minZoom: 5.0,
              zoom: 10.0),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            new MarkerLayerOptions(markers: markers),
          ],
        ),
      ),
    );
  }
}
