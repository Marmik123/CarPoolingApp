import '../utils/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registration {
  UserData user;
  Registration(this.user);

  bool updateProfileOnFirebase() {
    final _firestore = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;
    var postID = _auth.currentUser.uid;
    var status = _firestore.collection('userData').doc(postID).set({
      "age": user.age,
      "sex": user.sex,
      "email": user.email,
      "emergencyContact": user.emergencyConatct,
      "review": user.review,
      "mobileNumber": user.mobileNumber,
      "penalties": user.penalties,
      "name": user.name
    });
    if (status != null) {
      return true;
    } else {
      return false;
    }
  }
}
