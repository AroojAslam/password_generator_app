import 'package:flutter/material.dart';
Widget customGestureDetector({
  required String buttonText,
  required VoidCallback onTap,
  required BuildContext context,
  double height = 65,
  Widget? text,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      color: Colors.grey.shade50,
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
              Text(
                buttonText,
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
              ),
              if (text != null) text,
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
  return Expanded(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: BoxDecoration(
        color: Colors.grey.shade700,
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
    ),
  );
}


