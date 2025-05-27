// presentation/views/desktop_view/work_and_academic/work_and_academic.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkAndAcademic extends StatefulWidget {
  const WorkAndAcademic({super.key});

  @override
  State<WorkAndAcademic> createState() => _WorkAndAcademicState();
}

class _WorkAndAcademicState extends State<WorkAndAcademic> {
  final List<TimelineItem> experienceList = [
    TimelineItem(
      title: 'Leadership Intern – Nobel Navigators',
      date: 'Jun 2023 – Apr 2023, Remote',
      description:
          'Completed 3-stage program on leadership and communication. Led initiatives and participated in simulations.',
    ),
    TimelineItem(
      title:
          'Software Engineer Intern & Jr. Frontend Mobile App Developer  – Yellow Nepal [Fawesome Apps]',
      date: 'Apr 2021 – Aug 2022, Kathmandu, Nepal',
      description:
          'Built “Fonepay” banking app with QR payments. Improved performance by 40% and boosted user retention by 15%.',
    ),
  ];

  final List<TimelineItem> educationList = [
    TimelineItem(
      title: 'Post-Graduate – Business Analytics, Lambton College',
      date: 'Jan 2024 – Present (Ottawa ON, Canada)',
      description:
          'GPA: 3.62 | Studying BI tools, Software Testing, SQL, Data Visualization, Big Data & Statistical Analytics.',
    ),
    TimelineItem(
      title:
          'BSc – Computer Science & Software Engineering, University of Bedfordshire',
      date: 'Jan 2019 – Feb 2022 (Luton, UK)',
      description:
          'Graduated First Class. Studied AI, OOP, System Development & Modern Databases.',
    ),
  ];

  final List<String> certifications = [
    'AWS Certified Cloud Practitioner – Issued Jan 2025',
    'BA Blitz 2025 Hackathon (ABLE Autism Challenge)',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Text(
              "Experience & Education",
              style: GoogleFonts.montserrat(
                fontSize: width > 760 ? 40 : 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Divider(color: Colors.grey[400]),

            /// Two-column layout
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Experience Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Experience",
                        style: GoogleFonts.montserrat(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10),
                      ...experienceList.map((item) => TimelineTile(item: item)),
                    ],
                  ),
                ),
                const SizedBox(width: 40),

                // Education Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Education",
                        style: GoogleFonts.montserrat(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10),
                      ...educationList.map((item) => TimelineTile(item: item)),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),

            /// Certifications Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Certifications & Hackathons",
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 10),
            ...certifications.map(
              (cert) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    const Icon(Icons.verified, color: Colors.green, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        cert,
                        style: GoogleFonts.lato(
                          fontSize:
                              MediaQuery.of(context).size.width > 760 ? 14 : 12,
                          color: Colors.black,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class TimelineItem {
  final String title;
  final String date;
  final String description;

  TimelineItem({
    required this.title,
    required this.date,
    required this.description,
  });
}

class TimelineTile extends StatelessWidget {
  final TimelineItem item;

  const TimelineTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Icon(Icons.circle, size: 12, color: Colors.green),
              Container(height: 60, width: 2, color: Colors.grey),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: GoogleFonts.lato(
                    fontSize: MediaQuery.of(context).size.width > 760 ? 14 : 12,
                    color: Colors.black,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.date,
                  style: GoogleFonts.lato(
                    fontSize: MediaQuery.of(context).size.width > 760 ? 14 : 12,
                    color: Colors.black,
                    height: 1.5, // Better line spacing
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.description,
                  style: GoogleFonts.lato(
                    fontSize: MediaQuery.of(context).size.width > 760 ? 14 : 12,
                    color: Colors.black,
                    height: 1.5, // Better line spacing
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
