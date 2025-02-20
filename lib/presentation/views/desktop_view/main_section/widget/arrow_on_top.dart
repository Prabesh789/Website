// presentation/views/desktop_view/main_section/widget/arrow_on_top.dart
import 'package:portfolio_web/presentation/configs/const_colors.dart';
import 'package:flutter/material.dart';

class ArrowOnTop extends StatefulWidget {
  final VoidCallback onPressed;

  const ArrowOnTop({super.key, required this.onPressed});

  @override
  State<ArrowOnTop> createState() => _ArrowOnTopState();
}

class _ArrowOnTopState extends State<ArrowOnTop> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: widget.onPressed,
          onHover: (isHovering) {
            if (isHovering) {
              setState(() {
                isHover = true;
              });
            } else {
              setState(() {
                isHover = false;
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
              boxShadow:
                  isHover
                      ? [
                        BoxShadow(
                          color: kBlack.withAlpha(200),
                          blurRadius: 12.0,
                          offset: Offset(2.0, 3.0),
                        ),
                      ]
                      : [],
            ),
            child: Icon(
              Icons.arrow_drop_up_outlined,
              color: kBlack,
              size: MediaQuery.of(context).size.height * 0.05,
            ),
          ),
        ),
      ],
    );
  }
}
