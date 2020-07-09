import 'package:ColocApp/Models/User.dart';

class Request{
  String id;
  
  double maxBudget;
  String comment;
  String user_name;
  String user_phone;
  String user_email;

  Request (this.maxBudget,this.comment,this.user_name,this.user_phone,this.user_email);

  
}