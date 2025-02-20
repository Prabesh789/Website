// presentation/utils/social_medial_icon.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_web/presentation/configs/const_strings.dart';

class SocialMediaIconBtn extends StatelessWidget {
  final String icon;
  final String socialLink;
  final double height;

  const SocialMediaIconBtn({
    super.key,
    required this.icon,
    required this.socialLink,
    required this.height,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SizedBox(width: 40, child: SvgPicture.asset(icon)),
      iconSize: height,
      onPressed: () => launchURL(socialLink),
    );
  }
}
