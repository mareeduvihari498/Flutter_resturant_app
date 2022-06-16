import 'package:bawarchi/item.dart';
import 'package:bawarchi/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool ls =true;
  @override
  FirebaseFirestore db = FirebaseFirestore.instance;
  
  final _formkey= GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return  Center(
      child:Card(
        margin: const EdgeInsetsDirectional.all(8),
        child: SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsetsDirectional.all(16),
            child:Form(
              key: _formkey,
              child:Column(
                  mainAxisSize: MainAxisSize.min,
                  
                children: <Widget>[
                  TextFormField(
                      key: const ValueKey('number'),
                    inputFormatters: [
                      MaskedInputFormatter('### ### ####')
                    ],
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                    
                    ),
                    
                    
                    validator: (value){
                      if(value==null){
                        return 'phone number can\'t be empty';

                      }
                      if(value.length!=12 ){
                        print(value.length);
                        return 'Phone Number must be 10 digits';
                      }
                      
                    },
                  ),
                  TextFormField(
                      key: const ValueKey('OTP'),
                    obscureText: true,
                    enabled: false,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Enter OTP',
                    
                    ),
                    
                    
                    validator: (value){
                      if(value==null){
                        return 'OTP can\'t be empty';

                      }
                      if(value.length!=6 ){
                        return 'Phone Number must be 6 digits';
                      }
                      
                    },
                  ),
                  Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
                  
              onPressed:() async {
                if(_formkey.currentState?.validate()!=null){
                  await db.collection('Users').doc('+16028152446').collection('previous_orders').doc((DateTime.now().millisecondsSinceEpoch).toString()).set({'card number':0,'items':{'entree':16.99,'count':1}});
                  var doc=db.collection('Users').doc('+16028152446');
                  var d = doc.snapshots().forEach((element) {
                    print(element.data());
                  });

                  
                  Navigator.push(context, MaterialPageRoute(builder: ((context) {
                    return  Item();
                  }))
                  );
                  Navigator.pop(context);

            }
                

              },
              
              
              child: const Text('Sign Up'),
            ),

                  ),
                  

                ],
              ), 
            ) ,
            
          ),
          
           ),
      ) ,
      
    );
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dwaraka Bawarchi'),
        ),
        body: Center(
          child:Padding(padding: const EdgeInsetsDirectional.all(8),  child:SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsetsDirectional.all(16),
              child: Form(
                key: _formkey,
                child: Column(
                   mainAxisSize: MainAxisSize.min,
                  children: [
                       TextFormField(
                      key: const ValueKey('number'),
                    inputFormatters: [
                      MaskedInputFormatter('### ### ####')
                    ],
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                    
                    ),
                    
                    
                    validator: (value){
                      if(value==null){
                        return 'phone number can\'t be empty';

                      }
                      if(value.length!=12 ){
                        print(value.length);
                        return 'Phone Number must be 10 digits';
                      }
                      
                    },
                  ),
                  TextFormField(
                      key: const ValueKey('OTP'),
                    obscureText: true,
                    enabled: false,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Enter OTP',
                    
                    ),
                    
                    
                    validator: (value){
                      if(value==null){
                        return 'OTP can\'t be empty';

                      }
                      if(value.length!=6 ){
                        return 'Phone Number must be 6 digits';
                      }
                      
                    },
                  ),
                  Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
                  
              onPressed:() {
                if(_formkey.currentState?.validate()!=null){
                  
                  Navigator.push(context, MaterialPageRoute(builder: ((context) {
                    return  Item();
                  }))
                  );
                  Navigator.pop(context);

            }
                

              },
              
              
              child: const Text('Sign Up'),
            ),

                  ),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: ((context) {
                    return  Signup();
                  }))
                  );

                  }, child:const Text('New Customer? Signup')),

                  ],
                ),
            ),

          ),
          ),
        ),
      ),
    )
    );*/
    
  }
}