import 'package:flutter/material.dart';
import 'package:pmanchu/pages/login/login_page.dart';

void main()=>runApp(
  MaterialApp(
    theme: ThemeData(
      fontFamily: 'Pretendard',
      scaffoldBackgroundColor: Colors.white
    ),
    debugShowCheckedModeBanner: false,
    home: const LoginPage()
  )
);