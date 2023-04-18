// ignore_for_file: public_member_api_docs, sort_constructors_first
/*import 'package:flutter/material.dart';

class AnimatedTextContainer extends StatefulWidget {
   List< String> texts;
   
  

  AnimatedTextContainer({
    Key? key,
    required this.texts,
  }) : super(key: key);

  @override
  AnimatedTextContainerState createState() => AnimatedTextContainerState();
}

class AnimatedTextContainerState extends State<AnimatedTextContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 0.5),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: _animation.value * MediaQuery.of(context).size.height,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 100,
            color: Colors.blue,
            child: 
          ),
        );
      },
    );
  }
}

*/
