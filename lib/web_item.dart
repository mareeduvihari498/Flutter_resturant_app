import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class WebItem extends StatefulWidget {
  const WebItem({Key? key}) : super(key: key);

  @override
  State<WebItem> createState() => _WebItemState();
}

class _WebItemState extends State<WebItem> {
  DatabaseReference ref =FirebaseDatabase.instance.ref('/items');
  Future<Widget> item() async{
     Stream<DatabaseEvent> db = ref.onValue;
     var s;
          db.forEach((element) {
          element.snapshot.children.forEach((element) {
            element.children.forEach((element) { 
               s=s+element;
            });
           });
          });

          return Text(s);
            /*ref.onValue.forEach((element) {
              print(element);
              (element.snapshot.children.forEach((element) {
                print(element.value);
                if(element.key=='items'){
                  element.children.forEach((element) {
                    element.children.forEach((element) { 
                      print(element.value);
                    });
                   });
                }
               }));
              
            });*/

  }
  //.child('items').child('item') ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:<Widget> [
            TextButton(onPressed: (){}, child:const Text('Home')),
            TextButton(onPressed: (){}, child: const Text('Order Now'))    
        ],
        title:const Text('Dwaraka Bawarchi'),
      ),
      body: const Text('Not working think of something you moron')
      
      /* StreamBuilder<DatabaseEvent>(
        stream: ref.onValue  ,
        builder: ( context, databaseEvent) {
          if(databaseEvent.hasData){
            final data =databaseEvent.data!.snapshot ;
            data.children.forEach((element) { 
              return Text(element.child('item').value.toString());
              
            });

          }
          return Text('Loading Data');
          

          },
      ),*/
    );
    
  }
}