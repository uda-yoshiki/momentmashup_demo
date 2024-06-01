import 'package:flutter/material.dart';
import 'package:momentmashup_demo/screens/home_screen.dart'; // HomeScreenをインポート
import 'package:google_fonts/google_fonts.dart';
import 'package:momentmashup_demo/models/user_auth.dart'; // UserAuthをインポート

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserAuth _userAuth = UserAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'ログイン',
                style: GoogleFonts.notoSansJp(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF03AED2),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'ユーザー名',
                    labelStyle: GoogleFonts.notoSansJp(color: const Color(0xFF68D2E8)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF68D2E8)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF03AED2)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'パスワード',
                    labelStyle: GoogleFonts.notoSansJp(color: const Color(0xFF68D2E8)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF68D2E8)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF03AED2)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  final user = await _userAuth.signInWithEmailAndPassword(
                    _usernameController.text,
                    _passwordController.text,
                  );
                  if (user != null) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('ログインに失敗しました。')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF03AED2),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text('ログイン', style: GoogleFonts.notoSansJp(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  // 新規登録画面へ遷移
                },
                child: Text(
                  '新規登録はこちら',
                  style: GoogleFonts.notoSansJp(
                    color: const Color(0xFFFDDE55),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: const Color(0xFF03AED2), // アンダーラインの色を変更
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // パスワード忘れた場合の処理
                },
                child: Text(
                  'パスワードを忘れた場合',
                  style: GoogleFonts.notoSansJp(
                    color: const Color(0xFFFDDE55),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: const Color(0xFF03AED2), // アンダーラインの色を変更
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
