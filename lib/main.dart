/*
Todo List
Add a login page 
Set firebase rules
create a seperte admin screen

*/

import 'package:bawarchi/login.dart';
import 'package:flutter/material.dart';
import 'dart:io';
//import 'package:collection/collection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart';


import 'signup.dart';
//import 'Ico.dart';
//import 'item.dart';
/*
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
*/


Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() =>  _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  
  Widget build(BuildContext context){
    return   MaterialApp(
      
        home:Scaffold(
          body: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child:Signup()),
              const SizedBox(
                  width: 20,
                ),
              Expanded(child:Login())
            ],
          ),
        ),
        /*routes:<String, WidgetBuilder>{
          'order': (BuildContext context) =>   const Order(s: '',),
          'schedule' : (BuildContext context) =>  new Item(),
          'payment' :(BuildContext context) => new Item(),

        },*/
        
        
    );
     }
}

