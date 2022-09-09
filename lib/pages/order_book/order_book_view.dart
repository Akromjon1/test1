import 'package:flutter/material.dart';
import '../../models/TradeModel.dart';
import '../../services/socket_service.dart';

class OrderBook extends StatefulWidget {
  const OrderBook({Key? key}) : super(key: key);

  @override
  State<OrderBook> createState() => _OrderBookState();
}

class _OrderBookState extends State<OrderBook> {
  @override
  void initState() {
    super.initState();
    SocketService.connectSocketChannelTrades();
  }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   SocketService.disconnectSocketChannel();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
              SocketService.disconnectSocketChannel();
            },
            child: const Icon(Icons.back_hand)),
        title: const Text("Socket"),
      ),
      body: StreamBuilder(
        stream: SocketService.channel.stream,
        builder: (context, snapshot) {
          print(snapshot.data);
          TradeModel? model;
          if(snapshot.hasData && snapshot.data != '{"message":"Welcome!"}') {
            debugPrint(snapshot.data.toString());
            model = tradeModelFromJson(snapshot.data as String);

            return Column(
              children: [
                Center(
                  child: Text(
                    snapshot.hasData ? "${model.data}" : 'No data',
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                Center(
                  child: Text(
                    snapshot.hasData ? "${model.symbol}" : 'No data',
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                Center(
                  child: Text(
                    snapshot.hasData ? "${model.action}" : 'No data',
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                Center(
                  child: Text(
                    snapshot.hasData ? "${model.time}" : 'No data',
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                Center(
                  child: Text(
                    snapshot.hasData ? "${model.topic}" : 'No data',
                    style: const TextStyle(fontSize: 22),
                  ),
                ),

              ],
            );
          }

          return Center(
            child: Text(
              snapshot.hasData ? "${snapshot.error}" : 'No data',
              style: const TextStyle(fontSize: 22),
            ),
          );
        },
      ),

    );
  }
}
