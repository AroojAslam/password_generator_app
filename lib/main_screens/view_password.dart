import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';


class ViewPassword extends StatefulWidget {

  @override
  State<ViewPassword> createState() => _ViewPasswordState();
}

class _ViewPasswordState extends State<ViewPassword> {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  var newPassword;
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = auth.currentUser;
    String uid = user!.uid;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
        title:const Text('View All Password ',style: TextStyle(color: Colors.white),),
          leading: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
            },
            icon:const Icon(Icons.keyboard_backspace_rounded,color: Colors.white),
          )
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon:const Icon(Icons.search),
                suffixIcon: TextButton(
                 child:Text('Search'),
                  onPressed: (){
                    setState(() {

                    });
                  },
                ),
                contentPadding:const EdgeInsets.symmetric(vertical: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide:const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide:const BorderSide(),
                ),
              ),
            ),
          ),

          Expanded(
            child:  StreamBuilder(
              stream: firestore.collection('users').doc(uid).collection('pass').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                var passList = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: passList.length,
                  itemBuilder: (context, index) {
                    var passData = passList[index].data();
                    var appName = passData['AppName'];
                    var password = passData['Password'];

                    if(searchController.text.isEmpty){
                      return Card(
                        elevation: 4,
                        margin:const EdgeInsets.symmetric(vertical: 8, horizontal: 7),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('App Name:',style: TextStyle(fontWeight: FontWeight.w600,color:Theme.of(context).primaryColor),),
                              Text(appName),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Password:',style: TextStyle(fontWeight: FontWeight.w600,color:Theme.of(context).primaryColor),),
                              Text(password),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      String newPassword = password;
                                      return AlertDialog(
                                        title:const Text('Edit Password'),
                                        content: TextField(
                                          maxLength: 15,
                                          onChanged: (value) {
                                            newPassword = value;
                                          },
                                          decoration:const InputDecoration(labelText: 'New Password'),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              firestore
                                                  .collection('users')
                                                  .doc(uid)
                                                  .collection('pass')
                                                  .doc(passList[index].id)
                                                  .update({'Password': newPassword});
                                              Navigator.pop(context);
                                            },
                                            child:const Text('Save'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child:const Text('Cancel'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child:const Icon(Icons.edit),
                              ),

                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Delete Password'),
                                        content: Text('Are you sure you want to delete this password?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              firestore
                                                  .collection('users')
                                                  .doc(uid)
                                                  .collection('pass')
                                                  .doc(passList[index].id)
                                                  .delete();
                                              Navigator.pop(context);
                                            },
                                            child:const Text('Delete'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child:const Text('Cancel'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child:const Icon(Icons.delete),
                              ),

                            ],
                          ),
                        ),
                      );
                    }else if(appName.toLowerCase().contains(searchController.text.toLowerCase())){
                      return Card(
                        elevation: 4,
                        margin:const EdgeInsets.symmetric(vertical: 8, horizontal: 7),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('App Name:',style: TextStyle(fontWeight: FontWeight.w600,color:Theme.of(context).primaryColor),),
                              Text(appName),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Password:',style: TextStyle(fontWeight: FontWeight.w600,color:Theme.of(context).primaryColor),),
                              Text(password),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      String newPassword = password; // Initialize with the existing password
                                      return AlertDialog(
                                        title:const Text('Edit Password'),
                                        content: TextField(
                                          maxLength: 10,
                                          onChanged: (value) {
                                            newPassword = value;
                                          },
                                          decoration:const InputDecoration(labelText: 'New Password'),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              firestore
                                                  .collection('users')
                                                  .doc(uid)
                                                  .collection('pass')
                                                  .doc(passList[index].id)
                                                  .update({'Password': newPassword});
                                              Navigator.pop(context);
                                            },
                                            child:const Text('Save'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child:const Text('Cancel'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child:const Icon(Icons.edit),
                              ),

                              const  SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title:const Text('Delete Password'),
                                        content:const Text('Are you sure you want to delete this password?'),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              firestore
                                                  .collection('users')
                                                  .doc(uid)
                                                  .collection('pass')
                                                  .doc(passList[index].id)
                                                  .delete();
                                              Navigator.pop(context);
                                            },
                                            child: Text('Delete'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child:const Text('Cancel'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child:const Icon(Icons.delete),
                              ),

                            ],
                          ),
                        ),
                      );
                    }
                    else{
                      return  Container();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}