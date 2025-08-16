// presentation/views/mobille_view/mobile_about_section/mobile_about_section.dart
// presentation/views/desktop_view/about/about_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileAboutSection extends StatefulWidget {
  const MobileAboutSection({super.key});

  @override
  State<MobileAboutSection> createState() => _MobileAboutSectionState();
}

class _MobileAboutSectionState extends State<MobileAboutSection> {
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
          SizedBox(
            width: width * 0.8,
            child: Text(
              "Hello, world!",
              style: GoogleFonts.montserrat(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.8,
              child: Text(
                "I’m Prabesh Rai, a Business Analytics Graduate from Lambton College, Ottawa. I’m passionate about transforming complex data into actionable insights and applying machine learning to solve real-world business problems.",
                style: GoogleFonts.lato(
                  fontSize: 14, // Optimized for mobile
                  color: Colors.black87,
                  height: 1.5, // Improves readability
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.8,
              child: Text(
                "I hold a Bachelor’s degree in Computer Science & Software Engineering from the University of Bedfordshire (2022). With hands-on experience in mobile app development, I enjoy building practical solutions using Flutter and Dart, alongside my expertise in SQL, Python, Power BI, and Data Visualization.",
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.8,
              child: Divider(color: Colors.grey[400]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.8,
              child: Text(
                "Lately",
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.8,
              child: Text(
                "My current focus is on launching my career in Business/Data Analytics, where I can apply my skills in data modeling, visualization, and predictive analysis to support decision-making. At the same time, I continue exploring app development and AI/ML projects, aiming to integrate technology and analytics into innovative, data-driven solutions that make a measurable impact.",
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
