// presentation/views/desktop_view/footer_section/footer_section.dart
import 'package:flutter/material.dart';
import 'package:portfolio_web/presentation/configs/const_colors.dart';
import 'package:portfolio_web/presentation/configs/const_strings.dart';
import 'package:portfolio_web/presentation/utils/social_medial_icon.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
      height: height * 0.25,
      width: width,
      color: Colors.grey[900],
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            SizedBox(height: 20),
            // Contact Info
            Text(
              "📧 Email: raiprabesh775@gmail.com",
              style: TextStyle(fontSize: 12, color: kWhite),
            ),
            Text(
              "📍 Location: Ottawa, Canada",
              style: TextStyle(fontSize: 12, color: kWhite),
            ),
            SizedBox(height: 10),

            // Copyright
            Text(
              "© ${DateTime.now().year} Prabesh Rai. All Rights Reserved.",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
