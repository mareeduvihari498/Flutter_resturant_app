import 'package:flutter/material.dart';
class FlutterExample extends StatelessWidget {
  const FlutterExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView(
        children:  List.generate(5, (i)=> ListTileItem(
          title: "Item#$i",
        )),
      );
  }
}
class ListTileItem extends StatefulWidget {
    String title;
  ListTileItem({Key? key, required this.title}) : super(key: key);
  @override
  _ListTileItemState createState() =>  _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title:  Text(widget.title),
      trailing:  Row(
        children: <Widget>[
           _itemCount!=0?   IconButton(icon: const Icon(Icons.remove),onPressed: ()=>setState(()=>_itemCount--),): Container(),
            Text(_itemCount.toString()),
           IconButton(icon: const Icon(Icons.add),onPressed: ()=>setState(()=>_itemCount++))
        ],
      ),
    );
  }
}