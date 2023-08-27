import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showSuccessDialog({
  required BuildContext context,
  required String heading
  ,required VoidCallback onPressed,
  required String buttontext,
    Widget? content}) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:Text(heading,style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.center,) ,
        content: content!= null ? content : null ,
        actions: <Widget>[
          TextButton(
            onPressed:onPressed,
            child: Text(buttontext),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
        ],
      );
    },
  );
}


void addpasswor({required String pasword,required String a} ){
  final firestore = FirebaseFirestore.instance.collection('users');
  final auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  String uid = user!.uid;
  var time =DateTime.now().millisecondsSinceEpoch;
  firestore.doc(uid).collection('pass').doc(time.toString()).set({
    'AppName':'$a','Password':'$pasword'
  });
}
Widget customGestureDetector({
  required String buttonText,
  required VoidCallback onTap,
  required BuildContext context,
  double height = 60,
  Widget? text,
  bool loading =false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      elevation: 2,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             loading ? CircularProgressIndicator(): Text(
                buttonText,
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
              ),
              if (text != null)text,
            ],
          ),
        ),
      ),
    ),
  );
}
Widget mainContainer({
  required BuildContext context,required Widget column,
}){
  return  Container(
      height: MediaQuery.of(context).size.height * 0.37,
      decoration: BoxDecoration(
       color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 10, // Blur radius
            offset: Offset(0, 3), // Offset in the (x, y) direction
          ),
        ],
      ),
      child: column,
    );
}

Widget backGround({required BuildContext context,required int pos1,required pos2}){
  return Positioned(
      right: -100,bottom: -100,
      child: Container(
        height: 350,
        width: 350,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
      ));
}
class Utils{
  Future<void> toastmessage(String message) async {
    Fluttertoast.showToast(
        msg:message ,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}