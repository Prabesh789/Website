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
                "Hi, I’m Prabesh Rai, a Business Analytics postgraduate student at Lambton College, Ottawa. "
                "I’m deeply passionate about Data Analytics and Machine Learning.",
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
                "I hold a Bachelor's degree in Computer Science & Engineering from the University of Bedfordshire (2022). "
                "With experience in mobile app development, I specialize in building applications using Flutter and Dart.",
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
                "My current goal is to deepen my knowledge in Machine Learning, Deep Learning, Data Structures & Algorithms, "
                "Computer Architecture, and Business Analytics, while continuing my journey in Mobile App Development. "
                "I aim to integrate these technologies to develop innovative, data-driven solutions that solve real-world problems.",
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
