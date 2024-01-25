import 'dart:math';

import 'package:animation/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TwinScreen extends StatefulWidget {
  const TwinScreen({super.key});

  @override
  State<TwinScreen> createState() => _TwinScreenState();
}

class _TwinScreenState extends State<TwinScreen> with TickerProviderStateMixin{
  HomeProvider? providerr;
  HomeProvider? providerw;

  AnimationController? animationController;
  Animation? colorTween;
  Tween<Alignment>? alignTween1;
  Tween<Alignment>? alignTween2;
  Tween<Alignment>? alignTween3;
  Tween<Alignment>? alignTween4;
  Animation? tweenSequence;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: const Duration(seconds: 2));

    //color
    colorTween=ColorTween(end: Colors.yellow,begin: Colors.blue).animate(animationController!);

    //align
    alignTween1 =Tween(begin: Alignment.topLeft,end: Alignment.topRight);
    alignTween2 =Tween(begin: Alignment.topRight,end: Alignment.bottomRight);
    alignTween3 =Tween(begin: Alignment.bottomRight,end: Alignment.bottomLeft);
    alignTween4 =Tween(begin: Alignment.bottomLeft,end: Alignment.topLeft);

    //tweenSequence
    tweenSequence = TweenSequence(
      [
        TweenSequenceItem(tween: alignTween1!, weight: 1),
        TweenSequenceItem(tween: alignTween2!, weight: 2),
        TweenSequenceItem(tween: alignTween3!, weight: 1),
        TweenSequenceItem(tween: alignTween4!, weight: 2),
      ]
    ).animate(animationController!);
    animationController!.addListener(() {
      setState(() {});
    });
    animationController!.repeat();
  }
  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Twin"),
          centerTitle: true,
        ),
        body: Align(
          alignment: tweenSequence!.value,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: colorTween!.value),
          ),
        ),
      ),
    );
  }
}
