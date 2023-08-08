import 'package:anywhere_realestate_assignment/app/routes/pages.dart';
import 'package:anywhere_realestate_assignment/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RealEstateAnyhwereApp extends StatelessWidget {
  const RealEstateAnyhwereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        //wrap app in responsive breakpoints to handle different design layouts
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 600, name: MOBILE),
            const Breakpoint(start: 601, end: double.infinity, name: TABLET),
          ],
        );
      },
      initialRoute: Routes.characterList,
      getPages: Pages.pages,
    );
  }
}
