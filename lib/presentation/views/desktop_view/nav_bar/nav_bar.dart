// presentation/views/desktop_view/nav_bar/nav_bar.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarLogo extends StatelessWidget {
  final double? height;
  const NavBarLogo({super.key, this.height});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width < 1100 ? 0.0 : 40.0,
        20.0,
        0,
        30,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("< ", style: TextStyle(fontSize: height ?? 15)),
          Text(
            "Prabesh",
            style: GoogleFonts.spaceMono(
              fontSize: height ?? 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          Flexible(
            child: Text(
              MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : " />",
              style: TextStyle(fontSize: height ?? 15),
            ),
          ),
        ],
      ),
    );
  }
}
