// presentation/views/mobille_view/mobile_home_section/mobile_home_screen.dart
// presentation/views/desktop_view/home_section/home_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

class Overview extends StatefulWidget {
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
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Color transition duration
    );

    _colorAnimation = ColorTween(
      begin: Colors.blueAccent,
      end: Colors.deepPurpleAccent,
    ).animate(_controller);

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _visible = true;
      });
    });

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return "🌞 Good Morning!";
    } else if (hour < 18) {
      return "🌤️ Good Afternoon!";
    } else {
      return "🌙 Good Evening!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.crossAxisAlignment,
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
        // Live Greeting with Fade-in Animation & Dynamic Color
        AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(seconds: 2),
          child: AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                constraints: BoxConstraints(
                  minWidth: 200, // Ensures it doesn’t shrink too much
                  maxWidth: 400, // Limits width to prevent overflow
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200.withValues(
                    alpha: (0.1 * 255).toDouble(),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "${getGreeting()} - Hope you are doing well!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color:
                        Colors.black87, // High contrast black for a clean look
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: widget.height * 0.050,
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
          width: widget.width * 0.8,
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
