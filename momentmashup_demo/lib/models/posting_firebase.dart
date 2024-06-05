import 'package:cloud_firestore/cloud_firestore.dart';

class PostingFirebase {
  final CollectionReference _postsRef = FirebaseFirestore.instance.collection('postings');

  Future<bool> postContent({
    required String postingContents,
    required String postingDate,
    required String postingTheme,
    required String userName,
  }) async {
    try {
      await _postsRef.add({
        'posting_contents': postingContents,
        'posting_date': postingDate,
        'posting_theme': postingTheme,
        'user_name': userName,
      });
      return true; // 投稿が成功した場合
    } catch (e) {
      print('投稿エラー: $e');
      return false; // 投稿が失敗した場合
    }
  }
}
