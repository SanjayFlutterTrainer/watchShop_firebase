import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  var Watch;
  Products({super.key, required this.Watch});

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height: 200,
          width: 800,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                (Watch["image"]),
                fit: BoxFit.fill,
              ),
              Column(
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    Watch["title"],
                    style: TextStyle(fontSize: 30, color: Colors.blueGrey),
                  ),
                  Text(
                    Watch["price"].toString(),
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    users.doc(auth.currentUser!.uid).update({
                      'cart': [Watch["title"]]
                    });
                  },
                  child: Text(
                    "add to cart",
                    style: TextStyle(color: Colors.blueGrey),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
