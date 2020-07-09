import 'package:ColocApp/Models/Offer.dart';
import 'package:ColocApp/Models/Request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String name;
  String email;
  String phone;
  List<Request> requestList;
  List<Offer> offerList;
  
  User(this.uid , this.name, this.email,this.phone);
  
 

}