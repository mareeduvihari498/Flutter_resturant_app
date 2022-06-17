/*
Todo List
Create the next screen from checkout to order
write it to firestore
Add transaction and payment method

*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Order extends StatefulWidget {
  const Order({Key? key, required this.s,required this.price,required this.count, required this.totalamount}) : super(key: key);
final List<String> s;
final List<double> price;
final List<int> count;
final double totalamount;
  @override
  State<Order> createState() => _OrderState(s,price,count,totalamount);
}

class _OrderState extends State<Order> {
  final List<String> s;
  final List<double> prices;
  final List<int> count;
  final double  totalamount;
  Future<void> porder()async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection('Users').doc('+16028152446').collection('previous_orders').doc((DateTime.now().millisecondsSinceEpoch).toString()).set({}) ;
    
  }

  _OrderState(this.s,this.prices,this.count, this.totalamount);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dwarka Bawarchi'),

      ),
      body:Padding(padding: EdgeInsets.all(8),child: Column(
          mainAxisSize: MainAxisSize.min,
        
        
        children:[
      Expanded(child: 
      ListView.builder(
        itemCount: s.length,
        itemBuilder: ( (BuildContext context, index) {
        return ListTile(
          isThreeLine: true,
          title: Text(s[index]),
          subtitle: Text('${prices[index]}x${count[index]}'),
          trailing:buildText(prices[index],count[index]),
         

        );
      }))),
        ListTile(
          
        title: const Text('The total amount is '),
        trailing: Text('$totalamount'),
      ),
      ElevatedButton(onPressed: (){}, child:const Text('Place the order')  ),
      ])
      
    ));

    
  }
}


Text buildText(double x,int y){

  double z = x*y;
    return Text('$z');
} 