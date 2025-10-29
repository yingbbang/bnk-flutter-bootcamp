/*
  날짜 : 2025/10/29
  이름 : 조지영
  내용 : Flutter 비동기 처리 실습
*/
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('01.Flutter 비동기 처리 실습'),),
        body: FutureScreen(),
      ),
    );
  }
}

class FutureScreen extends StatefulWidget {
  const FutureScreen({super.key});
  @override
  State<StatefulWidget> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {

  String result = '결과 대기중...';
  bool isLoading = false;

  // 비동기 처리 함수
  Future<String> fetchData(){
    return Future.delayed(const Duration(seconds: 3), (){
      return '서버에서 가져온 데이터 입니다.';
    });
  }

  void loadData(){
    setState(() {
      result = '로딩 중...1';
    });

    fetchData().then((data){
      setState(() {
        result = data;
      });
    }).catchError((err){
      setState(() {
        result = err;
      });
    }).whenComplete((){
      print('작업완료!');
    });

    setState(() {
      result = '로딩 중...2';
    });
  }

  // 카운트 비동기 처리
  int count = 0;
  bool isCounting = false;

  Future<int> startCounting() async {

    setState(() {
      isCounting = true;
    });

    for(int i=1 ; i<=10 ; i++){

      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        count = i;
      });
    }

    setState(() {
      isCounting = false;
    });

    return count;
  }

  void handleCount() async {
    int result = await startCounting();

    setState(() {
      count = result + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(result, style: TextStyle(fontSize: 16),),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: loadData, child: const Text('데이터 불러오기')),
          const SizedBox(height: 10,),
          Text('결과 출력 : $count'),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            handleCount();
          }, child: const Text('카운트 시작')),
        ],
      ),
    );
  }

}

















