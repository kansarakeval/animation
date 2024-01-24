import 'package:animation/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;

  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Animation"),
          centerTitle: true,
        ),
        body: InkWell(
          onTap: () {
            providerr!.changImage(!providerr!.isColor);
          },
          child: AnimatedAlign(
            duration: Duration(seconds: 3),
            alignment: providerw!.isColor?Alignment.topCenter:Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(seconds: 3),
              height: providerw!.isColor?100:200,
              width: providerw!.isColor?100:200,
              color: providerw!.isColor
                  ?Colors.pink:Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
