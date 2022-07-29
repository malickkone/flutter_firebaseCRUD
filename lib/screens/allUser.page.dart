import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/screens/widgets/user.list.dart';
import 'package:flutter/material.dart';

import '../model/user.model.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {
    List<User> allUsers = [];

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .orderBy("name")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('error page',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 45,
                    fontStyle: FontStyle.italic,
                  )),
            );
          }
          if (snapshot.hasData) {
            allUsers = snapshot.data!.docs
                .map((e) => User.fromJson(e.data() as Map<String, dynamic>))
                .toList();
            return ListUsers(user: allUsers);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
