/*
  날짜 : 2025/10/23
  이름 : 조지영
  내용 : Dart 비동기 처리
*/

// Future는 미래에 가져오는 값을 의미하는 객체
Future<String> fetchData(){
  // 비동기 작업 정의
  return Future.delayed(Duration(seconds: 3), (){
    return 'fetchData!';
  });
}

void main() async {

  // Future 비동기 작업 수행
  print('here...1');

  fetchData()
      .then((data){
    print('here...2 : $data');
  })
      .catchError((err){
    print('here...3 : $err');
  })
      .whenComplete((){
    print('here...4 비동기 작업 완료');
  });

  print('here...5');

  // async/await 실행
  print('async_await...1');

  try {
    String data = await fetchData(); // 비동기 처리를 대기
    print('async_await...2 : $data');
  }catch(e) {
    print('async_await...3 : $e');
  }finally {
    print('async_await...4 비동기 작업 완료');
  }

  print('async_await...5');

}