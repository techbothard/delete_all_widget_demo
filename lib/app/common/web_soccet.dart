import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSoccetScreen extends StatefulWidget {
  const WebSoccetScreen({super.key});

  @override
  State<WebSoccetScreen> createState() => _WebSoccetScreenState();
}

class _WebSoccetScreenState extends State<WebSoccetScreen> {
  final controller = TextEditingController();
  final channel =
  WebSocketChannel.connect(Uri.parse('wss://echo.websocket.events'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web Socket"),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          StreamBuilder(
            stream: channel.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.lenght,
                  itemBuilder: (context, index) => Text(snapshot.data[index]),
                );
              }
              return Container();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          channel.sink.add(controller.text);
          controller.clear();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
