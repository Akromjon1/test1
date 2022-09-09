import 'package:flutter/material.dart';
import 'package:web_socket/pages/order_book/order_book_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>  const OrderBook()));
          }, child: const Text("OrderBook")),
          ElevatedButton(onPressed: (){}, child: const Text("Trade")),
        ],
      ),
    );
  }
}
