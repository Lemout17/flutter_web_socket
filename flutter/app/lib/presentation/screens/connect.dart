import 'package:app/presentation/screens/websocket.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _serverController = TextEditingController();

class Connect extends StatelessWidget {
  const Connect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect to server'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: Column(
          children: [
            Form(
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            const SizedBox(height: 23),
            Form(
              child: TextFormField(
                controller: _serverController,
                decoration: const InputDecoration(
                  labelText: 'Server URL',
                ),
              ),
            ),
            const SizedBox(height: 23),
            ElevatedButton(
              onPressed: () {
                _connectToServer(context);
              },
              child: const Text('Connect'),
            ),
          ],
        ),
      ),
    );
  }

  void _connectToServer(BuildContext context) {
    final serverUrl = _serverController.text;
    final username = _nameController.text;
    if (serverUrl.isNotEmpty) {
      final webSocketChannel = IOWebSocketChannel.connect(serverUrl);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebSocketScreen(
            webSocketChannel: webSocketChannel,
            username: username,
          ),
        ),
      );
    }
  }
}
