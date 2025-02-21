// presentation/views/mobille_view/mobile_home_section/mobile_home_screen.dart
// presentation/views/desktop_view/home_section/home_section.dart
import 'package:flutter/material.dart';
import 'package:portfolio_web/presentation/configs/const_strings.dart';
import 'package:portfolio_web/presentation/utils/social_medial_icon.dart';
import 'package:portfolio_web/presentation/views/mobille_view/mobile_view_main_section.dart';

class MobileHomeSection extends StatefulWidget {
  const MobileHomeSection({super.key});

  @override
  State<MobileHomeSection> createState() => _MobileHomeSectionState();
}

class _MobileHomeSectionState extends State<MobileHomeSection> {
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
          Overview(
            width: width,
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
                child: Image.asset('assets/prabesh.jpg', height: height * 0.4),
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
    required this.width,
  });

  final double height;
  final double width;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "PRABESH RAI",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(
          "BUSINESS ANALYTICS STUDENT @ LAMBTON COLLEGE",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 14),
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
        SizedBox(height: 14),
        SizedBox(
          width: width * 0.8,
          child: Text(
            "I am a Computer Science Graduate pursuing Post-Graduate Degree In Business Analytics at Lambton College.",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center, // Aligns the text properly
          ),
        ),
        SizedBox(height: 16),
        InkWell(
          onTap: () {
            itemForMobileScrollController.scrollTo(
              index: 1,
              duration: Duration(seconds: 1),
            );
          },
          child: Text("Learn more ->", style: TextStyle(fontSize: 13)),
        ),
      ],
    );
  }
}
