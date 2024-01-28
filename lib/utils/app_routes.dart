import 'package:animation/screen/home/view/explicit_screen.dart';
import 'package:animation/screen/home/view/home_screen.dart';
import 'package:animation/screen/home/view/tween_anim_screen.dart';
import 'package:animation/screen/home/view/twin_screen.dart';
import 'package:animation/screen/home/view/twinanimation_screen.dart';
import 'package:animation/screen/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> app_Routes = {
  '/': (context) => const HomeScreen(),
  'profile': (context) => const ProfileScreen(),
  'twin':(context) => const TwinAnimationScreen(),
  'explicit':(context) => const ExplicitAnimationScreen(),
  'tiw':(context) => const TwinScreen(),
  'anim':(context) => const AnimScreen(),
};
