// ignore_for_file: unnecessary_const

/*
Todo List
Create a streambuilder for reading the changes as it doesn't reaload while the app is running in the background
Snackbar to say that prices have been changes
Push notification before a day when the changes have been made 

*/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'order.dart';
import 'package:firebase_database/firebase_database.dart';

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref =FirebaseDatabase.instance.ref() ;
    final counter =<int>[];
  var i =0;
  late List<String>entries  ;
  late List<String>description  ;
  var total_amount=0.0;
  late List<double> prices  ;

    Future<int> _newentree()async{
      await ref.child('items').child('item').push().set({'name':'biryani','price':15.99,'description':'Falovured rice'});
      return 1;
    }

   Future<void>_trail() async{
   await ref.child('items').child('item').once().then((DatabaseEvent snapshot){
    
     for (var element in snapshot.snapshot.children) {
       counter.add(0);
       var values = jsonDecode(jsonEncode(element.value));
       entries.add(values['name']);
       prices.add(values['price']);
       description.add(values['description']);
     }
     

     
     //print((snapshot.snapshot.value.runtimeType));
   });
  

setState(() {});
   
    
  }
  void NextScreen(){
   final s=<String>[];
    final p=<double>[];
    final c =<int>[];
     for(var j=0;j<counter.length;j++){
      if(counter[j]!=0){
        s.add(entries[j]);
        c.add(counter[j]);
        p.add(prices[j]);
      }

     }
    
    
  Navigator.push(
              context,
              MaterialPageRoute(builder: ( context) {return  Order(s: s,count: c,price: p,);}
              ),
            );
  }

  //final counter =List<int>.filled(3, 0);

  @override
  void initState(){
    super.initState();
    entries=[];
    prices=[];
    description=[];
    _trail();
  }
  Widget build(BuildContext context) {
   return  MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title:  const Text("Dwarka Bawarchi"),
        ),
        drawer:  Drawer(
          child: ListView(
            padding:EdgeInsets.zero ,
            children:  [
              const DrawerHeader(
                child:const Text('Welcome Customer')
                ),
                ListTile(
                  title:  const Text('Orders'),
                  onTap: (){

                  },
                ),
                ListTile(
                  title:  const Text('Reviews'),
                  onTap: (){

                  },
                ),
                ListTile(
                  title:  const Text('Settings'),
                  onTap: (){

                  },
                ),
                ListTile(
                  title:  const Text('Signout'),
                  onTap: (){

                  },
                ),
            ],
          ),

        ),
        body:    ListView.builder(padding: const EdgeInsets.all(8),
  itemCount: entries.length,
  itemBuilder: (BuildContext context, int index) {
    return   ListTile(
      title: Text(entries[index]),
      subtitle: Text('${prices[index]}\n ${description[index]}'),
      
      isThreeLine: true,

      trailing: (() {
        if(counter[index]==0){
  // your code here
  return IconButton( 
        onPressed: () => {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added ${entries[index]}'),duration: const Duration(microseconds: 100 ),)),
          setState(() {
            counter[index]++;
            total_amount+=prices[index];
            i++;
          }),
          
        },
        icon: const Icon(Icons.add),
        color: Colors.blue,
      );}
      return Row(
      mainAxisSize: MainAxisSize.min,
      children:<Widget>[ IconButton( 
        onPressed: () => {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('deleted ${entries[index]}'),duration: const Duration(microseconds: 100),)),
          setState(() {
            counter[index]--;
            total_amount-=prices[index];
            i--;
          }),
        },
        icon:const Icon(Icons.remove),
        color: Colors.blue,
      ),
      Text('${counter[index]}'),
      IconButton( 
        onPressed: () => {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added ${entries[index]}'),duration: const Duration(microseconds: 100),)),
          setState(() {
            total_amount+=prices[index];
            counter[index]++;
            i++;
          }),
          
        },
        icon: const Icon(Icons.add),
        color: Colors.blue,
      ),
      ]);

      }())

    ); 

  },
        
      ),
      
       floatingActionButton:i!=0?FloatingActionButton.extended(onPressed:NextScreen, 
      label:const Text('Order'),
      icon: const Icon(Icons.shopping_cart_checkout),
      ):null,
      
     
    ),
 );    
  }
}
