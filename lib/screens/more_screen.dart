import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majlaat/providers/language_provider.dart';
import 'package:majlaat/widgets/custom_inkwell.dart';
import 'package:majlaat/widgets/custom_screen.dart';
import 'package:majlaat/widgets/custom_shadow_text.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      removeBack: true,
      title: 'المزيد',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getLineButton(
              icon: Icons.favorite_border, onTap: () {}, title: 'قائمتي'),
          getLineButton(
              icon: CupertinoIcons.gift, onTap: () {}, title: 'إشترك الآن'),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getTextButton(
                  text: 'من نحن',
                  onTap: (() {}),
                ),
                getTextButton(
                  text: 'اتصل بنا',
                  onTap: (() {}),
                ),
                getTextButton(
                  text: 'سياسة الخصوصية',
                  onTap: (() {}),
                ),
                getTextButton(
                  text: 'الشروط والأحكام',
                  onTap: (() {}),
                ),
              ],
            ),
          ),
          getSocialMediaRow(),
        ],
      ),
    );
  }

  getSocialMediaRow() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getSocialMediaIcon(
            iconPath: 'assets/icons/youtube.png',
            url: 'https://www.youtube.com/',
          ),
          getSocialMediaIcon(
            iconPath: 'assets/icons/facebook.png',
            url: 'https:/www.facebook.com',
          ),
          getSocialMediaIcon(
            iconPath: 'assets/icons/whatsapp.png',
            url: 'https://web.whatsapp.com',
          ),
          getSocialMediaIcon(
            iconPath: 'assets/icons/instagram.png',
            url: 'https:/www.instagram.com',
          ),
          getSocialMediaIcon(
            iconPath: 'assets/icons/linkedin.png',
            url: 'https:/www.linkedin.com',
          ),
          getSocialMediaIcon(
            iconPath: 'assets/icons/twiter.png',
            url: 'https:/www.twitter.com',
          ),
        ],
      ),
    );
  }

  Widget getSocialMediaIcon({required String iconPath, required String url}) {
    return SizedBox(
      height: 50,
      width: 50,
      child: CustomInkwell(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          } else {
            throw "Could not launch $url";
          }
          return;
        },
        child: Image.asset(iconPath),
      ),
    );
  }

  getLineButton(
      {required IconData icon,
      required Function() onTap,
      required String title}) {
    return CustomInkwell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 25, right: 15, left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(width: 30),
                CustomShadowText(
                  text: title,
                  textColor: Colors.white,
                  shadowColor: Colors.black38,
                  fontSize: 20,
                )
              ],
            ),
            SizedBox(height: 20),
            Divider(
              height: 0,
              thickness: 0.8,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  getTextButton({required String text, required Function() onTap}) {
    return TextButton(
        onPressed: onTap,
        child: CustomShadowText(
          text: text,
          textColor: Colors.white,
          shadowColor: Colors.black38,
          fontSize: 20,
        ));
  }
}
