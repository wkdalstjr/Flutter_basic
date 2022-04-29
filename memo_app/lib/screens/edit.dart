// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, override_on_non_overriding_member, unnecessary_this
import 'package:flutter/material.dart';
import 'package:memo_app/database/memo.dart';
import 'package:memo_app/main.dart';
import 'package:memo_app/database/db.dart';

class EditPage extends StatelessWidget {

  @override
  String title = '';
  String text = '';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: (){},
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: saveDB,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String title){ this.title = title;},
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              //obscureText: true,
              decoration: InputDecoration(
                //border: OutlineInputBorder(),
                hintText: '메모의 제목을 적어주세요',
              ),
            ),
            Padding(padding: const EdgeInsets.all(10)),
            TextField(
              onChanged: (String text){ this.text = text;},
              //obscureText: true,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                //border: OutlineInputBorder(),
                hintText: '메모의 내용을 적어주세요',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveDB() async {
    DBHelper sd = DBHelper();

    var fido = Memo(
      id: 4,
      title: this.title,
      text: this.text,
      createTime: DateTime.now().toString(),
      editTime: DateTime.now().toString(),
    );

    await sd.insertMemo(fido);

    print(await sd.memos());
  }
}
