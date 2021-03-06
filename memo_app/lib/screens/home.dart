// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, unnecessary_null_comparison, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memo_app/screens/edit.dart';
import 'package:memo_app/database/db.dart';
import 'package:memo_app/database/memo.dart';
import 'package:memo_app/screens/view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String deleteId = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 5, top: 50, bottom: 20),
            child: Container(
              child: Text(
                '메모메모',
                style: TextStyle(fontSize: 36, color: Colors.blue),
              ),
            ),
          ),
          Expanded(child: memoBuilder(context)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => EditPage()));
        },
        tooltip: '노트를 추가하려면 클릭하세요',
        label: Text('메모 추가'),
        icon: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<List<Memo>> loadMemo() async {
    DBHelper sd = DBHelper();
    return await sd.memos();
  }

  Future<void> deleteMemo(String id) async {
    DBHelper sd = DBHelper();
    await sd.deleteMemo(id);
  }

  void showAlertDialog(BuildContext context) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('삭제 경고'),
          content: Text('정말 삭제하시겠습니까? \n 삭제된 메모는 복구되지 않습니다.'),
          actions: <Widget>[
            FlatButton(
              child: Text('삭제'),
              onPressed: (){
                Navigator.pop(context, "삭제");
                setState(() {
                  deleteMemo(deleteId);
                });
                deleteId = '';
              },
            ),
            FlatButton(
              child: Text('취소'),
              onPressed: (){
                Navigator.pop(context, "취소");
                deleteId = '';
              },
            ),
          ],
        );
      }
    );
  }

  Widget memoBuilder(BuildContext parentContext) {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if ((projectSnap.data as List).isEmpty) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container(
            alignment: Alignment.center,
            child: Text(
              '지금 바로 "메모 추가" 버튼을 눌러\n새로운 메모를 추가해보세요!\n\n\n\n\n\n\n\n\n',
              style: TextStyle(fontSize: 15, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          );
        }
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: (projectSnap.data as List).length,
          itemBuilder: (context, index) {
            Memo memo = (projectSnap.data as List)[index];
            return InkWell(
              onTap: (){
                Navigator.push(
                  parentContext, CupertinoPageRoute(builder: (context) => ViewPage(id: memo.id))
                );
              },
              onLongPress: (){
                setState(() {
                  deleteId = memo.id;
                  showAlertDialog(parentContext);
                });
              },
              child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 240, 240, 1),
                    border: Border.all(
                      color: Colors.blue,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.lightBlue, blurRadius: 2)
                    ],
                    borderRadius: BorderRadius.circular(12)),
                alignment: Alignment.center,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          memo.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          memo.text,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "최종 수정 시간: " + memo.editTime.split('.')[0],
                          style: TextStyle(fontSize: 11),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      future: loadMemo(),
    );
  }
}
