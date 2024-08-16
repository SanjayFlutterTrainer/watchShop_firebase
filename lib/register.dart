import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';

class Register extends StatelessWidget {
  Register({super.key});

  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var usernameCrontroller = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: usernameCrontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Username",
                  fillColor: Colors.white70,
                ),
              ),
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "email",
                  fillColor: const Color.fromRGBO(255, 255, 255, 0.702),
                ),
              ),
              TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "password",
                  fillColor: Colors.white70,
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      final credentials = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailcontroller.text,
                              password: passwordcontroller.text);

                      users.doc(credentials.user!.uid).set({
                        'username': usernameCrontroller.text,
                        'email': emailcontroller.text, // John Doe
                        'cart': [], // Stokes and Sons
                      }).then((value) {
                        print("User Added");
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Homepage();
                          },
                        ));
                      }).catchError(
                          (error) => print("Failed to add user: $error"));
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("submit"))
            ],
          ),
        ),
      ),
    );
  }
}
