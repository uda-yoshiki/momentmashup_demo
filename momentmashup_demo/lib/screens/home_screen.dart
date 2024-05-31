import 'package:flutter/material.dart';
import 'package:momentmashup_demo/screens/time_line_screen.dart';
import 'package:momentmashup_demo/widgets/custom_bottom_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momentmashup_demo/screens/setting_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF68D2E8), width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '現在のお題',
                        style: GoogleFonts.notoSansJp(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF68D2E8),
                        ),
                      ),
                      Text(
                        'もしも宇宙人が隣に引っ越してきたら？',
                        style: GoogleFonts.notoSansJp(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ここに投稿を入力',
                  hintStyle: GoogleFonts.notoSans(color: const Color(0xFF68D2E8)),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF03AED2), // ブルー
                    textStyle: GoogleFonts.notoSansJp(
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // 白文字
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // 角を少し四角く
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: const Color(0xFFFEEFAD), // ライトイエロー
                          title: Text(
                            '投稿確認',
                            style: GoogleFonts.notoSansJp(
                              color: const Color(0xFF03AED2), // ブルー
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Text(
                            'このお題に対して一回しか投稿できません。',
                            style: GoogleFonts.notoSansJp(
                              color: Colors.black,
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF68D2E8), // ライトブルー
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                'キャンセル',
                                style: GoogleFonts.notoSansJp(),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF03AED2), // ブルー
                              ),
                              onPressed: () {
                                // 投稿処理をここに記述
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                '投稿する',
                                style: GoogleFonts.notoSansJp(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    '投稿する',
                    style: GoogleFonts.notoSansJp(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0, // 現在選択されているインデックス
        onItemSelected: (index) {
          if (index == 3) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const TimeLineScreen(),
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