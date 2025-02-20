// presentation/views/desktop_view/home_section/home_section.dart
import 'package:flutter/material.dart';
import 'package:portfolio_web/presentation/configs/const_strings.dart';
import 'package:portfolio_web/presentation/utils/social_medial_icon.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MediaQuery.of(context).size.width > 760
              ? SizedBox.shrink()
              : Overview(
                height: height,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset('assets/prabesh.jpg', height: height * 0.5),
              ),
              MediaQuery.of(context).size.width < 760
                  ? SizedBox.shrink()
                  : Overview(
                    height: height,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
            ],
          ),
        ],
      ),
    );
  }
}

class Overview extends StatelessWidget {
  const Overview({
    super.key,
    required this.height,
    required this.crossAxisAlignment,
  });

  final double height;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "PRABESH RAI",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "BUSINESS ANALYTICS STUDENT @ LAMBTON COLLEGE",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: height * 0.050,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < kSocialIcons.length; i++)
                SocialMediaIconBtn(
                  icon: kSocialIcons[i],
                  socialLink: kSocialLinks[i],
                  height: 20,
                ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Text(
          "I am a Computer Science Graduate pursuing \n Post-Graduate In Business Analytics at Lambton College.",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start, // Aligns the text properly
          softWrap: true, // Ensures text wraps properly
          overflow: TextOverflow.visible, // Avoids text being clipped
        ),
        SizedBox(height: 16),
        Text("Learn more ->", style: TextStyle(fontSize: 13)),
      ],
    );
  }
}
