import 'package:bawarchi/item.dart';
import 'package:bawarchi/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool ls =true;
  @override
  final _formkey= GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
    
  }
}