// presentation/views/desktop_view/work_and_academic/work_and_academic.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkAndAcademic extends StatefulWidget {
  const WorkAndAcademic({super.key});

  @override
  State<WorkAndAcademic> createState() => _WorkAndAcademicState();
}

class _WorkAndAcademicState extends State<WorkAndAcademic> {
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
              "Work & Education",
              style: GoogleFonts.montserrat(
                fontSize: MediaQuery.of(context).size.width > 760 ? 50 : 30,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
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
        ],
      ),
    );
  }
}
