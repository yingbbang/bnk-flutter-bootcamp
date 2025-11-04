
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kmarket_shopping/config/app_config.dart';
import 'package:kmarket_shopping/models/cart.dart';
import 'package:kmarket_shopping/services/token_storage_service.dart';

class CartService {

  final _tokenStorageService = TokenStorageService();

  Future<List<Map<String, dynamic>>> getCarts() async {
    try {
      // JWT 가져오기
      final jwt = await _tokenStorageService.readToken();
      log('jwt : $jwt');

      final response = await http.get(
          Uri.parse('${AppConfig.baseUrl}/cart'),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer$jwt",
          }
      );

      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }else {
        throw Exception(response.statusCode);
      }
    }catch(err){
      throw Exception(err);
    }
  }


  Future<Map<String, dynamic>> addCart(int pno, int quantity) async {

    try {
      // JWT 가져오기
      final jwt = await _tokenStorageService.readToken();
      log('jwt : $jwt');

      // 전송 데이터 생성
      final jsonData = {
        "pno": pno,
        "quantity": quantity,
      };

      log('jsonData : $jsonData');

      final response = await http.post(
          Uri.parse('${AppConfig.baseUrl}/cart'),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer$jwt",
          },
          body: jsonEncode(jsonData)
      );

      if(response.statusCode == 200){
        log('response.body : ${response.body}');
        return jsonDecode(response.body);
      }else {
        log('err...1');
        throw Exception(response.statusCode);
      }
    }catch(err){
      log('err...2');
      throw Exception(err);
    }


  }


}