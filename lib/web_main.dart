import 'package:flutter/material.dart';
class Webmain extends StatefulWidget {
  const Webmain({Key? key}) : super(key: key);

  @override
  State<Webmain> createState() => _WebmainState();
}

class _WebmainState extends State<Webmain> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
    
    const Image(
  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
  
),
Expanded(child: 
Center(
  
  child: Text('Noice'),)
  )
]
);
    
  }
}