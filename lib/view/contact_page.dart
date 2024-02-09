import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset('assets/contact1.jpg',
              width: double.infinity,
              height: ScreenUtil().setHeight(300),
              fit: BoxFit.cover),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => launchUrlString(
                      'https://www.facebook.com/profile.php?id=100008204142764&mibextid=ZbWKwL'),
                  icon: Icon(
                    Icons.facebook,
                    size: ScreenUtil().setWidth(50),
                  )),
              IconButton(
                  onPressed: () => launchUrlString(
                      'https://www.instagram.com/gheith.alsheikh?igsh=MXE3MGgxZm53ZDNkNg=='),
                  icon: Icon(
                    FontAwesomeIcons.instagram,
                    size: ScreenUtil().setWidth(50),
                  )),
              IconButton(
                  onPressed: () => launchUrlString(
                      'https://www.linkedin.com/in/%D8%BA%D9%8A%D8%AB-%D8%A7%D9%84%D8%B4%D9%8A%D8%AE-a7686921b?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app'),
                  icon: Icon(
                    FontAwesomeIcons.linkedin,
                    size: ScreenUtil().setWidth(50),
                  )),
              IconButton(
                  onPressed: () => launchUrlString(
                      'https://api.whatsapp.com/send/?phone=963936083190&text&type=phone_number&app_absent=0'),
                  icon: Icon(
                    FontAwesomeIcons.whatsapp,
                    size: ScreenUtil().setWidth(50),
                  )),
              IconButton(
                  onPressed: () =>
                      launchUrlString('https://t.me/GheithAlsheikh'),
                  icon: Icon(
                    FontAwesomeIcons.telegram,
                    size: ScreenUtil().setWidth(50),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
