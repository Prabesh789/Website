// presentation/views/desktop_view/contact_section/contact_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http show post;
import 'package:portfolio_web/presentation/configs/const_colors.dart';
import 'package:portfolio_web/presentation/configs/const_strings.dart';
import 'package:portfolio_web/presentation/utils/social_medial_icon.dart';
import 'package:portfolio_web/presentation/views/desktop_view/footer_section/footer_section.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _messageFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _messageFocus.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse(
          "https://formspree.io/f/xvgzlaga",
        ), // Replace with your Formspree form ID
        headers: {"Content-Type": "application/json"},
        body: '''
        {
          "name": "${_nameController.text}",
          "email": "${_emailController.text}",
          "message": "${_messageController.text}"
        }
        ''',
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior:
                SnackBarBehavior
                    .floating, // Ensures it's floating and not full-width
            backgroundColor:
                Colors
                    .transparent, // Makes background transparent so we can control size
            elevation: 0, // Removes shadow for a cleaner look
            content: Center(
              // Centers the snackbar on the screen
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                width: 300, // Fixed width
                decoration: BoxDecoration(
                  color: Colors.green, // Background color
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: Text(
                  "Message Sent Successfully!",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center, // Centers text inside snackbar
                ),
              ),
            ),
            duration: Duration(seconds: 3), // Duration before it disappears
          ),
        );
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior:
                SnackBarBehavior
                    .floating, // Ensures it's floating and not full-width
            backgroundColor:
                Colors
                    .transparent, // Makes background transparent so we can control size
            elevation: 0, // Removes shadow for a cleaner look
            content: Center(
              // Centers the snackbar on the screen
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                width: 300, // Fixed width
                decoration: BoxDecoration(
                  color: kRed, // Background color
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: Text(
                  "Something went Wrong!",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center, // Centers text inside snackbar
                ),
              ),
            ),
            duration: Duration(seconds: 3), // Duration before it disappears
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Form(
          key: _formKey,
          child: SizedBox(
            height: height,
            width: width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: width * 0.07,
              children: [
                MediaQuery.of(context).size.width < 1000
                    ? SizedBox.shrink()
                    : ConnectWithMe(height: height),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MediaQuery.of(context).size.width < 1000
                        ? ConnectWithMe(height: height)
                        : SizedBox.shrink(),
                    MediaQuery.of(context).size.width < 760
                        ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: width * 0.5,
                            child: Divider(color: kGrey),
                          ),
                        )
                        : SizedBox.shrink(),
                    SizedBox(
                      height: MediaQuery.of(context).size.width > 760 ? 0 : 20,
                    ),
                    formField(width),
                  ],
                ),
              ],
            ),
          ),
        ),
        FooterSection(),
      ],
    );
  }

  Column formField(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Full Name",
          style: GoogleFonts.nunitoSans(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 450,
          child: TextFormField(
            cursorColor: kGrey,
            controller: _nameController,
            focusNode: _nameFocus,
            decoration: InputDecoration(
              hintText: "Enter your name",
              hintStyle: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                ), // Grey border
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                ), // Grey border when not focused
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kBlack,
                  width: 1.5,
                ), // Grey border when focused
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.5,
                ), // Red border for errors
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.5,
                ), // Red border when error is focused
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your name";
              }
              return null;
            },
            onEditingComplete: () => _emailFocus.requestFocus(),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Email",
          style: GoogleFonts.nunitoSans(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 450,
          child: TextFormField(
            cursorColor: kGrey,
            controller: _emailController,
            focusNode: _emailFocus,
            decoration: InputDecoration(
              hintText: "youremail@gmail.com",
              hintStyle: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                ), // Grey border
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                ), // Grey border when not focused
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kBlack,
                  width: 1.5,
                ), // Grey border when focused
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.5,
                ), // Red border for errors
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.5,
                ), // Red border when error is focused
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your email";
              } else if (!RegExp(
                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
              ).hasMatch(value)) {
                return "Enter a valid email";
              }
              return null;
            },
            onEditingComplete: () => _messageFocus.requestFocus(),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Message",
          style: GoogleFonts.nunitoSans(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 450,
          child: TextFormField(
            maxLines: width < 760 ? 3 : 5,
            cursorColor: kGrey,
            controller: _messageController,
            focusNode: _messageFocus,
            decoration: InputDecoration(
              hintText: "Hi, I would like to reach out to you...",
              hintStyle: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                ), // Grey border
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                ), // Grey border when not focused
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kBlack,
                  width: 1.5,
                ), // Grey border when focused
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.5,
                ), // Red border for errors
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.5,
                ), // Red border when error is focused
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a message";
              }
              return null;
            },
            onEditingComplete: () => _messageFocus.unfocus(),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: _submitForm,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Primary color
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 3, // Subtle shadow effect
            ),
            child: Text(
              "SEND MESSAGE",
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ConnectWithMe extends StatelessWidget {
  const ConnectWithMe({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          MediaQuery.of(context).size.width > 760
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Title
        Text(
          "Connect with Me",
          style: GoogleFonts.montserrat(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.black87,
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10),
        // Improved Subtitle
        Text(
          "This form is for contacting me about opportunities to work or collaborate.\nPlease avoid general conversations.",
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black54,
            height: 1.5,
          ),
        ),

        // Social Media Icons
        SizedBox(
          height: height * 0.050,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < kSocialIcons.length; i++)
                SocialMediaIconBtn(
                  icon: kSocialIcons[i],
                  socialLink: kSocialLinks[i],
                  height: 25,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
