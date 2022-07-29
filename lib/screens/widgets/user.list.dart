// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:firebase_crud/model/user.model.dart';
import 'package:firebase_crud/repository/user.repo.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';


class ListUsers extends StatefulWidget {
  List<User> user;
  ListUsers({required this.user});

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {

    final allUsers = widget.user;
    final ctrNameUpdate = TextEditingController();
    final ctrAgeUpdate = TextEditingController();


    return ListView.builder(
        itemCount: allUsers.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: index % 2 == 0
                    ? Colors.purple
                    : const Color.fromARGB(255, 226, 126, 244),
                child: Text(allUsers[index].name.substring(0, 2).toUpperCase()),
              ),
              title: Text(
                allUsers[index].name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontStyle: FontStyle.normal),
              ),
              subtitle: Text(allUsers[index].age.toString(),
                  style: const TextStyle(fontSize: 17)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  TextButton(
                    onPressed: (){
                       ctrNameUpdate.text = allUsers[index].name;
                        ctrAgeUpdate.text = allUsers[index].age.toString();
                      showDialog(
                        context: context, 
                        builder: (context)=> AlertDialog(
                          title: Center(child: Text('update: ${allUsers[index].name.toUpperCase()}')),
                          content: Container(
                            height: 250,
                            //________//
                            child: Spin(
                              child: Column (
                                children: [
                                  TextField(
                                    style: const TextStyle(fontSize: 20, color: Colors.purple),
                                    decoration: const InputDecoration(
                                      label: Text('Name'),
                                      border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(40)))),
                                    controller: ctrNameUpdate,
                                  ),
                                  const SizedBox(height: 20,),
                                 TextField(
                                    style: const TextStyle(fontSize: 20, color: Colors.purple),
                                    decoration: const InputDecoration(
                                      labelText: 'Age',
                                       border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(40)))),
                                    controller: ctrAgeUpdate,
                                  ),
                                  const SizedBox(height: 20,),
                                  ElevatedButton(
                                    onPressed: (){
                                      final user = User(id:allUsers[index].id, name: ctrNameUpdate.text, age: int.parse(ctrAgeUpdate.text));
                                      updateUser(user);
                                      Navigator.pop(context);
                                    }, 
                                    child:Container(width: double.infinity, child: const Center(child: Text('UPDATE', style: TextStyle(fontSize: 20),)),), )
                                ],
                              ),
                            ),
                          ),
                        ) );
                    }, 
                    child: const Icon(Icons.edit, size: 28, color:Colors.purple)),
                  TextButton(
                    onPressed: (){
                      showDialog(
                        context: context, 
                        builder: (context)=>BounceInDown(
                          child: AlertDialog(
                            title: Text('voulez-vous vraiment supprimer ${allUsers[index].name.toUpperCase()} ?'),
                            actions: [
                              ElevatedButton(
                                onPressed: (){
                                  deleteUser(allUsers[index].id);
                                  Navigator.pop(context);
                                }, 
                                child: const Text('OUI')),
                              ElevatedButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                }, 
                                child: const Text('NON'))
                            ],
                          ),
                        ));
                    }, 
                    child: const Icon(Icons.delete, size: 28, color:Colors.red))
                ],
              ),
            ),
          );
        });
  }
}
