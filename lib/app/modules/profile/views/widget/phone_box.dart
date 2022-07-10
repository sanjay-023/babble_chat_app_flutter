import 'package:flutter/material.dart';

class PhoneBoxwidget extends StatelessWidget {
  PhoneBoxwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color.fromARGB(94, 70, 69, 69),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(30, 0, 0, 0),
                  blurRadius: 6,
                  spreadRadius: 0.5)
            ]),
        child: ListTile(
          leading: Icon(
            Icons.phone,
            color: Colors.white,
          ),
          title: Text(
            "Tap to add contact number",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
