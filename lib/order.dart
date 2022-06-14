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


Text buildText(double x,int y){

  double z = x*y;
    return Text('$z');
} 