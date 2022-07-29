import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/model/user.model.dart';

Future addUder(User user) async{
  final docUser = FirebaseFirestore.instance.collection("users").doc();
  user.id = docUser.id;
  await docUser.set(user.toJson()); 
}

Future updateUser(User user) async {
  final docUser = FirebaseFirestore.instance.collection("users").doc(user.id);
  await docUser.update(user.toJson());
}

Future deleteUser(String idUser) async{
  final docUser = FirebaseFirestore.instance.collection("users").doc(idUser);
  await docUser.delete();
}