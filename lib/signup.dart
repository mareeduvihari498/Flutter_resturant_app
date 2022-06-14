import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'item.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  bool otp =true;
  var signup = 'Get OTP';
    final _formkey= GlobalKey<FormState>();
  final _controller= TextEditingController();
  final _pcontroller = TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Text('Dwaraka Bawarch'),
        ),
        body: Center(
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
                    enabled: otp,
                    inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[a-z]')),
                        ],
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Name can\'t be empty';
                      }
                        return null;
                    },
                    ),
                  TextFormField(
                    enabled: otp,
                    keyboardType: TextInputType.emailAddress,
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Email'
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Email can\'t be empty';
                      }
                      else if(!value.contains('@') || !value.endsWith('.com')){
                        return 'enter valid Email';
                      }
                      return null;
                    },
                  ),
                    TextFormField(
                      enabled: otp,
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
                      /*if(value.length!=10 ){
                        return 'Phone Number must be 10 digits';
                      }*/
                      return null;
                    },
                  ),
                  TextFormField(
                    enabled: otp,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Card Number',
                    ),
                    inputFormatters: <TextInputFormatter>[
                      CreditCardNumberInputFormatter(onCardSystemSelected:  (CardSystemData? cardSystemData) {
            print(cardSystemData?.system);
            
        }),
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
  ],

                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(child:TextFormField(
                        enabled: otp,
                        inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                    decoration: const InputDecoration(
                      labelText: 'Expiration Date'
                    ),
                  ),),
                   const SizedBox(
                  width: 20,
                ),
                  Expanded(child:TextFormField(
                    enabled: otp,
                    inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                    decoration: const InputDecoration(
                      labelText: 'CVV'

                    ),
                    obscureText: true,
                  ),),
                   

                    ],
                  ),
                  TextFormField(
                    enabled: otp,
                    inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[a-z]')),
                        ],
                    decoration: const InputDecoration(
                      labelText: 'Name on Card'
                    ),
                  ),
                  TextFormField(
                    enabled: !otp,
                    decoration: const InputDecoration(
                      labelText: 'Enter OTP',
                    ),
                  ),
                 Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed:() {
                if(otp){if(_formkey.currentState!.validate()){
                  
                  setState(() {
                    otp=false;
                    signup='Sign Up';
                  });

                }
                

              }
              else{
                 Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: ((context) {
                    return  Item();
                  }))
                  );
                 
              }
              
              },
              
              
               /*() {

                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formkey.currentState!.validate()) {
                  // Process data.
                }
              },*/
              child:  Text(signup),
            ),
          ),
          TextButton(onPressed: (){
            
            Navigator.push(context, MaterialPageRoute(builder: (context){return Login();} ));
          }, child: const Text('Already have a account? Click to Login'))
                  
                ],
              ), 
            ) ,
            
          ),
          
           ),
      ) ,
      
    ),
        ),
      
    );
    
  }
}