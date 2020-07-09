import 'package:ColocApp/Models/Request.dart';
import 'package:ColocApp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'UserRequestTile.dart';

class UserRequestList extends StatefulWidget {
  @override
  _UserRequestListState createState() => _UserRequestListState();
}

class _UserRequestListState extends State<UserRequestList> {
  /*@override
  initState() {
    super.initState();
    getUser();
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String uid='';
  getUser() async
  {
    FirebaseUser u=await  _auth.currentUser();
    setState(() {
      this.uid = u.uid;
    });
  }*/
  @override
  Widget build(BuildContext context) {
    

    final requests = Provider.of<List<Request>>(context);
    
    List<Request> userRequest= new List<Request>();
    final u = Provider.of<User>(context);
    
    for (var request in requests) {
      
     if(request.uid==u.uid) 
     userRequest.add(request);
    }
    return ListView.builder(
      itemCount: userRequest.length,
      itemBuilder: (context, index) {
        
        return UserRequestTile(request: userRequest[index]);
      },
    );
  }
}