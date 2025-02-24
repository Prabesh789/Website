// presentation/views/desktop_view/main_section/main_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/presentation/animation/entrance_fader.dart';
import 'package:portfolio_web/presentation/configs/const_colors.dart';
import 'package:portfolio_web/presentation/views/desktop_view/about/about_section.dart';
import 'package:portfolio_web/presentation/views/desktop_view/contact_section/contact_section.dart';
import 'package:portfolio_web/presentation/views/desktop_view/home_section/home_section.dart';
import 'package:portfolio_web/presentation/views/desktop_view/nav_bar/nav_bar.dart';
import 'package:portfolio_web/presentation/views/desktop_view/project_section/project_section.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

final ItemScrollController itemScrollController = ItemScrollController();

class MainSection extends StatefulWidget {
  const MainSection({super.key});

  @override
  State<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 25.0,
  );
  // final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionListener =
      ItemPositionsListener.create();
  final List<String> _sectionsName = [
    "HOME",
    "ABOUT",
    "PROJECTS",
    // "BLOG",
    "CONTACT",
  ];
  var _selectedIndex = 0;

  void _scroll(int i) {
    itemScrollController.scrollTo(index: i, duration: Duration(seconds: 1));
    setState(() {
      _selectedIndex = i; // Update selected index
    });
  }

  final List<IconData> _sectionsIcons = [
    Icons.home,
    Icons.person,
    Icons.settings,
    Icons.build,
    Icons.phone,
  ];

  Widget sectionWidget(int i) {
    if (i == 0) {
      return HomeSection();
      // return ContactSection();
    } else if (i == 1) {
      return AboutSection();
    } else if (i == 2) {
      return ProjectSection();
    } else if (i == 3) {
      // return BlogSection();
      return ContactSection();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: kWhite,
        elevation: 0.0,
        title: NavBarLogo(height: 20),
        actions: [
          for (int i = 0; i < _sectionsName.length; i++)
            _appBarActions(_sectionsName[i], i, _sectionsIcons[i]),
        ],
        actionsPadding: EdgeInsets.only(right: 60, bottom: 15),
      ),
      drawer: MediaQuery.of(context).size.width < 400 ? _appBarMobile() : null,
      body: Container(
        color: kWhite,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: RawScrollbar(
          controller: _scrollController,
          thumbColor: kTeal200,
          thickness: 4.0,
          child: ScrollablePositionedList.builder(
            itemScrollController: itemScrollController,
            itemPositionsListener: _itemPositionListener,
            itemCount: 6,
            itemBuilder: (context, index) {
              return sectionWidget(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _appBarMobile() {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: NavBarLogo(height: 28)),
            for (int i = 0; i < _sectionsName.length; i++)
              _appBarActions(_sectionsName[i], i, _sectionsIcons[i]),
          ],
        ),
      ),
    );
  }

  Widget _appBarActions(String childText, int index, IconData icon) {
    return MediaQuery.of(context).size.width > 480
        ? EntranceFader(
          offset: Offset(0, -20),
          delay: Duration(seconds: 0),
          duration: Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () => _scroll(index),
              child: Text(
                childText,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: kBlack,
                  fontWeight:
                      _selectedIndex == index
                          ? FontWeight.w600
                          : FontWeight.w400, // Bold for selected
                  decoration:
                      _selectedIndex == index
                          ? TextDecoration.underline
                          : TextDecoration.none,
                  decorationThickness: 1.0,
                  decorationColor: kBlack,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
          ),
        )
        : Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            hoverColor: kGrey500,
            onPressed: () => _scroll(index),
            child: ListTile(
              leading: Icon(icon, color: kGrey500),
              title: Text(childText),
            ),
          ),
        );
  }
}
