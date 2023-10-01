import 'package:flutter/material.dart';
import 'package:flutter_application_1/componants/squretitle.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final Constants _constants = Constants();
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse("https://$url");

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch URL";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: _constants.primaryColor,
      appBar: AppBar(
        title: const Text('About'),
        leading: IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "Swipe Right To See Menu",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: _constants.secondaryColor,
                  textColor: Colors.black);
            },
            icon: const Icon(Icons.swipe_right)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: _constants.primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: _constants.secondaryColor,
                    spreadRadius: 10,
                    blurRadius: 15,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Contact Me',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * .025),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(
                      style: TextStyle(fontSize: 15.5, color: Colors.black),
                      children: [
                        TextSpan(
                          text:
                              "This meteorological forecasting application was conceived and subsequently    released with the primary aim of serving as an educational project. The construction of     this software was undertaken within the confines of the Flutter framework, utilizing     the Dart programming language. The final product was presented to Shamsipur Technical Vocational College. For the purposes of engaging in dialogue with the developer or furnishing constructive feedback, please do not hesitate to reach out to me via email at the following           address: ",
                        ),
                        TextSpan(
                          text: "@test@gmail.com",
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                        TextSpan(
                          text:
                              " or alternatively, through the developer's profiles on GitHub or Linkedin. Furthermore, it is imperative to note that this program is entirely open-source in nature, with its complete source code accessible on GitHub via the provided hyperlink.",
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: size.height * 0.075,
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: size.height * .035),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child:
                            const SquareTile(imagePath: "assets/github1.png"),
                        onTap: () {
                          _launchURL(
                              "github.com/AlirezaKazemiZadeh/WeatherApp");
                        },
                      ),
                      SizedBox(width: size.width * 0.05),
                      InkWell(
                        child:
                            const SquareTile(imagePath: "assets/linkden3.png"),
                        onTap: () {
                          _launchURL(
                              "www.linkedin.com/in/alireza-kazemi-zadeh-71744b288/");
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Text(
                          '  GitHub',
                          style: TextStyle(
                              color: Colors.blue[600],
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          _launchURL(
                              "github.com/AlirezaKazemiZadeh/WeatherApp");
                        },
                      ),
                      SizedBox(width: size.width * 0.09),
                      GestureDetector(
                        child: Text(
                          '         Linkedin',
                          style: TextStyle(
                              color: Colors.blue[600],
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          _launchURL(
                              "www.linkedin.com/in/alireza-kazemi-zadeh-71744b288/");
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
