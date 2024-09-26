import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pmanchu/pages/login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    Future.delayed(const Duration(milliseconds: 1500), (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=>const LoginPage()
        )
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final bool hasMandu = Random().nextBool();
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.3),
            Image.asset(
              'assets/logo_with_text.png',
              width: 180
            ),
            const SizedBox(height: 16),
            Image.asset(
              hasMandu ? 'assets/logo_text_mandu.png' : 'assets/logo_text.png',
              width: 180
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return CustomPaint(
                        size: const Size(75, 40),
                        painter: WavyPainter(_controller.value)
                      );
                    }
                  ),
                  Image.asset(
                    'assets/mandu.png',
                    width: 200
                  )
                ],
              )
            )
          ]
        )
      )
    );
  }
}

class WavyPainter extends CustomPainter {
  final double animationValue;

  WavyPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFDEA7)
      ..strokeWidth = 8.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const waveWidth = 12;
    const offsetX = 20.0;
    final waveHeight = size.height;
    final middleX = size.width / 2;

    final List<double> xPositions = [
      middleX - offsetX,
      middleX,
      middleX + offsetX
    ];

    for (final xPos in xPositions) {
      final path = Path();
      path.moveTo(xPos, 0);
      path.quadraticBezierTo(
        xPos - waveWidth * sin(animationValue * 2 * pi),
        waveHeight / 4,
        xPos,
        waveHeight / 2
      );
      path.quadraticBezierTo(
        xPos + waveWidth * sin(animationValue * 2 * pi),
        3 * waveHeight / 4,
        xPos,
        waveHeight
      );

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
