import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class WebItem extends StatefulWidget {
  const WebItem({Key? key}) : super(key: key);

  @override
  State<WebItem> createState() => _WebItemState();
}

class _WebItemState extends State<WebItem> {
  late bool login;
  void initState(){
    super.initState();
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      login = false;
    } else {
      login = true;
    }
  });

  }
  DatabaseReference ref =FirebaseDatabase.instance.ref('/items');
  var s = 'Verify';
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
            TextButton(onPressed: (){}, child:const Text('Home',style: TextStyle(color: Colors.white),)),
            TextButton(onPressed: () =>
            {if(!login){
              showDialog(
  context: context,
  builder: (context) {
    String contentText = "Content of Dialog";
    String c = "Change";
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          title: Text("Title of Dialog"),
          content: Text(contentText),
          actions: <Widget>[
            Form(child: Column(
              children: <Widget>[
                TextFormField(
                  
                  decoration: InputDecoration(
                    labelText: 'Phone Number'
                  ),
                )
              ],
            )),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  login=true;
                  contentText = "Changed Content of Dialog";
                  c="Changed";
                });
              },
              child: Text(c),
            ),
          ],
        );
      },
    );
  },
)}
else{
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: const Text('simple snack bar'))
  )
}
}
              
              

            , child: const Text('Order Now',style: TextStyle(color: Colors.white),))    
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