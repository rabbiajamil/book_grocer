import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart'; // For sharing app links

import '../../common/color_extenstion.dart';
import '../../common_widget/your_review_row.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final List<String> purArr = ["assets/img/p1.jpg", "assets/img/p2.jpg", "assets/img/p3.jpg"];

  final List<Map<String, dynamic>> sResultArr = [
    {
      "img": "assets/img/p1.jpg",
      "description": "A must read for everybody. This book taught me so many things about...",
      "rate": 5.0
    },
    {
      "img": "assets/img/p2.jpg",
      "description": "#1 international bestseller and award-winning history book.",
      "rate": 4.0
    }
  ];

  void _shareApp() {
    Share.share('Check out this amazing app: [App Link]');
  }

  void _logout() {
    Navigator.pushReplacementNamed(context, '/login'); // Example route for logout
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Help'),
          content: const Text('For any assistance, please contact support@example.com or call +123456789.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: TColor.primary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _shareApp,
            icon: Icon(
              Icons.share,
              color: TColor.primary,
            ),
          ),
          IconButton(
            onPressed: _logout,
            icon: Icon(
              Icons.logout,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileSection(),
            _buildEditProfileButton(),
            _buildStatsSection(),
            _buildSectionTitle("Your purchases (21)"),
            _buildHorizontalScroll(media, purArr),
            _buildSectionTitle("Your reviews (7)"),
            _buildReviewsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Eman ",
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Constantly travelling and keeping up to date with business related books.",
                  style: TextStyle(color: TColor.subTitle, fontSize: 13),
                )
              ],
            ),
          ),
          const SizedBox(width: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Image.asset(
              "assets/img/121.jpeg",
              width: 70,
              height: 70,
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }

  Widget _buildEditProfileButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Icon(Icons.near_me_sharp, color: TColor.subTitle, size: 15),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              " Pakistan",
              style: TextStyle(color: TColor.subTitle, fontSize: 13),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/editProfile');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: TColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Edit Profile',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Row(
        children: [
          _buildStatItem("21", "Books"),
          const SizedBox(width: 30),
          _buildStatItem("5", "Reviews"),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(
              color: TColor.subTitle, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: TColor.subTitle, fontSize: 11),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Text(
        title,
        style: TextStyle(
            color: TColor.subTitle, fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildHorizontalScroll(Size media, List<String> items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((iName) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 2, offset: Offset(0, 1))
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                iName,
                height: media.width * 0.5,
                fit: BoxFit.fitHeight,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildReviewsList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
      itemCount: sResultArr.length,
      itemBuilder: (context, index) {
        final rObj = sResultArr[index];
        return YourReviewRow(sObj: rObj);
      },
    );
  }
}
