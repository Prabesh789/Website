// presentation/views/mobille_view/mobile_view_main_section.dart
// presentation/views/desktop_view/main_section/main_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/presentation/animation/entrance_fader.dart';
import 'package:portfolio_web/presentation/configs/const_colors.dart';
import 'package:portfolio_web/presentation/views/mobille_view/mobile_about_section/mobile_about_section.dart';
import 'package:portfolio_web/presentation/views/mobille_view/mobile_contact_section/mobile_contact_section.dart';
import 'package:portfolio_web/presentation/views/mobille_view/mobile_home_section/mobile_home_screen.dart';
import 'package:portfolio_web/presentation/views/mobille_view/mobile_project_section/mobile_project_section.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

final ItemScrollController itemForMobileScrollController =
    ItemScrollController();

class MobileViewMainSection extends StatefulWidget {
  const MobileViewMainSection({super.key});

  @override
  State<MobileViewMainSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<MobileViewMainSection> {
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
    itemForMobileScrollController.scrollTo(
      index: i,
      duration: Duration(seconds: 1),
    );
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
      return MobileHomeSection();
    } else if (i == 1) {
      return MobileAboutSection();
    } else if (i == 2) {
      return MobileProjectSection();
    } else if (i == 3) {
      // return BlogSection();
      return MobileContactSection();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        leadingWidth: 0,
        centerTitle: true,
        backgroundColor: kWhite,
        toolbarHeight: 55,
        elevation: 0.0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < _sectionsName.length; i++)
              _appBarActions(_sectionsName[i], i, _sectionsIcons[i]),
          ],
        ),
      ),
      body: Container(
        color: kWhite,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: RawScrollbar(
          controller: _scrollController,
          thumbColor: kTeal200,
          thickness: 3.0,
          child: ScrollablePositionedList.builder(
            itemScrollController: itemForMobileScrollController,
            itemPositionsListener: _itemPositionListener,
            itemCount: 4,
            itemBuilder: (context, index) {
              return sectionWidget(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _appBarActions(String childText, int index, IconData icon) {
    return EntranceFader(
      offset: Offset(0, -20),
      delay: Duration(seconds: 0),
      duration: Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 6, 6),
        child: MaterialButton(
          onPressed: () => _scroll(index),
          child: Text(
            childText,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: kBlack,
              fontWeight:
                  _selectedIndex == index
                      ? FontWeight.w600
                      : FontWeight.w400, // Bold for selected
              decoration:
                  _selectedIndex == index
                      ? TextDecoration.underline
                      : TextDecoration.none,
              decorationThickness: 0.7,
              decorationColor: kBlack,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
