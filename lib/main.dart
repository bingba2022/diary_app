import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 상단바(회색)없애기
import 'home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white, // 상단바 색상 흰색으로 덮음
    statusBarIconBrightness: Brightness.dark, // 상단바 아이콘만 보이게 검정색으로 설정
  ));
  runApp(const DiaryApp());
}

class DiaryApp extends StatelessWidget {
  const DiaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}
