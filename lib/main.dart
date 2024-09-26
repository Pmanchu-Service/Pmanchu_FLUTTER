import 'package:flutter/material.dart';
import 'package:pmanchu/pages/splash/splash_page.dart';

void main()=>runApp(
  MaterialApp(
    theme: ThemeData(
      fontFamily: 'Pretendard',
      scaffoldBackgroundColor: Colors.white
    ),
    debugShowCheckedModeBanner: false,
    home: const SplashPage()
  )
);