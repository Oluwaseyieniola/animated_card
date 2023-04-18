import 'dart:async';

import 'package:flutter/material.dart';

class DiamondWidget extends StatefulWidget {
  const DiamondWidget({Key? key}) : super(key: key);

  @override
  State<DiamondWidget> createState() => _DiamondWidgetState();
}

class _DiamondWidgetState extends State<DiamondWidget> {
  double _position = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Set up a timer to update the widget's position every 50 milliseconds
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        // Increment the position by a fixed amount
        _position += 2.0;
        // If the position has reached the end of the screen, reset it to the beginning
        if (_position > MediaQuery.of(context).size.width) {
          _position = 0.0;
        }
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to avoid memory leaks
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CustomPaint(
                    painter: DiamondPainter(),
                  ),
                ),
                const Positioned(
                  top: 20,
                  left: 20,
                  child: Text(
                    'Diamond',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CustomPaint(
                    painter: LovePainter(),
                  ),
                ),
                const Positioned(
                  top: 20,
                  left: 20,
                  child: Text(
                    'Love',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CustomPaint(
                    painter: LengthPainter(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DiamondPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.pink
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(size.width / 2, 2)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(DiamondPainter oldDelegate) => false;
}

class LengthPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.pink
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(size.width / 1.5, 2)
      ..lineTo(size.width, size.height / 1)
      ..lineTo(size.width / 1.7, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(LengthPainter oldDelegate) => false;
}

class LovePainter extends CustomPainter {
  @override
  Future<void> paint(Canvas canvas, Size size) async {
    final paint = Paint()
      // heart shape
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final Paint body = Paint();

    // this particulat code exits because of the content of the body of the heart shaped paint
    body
      ..color = Colors.pink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0;

    final border = Paint();
// this paints the border of the heart shaped paint
    border
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;
    final double width = size.width;
    final double height = size.height;

    final Path path = Path();
    path.moveTo(0.5 * width, height * 0.4);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.4);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    canvas.drawPath(path, body);
    canvas.drawPath(path, border);
  }

  @override
  bool shouldRepaint(LovePainter oldDelegate) => false;
}
