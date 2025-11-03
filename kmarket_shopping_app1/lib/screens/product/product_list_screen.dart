
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
  - 샘플 데이터 넣기
  INSERT INTO PRODUCT (DELIVERY, DISCOUNT, ETC, POINT, PRICE, PRODUCTNAME, STOCK, THUMB120, THUMB240, THUMB750, CATEGORY)
  SELECT DELIVERY, DISCOUNT, ETC, POINT, PRICE, PRODUCTNAME, STOCK, THUMB120, THUMB240, THUMB750, CATEGORY FROM PRODUCT;
*/

class ProductListScreen extends StatefulWidget {

  final int categoryNum;
  final String categoryName;

  const ProductListScreen({super.key, required this.categoryNum, required this.categoryName});
  @override
  State<StatefulWidget> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.categoryName}(${widget.categoryNum}) 상품 목록'),),
      body: Column(
        children: [
          Text('상품 내용')
        ],
      ),
    );
  }
}