import 'package:flutter/cupertino.dart';

class ScreenSize {
  static final width = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
  static final height = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;
}