import 'package:flutter/material.dart';
import 'package:momentmashup_demo/widgets/custom_bottom_navigation_bar.dart';
import 'package:momentmashup_demo/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momentmashup_demo/screens/setting_screen.dart';

class TimeLineScreen extends StatelessWidget {
  const TimeLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Text(
              'もしも宇宙人が隣に引っ越してきたら？',
              style: GoogleFonts.notoSansJp(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF68D2E8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // 左右に余白を追加
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF68D2E8), // バックカラーを設定
                borderRadius: BorderRadius.circular(20), // 角を少し丸く
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.account_circle, color: Colors.white),
                    title: const Text('ユーザー名'),
                    subtitle: const Text('ここに投稿内容が表示されます。'),
                    trailing: IconButton(
                      icon: const Icon(Icons.comment, color: Colors.white),
                      onPressed: () {}, // コメント機能
                    ),
                  ),
                  _StarRating(), // 星のボタンを投稿の一番下に配置
                ],
              ),
            ),
          ),
          // 他の投稿も同様にリスト表示
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 3, // 現在選択されているインデックス
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
          } else if (index == 4) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const SettingScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = const Offset(1.0, 0.0); 
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

class _StarRating extends StatefulWidget {
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<_StarRating> {
  int _currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _currentRating ? Icons.star : Icons.star_border,
            color: const Color(0xFFFDDE55),
          ),
          onPressed: () {
            setState(() {
              _currentRating = index + 1;
            });
          },
        );
      }),
    );
  }
}
