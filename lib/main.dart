import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funny Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static var indexquoteprev = -1;
  static var indexcolorprev = -1;
  static const List<String> quoteList = [
    'น้ำขึ้นให้รีบตัก ผู้ชายทักให้รีบตอบ',
    'ร้ายก็ว่าแย่ อ่อนแอก็ว่าสำออย',
    'เคยเป็นแล้วคนดี ตอนนี้เป็นคนโสด',
    'สับรางไม่ไหว แต่สับไพ่สู้อยู่',
    'อย่าโชว์เหนือถ้าเสือยังไม่ออกจากถ้ำ',
    'รักแท้แพ้ใกล้ชิด แต่ทำไมเราคุยกับเธอทุกวัน เธอไม่เห็นจะชอบเราบ้างเลย',
    'ถ้าหนังไม่เหนียวอย่ามาเฟี้ยวกับพี่',
    'จะจีบก็ทักมา อย่าลีลาเดี๋ยวแม่ตบ',
  ];

  static const List<Color> colorList = [
    Colors.cyanAccent,
    Colors.blueAccent,
    Colors.deepPurpleAccent,
    Colors.teal,
    Colors.pink
  ];

  var quote = quoteList[0];
  var color = colorList[1];


  void handleClickGo() {
    setState(() {
      var rand = Random();
      var randomIndex = rand.nextInt(quoteList.length);
      var randomColor = rand.nextInt(colorList.length);

      if(randomIndex == indexquoteprev){
        while(true){
          randomIndex = rand.nextInt(quoteList.length);
          if(randomIndex != indexquoteprev){
            quote = quoteList[randomIndex];
            indexquoteprev = randomIndex;
            break;
          }
        }
      }else{
        quote = quoteList[randomIndex];
        indexquoteprev = randomIndex;
      }

      if(randomColor == indexcolorprev){
        while(true){
          randomColor = rand.nextInt(colorList.length);
          if(randomColor != indexcolorprev){
            color = colorList[randomColor];
            indexcolorprev = randomColor;
            break;
          }
        }
      }else{
        color = colorList[randomColor];
        indexcolorprev = randomColor;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคมกวนๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickGo,
        child: const Center(
          child: Text(
            'Next Quote',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            quote, // positional parameter/argument
            // named parameter/argument
            style: TextStyle(
              color: color,
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}