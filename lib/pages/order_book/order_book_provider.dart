

import 'package:flutter/foundation.dart';
import 'package:web_socket/services/socket_service.dart';

class OrderBookStreamProvider extends ChangeNotifier{
  String str = "No data";
  var streamOrderBook = SocketService.channel;
  init(){
    SocketService.connectSocketChannel();
  }
  close(){
    SocketService.closeSocketChannel();
  }
}