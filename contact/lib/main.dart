import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('앱임'),
          centerTitle: false,
          leading: Icon(Icons.star),
          actions: [Icon(Icons.person), Icon(Icons.person)],
        ),
        // body: Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Container(
        //     width: double.infinity, height: 50, color: Colors.blue,
        //     // margin: EdgeInsets.fromLTRB(0,30,0,0),
        //     // decoration: BoxDecoration( // 잡다한 기능은 decoration 안에다가 작성
        //     //   border: Border.all(color: Colors.black),
        //     //
        //     // ),
        //   ),
        // ),
        body: SizedBox(
          child:
          // Text('안녕하세요',
          //   style: TextStyle(color: Colors.red, fontSize: 30, fontWeight: FontWeight.w700),
          // ),
          ElevatedButton(
            child: Text('글자'),
            onPressed: (){},
          ),
        ),
      )
    );

  }
}

