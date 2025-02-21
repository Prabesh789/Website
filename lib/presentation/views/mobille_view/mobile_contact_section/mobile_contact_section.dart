// presentation/views/mobille_view/mobile_contact_section/mobile_contact_section.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http show post;
import 'package:portfolio_web/presentation/configs/const_colors.dart';
import 'package:portfolio_web/presentation/configs/const_strings.dart';
import 'package:portfolio_web/presentation/utils/social_medial_icon.dart';
import 'package:portfolio_web/presentation/views/desktop_view/footer_section/footer_section.dart';

class MobileContactSection extends StatefulWidget {
  const MobileContactSection({super.key});

  @override
  State<MobileContactSection> createState() => _MobileContactSectionState();
}

class _MobileContactSectionState extends State<MobileContactSection> {
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: _formKey,
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConnectWithMe(height: height, width: width),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 5,
                  ),
                  child: Divider(color: kGrey),
                ),
                SizedBox(height: 20),
                formField(width),
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
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: width * 0.9,
          child: TextFormField(
            cursorColor: kGrey,
            controller: _nameController,
            focusNode: _nameFocus,
            decoration: InputDecoration(
              hintText: "Enter your name",
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey[700]),
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
        Text("Email", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
        SizedBox(height: 10),
        SizedBox(
          width: width * 0.9,
          child: TextFormField(
            cursorColor: kGrey,
            controller: _emailController,
            focusNode: _emailFocus,
            decoration: InputDecoration(
              hintText: "youremail@gmail.com",
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey[700]),
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
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: width * 0.9,
          child: TextFormField(
            maxLines: width < 760 ? 3 : 5,
            cursorColor: kGrey,
            controller: _messageController,
            focusNode: _messageFocus,
            decoration: InputDecoration(
              hintText: "Hi, I would like to reach out to you...",
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey[700]),
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
              backgroundColor: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            ),
            child: Text(
              "SEND MESSAGE",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

class ConnectWithMe extends StatelessWidget {
  const ConnectWithMe({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Connect with Me",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10),
        SizedBox(
          width: width * 0.8,
          child: Center(
            child: Text(
              "This form is only for contacting me about opportunities to work or collaborate together. "
              "Please avoid it for general conversations.", // Concatenated for readability
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey[700]),
              softWrap: true, // Allows text to wrap
              maxLines: 3, // Allows multiple lines
            ),
          ),
        ),
        SizedBox(height: 15),
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
                  height: 20,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
