/*
  날짜 : 2025/10/28
  이름 : 조지영
  내용 : 5장 Flutter 상태관리 실습
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('01.상태 관리 기본'),),
        body: ParentStateApp(),
      ),
    );
  }
}

class ParentStateApp extends StatefulWidget {
  const ParentStateApp({super.key});

  @override
  State<StatefulWidget> createState() => _ParentStateAppState();
}

class _ParentStateAppState extends State<ParentStateApp> {

  // 상태 속성
  int _count = 0;
  String _text = '';

  void increment(){
    // 위젯 상태를 업데이트 하고 UI 재빌드(build 호출)
    setState(() {
      _count++;
    });
    print('_count : $_count');
  }

  void changeText(String newText){
    // 위젯 상태를 업데이트 하고 UI 재빌드(build 호출)
    setState(() {
      _text = newText;
    });
    print('_text : $_text');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Count : $_count'),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: increment,
              child: const Text('증가')
          ),
          Divider(),
          Text(_text),
          const SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '아무거나 입력'
            ),
            onChanged: (value){
              changeText(value);
            },
          ),
          Divider(),
          IconWidget(),
          ContentWidget()
        ],
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: (){},
        icon: Icon(Icons.favorite),
        iconSize: 100,
        color: Colors.red,
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'favoriteCount : ',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}




















