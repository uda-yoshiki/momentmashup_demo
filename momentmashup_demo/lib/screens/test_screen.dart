import 'package:flutter/material.dart';
import 'package:momentmashup_demo/models/posting_firebase.dart';
import 'package:intl/intl.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _themeController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final PostingFirebase _postingFirebase = PostingFirebase();

  void _postContent() async {
    // 日付をJSTに変換
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now().toLocal());

    bool success = await _postingFirebase.postContent(
      postingContents: _contentController.text,
      postingDate: formattedDate, // 変換した日付を使用
      postingTheme: _themeController.text,
      userName: _userNameController.text,
    );

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('投稿成功')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('投稿失敗')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('投稿テスト画面'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  labelText: '内容',
                ),
              ),
              TextField(
                controller: _themeController,
                decoration: const InputDecoration(
                  labelText: 'テーマ',
                ),
              ),
              TextField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  labelText: 'ユーザー名',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _postContent,
                child: const Text('投稿'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
