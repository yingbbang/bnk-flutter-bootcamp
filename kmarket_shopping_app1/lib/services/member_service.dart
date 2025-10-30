import 'dart:convert';

import 'dart:convert';

import 'package:kmarket_shopping/models/member.dart';
import 'package:http/http.dart' as http;

class MemberService {

  final String baseUrl = "http://10.0.2.2:8080/ch09";

  Future<void> login() async {
    return;
  }

  Future<Map<String, dynamic>> register(Member member) async {
    try {
      final response = await http.post(
          Uri.parse('$baseUrl/user/register'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(member.toJson())
      );

      if(response.statusCode == 200){
        // savedUser 반환
        return jsonDecode(response.body);

      } else {
        throw Exception('statusCode : ${response.statusCode}');
      }
    }catch (err){
      throw Exception('에러발생 : $err');
    }
  }

}