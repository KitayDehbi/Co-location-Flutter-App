import 'package:ColocApp/Models/User.dart';

class Offer {
  String id;
  String uid;
  String address;
  double surface;
  double price;
  int capacity;
  String description;
  String image; 
  String user_name;
  String user_phone;
  String user_email;

  Offer (this.id,this.uid,this.address,this.surface,this.capacity,this.price,this.description ,this.user_name,this.user_phone,this.user_email );
}