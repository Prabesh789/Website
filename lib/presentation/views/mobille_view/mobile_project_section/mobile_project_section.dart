// presentation/views/mobille_view/mobile_project_section/mobile_project_section.dart
// presentation/views/desktop_view/project_section/project_section.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/presentation/configs/const_colors.dart';
import 'package:portfolio_web/presentation/configs/const_strings.dart';

class MobileProjectSection extends StatefulWidget {
  const MobileProjectSection({super.key});

  @override
  State<MobileProjectSection> createState() => _MobileProjectSectionState();
}

class _MobileProjectSectionState extends State<MobileProjectSection> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final ScrollController scrollController = ScrollController();
    void scrollLeft() {
      scrollController.animateTo(
        scrollController.offset - 300, // Adjust scroll amount
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    void scrollRight() {
      scrollController.animateTo(
        scrollController.offset + 300, // Adjust scroll amount
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    return SizedBox(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          // Portfolio title
          SizedBox(
            width: width * 0.5,
            child: Text(
              "Portfolio",
              style: GoogleFonts.montserrat(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.8,
              child: Text(
                "A collection of my Mobile App Development, Research, and Data Analysis projects.",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.black54,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 0,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Left Arrow Button
              IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 20),
                onPressed: scrollLeft,
              ),
              // ListView with ScrollController
              SizedBox(
                height: 590,
                width: width * 0.74,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  addAutomaticKeepAlives: true,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: kProjects.length,
                  itemBuilder: (context, i) {
                    final projects = kProjects;
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Project(
                        width: width * 0.7,
                        title: projects[i]['kProjectTitle'] ?? "",
                        image: projects[i]['kProjectBanner'] ?? "",
                        description: projects[i]['kProjectsDescription'] ?? "",
                        projectLink: projects[i]['kProjectLink'] ?? "",
                        dashboardLink: projects[i]['kProjectDashboard'] ?? "",
                        appStoreLink: projects[i]['kAppStoreLink'] ?? "",
                        thesisPaper: projects[i]['kProjectThesisPaper'] ?? "",
                      ),
                    );
                  },
                ),
              ),
              // Right Arrow Button
              IconButton(
                icon: Icon(Icons.arrow_forward_ios, size: 20),
                onPressed: scrollRight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Project extends StatefulWidget {
  const Project({
    super.key,
    required this.width,
    required this.image,
    required this.description,
    required this.projectLink,
    required this.title,
    required this.dashboardLink,
    required this.appStoreLink,
    required this.thesisPaper,
  });

  final double width;
  final String image;
  final String description;
  final String projectLink;
  final String title;
  final String dashboardLink;
  final String appStoreLink;
  final String thesisPaper;

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  bool _isCodeHovered = false;
  bool _isPaperHovered = false;
  bool _isDashboardHovered = false;
  bool _isPlayConsoleHovered = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: (0.2 * 255).toDouble()),
                  spreadRadius: 2, // How much the shadow spreads
                  blurRadius: 10, // Softness of the shadow
                  offset: Offset(4, 4), // Position of shadow (X, Y)
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                widget.image,
                height: 400,
                width: widget.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          // Project Titles
          Text(
            widget.title,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationThickness: 1.5,
              decorationColor: Colors.black87,
            ),
          ),
          SizedBox(height: 6),
          // Project Description
          Text(
            widget.description,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.black54,
              height: 1.5, // Better spacing
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              widget.projectLink != ""
                  ? MouseRegion(
                    onEnter:
                        (_) => setState(
                          () => _isCodeHovered = true,
                        ), // When mouse enters
                    onExit:
                        (_) => setState(
                          () => _isCodeHovered = false,
                        ), // When mouse exits
                    child: GestureDetector(
                      onTap: () => launchURL(widget.projectLink), // Open URL
                      child: AnimatedContainer(
                        duration: Duration(
                          milliseconds: 200,
                        ), // Smooth transition
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color:
                              _isCodeHovered
                                  ? kGrey300
                                  : Colors.transparent, // Hover color effect
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FontAwesomeIcons.github,
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "CODE",
                              style: GoogleFonts.robotoMono(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  : SizedBox.shrink(),
              SizedBox(width: widget.thesisPaper != "" ? 10 : 0),
              widget.thesisPaper != ""
                  ? MouseRegion(
                    onEnter:
                        (_) => setState(
                          () => _isPaperHovered = true,
                        ), // When mouse enters
                    onExit:
                        (_) => setState(
                          () => _isPaperHovered = false,
                        ), // When mouse exits
                    child: GestureDetector(
                      onTap: () => launchURL(widget.thesisPaper), // Open URL
                      child: AnimatedContainer(
                        duration: Duration(
                          milliseconds: 200,
                        ), // Smooth transition
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color:
                              _isPaperHovered
                                  ? kGrey300
                                  : Colors.transparent, // Hover color effect
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FontAwesomeIcons.paperPlane,
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "THESIS PAPER",
                              style: GoogleFonts.robotoMono(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  : SizedBox.shrink(),

              SizedBox(width: widget.dashboardLink != "" ? 10 : 0),
              widget.dashboardLink != ""
                  ? MouseRegion(
                    onEnter:
                        (_) => setState(
                          () => _isDashboardHovered = true,
                        ), // When mouse enters
                    onExit:
                        (_) => setState(
                          () => _isDashboardHovered = false,
                        ), // When mouse exits
                    child: GestureDetector(
                      onTap: () => launchURL(widget.dashboardLink), // Open URL
                      child: AnimatedContainer(
                        duration: Duration(
                          milliseconds: 200,
                        ), // Smooth transition
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color:
                              _isDashboardHovered
                                  ? kGrey300
                                  : Colors.transparent, // Hover color effect
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FontAwesomeIcons.chartBar,
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "DASHBOARD",
                              style: GoogleFonts.robotoMono(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  : SizedBox.shrink(),
              SizedBox(width: widget.appStoreLink != "" ? 10 : 0),
              widget.appStoreLink != ""
                  ? MouseRegion(
                    onEnter:
                        (_) => setState(
                          () => _isPlayConsoleHovered = true,
                        ), // When mouse enters
                    onExit:
                        (_) => setState(
                          () => _isPlayConsoleHovered = false,
                        ), // When mouse exits
                    child: GestureDetector(
                      onTap: () => launchURL(widget.appStoreLink), // Open URL
                      child: AnimatedContainer(
                        duration: Duration(
                          milliseconds: 200,
                        ), // Smooth transition
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color:
                              _isPlayConsoleHovered
                                  ? kGrey300
                                  : Colors.transparent, // Hover color effect
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FontAwesomeIcons.googlePlay,
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "PLAY CONSOLE",
                              style: GoogleFonts.robotoMono(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
