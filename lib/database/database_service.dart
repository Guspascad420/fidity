import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  void createNewUser(Map<String, dynamic> user, String uid) async {
    await db.collection("fidity_users").doc(uid).set(user);
  }

  Future<Map<String, dynamic>> retrieveUserData(String id) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
    await db.collection("fidity_users").doc(id).get();
    return snapshot.data()!;
  }
}