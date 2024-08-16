import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/register.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
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
                          .signInWithEmailAndPassword(
                              email: emailcontroller.text,
                              password: passwordcontroller.text);

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Homepage();
                        },
                      ));
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("submit")),
                  ElevatedButton(
                  onPressed: ()  {
                 

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Register();
                        },
                      ));
                 
                  },
                  child: Text("register user")),

            ],
          ),
        ),
      ),
    );
  }
}
