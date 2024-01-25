import 'dart:math';

import 'package:animation/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExplicitAnimationScreen extends StatefulWidget {
  const ExplicitAnimationScreen({super.key});

  @override
  State<ExplicitAnimationScreen> createState() =>
      _ExplicitAnimationScreenState();
}

class _ExplicitAnimationScreenState extends State<ExplicitAnimationScreen> with TickerProviderStateMixin{
  HomeProvider? providerr;
  HomeProvider? providerw;

  AnimationController? animationController;
  Animation? colorTween;
  Animation? alignTween;
  Animation? rotateTween;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: const Duration(seconds: 2));
    colorTween=ColorTween(end: Colors.yellow,begin: Colors.blue).animate(animationController!);
    alignTween =Tween(begin: Alignment.topLeft,end: Alignment.bottomRight).animate(animationController!);
    rotateTween = Tween<double>(begin: 0,end: 2).animate(animationController!);
    animationController!.addListener(() {
      setState(() {});
    });
    animationController!.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Explicit"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {
              Navigator.pushNamed(context, 'tiw');
            }, icon: const Icon(Icons.arrow_forward))
          ],
        ),
        body: Align(
          alignment: alignTween!.value,
          child: Transform.rotate(
            angle: pi*rotateTween!.value,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: colorTween!.value),
            ),
          ),
        ),
      ),
    );
  }
}
