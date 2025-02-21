// presentation/views/desktop_view/about/about_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
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
            width: width * 0.5,
            child: Text(
              "Hello, world!",
              style: GoogleFonts.montserrat(
                fontSize: MediaQuery.of(context).size.width > 760 ? 70 : 50,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.5,
              child: Text(
                "Hi, I’m Prabesh Rai, a Business Analytics postgraduate student at Lambton College, Ottawa. "
                "I’m deeply passionate about Data Analytics and Machine Learning.",
                style: GoogleFonts.lato(
                  fontSize: MediaQuery.of(context).size.width > 760 ? 16 : 13,
                  color: Colors.black87,
                  height: 1.5, // Better line spacing
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.5,
              child: Text(
                "I hold a Bachelor's degree in Computer Science & Engineering from the University of Bedfordshire (2022). "
                "With experience in mobile app development, I specialize in building applications using Flutter and Dart.",
                style: GoogleFonts.lato(
                  fontSize: MediaQuery.of(context).size.width > 760 ? 16 : 13,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.5,
              child: Divider(color: Colors.grey[400]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.5,
              child: Text(
                "Lately",
                style: GoogleFonts.montserrat(
                  fontSize: MediaQuery.of(context).size.width > 760 ? 50 : 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.5,
              child: Text(
                "My current goal is to deepen my knowledge in Machine Learning, Deep Learning, Data Structures & Algorithms, "
                "Computer Architecture, and Business Analytics, while continuing my journey in Mobile App Development. "
                "I aim to integrate these technologies to develop innovative, data-driven solutions that solve real-world problems.",
                style: GoogleFonts.lato(
                  fontSize: MediaQuery.of(context).size.width > 760 ? 16 : 13,
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
