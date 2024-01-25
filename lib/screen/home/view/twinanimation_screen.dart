import 'dart:ffi';
import 'dart:math';

import 'package:animation/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TwinAnimationScreen extends StatefulWidget {
  const TwinAnimationScreen({super.key});

  @override
  State<TwinAnimationScreen> createState() => _TwinAnimationScreenState();
}

class _TwinAnimationScreenState extends State<TwinAnimationScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;

  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TwinAnimation"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {
              Navigator.pushNamed(context, 'explicit');
            }, icon: const Icon(Icons.arrow_forward))
          ],
        ),
        body: Center(
          child: TweenAnimationBuilder<double>(
            duration: const Duration(seconds: 5),
            tween: Tween(begin: 0, end: 2),
            builder: (context, value, child) {
              return Transform.rotate(
                angle: pi*value,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
