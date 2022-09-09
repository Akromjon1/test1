import 'package:web_socket_channel/web_socket_channel.dart';

class SocketService {
  static String SERVER = 'wss://api.hollaex.com/stream';
  static WebSocketChannel channel = WebSocketChannel.connect(Uri.parse(SERVER),);

  static void connectSocketChannel () {
    channel.sink.add('{"op": "subscribe","args": ["orderbook:xht-usdt"]}');  }

  static void connectSocketChannelTrades () {
    channel.sink.add('{"op": "subscribe","args": ["trades:xht-usdt"]}');  }
  static void disconnectSocketChannel () {
    channel.sink.add('{"op": "unsubscribe","args": ["orderbook:xht-usdt"]}');  }

  static void closeSocketChannel () {
    channel.sink.close();
  }
}