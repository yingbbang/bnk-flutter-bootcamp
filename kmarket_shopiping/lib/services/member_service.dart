import 'dart:convert';

import 'package:kmarket_shopiping/models/member.dart';
import '';

class MemberService {

  final String baseUrl = 'http://10.0.2.2:8080/ch09';

  Future<void> login() {
    return null;
  }

  Future<Map<String, dynamic>> register(Member member) async {
    try {
      final response = await http.post(
          Uri.parse('$baseUrl/user/register'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(member)
      );

      if(response.statusCode == 200) {
        // savedUser 반환
        return jsonDecode(response.body);
      }else {
        throw Exception('response.statusCode : ${response.statusCode}');
    } catch (err) {
      print(e);
    }
    return;
      }


      return;
    }
  }