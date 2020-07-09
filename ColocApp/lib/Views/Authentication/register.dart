import 'package:ColocApp/Service/Auth.dart';
import 'package:ColocApp/Views/Home/home.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String password = '';
  String name = '';
  String phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Sign up to CoLoc'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'email *',
                ),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password *',
                ),
                obscureText: true,
                validator: (val) =>
                    val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name *',
                ),
                validator: (val) => val.isEmpty ? 'Enter a name' : null,
                onChanged: (val) {
                  setState(() => name = val);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'phone *',
                ),
                validator: (val) => val.isEmpty ? 'Enter a phone' : null,
                onChanged: (val) {
                  setState(() => phone = val);
                },
              ),
              RaisedButton(
                  color: Colors.blueAccent,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password, name, phone);
                          
                      if (result == null) {
                        setState(() {
                          error = 'Please supply a valid email';
                        });
                      }
                      else{Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );}
                      /**/
                    }
                  }),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
