// presentation/views/desktop_view/home_section/home_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/presentation/configs/const_strings.dart';
import 'package:portfolio_web/presentation/utils/social_medial_icon.dart';
import 'package:portfolio_web/presentation/views/desktop_view/main_section/main_section.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final desktopView = MediaQuery.of(context).size.width > 760;
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          desktopView
              ? SizedBox.shrink()
              : Overview(
                height: height,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/prabesh.jpg',
                  height: desktopView ? height * 0.5 : height * 0.4,
                ),
              ),
              MediaQuery.of(context).size.width < 760
                  ? SizedBox.shrink()
                  : Overview(
                    height: height,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
  });

  final double height;
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
        // Name & Title
        Text(
          "PRABESH RAI",
          style: GoogleFonts.montserrat(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          "BUSINESS ANALYTICS STUDENT @ LAMBTON COLLEGE",
          style: GoogleFonts.raleway(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 12),

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
                    fontSize: 15,
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

        // Social Icons
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
        SizedBox(height: 16),

        // About Section
        Text(
          "I am a Computer Science Graduate pursuing \nPost-Graduate In Business Analytics at Lambton College.",
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: Colors.black87,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 16),

        // Learn More Button
        InkWell(
          onTap: () {
            itemScrollController.scrollTo(
              index: 1,
              duration: Duration(seconds: 1),
            );
          },
          child: Text(
            "Learn more ->",
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ],
    );
  }
}
