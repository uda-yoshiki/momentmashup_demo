import 'package:flutter/material.dart';
import 'package:momentmashup_demo/screens/home_screen.dart'; // HomeScreenをインポート
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  color: Color(0xFF03AED2),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'ユーザー名',
                    labelStyle: GoogleFonts.notoSansJp(color: Color(0xFF68D2E8)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF68D2E8)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF03AED2)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'パスワード',
                    labelStyle: GoogleFonts.notoSansJp(color: Color(0xFF68D2E8)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF68D2E8)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF03AED2)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // ログイン処理後、HomeScreenに遷移
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
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
                    color: Color(0xFFFDDE55),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF03AED2), // アンダーラインの色を変更
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
                    color: Color(0xFFFDDE55),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF03AED2), // アンダーラインの色を変更
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
