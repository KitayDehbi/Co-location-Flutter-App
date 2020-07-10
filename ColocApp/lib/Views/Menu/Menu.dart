import 'package:ColocApp/Views/Home/Map/MapOffer.dart';
import 'package:ColocApp/Views/Home/Offers/Offers.dart';
import 'package:ColocApp/Views/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:ColocApp/Views/Home/Offers/MyOffers.dart';
import 'package:ColocApp/Views/Home/Requests/Requests.dart';
import 'package:ColocApp/Views/Home/Requests/MyRequests.dart';
class Menu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(

        child:Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(6),
              color: Colors.white,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                       margin: EdgeInsets.only(
                      top: 25,
                      bottom: 10),
                      width: 120,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('lib/Assets/images/colocation.jpg'),
                          fit: BoxFit.fill,
                        ),
                        ),
                    ), 
                    Text("Colocation",
                    style: TextStyle(
                      
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                    ),
                    )
                   
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              dense:true,
             onTap: () {
               Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                       Home()
                  ),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.new_releases),
              title: Text('Offers'),
              dense:true,
              onTap: () {
               Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                       Offers()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Offers on MAP'),
              dense:true,
              onTap: () {
                
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        MapOffer()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text('Requests'),
              dense:true,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Requests()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text('My offers'),
              dense:true,
              onTap: () {
               Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        MyOffers()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text('My requests'),
              dense:true,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        MyRequests()
                  ),
                );
              },
            ),
            
            
          ],
        )
      );
  }}