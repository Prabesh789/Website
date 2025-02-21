// presentation/views/main_view.dart
import 'package:flutter/material.dart';
import 'package:portfolio_web/presentation/views/desktop_view/desktop_view.dart';
import 'package:portfolio_web/presentation/views/mobille_view/mobile_view_main_section.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return DesktopView();
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return DesktopView();
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return MobileViewMainSection();
        }
        return Container(color: Colors.purple);
      },
    );
  }
}
