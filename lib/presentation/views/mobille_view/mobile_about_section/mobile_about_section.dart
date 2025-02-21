// presentation/views/mobille_view/mobile_about_section/mobile_about_section.dart
// presentation/views/desktop_view/about/about_section.dart
import 'package:flutter/material.dart';
import 'package:portfolio_web/presentation/configs/const_colors.dart';

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
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.8,
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
              width: width * 0.8,
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
            child: SizedBox(width: width * 0.8, child: Divider(color: kGrey)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.8,
              child: Text(
                "Lately",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.8,
              child: Text(
                "My current goal is to strengthen my foundation in Machine Learning, Deep Learning, Data Structures & Algorithms, Computer Architecture, Data Analytics, and Business Analytics while continuing Mobile App Development. I aim to integrate these technologies to create innovative solutions.",
                style: TextStyle(fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
