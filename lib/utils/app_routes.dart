import 'package:animation/screen/home/view/home_screen.dart';
import 'package:animation/screen/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> app_Routes = {
  '/': (context) => const HomeScreen(),
  'profile': (context) => const ProfileScreen(),
};
