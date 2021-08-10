import 'dart:async';
import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome to Flutter', home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Startup name generator')),
        body: _buildSuggestions());
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          /// `Divider widget`: 1 pixel height
          if (i.isOdd) return Divider();

          /// x ~/ y: tương đương như x / y, sẽ trả về 1 kiểu số (integer)
          /// VD:
          /// x là 1,2,3,4,5
          /// y là 2
          /// Kết quả lần lượt là 0,1,1,2,2
          final index = i ~/ 2;

          /// Nếu đã hết giá trị thì khởi tạo thêm 10 item nữa & add vào list _suggestions
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return buildRow(_suggestions[index]);
        });
  }

  Widget buildRow(WordPair wordPair) {
    return ListTile(
        title: Text(
      wordPair.asPascalCase,
      style: _biggerFont,
    ));
  }
}
