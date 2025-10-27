/*
  날짜 : 2025/10/27
  이름 : 조지영
  내용 : GridView 위젯 실습하기
*/


import 'package:flutter/material.dart';

void main(){
  runApp(GridViewTest());
}

class GridViewTest extends StatelessWidget {
  GridViewTest({super.key});

  final List<String> cities = ['서울', '대전', '대구', '부산', '광주'];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('02.GridView 위젯 실습'),
          ),
          body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,          // 한줄에 표시할 아이템 갯수
                  crossAxisSpacing: 10,       // 교차축(가로) 그리드 아이템 간격
                  mainAxisSpacing: 10,        // 메인축(세로) 그리드 아이템 간격
                  childAspectRatio: 1 / 1.5   // 그리드 아이템 가로/세로 비율 조정
              ), // grid 형태 정의
              itemCount: cities.length,
              itemBuilder: (context, index){

                return Card(
                  child: Center(
                    child: Text(cities[index]),
                  ),
                );

              }
          )
      ),
    );
  }

}