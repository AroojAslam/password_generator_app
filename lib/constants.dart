
import 'package:flutter/material.dart';


Widget customGestureDetector({
  required String buttonText,
  required VoidCallback onTap,
  required BuildContext context,
  double height = 80,
  Widget? divider,
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
              if (divider != null) divider,
              if (text != null) text,
            ],
          ),
        ),
      ),
    ),
  );
}

