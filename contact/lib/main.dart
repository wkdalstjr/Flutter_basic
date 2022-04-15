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
        appBar: AppBar(),
        body: ShopItem()
        ),
      );
  }
}

// 평생 바뀌지 않는 값들은 변수로 만들어서 호출해도 괜찮다.
var a = SizedBox(
  child: Text('안녕'),
);

// 큰 페이지나, 재사용 많은 UI들을 커스텀위젯으로 하는게 좋음 
class ShopItem extends StatelessWidget {
  const ShopItem({Key? key}) : super(key: key);

  @override // 이거 먼저 적용하라는 뜻
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text('안녕'),
    );
  }
}






// home: Scaffold(
//   appBar: AppBar(),
//   body: Container(
//     height: 110,
//     padding: EdgeInsets.all(10),
//     child: Row(
//       children: [
//         Image.asset('dog.png', width: 150),
//         Container(
//           width: 100,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('보리입니다.'),
//               Text('산본동'),
//               Text('8살'),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Icon(Icons.favorite),
//                   Text('4')
//                 ],
//               )
//             ],
//           ),
//         )
//       ],
//     ),
//   )
// )

// return MaterialApp(
//   home: Scaffold(
//     appBar: AppBar(
//       title: Text('앱임'),
//       centerTitle: false,
//       leading: Icon(Icons.star),
//       actions: [Icon(Icons.person), Icon(Icons.person)],
//     ),
//     // body: Align(
//     //   alignment: Alignment.bottomCenter,
//     //   child: Container(
//     //     width: double.infinity, height: 50, color: Colors.blue,
//     //     // margin: EdgeInsets.fromLTRB(0,30,0,0),
//     //     // decoration: BoxDecoration( // 잡다한 기능은 decoration 안에다가 작성
//     //     //   border: Border.all(color: Colors.black),
//     //     //
//     //     // ),
//     //   ),
//     // ),
//     body: SizedBox(
//       child:
//       // Text('안녕하세요',
//       //   style: TextStyle(color: Colors.red, fontSize: 30, fontWeight: FontWeight.w700),
//       // ),
//       ElevatedButton(
//         child: Text('글자'),
//         onPressed: (){},
//       ),
//     ),
//   )
// );