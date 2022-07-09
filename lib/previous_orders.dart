import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Previous_Orders extends StatefulWidget {
  const Previous_Orders({Key? key}) : super(key: key);

  @override
  State<Previous_Orders> createState() => _Previous_OrdersState();
}

class _Previous_OrdersState extends State<Previous_Orders> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dwaraka Bawarchi'),
      ),
      body: 
      
      /*TextButton(
        child: 
        
        const Text('check'),
        onPressed: () async{
          var data = await db.collection('Users').doc('+16028152446').collection('previous_orders').get().asStream();
          /*data.docs.forEach((element) {
            print(element.data());
          });*/
          data.forEach((element) {
            element.docs.forEach((element) {
              print(element.data());
            });
          });
        },
      )*/
      
      
     StreamBuilder<QuerySnapshot>(
        stream: db.collection('Users').doc('+16028152446').collection('previous_orders').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasData){
          return ListView(children:snapshot.data!.docs.map((DocumentSnapshot documentSnapshot){
            return ListTile(
              title: Text(documentSnapshot['items'].toString()),
            );
          } ).toList(),
          );
          }
          else{
            return const Center (child: CircularProgressIndicator(
              value: null,
              semanticsLabel: 'Linear progress indicator',
            ));
          }
        },
      )
    );
    
  }
}