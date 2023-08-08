import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LayoutHelper {
  final BuildContext context;
  LayoutHelper(this.context);

  bool get isMobile => ResponsiveBreakpoints.of(context).isMobile;
  bool get isTablet => ResponsiveBreakpoints.of(context).isTablet;
  //any other breakpoints you may need including desktop and web breakpoints using kIsWeb
}
