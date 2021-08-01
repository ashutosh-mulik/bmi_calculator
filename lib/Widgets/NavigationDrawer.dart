import 'dart:io';

import 'package:bmi_calculator/Config.dart';
import 'package:bmi_calculator/Views/PrivacyPolicyView.dart';
import 'package:bmi_calculator/Views/TermsView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationDrawer {
  Drawer drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Config.colorVar1,
            ),
            child: Center(
                child: Text(
              "BMI CALCULATOR",
              style: GoogleFonts.oswald(color: Colors.white),
            )),
          ),
          ListTile(
            leading: Icon(
              Icons.policy,
              color: Colors.white,
            ),
            title: Text(
              'Privacy Policy',
              style: GoogleFonts.nunito(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Get.to(PrivacyPolicyView());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.security,
              color: Colors.white,
            ),
            title: Text(
              'Terms and Conditions',
              style: GoogleFonts.nunito(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Get.to(TermsView());
            },
          ),
          AboutListTile(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            child: Text(
              'About app',
              style: GoogleFonts.nunito(color: Colors.white),
            ),
            applicationIcon: Image.asset(
              'assets/scale.png',
              width: 30,
              height: 30,
            ),
            applicationName: 'BMI Calculator',
            applicationVersion: '1.0.1',
            applicationLegalese: '© 2021 Twoab Company',
            aboutBoxChildren: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: InkWell(
                  onTap: () {
                    launch("https://github.com/ashutosh-mulik");
                  },
                  child: Text("Author : Ashutosh Mulik."),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: InkWell(
                  onTap: () {
                    launch("https://dribbble.com/shots/4585382-Simple-BMI-Calculator");
                  },
                  child: Text("UI Design : Ruben Vaalt (Dribbble)"),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: InkWell(
                  onTap: () {
                    launch("www.flaticon.com");
                  },
                  child: Text("Icons : www.flaticon.com"),
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(
              Icons.share,
              color: Colors.white,
            ),
            title: Text(
              'Share',
              style: GoogleFonts.nunito(
                color: Colors.white,
              ),
            ),
            onTap: () async {
              if (Platform.isAndroid) {
                Share.share('Check Out New BMI Calculator https://play.google.com/store/apps/details?id=com.twoab.bmi.bmi_calculator');
              }
            },
          ),
        ],
      ),
    );
  }
}
