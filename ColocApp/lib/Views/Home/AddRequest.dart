import 'package:ColocApp/Models/Request.dart';
import 'package:ColocApp/Models/User.dart';
import 'package:ColocApp/Service/DatabaseService.dart';
import 'package:ColocApp/Views/Home/MyRequests.dart';
import 'package:ColocApp/Views/Home/Requests.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRequest extends StatefulWidget {

  @override
  _AddRequestState createState() => _AddRequestState();
}
class _AddRequestState extends State<AddRequest>  {

  final DatabaseService _databaseService = new DatabaseService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String comment = '';
  double buget;
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
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Max budget *',
                ),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => buget = double.parse(val));
                },
              ),
              TextFormField(
                
                decoration: const InputDecoration(
                  labelText: 'comment *',
                ),
                validator: (val) => val.length < 10 ? 'Enter a meaningfull discription' : null,
                onChanged: (val) {
                  setState(() => comment = val);
                },
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  'Add Request',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                    
                    await _databaseService.updateUserRequest( new Request('','',buget, comment ,null,null,null));
                      Navigator.push(context,MaterialPageRoute(builder: (context) => MyRequests()));
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}