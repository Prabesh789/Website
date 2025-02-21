// presentation/views/desktop_view/footer_section/footer_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/presentation/configs/const_strings.dart';
import 'package:portfolio_web/presentation/utils/social_medial_icon.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      width: width,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 🔹 Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < kSocialIcons.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: SocialMediaIconBtn(
                      icon: kSocialIcons[i],
                      socialLink: kSocialLinks[i],
                      height: 22,
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: 15),

          // 🔹 Divider for better separation
          Divider(
            color: Colors.grey[800],
            thickness: 1,
            indent: width * 0.25,
            endIndent: width * 0.25,
          ),

          SizedBox(height: 15),

          // 🔹 Contact Information
          Text(
            "📧 Email: raiprabesh775@gmail.com",
            style: GoogleFonts.inter(fontSize: 14, color: Colors.white70),
          ),
          Text(
            "📍 Location: Ottawa, Canada",
            style: GoogleFonts.inter(fontSize: 14, color: Colors.white70),
          ),

          SizedBox(height: 10),

          // 🔹 Copyright Information
          Text(
            "© ${DateTime.now().year} Prabesh Rai. All Rights Reserved.",
            style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
