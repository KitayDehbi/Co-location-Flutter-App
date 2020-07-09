import 'package:ColocApp/Models/Offer.dart';
import 'package:ColocApp/Models/User.dart';
import 'package:ColocApp/Service/DatabaseService.dart';
import 'package:ColocApp/Views/Home/MyOffers.dart';
import 'package:ColocApp/Views/Home/Offers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddOffer extends StatefulWidget {
  @override
  _AddOfferState createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {
  
  final DatabaseService _databaseService = new DatabaseService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String comment = '';
  String address;
  double area;
  double price;
  int capacity;
  String description = '';
  bool loading = false;
  
  @override
  Widget build(BuildContext context) {
      
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('CoLoc'),
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Adresse :  *',
                ),
                validator: (val) => val.isEmpty ? 'Enter an Adress' : null,
                onChanged: (val) {
                  setState(() => address = val);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Area :  *',
                ),
                validator: (val) => val.isEmpty ? 'Enter an area' : null,
                onChanged: (val) {
                  setState(() => area = double.parse(val));
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'price *',
                ),
                validator: (val) => val.isEmpty ? 'Enter a price' : null,
                onChanged: (val) {
                  setState(() => price = double.parse(val));
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Capacity *',
                ),
                validator: (val) => val.isEmpty ? 'Enter a capacity ' : null,
                onChanged: (val) {
                  setState(() => capacity = int.parse(val));
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description *',
                ),
                validator: (val) => val.isEmpty ? 'Enter a Description ' : null,
                onChanged: (val) {
                  setState(() => description = val);
                },
              ),
              RaisedButton(
                  color: Colors.blueAccent,
                  child: Text(
                    'Add Offer',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);          
                                
                      await _databaseService.updateUserOffer(new Offer('','',
                        address, area, capacity, price, description, null,null,null));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyOffers()));
                    }
                  }),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
