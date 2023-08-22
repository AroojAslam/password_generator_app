import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';


class ViewPassword extends StatefulWidget {

  @override
  State<ViewPassword> createState() => _ViewPasswordState();
}

class _ViewPasswordState extends State<ViewPassword> {
  var newPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
        title: Text('View All Password ',style: TextStyle(color: Colors.white),),
          leading: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
            },
            icon: Icon(Icons.keyboard_backspace_rounded,color: Colors.white),
          )
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),

          Expanded(
            child: StreamBuilder(
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return ListView.builder(
                  itemCount: 2,
                   // itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2) ,
                        child: Card(
                          elevation: 3,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 130,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                 Container(
                                   child: Row(
                                     children: [
                                       Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                                         children: [
                                           Text('App Name:',style: TextStyle(
                                               fontSize: 16,fontWeight: FontWeight.w600,
                                               color: Theme.of(context).primaryColor),),
                                           Text('Pasword:',style: TextStyle(fontSize: 16,
                                               fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor),),
                                         ],
                                       ),
                                       SizedBox(width: 10,),
                                       Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                                         children: [
                                           Text('Instagram'),
                                           Text('Au68@*'),
                                         ],
                                       ),
                                     ],
                                   ),
                                 ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          child: Icon(Icons.edit),
                                      onPressed: (){}),
                                      ElevatedButton(child: Icon(Icons.delete),onPressed: (){}),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),
                      );

                    });

              },
            ),
          ),
        ],
      ),
    );
  }
}