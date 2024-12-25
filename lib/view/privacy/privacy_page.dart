import 'package:flutter/material.dart';
import 'package:book_grocer/common/color_extenstion.dart';

class PrivacyPage extends StatefulWidget {
  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool isDataSharingAllowed = true;
  bool areCookiesEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        title: const Text("Privacy Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Manage Your Privacy",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: TColor.text,
              ),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: Text("Allow Data Sharing", style: TextStyle(color: TColor.text)),
              subtitle: Text(
                "Share your app usage data to improve services.",
                style: TextStyle(color: TColor.textSecondary),
              ),
              value: isDataSharingAllowed,
              onChanged: (value) {
                setState(() {
                  isDataSharingAllowed = value;
                });
              },
              activeColor: TColor.primary,
            ),
            Divider(color: TColor.textbox),
            SwitchListTile(
              title: Text("Enable Cookies", style: TextStyle(color: TColor.text)),
              subtitle: Text(
                "Allow cookies for a better experience.",
                style: TextStyle(color: TColor.textSecondary),
              ),
              value: areCookiesEnabled,
              onChanged: (value) {
                setState(() {
                  areCookiesEnabled = value;
                });
              },
              activeColor: TColor.primary,
            ),
            Divider(color: TColor.textbox),
            ExpansionTile(
              title: Text(
                "Learn More About Privacy",
                style: TextStyle(color: TColor.text),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "We prioritize your privacy by using advanced encryption to protect your data. Our services comply with GDPR and CCPA regulations to ensure transparency and security.",
                    style: TextStyle(color: TColor.textSecondary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
