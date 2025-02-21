// presentation/views/desktop_view/about/about_section.dart
import 'package:flutter/material.dart';
import 'package:portfolio_web/presentation/configs/const_colors.dart';

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
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width > 760 ? 70 : 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.5,
              child: Text(
                "I am Prabesh Rai. I am currently pursuing my Post-graduate degree in Business Analytics at Lambton College Ottawa. I am passionate about Data Analystics and Machine Learning.",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 760 ? 16 : 13,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.5,
              child: Text(
                "I am graduate in Computer Science and Engineering from University of Bedfordshire, In 2022. I have expereinced in developing mobile applications using Flutter and Dart.",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 760 ? 16 : 13,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(width: width * 0.5, child: Divider(color: kGrey)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.5,
              child: Text(
                "Lately",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 760 ? 50 : 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.5,
              child: Text(
                "My current goal is to strengthen my foundation in Machine Learning, Deep Learning, Data Structures & Algorithms, Computer Architecture, Data Analytics, and Business Analytics while continuing Mobile App Development. I aim to integrate these technologies to create innovative solutions.",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 760 ? 16 : 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
