import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmarket_shopping/providers/auth_provider.dart';
import 'package:kmarket_shopping/screens/member/login_screen.dart';
import 'package:provider/provider.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {

  // 로그인 안했을 때 화면
  Widget _buildLoginRequired(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('장바구니는 로그인 후 이용 가능합니다.'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              // 로그인 화면으로 이동
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            child: const Text('로그인 하러 가기'),
          ),
        ],
      ),
    );
  }

  // 로그인 했을 때 화면
  Widget _buildCartList(){
    return Text('장바구니 목록');
  }


  @override
  Widget build(BuildContext context) {

    // 아래 Consumer 위젯으로 처리
    //final authProvider = Provider.of<AuthProvider>(context);
    //final isLogin = authProvider.isLoggedIn;

    return Scaffold(
        appBar: AppBar(
          title: const Text('장바구니'),
          automaticallyImplyLeading: false,
        ),
        body: Consumer<AuthProvider>(
            builder: (context, provider, child) {
              return provider.isLoggedIn ? _buildCartList() : _buildLoginRequired();
            }
        )
    );
  }
}