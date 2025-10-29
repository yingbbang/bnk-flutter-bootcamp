
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User1Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _User1RegisterState();
}

class _User1RegisterState extends State<User1Register> {


  Future<void> selectBirth() async {
    DateTime now = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(1900),
        lastDate: now
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('User1 등록'),),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: null,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '아이디 입력'
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: null,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '이름 입력'
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: null,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '생년월일 입력'
                    ),
                    readOnly: true,
                    onTap: selectBirth,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: null,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '나이 입력'
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: const Text('취소')),
                      const SizedBox(width: 10,),
                      ElevatedButton(onPressed: (){}, child: const Text('등록')),
                    ],
                  )
                ],
              )
          ),
        )
    );
  }

}