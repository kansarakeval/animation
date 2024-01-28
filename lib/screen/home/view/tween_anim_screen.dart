import 'dart:math';

import 'package:flutter/material.dart';

class AnimScreen extends StatefulWidget {
  const AnimScreen({super.key});

  @override
  State<AnimScreen> createState() => _AnimScreenState();
}

class _AnimScreenState extends State<AnimScreen> with TickerProviderStateMixin {
  AnimationController? animationController;
  // Animation<double>? animation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    // animation =
    //     CurvedAnimation(parent: animationController!, curve: Curves.linear);

    animationController!.addListener(() {
      setState(() {});
    });
    animationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: AnimatedBuilder(
          animation: animationController!,
          builder: (context, child) {
            return Transform.rotate(
              angle: pi*animationController!.value*2,
              child: const FlutterLogo(
                size: 150,
              ),
            );
          },
        )),
      ),
    );
  }
}
