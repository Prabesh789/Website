// presentation/views/desktop_view/blog_section/blog_section.dart
import 'package:flutter/material.dart';

class BlogSection extends StatefulWidget {
  const BlogSection({super.key});

  @override
  State<BlogSection> createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(child: Text('Blog Section'));
  }
}
