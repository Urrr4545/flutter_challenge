import 'dart:ui';

import 'package:flutter/material.dart';

class ChallengeNormalScreenDay10 extends StatefulWidget {
  const ChallengeNormalScreenDay10({Key? key}) : super(key: key);

  @override
  State<ChallengeNormalScreenDay10> createState() =>
      _ChallengeNormalScreenDay10State();
}

class _ChallengeNormalScreenDay10State
    extends State<ChallengeNormalScreenDay10> {
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Custom Paint!",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Select a profile",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildProfileWidget(Colors.red, "hello"),
                    const SizedBox(
                      width: 15,
                    ),
                    _buildProfileWidget(Colors.green, "flutter"),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildProfileWidget(Colors.blue, "world"),
                    const SizedBox(
                      width: 15,
                    ),
                    _buildAddWidget(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileWidget(Color color, String name) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            size: const Size(100, 100),
            foregroundPainter: ProfilePainter(backgroundColor: color),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _buildAddWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            size: const Size(100, 100),
            foregroundPainter: AddProfilePainter(),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Add Profile",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class ProfilePainter extends CustomPainter {
  const ProfilePainter({required this.backgroundColor});
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    RRect fullRect = RRect.fromRectAndRadius(
      rect,
      const Radius.circular(15),
    );
    RadialGradient backgroundGradient = RadialGradient(
      center: const Alignment(0, -0.4),
      radius: 1.2,
      colors: <Color>[backgroundColor, Colors.white],
      stops: <double>[0.5, 0.9],
    );
    Paint backgroundPaint = Paint()
      ..shader = backgroundGradient.createShader(rect);

    var pointHeight = size.height / 3;
    var pointWidget = size.width / 4;
    var strokeWidth = size.width / 7;
    Paint roundPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = Colors.white
      ..strokeWidth = strokeWidth;

    List<Offset> offsetPoints = [];
    offsetPoints.add(Offset(pointWidget, pointHeight));
    offsetPoints.add(Offset(pointWidget * 3, pointHeight));

    Paint linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = strokeWidth / 4
      ..style = PaintingStyle.stroke;

    var lineHeight = size.height * 1.8 / 3;
    var lineCurveHeight = size.height * 2.4 / 3;
    var lineWidthStart = size.height * 0.8 / 3;
    var lineWidthEnd = size.height * 2.5 / 3;
    var linePath = Path()
      ..moveTo(lineWidthStart, lineHeight)
      ..quadraticBezierTo(lineWidthStart + (lineWidthEnd - lineWidthStart) / 2,
          lineCurveHeight, lineWidthEnd, lineHeight);

    //background draw
    canvas.drawRRect(
      fullRect,
      backgroundPaint,
    );

    //point eyes
    canvas.drawPoints(PointMode.points, offsetPoints, roundPaint);

    //line mouse
    canvas.drawPath(linePath, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}

class AddProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var plusTopPoint = size.height / 4;
    var plusDownPoint = size.height * 3 / 4;
    var plusLeftPoint = size.width / 4;
    var plusRightPoint = size.width * 3 / 4;

    final Path plusPath = Path()
      ..moveTo(size.width / 2, plusTopPoint)
      ..lineTo(size.width / 2, plusDownPoint)
      ..moveTo(plusLeftPoint, size.height / 2)
      ..lineTo(plusRightPoint, size.height / 2);

    canvas.drawPath(plusPath, paint);

    Rect rect = Offset.zero & size;
    RRect fullRect = RRect.fromRectAndRadius(
      rect,
      const Radius.circular(15),
    );

    canvas.drawRRect(
      fullRect,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}
