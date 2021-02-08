import 'package:BlocProj/blocs.dart';
import 'package:BlocProj/eventes.dart';
import 'package:BlocProj/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocTest>(
      create: (BuildContext context) => BlocTest(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MessagePage(),
      ),
    );
  }
}

class MessagePage extends StatelessWidget {
  const MessagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: BlocBuilder<BlocTest, MessageState>(
        builder: (context, messageState) {
          String _text = '';
          if (messageState is UpdMessageState) {
            _text = messageState.message;
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_text, style: TextStyle(fontSize: 24, color: Colors.amber)),
              TextFormField(
                onChanged: (String val) {
                  context.read<BlocTest>().add(MessageEvent(message: val));
                },
              ),
            ],
          );
        },
      )),
    );
  }
}
