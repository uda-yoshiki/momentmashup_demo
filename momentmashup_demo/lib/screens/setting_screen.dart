import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momentmashup_demo/screens/login_screen.dart'; // LoginScreenをインポート
import 'package:momentmashup_demo/widgets/custom_bottom_navigation_bar.dart'; // CustomBottomNavigationBarをインポート
import 'package:momentmashup_demo/screens/home_screen.dart'; // HomeScreenをインポート
import 'package:momentmashup_demo/screens/time_line_screen.dart'; // time_line_screenをインポート

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'アカウント設定',
              style: GoogleFonts.notoSansJp(),
            ),
            leading: const Icon(Icons.person, color: Color(0xFF03AED2)),
            onTap: () {
              // アカウント設定画面への遷移
            },
          ),
          ListTile(
            title: Text(
              '通知設定',
              style: GoogleFonts.notoSansJp(),
            ),
            leading: const Icon(Icons.notifications, color: Color(0xFF03AED2)),
            onTap: () {
              // 通知設定画面への遷移
            },
          ),
          ListTile(
            title: Text(
              'プライバシー設定',
              style: GoogleFonts.notoSansJp(),
            ),
            leading: const Icon(Icons.lock, color: Color(0xFF03AED2)),
            onTap: () {
              // プライバシー設定画面への遷移
            },
          ),
          ListTile(
            title: Text(
              'ログアウト',
              style: GoogleFonts.notoSansJp(),
            ),
            leading: const Icon(Icons.exit_to_app, color: Color(0xFF03AED2)),
            onTap: () {
              // ログアウト処理
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('ログアウト確認', style: GoogleFonts.notoSansJp()),
                    content: Text('本当にログアウトしますか？', style: GoogleFonts.notoSansJp()),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('キャンセル', style: GoogleFonts.notoSansJp()),
                      ),
                      TextButton(
                        onPressed: () {
                          // ログアウト処理を実行し、ログイン画面に遷移
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                        },
                        child: Text('ログアウト', style: GoogleFonts.notoSansJp(color: Colors.red)),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 4, // 設定画面のインデックス
        onItemSelected: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = const Offset(-1.0, 0.0); // 左からのスライドに変更
                  var end = Offset.zero;
                  var curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const TimeLineScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = const Offset(-1.0, 0.0); 
                  var end = Offset.zero;
                  var curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
