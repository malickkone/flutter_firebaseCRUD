import 'package:firebase_crud/screens/allUser.page.dart';
import 'package:firebase_crud/screens/user.add.dart';
import 'package:flutter/material.dart';

class ControlePage extends StatelessWidget {
  const ControlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child:  Text('Gestion des utilisaters')),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.supervised_user_circle_sharp,size: 28,), text: 'Add',),
              Tab(icon: Icon(Icons.edit_attributes,size: 28,), text: 'Users',),
              Tab(icon: Icon(Icons.search,size: 28,), text: 'Search',)
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AddUserPage(),
            AllUsers(),
            Text('search'),
          ]),
      ));
  }
}