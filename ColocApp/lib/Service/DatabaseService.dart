import 'package:ColocApp/Models/Offer.dart';
import 'package:ColocApp/Models/Request.dart';
import 'package:ColocApp/Models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('Users'); 
  final CollectionReference offersCollection = Firestore.instance.collection('Offers');
  final CollectionReference requestsCollection = Firestore.instance.collection('Requests'); 

  Future<void> updateUserData(User user) async {
    return await userCollection.document(user.uid).setData({
      'name': user.name,
      'phone': user.phone,
      'email' : user.email,
    });
  }
  Future<User> getUserInfo(String userId) async {
    var document =
        Firestore.instance.collection("Users").document(userId).get();
    return await document.then((doc) {
      return new User(doc.data['uid'], doc.data['name'], doc.data['email'], doc.data['phone']);
    });
  }
  Future updateUserRequest(Request request) async {
    FirebaseUser user = await _auth.currentUser();
    User u =await  getUserInfo(user.uid);
    
    return await requestsCollection.document().setData({
      'user_id' : user.uid,
      'maxBudget': request.maxBudget,
      'comment': request.comment,
      'user_phone' : u.phone,
      'user_email' : u.email,
      'user_name' : u.name,
      
    });
  }
  Future updateUserOffer(Offer offer ) async {
    FirebaseUser user = await _auth.currentUser();
    User u =await  getUserInfo(user.uid);
    return offersCollection.document().setData({
      'user_id' : user.uid,
      'address' :offer.address,
      'surface' : offer.surface,
      'price' : offer.price,
      'capacity' : offer.capacity,
      'description' : offer.description,
      'user_phone' : u.phone,
      'user_email' : u.email,
      'user_name' : u.name
    });
  }
  List<Request> _requestListFromSnapshot(QuerySnapshot snapshot) 
  {
    return snapshot.documents.map((doc){
      return Request(
         doc.data['maxBudget'] ,
         doc.data['comment'],
         doc.data["user_name"],
         doc.data["user_phone"],
         doc.data["user_email"] 
      );
    }).toList();
  }

  // get Request stream
  Stream<List<Request>> get requests {
    return requestsCollection.snapshots()
      .map(_requestListFromSnapshot);
  }

  List<Offer> _offersListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Offer(
         doc.data['user_id'],
         doc.data['address'],
         doc.data['surface'],
         doc.data['capacity'],
         doc.data['price'],
         doc.data['description'],
         doc.data["user_name"],
         doc.data["user_phone"],
         doc.data["user_email"] 
      );
    }).toList();
  }

  // get Request stream
  Stream<List<Offer>> get offers {
    return offersCollection.snapshots()
      .map(_offersListFromSnapshot);
  }
  User _getUser(DocumentSnapshot snapshot) {
      return new User(
            snapshot.data["uid"],
            snapshot.data['name'],
            snapshot.data['email'],
            snapshot.data['phone']);
    }
  
  Stream<User> get users {
    return offersCollection.document(uid).snapshots()
      .map(_getUser);
  }

  
 


}