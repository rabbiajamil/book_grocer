import 'package:flutter/material.dart';
import 'package:book_grocer/common/color_extenstion.dart';

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        title: const Text("Terms and Conditions"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Terms of Service",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: TColor.text,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "1. Introduction\n"
                  "1.1 Who we are: We are Book Grocer, a platform for discovering and purchasing books online. .\n"
                  "1.2 What these terms cover: These terms govern your use of the Book Grocer app and services.\n"
                  "1.3 Why you should read them: Please read these terms carefully to understand your rights and responsibilities when using our platform.\n"
                  "1.4 Privacy: We value your privacy and use your personal data as outlined in our Privacy Policy.\n"
                  "1.5 Third-Party Services: If you download the app from a third-party platform (e.g., Google Play, Apple App Store), their terms may also apply.\n"
                  "1.6 Contact Us: You can reach us at support@bookgrocer.com for any inquiries.\n\n"

                  "2. Creating an Account\n"
                  "2.1 Anyone can use Book Grocer, but you must create an account to make purchases and track your orders.\n"
                  "2.2 Account Details: Ensure the information you provide is accurate and up-to-date.\n"


                  "3. Acceptable Use Policy\n"
                  "3.1 Users agree not to:\n"
                  "- Use Book Grocer for illegal activities.\n"
                  "- Engage in fraudulent activities or infringe intellectual property rights.\n"
                  "- Post harmful or offensive content.\n"
                  "- Use the platform to spread malware or viruses.\n\n"

                  "4. Purchases and Payments\n"
                  "4.1 Book Purchases: You can purchase books via the platform.\n"
                  "4.2 Payment Terms: All transactions are processed securely, and we accept a variety of payment methods.\n\n"

                  "5. Intellectual Property Rights\n"
                  "5.1 All books, content, and services offered on Book Grocer are protected by copyright and other intellectual property laws.\n"
                  "5.2 You can view and purchase books, but you cannot reproduce, distribute, or sell content without permission.\n\n"

                  "6. Modifications to the Platform\n"
                  "6.1 We reserve the right to modify or discontinue services at any time, with or without notice.\n\n"

                  "7. Limitations of Liability\n"
                  "7.1 We are not responsible for any loss or damage that arises from using our platform, except where required by law.\n\n"

                  "8. Governing Law\n"
                  "8.1 These terms are governed by the laws of [Your Country/Region], and any disputes will be handled in [Your Location].\n\n"

                  "9. Updates to Terms\n"
                  "9.1 We may update these terms from time to time. Please review them regularly to stay informed.\n\n"

                  "If you have any questions or need assistance, please contact our support team.",
              style: TextStyle(color: TColor.textSecondary, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
