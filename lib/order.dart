/*
Todo List
Create the next screen from checkout to order
write it to firestore
Add transaction and payment method

*/
import 'package:flutter/material.dart';


class Order extends StatefulWidget {
  const Order({Key? key, required this.s,required this.price,required this.count}) : super(key: key);
final List<String> s;
final List<double> price;
final List<int> count;
  @override
  State<Order> createState() => _OrderState(s,price,count);
}

class _OrderState extends State<Order> {
  final List<String> s;
  final List<double> prices;
  final List<int> count;

  _OrderState(this.s,this.prices,this.count);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dwarka Bawarchi'),

      ),
      body: ListView.builder(
        itemCount: s.length,
        itemBuilder: ( (BuildContext context, index) {
        return ListTile(
          isThreeLine: true,
          title: Text(s[index]),
          subtitle: Text('${prices[index]}x${count[index]}'),
          trailing:buildText(prices[index],count[index]),
         

        );
      }))
    );

    
  }
}

/*class Order extends StatelessWidget {
  const Order({Key? key, required this.todos}) : super(key: key);
 //final List<To> todos;
  final List<String> todos;
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(
      title: const Text('Dwaraka Bawarchi'),
    ),
    body:ElevatedButton(
      child: Text('click'),
      onPressed: (){
        //print(p);
      },
    ),
    /*ListView.builder(itemBuilder:(BuildContext context,int index){
      return ListTile(
        title: Text(s[index]),
        trailing: Text('${p[index]}'),
      );
    } ),*/

    

    ); 
    
  }
}

class To{
  final String name;
  final double price;
  final int count;
  To(this.count,this.name,this.price);
}*/

Text buildText(double x,int y){

  double z = x*y;
    return Text('$z');
} 