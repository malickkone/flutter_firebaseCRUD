// ignore_for_file: sized_box_for_whitespace

import 'package:animate_do/animate_do.dart';
import 'package:firebase_crud/model/user.model.dart';
import 'package:firebase_crud/repository/user.repo.dart';
import 'package:flutter/material.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final  ctrname =  TextEditingController();
    final ctrage = TextEditingController();

    return Scaffold(
      body: Roulette(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                 TextField(
                  controller: ctrname,
                  style: const TextStyle(fontSize:32),
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))) ,
                  ),
                ),
                const SizedBox(height: 20,),
                 TextField(
                  controller: ctrage ,
                  style: const TextStyle(fontSize: 30),
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))
                  ),
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: (){
                    final user = User(name: ctrname.text, age: int.parse(ctrage.text));
                    addUder(user);
                    ctrname.text = '';
                    ctrage.text = '';
                  }, 
                  child: Container(
                    width: double.infinity,
                    child: const Icon(Icons.add, size: 32,),
                    )
                  )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}