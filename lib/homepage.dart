import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cartpage.dart';
import 'package:flutter_application_1/productCard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text(
            'Home',
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notification_important),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_bag_outlined),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return CartPage();
                  },
                ));
              },
            ),
          ],
        ),
        body: Column(children: [
          TextField(
            decoration: InputDecoration(
                hintText: "Search...",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search)),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Products(Watch: snapshot.data!.docs[index]);
                    },
                  );
                }),
          ),
        ]));
  }
}
