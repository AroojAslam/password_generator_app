import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
        backgroundColor: Colors.grey.shade700,
        title: Text('View All Password ',style: TextStyle(color: Colors.white),),
        leading: Image.asset('images/pas2.png'),
      ),
      body:StreamBuilder(
        //stream: FirebaseFirestore.instance.collection('PasswordGenerater').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // if (!snapshot.hasData)
          //   return Center(
          //   child: CircularProgressIndicator(),);

          return ListView.builder(
            itemCount: 2,
             // itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return  Container(
                    margin:  EdgeInsets.all(2.0),
                    height: 100,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text("Hint:",style:TextStyle(color: Colors.black87)),
                                //  Text(snapshot.data.docs[index]['Hint'],style:TextStyle(color: Colors.black87)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Password:",style:TextStyle(color: Colors.black87)),
                                //  Text(snapshot.data.docs[index]['Password'],style:TextStyle(color: Colors.black87)),
                                ],
                              ),

                            ],
                          ),

                          // Column(
                          //   children: [
                          //     IconButton(
                          //       icon: Icon(
                          //         Icons.edit,
                          //       ),
                          //       color:Color(0xFF2F2F2F),
                          //       splashColor: Colors.transparent,
                          //       highlightColor: Colors.transparent,
                          //       onPressed: () {
                          //         showDialog(
                          //             context: context,
                          //             builder: (context) {
                          //               return AlertDialog(
                          //                 backgroundColor: Colors.white,
                          //                 title: Text('Enter New Password',style: TextStyle(color: Colors.black87),),
                          //                 content: TextField(
                          //                   style: TextStyle(color: Colors.black),
                          //                   onChanged: (value) {
                          //                     setState(() {
                          //                       newPassword =  (value);
                          //                     });
                          //                   },
                          //                   decoration: InputDecoration(hintText: "Enter Password...",hintStyle:TextStyle(color:Colors.black54)),
                          //                 ),
                          //                 actions: <Widget>[
                          //                   ElevatedButton(
                          //                     child: Text("ok"),
                          //                     onPressed: () {
                          //                       setState(() {
                          //                         var docid=snapshot.data.docs[index].id;
                          //                       //  FirebaseFirestore.instance.collection("PasswordGenerater").doc(docid).update({'Password':'$newPassword'});
                          //                         Navigator.pop(context);
                          //                       });
                          //                     },
                          //                   ),
                          //
                          //                 ],
                          //               );
                          //             });
                          //
                          //
                          //       },
                          //     ),
                          //
                          //     IconButton(
                          //       icon: Icon(
                          //         Icons.delete,
                          //       ),
                          //       color:Color(0xFF2F2F2F),
                          //       splashColor: Colors.transparent,
                          //       highlightColor: Colors.transparent,
                          //       onPressed: () async{
                          //         var docid=snapshot.data.docs[index].id;
                          //        // var ref=FirebaseFirestore.instance.collection("PasswordGenerater").doc(docid);
                          //       //  ref.delete();
                          //       },
                          //     ),
                          //
                          //   ],
                          // ),
                        ]
                    ),

                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5.0)
                    )
                );

              });

        },
      ),
    );
  }
}