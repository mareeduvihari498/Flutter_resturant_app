/*
Add charts
add available/non-available features
Experimental Features

*/
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
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
    List<Color> colors = [Colors.blue,Colors.red];
    final _name = TextEditingController();
    final _price = TextEditingController();
    final _type = TextEditingController();
    final _description = TextEditingController();
    final _formkey= GlobalKey<FormState>();

    late List<int> available; 
    int ind =0;
      late List<String>entries  ;
  late List<String>description  ;
  var total_amount=0.0;
  late List<double> prices  ;
    Future<void>_trail() async{
    print('called');
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });

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
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(title:const Text('Dwaraka Bawarchi'),
        actions: <Widget>[
          TextButton(onPressed: ()=> showDialog<String>(context: context, builder: (BuildContext context)=> AlertDialog(
            title:const Text('Adding item') ,
            content: const Text('Add item details'),
            actions: <Widget>[
              Form(
                key: _formkey,
                child: Column(
                children: <Widget>[
                  TextFormField(
                      controller: _name,
                    decoration: const InputDecoration(
                      labelText: 'Name'
                    ),

                  ),
                  TextFormField(
                    controller: _price,
                    decoration: const InputDecoration(
                      labelText: 'Price'
                    ),

                  ),
                  TextFormField(
                    controller: _type,
                    decoration: const InputDecoration(
                      labelText: 'type'
                    ),

                  ),
                  TextFormField(
                    controller: _description,
                    decoration: const InputDecoration(
                      labelText: 'Description'
                    ),

                  ),
                  TextButton(onPressed: () async{
                    await ref.child('items').child(_type.text).push().set({'name':_name.text,'price':_price.text,'description':_description.text});
                    _formkey.currentState!.reset();

                  }, child: const Text('Add')),
                  TextButton(onPressed: (){}, child: const Text('Cancel')),
                  
                ],
              )),
            ],
          ))

          , child: const Text('Update Item',style: TextStyle(color: Colors.white),)),
          TextButton(onPressed: (){}, child: const Text('Add Item',style: TextStyle(color: Colors.white),)),
          TextButton(onPressed: (){}, child: const Text('Add Employee',style: TextStyle(color: Colors.white),)),
          TextButton(onPressed: (){}, child: const Text('Pause Orders',style: TextStyle(color: Colors.white),)),
          
          
          
          
          
        
        ],
        ),
        
        drawer: Drawer(
          child: ListView(
            padding:EdgeInsets.zero ,
            children: [
               ListTile(
                title:const Text('Add Employee'),
                onTap: (){},
               ),
               ListTile(
                title: const Text('Add Items'),
                onTap: (){},
               ),
               ListTile(
                title: const Text('Update Items'),
                onTap: (){},
               ),
               ListTile(
                title: const Text('Pause Orders'),
                onTap: (){},
               ),

            ],
          ),
        ), 
    body:  ListView.builder(padding: const EdgeInsets.all(8),
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
      } ,child: Text(avilable[available[index]],),)
    );
  },
        
      )));
    
  }
}

/*DrawerHeader(
                child: TextButton(onPressed:(){},
              child:const Text('Add Employee'))
              ),
              DrawerHeader(child: TextButton(
                onPressed: () {
                  
                },
                child: const Text('Pause Orders'),
              )
              ),
              DrawerHeader(child: TextButton(child:Text('Add Items') ,onPressed: (){},)),
              DrawerHeader(child: TextButton(child:Text('Update Items') ,onPressed: (){},)),
              DrawerHeader(child: TextButton(child:Text('Sales') ,onPressed: (){},)),
*/

