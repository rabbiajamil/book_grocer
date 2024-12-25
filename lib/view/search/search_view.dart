import 'package:book_grocer/view/search/search_fiter_view.dart';
import 'package:book_grocer/view/search/search_force_view.dart';
import 'package:flutter/material.dart';
import '../../common/color_extenstion.dart';
import '../../common_widget/search_grid_cell.dart';
import '../../common/extenstion.dart';
import 'package:book_grocer/view/new_release/new_release.dart';
import 'package:book_grocer/view/cart/Add_to_cart.dart';


class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txtSearch = TextEditingController();
  int selectTag = 0;
  List tagsArr = ["Genre", "New Release"];

  List searchArr = [
    {
      "name": "Biography",
      "img": "assets/img/111.jpeg",
    },
    {
      "name": "Business",
      "img": "assets/img/b2.jpg",
    },
    {
      "name": "Children",
      "img": "assets/img/b3.jpg",
    },
    {
      "name": "Cookery",
      "img": "assets/img/b4.jpg",
    },
    {
      "name": "Fiction",
      "img": "assets/img/b5.jpg",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/img/b6.jpg",
    },
  ];

  List recentArr = [
    {
      "name": "Where the Crawdads Sing",
      "author": "by Delia Owens",
      "img": "assets/img/99.jpg",
      "rating": 4.8,
      "pdf": "assets/pdf/1.pdf"
    },
    {
      "name": "It Ends With Us",
      "author": "by Colleen Hoover",
      "img": "assets/img/98.webp",
      "rating": 4.7,
      "pdf": "assets/pdf/2.pdf"
    },
    {
      "name": "Atomic Habits",
      "author": "by James Clear",
      "img": "assets/img/97.jpg",
      "rating": 4.9,
      "pdf": "assets/pdf/3.pdf"
    },
    {
      "name": "The Midnight Library",
      "author": "by Matt Haig",
      "img": "assets/img/96.jpg",
      "rating": 4.6,
      "pdf": "assets/pdf/4.pdf"
    },
    {
      "name": "The Alchemist",
      "author": "by Paulo Coelho",
      "img": "assets/img/95.jpg",
      "rating": 4.7,
      "pdf": "assets/pdf/5.pdf"
    },
    {
      "name": "The Four Agreements",
      "author": "by Don Miguel Ruiz",
      "img": "assets/img/94.jpg",
      "rating": 4.5,
      "pdf": "assets/pdf/6.pdf"
    },
    {
      "name": "The 48 Laws of Power",
      "author": "by Robert Greene",
      "img": "assets/img/93.png",
      "rating": 4.4,
      "pdf": "assets/pdf/7.pdf"
    },
    {
      "name": "Becoming",
      "author": "by Michelle Obama",
      "img": "assets/img/92.jpg",
      "rating": 4.8,
      "pdf": "assets/pdf/8.pdf"
    },
    {
      "name": "Dune",
      "author": "by Frank Herbert",
      "img": "assets/img/91.jpg",
      "rating": 4.6,
      "pdf": "assets/pdf/9.pdf"
    },
    {
      "name": "Educated",
      "author": "by Tara Westover",
      "img": "assets/img/80.jpg",
      "rating": 4.7,
      "pdf": "assets/pdf/10.pdf"
    },
    {
      "name": "The Book Thief",
      "author": "by Markus Zusak",
      "img": "assets/img/81.jpg",
      "rating": 4.8,
      "pdf": "assets/pdf/11.pdf"
    },
    {
      "name": "Sapiens: A Brief History of Humankind",
      "author": "by Yuval Noah Harari",
      "img": "assets/img/82.jpg",
      "rating": 4.8,
      "pdf": "assets/pdf/12.pdf"
    },
    {
      "name": "The Subtle Art of Not Giving a F*ck",
      "author": "by Mark Manson",
      "img": "assets/img/83.png",
      "rating": 4.4,
      "pdf": "assets/pdf/13.pdf"
    },
    {
      "name": "The Seven Husbands of Evelyn Hugo",
      "author": "by Taylor Jenkins Reid",
      "img": "assets/img/84.jpg",
      "rating": 4.7,
      "pdf": "assets/pdf/14.pdf"
    },
    {
      "name": "The Silent Patient",
      "author": "by Alex Michaelides",
      "img": "assets/img/85.jpg",
      "rating": 4.6,
      "pdf": "assets/pdf/15.pdf"
    },
    {
      "name": "The Power of Now",
      "author": "by Eckhart Tolle",
      "img": "assets/img/50.jpg",
      "pdf": "assets/pdf/16.pdf"
    },
    {
      "name": "You Are a Badass",
      "author": "by Jen Sincero",
      "img": "assets/img/51.jpg",
      "pdf": "assets/pdf/17.pdf"
    },

    {
      "name": "Think and Grow Rich",
      "author": "by Napoleon Hill",
      "img": "assets/img/52.webp",
      "pdf": "assets/pdf/18.pdf"
    },
    {
      "name": "The 7 Habits of Highly Effective People",
      "author": "by Stephen R. Covey",
      "img": "assets/img/54.jpg",
      "pdf": "assets/pdf/19.pdf"
    },
    {
      "name": "Dare to Lead",
      "author": "by Brené Brown",
      "img": "assets/img/55.png",
      "pdf": "assets/pdf/20.pdf"
    },
    {
      "name": "Grit",
      "author": "by Angela Duckworth",
      "img": "assets/img/56.jpg",
      "pdf": "assets/pdf/21.pdf"
    },
    {
      "name": "The Miracle Morning",
      "author": "by Hal Elrod",
      "img": "assets/img/57.webp",
      "pdf": "assets/pdf/22.pdf"
    },
    {
      "name": "The Gifts of Imperfection",
      "author": "by Brené Brown",
      "img": "assets/img/58.jpg",
      "pdf": "assets/pdf/23.pdf"
    },

    {
      "name": "The Power of Your Subconscious Mind",
      "author": "by Joseph Murphy",
      "img": "assets/img/59.jpg",
      "pdf": "assets/pdf/24.pdf"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: TColor.textbox,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: txtSearch,
                  onChanged: (value) {
                    setState(() {});
                  },
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchForceView(
                          didSearch: (sText) {
                            txtSearch.text = sText;
                            setState(() {});
                          },
                        ),
                      ),
                    );
                    endEditing();
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 8),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: TColor.text),
                    suffixIcon: SizedBox(
                      width: 40,
                      child: IconButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchFilterView(
                                didFilter: (fObj) {
                                  setState(() {});
                                },
                              ),
                            ),
                          );
                          endEditing();
                        },
                        icon: Icon(Icons.tune, color: TColor.text),
                      ),
                    ),
                    hintText: "Search Books. Authors. or ISBN",
                    labelStyle: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            if (txtSearch.text.isNotEmpty)
              const SizedBox(
                width: 8,
              ),
            if (txtSearch.text.isNotEmpty)
              TextButton(
                onPressed: () {
                  txtSearch.text = "";
                  setState(() {});
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: TColor.text,
                    fontSize: 17,
                  ),
                ),
              ),
          ],
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: tagsArr.map((tagName) {
                  var index = tagsArr.indexOf(tagName);
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectTag = index;
                          if (tagName == "New Release") {
                            // Navigate to NewReleasePage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewReleasePage(
                                  books: recentArr,
                                ),
                              ),
                            );
                          }
                        });
                      },
                      child: Text(
                        tagName,
                        style: TextStyle(
                          color: selectTag == index ? TColor.text : TColor.subTitle,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          if (txtSearch.text.isNotEmpty)
          // If there's search text, show AddToCartPage
            Expanded(
              child: AddToCartPage(),
            )
          else if (selectTag == tagsArr.indexOf("Genre"))
          // If "Genre" tag is selected, show SearchGridCell
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.75,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: searchArr.length,
                itemBuilder: (context, index) {
                  var sObj = searchArr[index];
                  return SearchGridCell(
                    sObj: sObj,
                    index: index,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }}
