// presentation/configs/const_strings.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// constant strings are prefixed with [ks]
const String ksFontFamily = "Montserrat";

// Social Media
const kSocialIcons = ["assets/github.svg", "assets/linkedin.svg"];

const kSocialLinks = [
  "https://github.com/Prabesh789",
  "https://www.linkedin.com/in/prabeshrai/",
];

// URL Launcher
void launchURL(String url) async =>
    await canLaunchUrl(Uri.parse(url))
        ? await launchUrl(Uri.parse(url))
        : throw 'Could not launch $url';

// projects

final List<Map<String, String>> kProjects = [
  {
    'kProjectBanner': "assets/tourism_dashboard.png",
    'kProjectTitle': "Global Tourism Dashboard",
    'kProjectsDescription':
        "An interactive Power BI dashboard analyzing global tourism trends before and after the COVID-19 pandemic.",
    'kProjectLink': "https://github.com/Prabesh789/Global-Tourism-Dashboard",
    'kProjectDashboard':
        "https://app.powerbi.com/view?r=eyJrIjoiZTVjYzRmZDAtNGI4MS00YjU5LTg4YzctYTBkOGY3ZGNiZTM1IiwidCI6ImI2NDE3Y2QwLTFmNzMtNDQ3MS05YTM5LTIwOTUzODIyYTM0YSIsImMiOjN9",
  },
  {
    'kProjectBanner': "assets/air_bnb.png",
    'kProjectTitle': "Airbnb Trends Analysis",
    'kProjectsDescription':
        "Tableau dashboard analyzing Airbnb data for trends in listings, pricing, availability, and host behavior.",
    'kProjectDashboard':
        "https://public.tableau.com/app/profile/prabesh.rai6215/viz/AirbnbFullProject_17344635039170/Dashboard1",
  },
  {
    'kProjectBanner': "assets/trek.png",
    'kProjectTitle': "Trek-High Nepal",
    'kProjectsDescription':
        "Mobile app promoting e-tourism in Nepal, featuring real-time hiking route updates and emergency alerts.",
    'kProjectLink': "https://github.com/Prabesh789/Trek-High/tree/main",
    'kProjectThesisPaper':
        "https://drive.google.com/file/d/1GoNvlYWyHyffhsZj33vYVf4kvXLIs2z-/view",
  },
  {
    'kProjectBanner': "assets/note_book.png",
    'kProjectTitle': "Notebook",
    'kProjectsDescription':
        "Intuitive and optimized note-taking app with a user-friendly interface for creating, editing, and deleting notes.",
    "kAppStoreLink":
        "https://play.google.com/store/apps/details?id=com.prabeshrai.note_book",
  },
];

// Contact
final kContactIcons = [Icons.home, Icons.phone, Icons.mail];

final kContactTitles = ["Location", "Phone", "Email"];

final kContactDetails = [
  "Ottawa, Ontario, Canada",
  "+1 (343) 543-5098",
  "raiprabesh775@gmail.com",
];
