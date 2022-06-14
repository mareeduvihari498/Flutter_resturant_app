/*Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
print('initalized flutter');

// Ideal time to initialize
//await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//...
}
Future<UserCredential> signInWithGoogle() async {
  main();
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  print(credential);
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
     final _formkey= GlobalKey<FormState>();
  final _controller= TextEditingController();
  final _pcontroller = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Scaffold(
          body: Center(
      child:Card(
        margin: EdgeInsetsDirectional.all(8),
        child: SingleChildScrollView(
          child:Padding(
            padding: EdgeInsetsDirectional.all(16),
            child:Form(
              key: _formkey,
              child:Column(
                  mainAxisSize: MainAxisSize.min,
                  
                children: <Widget>[
                  TextFormField(
                    key: ValueKey('number'),
                    inputFormatters: [
                      MaskedInputFormatter('### ### ####')
                    ],
                    keyboardType: TextInputType.phone,
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'phone number'
                    ),
                    validator: (value){
                      if(value?.length!=10 ){
                        return 'enter valid Email';
                      }
                      return null;
                    },
                  ),
                    TextFormField(
                    //keyboardType: TextInputType.,
                    decoration: InputDecoration(
                      labelText: 'password',
                    
                    ),
                    
                    obscureText: true,
                    validator: (value){
                      if(value?.length!=8 ){
                        return 'password must be 8 letter';
                      }
                      return null;
                    },
                  ),
                 Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed:() async{
                print(_controller.text);
                await auth.verifyPhoneNumber(
                  timeout: Duration(seconds: 60),
  phoneNumber:'+1'+ _controller.text,
  verificationCompleted: (PhoneAuthCredential credential) async {
    print(credential);
    print(FirebaseAuth.instance.currentUser);
    // ANDROID ONLY!

    // Sign the user in (or link) with the auto-generated credential
    await auth.signInWithCredential(credential);
    
  }, codeAutoRetrievalTimeout: (String verificationId) { 


   }, codeSent: (String verificationId, int? forceResendingToken) async {
     String smsCode = _pcontroller.text;
     print(smsCode);

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential);

     }, verificationFailed: (FirebaseAuthException error) { 
       if (error.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
    }

      },
);

              },
              
               /*() {

                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formkey.currentState!.validate()) {
                  // Process data.
                }
              },*/
              child: const Text('Submit'),
            ),
          ),
                  
                ],
              ), 
            ) ,
          ),
           ),
      ) ,
    ),
        ),
        */










        /*
class Item extends StatelessWidget {
  //Item({Key? key}) : super(key: key);
  int counter =0;
  bool c=false;
  final String item;
  Item(this.item);

  @override
  Widget build(BuildContext context) {
    if(c){
    return IconButton( 
        onPressed: () => {
          
          counter++,
         print('total number of ${item} is ${counter}')
        },
        icon:const Icon(Icons.add),
        color: Colors.blue,
      );
    }
    return IconButton( 
        onPressed: () => {
          
          counter++,
          if(counter==1){
            c=true
          }
        },
        icon: Icon(Icons.add),
        color: Colors.blue,
      );
  }
  
}
*/






 //Map<String,dynamic> data = jsonDecode(jsonEncode(snapshot.snapshot.value));
     
     //counter.fillRange(0,snapshot.snapshot.children.length-1,0);
     
     //print(jsonDecode( jsonEncode(snapshot.snapshot.value)).toString().length);







     /*StreamBuilder(
          stream:ref.onValue ,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
            if(snapshot.hasData){
              //List<Map<String,int>> result = List<Map<String,int>>.from(snapshot.data);
              //Map<data> result = snapshot.data;
              
              //print(result);
              return Center(
                child: ElevatedButton(child: null,
                onPressed: _newentree,

                ),
              ) ;
            }
            return Text('No data');


         },),*/




         /*()async{
         //Navigator.push(context, MaterialPageRoute(builder: (context)=>Order(s: 's')));
         print(ref.onValue.listen((event) async {
           //final data = event.snapshot.children;
           final json = event.snapshot.value as Map<dynamic, dynamic>;
           print(json.keys);
           print(json.values);

           //print(data);
           // print(event.snapshot.value);
         }));
        


      }*/

       /*bottomNavigationBar:i!=0?BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Order',
          ),BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),]
          ):null*/ 


              /*Container(
      height: 50,
      child:  Text('Entry ${entries[index]}'),
    );*/
