import 'package:book_grocer/common/color_extenstion.dart';
import 'package:flutter/material.dart';

import '../account/account_view.dart';
import '../home/home_view.dart';
import '../About_us/out_books_view.dart';
import '../search/search_view.dart';
import '../Audio/audio_books_view.dart';
import '../feedback/feedback_page.dart';
import '../Terms/TermsPage.dart';
import '../dictionary/dictionary_view.dart';
import '../privacy/privacy_page.dart';
import '../cart/Add_to_cart.dart';
import'package:book_grocer/view/privacy/setting.dart';
import'package:book_grocer/view/Notes/NotesPage.dart';
class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

GlobalKey<ScaffoldState> sideMenuScaffoldKey = GlobalKey<ScaffoldState>();

class _MainTabViewState extends State<MainTabView>
    with TickerProviderStateMixin {
  TabController? controller;

  int selectMenu = 0;

  List menuArr = [
    {"name": "Home", "icon": Icons.home},
    {"name": "About Us", "icon": Icons.book},
    {"name": "Audio Books", "icon": Icons.audiotrack},
    {"name": "Dictionary", "icon": Icons.menu_book},
    {"name": "Add to cart", "icon": Icons.add_shopping_cart},
    {"name": "FeedBack", "icon": Icons.newspaper},
    {"name": "Search Books", "icon": Icons.search},
    {"name": "Account", "icon": Icons.account_circle},
    {"name": "Notes", "icon": Icons.note_alt}, // Added Notes item
  ];


  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      key: sideMenuScaffoldKey,
      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        width: media.width * 0.8,
        child: Container(
          decoration: BoxDecoration(
            color: TColor.dColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(media.width * 0.7),
            ),
            boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 15)],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: menuArr.map((mObj) {
                    var index = menuArr.indexOf(mObj);
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 15),
                      decoration: selectMenu == index
                          ? BoxDecoration(
                          color: TColor.primary,
                          boxShadow: [
                            BoxShadow(
                              color: TColor.primary,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            )
                          ])
                          : null,
                      child: GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const HomeView()));
                          } else if (index == 1) {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const OurBooksView()));
                          } else if (index == 2) {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => SpotifySearchScreen()));
                          } else if (index == 3) {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => DictionaryScreen()));
                          } else if (index == 4) {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => AddToCartPage()));
                          } else if (index == 6) {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const SearchView()));
                          } else if (index == 5) {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const FeedbackPage()));
                          } else if (index == 7) {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const AccountView()));
                          } else if (index == 8) {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const NotesPage()));
                          }

                          sideMenuScaffoldKey.currentState?.closeEndDrawer();

                          setState(() {
                            selectMenu = index;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              mObj["name"].toString(),
                              style: TextStyle(
                                color: selectMenu == index
                                    ? Colors.white
                                    : TColor.text,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Icon(
                              mObj["icon"] as IconData? ?? Icons.home,
                              color: selectMenu == index ? Colors.white : TColor.primary,
                              size: 33,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => SettingsPage()));
                        },
                        icon: Icon(
                          Icons.settings,
                          color: TColor.subTitle,
                          size: 25,
                        ),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => TermsPage()));
                        },
                        child: Text(
                          "Terms",
                          style: TextStyle(
                            color: TColor.subTitle,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => PrivacyPage()));
                        },
                        child: Text(
                          "Privacy",
                          style: TextStyle(
                            color: TColor.subTitle,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3, // Number of tabs
        child: Scaffold(
          body: TabBarView(
            controller: controller,
            children: [
              const HomeView(),
              const SearchView(),
              AddToCartPage(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: TColor.primary, // Set background color of BottomAppBar
        child: TabBar(
          controller: controller,
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.search),
              text: "Search",
            ),
            Tab(
              icon: Icon(Icons.shopping_cart),
              text: "Cart",
            ),
          ],
        ),
      ),
    );
  }

}