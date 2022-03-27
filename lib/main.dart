import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final FlutterTts tts = FlutterTts();
  final TextEditingController controller =
      TextEditingController(text: '');

  Home() {
    tts.setLanguage('en');
    tts.setSpeechRate(0.4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text to Speech"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20), 
        child: ListView(
          children: [
            Column(
          children: [
            TextField(
              autofocus: true,
              style: TextStyle(fontSize: 20),
              keyboardType: TextInputType.multiline,
              controller: controller,
              maxLines: 30,
              decoration: InputDecoration(
                hintText: "Type something here"
              ),
            )
          ],
        ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          tts.speak(controller.text);
        },
        backgroundColor: Colors.deepOrangeAccent,
        child: Icon(Icons.play_arrow),
        ),
    );
  }
}