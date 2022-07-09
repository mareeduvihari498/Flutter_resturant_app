/*
Add charts
add available/non-available features
Experimental Features

*/
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref =FirebaseDatabase.instance.ref() ;
    List<String> avilable= ['Available','Not Available'];
    late List<int> available; 
    int ind =0;
      late List<String>entries  ;
  late List<String>description  ;
  var total_amount=0.0;
  late List<double> prices  ;
    Future<void>_trail() async{
    print('called');

   await ref.child('items').child('item').once().then((DatabaseEvent snapshot){
    print(snapshot.snapshot.children);
     for (var element in snapshot.snapshot.children) {
      available.add(0);
       
       var values = jsonDecode(jsonEncode(element.value));
       print(values);
       entries.add(values['name']);
       prices.add(values['price']);
       description.add(values['description']);
     }
     

     
     //print((snapshot.snapshot.value.runtimeType));
   });
  

setState(() {});

    
  }
  void initState(){
    super.initState();
    entries=[];
    prices=[];
    description=[];
    available=[];
    _trail();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(padding: const EdgeInsets.all(8),
  itemCount: entries.length,
  itemBuilder: (BuildContext context, int index) {
    return   ListTile(
      
      title: Text(entries[index]),
      subtitle: Text('${prices[index]}\n ${description[index]}'),
      
      isThreeLine: true,

      trailing:  TextButton(onPressed:(){
        setState(() {
          available[index]++;
          available[index]=available[index]%2;
          
        });
      } ,child: Text(avilable[available[index]]),)
    );
  },
        
      );
    
  }
}

