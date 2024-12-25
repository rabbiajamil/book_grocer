import 'package:book_grocer/common/color_extenstion.dart';
import 'package:book_grocer/view/book_reading/book_reading_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../common_widget/best_seller_cell.dart';
import '../../common_widget/genres_cell.dart';
import '../../common_widget/recently_cell.dart';
import '../../common_widget/popular_cell.dart';
import '../../common_widget/top_picks_cell.dart';
//import '../login/sign_up_view.dart';
import '../main_tab/main_tab_view.dart';
import '../../common_widget/book_summary.dart';
import 'package:book_grocer/view/pdf_viewer/pdf_viewer.dart';
import 'package:book_grocer/view/search/search_view.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  List topPicksArr = [
    {
      "name": "Man's Search for Meaning",
      "author": "Viktor E. Frankl",
      "img": "assets/img/20.webp",
      "pdf": "assets/pdf/25.pdf"
    },
    {
      "name": "Becoming",
      "author": "by Michelle Obama",
      "img": "assets/img/92.jpg",
      "pdf": "assets/pdf/8.pdf"
    },
    {
      "name": "The Time Travellers Handbook",
      "author": "Stride Lottie",
      "img": "assets/img/3.jpg",
      "pdf": "assets/pdf/26.pdf"
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
  ];
  List bestArr = [
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
    }
  ];

  List genresArr = [
    {
      "name": "Graphic Novels",
      "img": "assets/img/g1.png",
    },
    {
      "name": "self help",
      "img": "assets/img/21.jpg",
    },
    {
      "name": "Biography",
      "img": "assets/img/23.jpg",
    }
  ];
List recentArr = [
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
  List SummaryArr = [
    {
      "name": "Game of Thrones",
      "author": "by George R.R. Martin",  // Corrected author
      "img": "assets/img/aa.jpeg",
      "rating": 4.8
    },
    {
      "name": "1984",
      "author": "by George Orwell",  // Corrected author
      "img": "assets/img/bb.jpeg",
      "rating": 4.5
    },
    {
      "name": "The Kite Runner",
      "author": "by Khaled Hosseini",  // Corrected author
      "img": "assets/img/cc.jpeg",
      "rating": 4.8
    },
    {
      "name": "War and Peace",
      "author": "by Leo Tolstoy",  // Corrected author
      "img": "assets/img/dd.jpeg",
      "rating": 4.8
    },
    {
      "name": "Beloved",
      "author": "by Toni Morrison",  // Corrected author
      "img": "assets/img/kk.jpeg",
      "rating": 4.8
    },
    {
      "name": "A Little Life",
      "author": "by Hanya Yanagihara",  // Corrected author
      "img": "assets/img/jj.jpeg",
      "rating": 4.8
    },

    {
      "name": "The Book Thief",
      "author": "by Markus Zusak",
      "img": "assets/img/81.jpg",
      "rating": 4.8
    },
    {
      "name": "Atomic Habits",
      "author": "by James Clear",
      "img": "assets/img/97.jpg",
      "rating": 4.8
    },

    {
      "name": "The Silent Patient",
      "author": "by Alex Michaelides",
      "img": "assets/img/85.jpg",
      "rating": 4.8
    }

  ];

  List popularArr = [
    {
      "name": "J.K. Rowling",
      "img": "assets/img/h.jpeg",
      "pdf": "assets/pdf/16.pdf"
    },
    {
      "name": "George Orwell",
      "img": "assets/img/r.jpeg",
      "pdf": "assets/pdf/17.pdf"
    },

    {
      "name": "Leo Tolstoy",
      "img": "assets/img/a.jpeg",
      "pdf": "assets/pdf/18.pdf"
    },
    {
      "name": "Charles Dickens ",
      "img": "assets/img/b.jpeg",
      "pdf": "assets/pdf/18.pdf"
    },
    {
      "name": "William Shakespeare  ",
      "img": "assets/img/download.jpeg",
      "pdf": "assets/pdf/18.pdf"
    },


  ];



  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  child: Transform.scale(
                    scale: 1.5,
                    origin: Offset(0, media.width * 0.8),
                    child: Container(
                      width: media.width,
                      height: media.width,
                      decoration: BoxDecoration(
                          color: TColor.primary,
                          borderRadius:
                          BorderRadius.circular(media.width * 0.5)),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Row(children: const [
                        Text(
                          "Our Top Picks",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                      leading: Container(),
                      leadingWidth: 1,
                      actions: [
                        IconButton(
                            onPressed: () {

                              sideMenuScaffoldKey.currentState?.openEndDrawer();

                            }, icon: const Icon(Icons.menu))
                      ],
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.8,
                      child: CarouselSlider.builder(
                        itemCount: topPicksArr.length,
                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                          var iObj = topPicksArr[itemIndex] as Map? ?? {};

                          return GestureDetector(
                            onTap: () {
                              String pdfPath = iObj['pdf'] ?? ''; // Ensure a valid PDF path exists

                              // Navigate to PdfViewerPage with the correct PDF path
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PdfViewerPage(pdfPath: pdfPath),
                                ),
                              );
                            },
                            child: TopPicksCell(
                              iObj: iObj,
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          viewportFraction: 0.45,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Bestsellers",  // Title for the Bestsellers section
                            style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                         ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.7, // Adjust height as per your design
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                        scrollDirection: Axis.horizontal,
                        itemCount: bestArr.length,  // Use bestArr for bestsellers
                        itemBuilder: (context, index) {
                          var bObj = bestArr[index] as Map? ?? {};  // Get book data from bestArr

                          return GestureDetector(
                            onTap: () {
                              String pdfPath = bObj['pdf'];  // Get the PDF path for the book

                              // Navigate to PdfViewerPage with the correct PDF path
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PdfViewerPage(pdfPath: pdfPath),
                                ),
                              );
                            },
                            child: BestSellerCell(bObj: bObj),  // Use BestSellerCell to display book details
                          );
                        },
                      ),
                    ),



                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "Genres",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: media.width * 0.6,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                        scrollDirection: Axis.horizontal,
                        itemCount: genresArr.length,
                        itemBuilder: ((context, index) {
                          var bObj = genresArr[index] as Map? ?? {};

                          return GestureDetector(
                            onTap: () {
                              // Navigate to the _SearchViewState page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchView(), // Replace with your _SearchViewState page
                                ),
                              );
                            },
                            child: GenresCell(
                              bObj: bObj,
                              bgcolor: index % 2 == 0
                                  ? TColor.color1
                                  : TColor.color2,
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Books For You",
                            style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.7,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                        scrollDirection: Axis.horizontal,
                        itemCount: recentArr.length,
                        itemBuilder: (context, index) {
                          var bObj = recentArr[index] as Map? ?? {};

                          return GestureDetector( // Ensure the GestureDetector is returned here
                            onTap: () {
                              String pdfPath = bObj['pdf'];

                              // Navigate to PdfViewerPage with the correct PDF path
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PdfViewerPage(pdfPath: pdfPath),
                                ),
                              );
                            },
                            child: RecentlyCell(iObj: bObj),
                          );
                        },
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "Books Summary",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: media.width * 0.9,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: SummaryArr.length,
                          itemBuilder: ((context, index) {
                            var bObj = SummaryArr[index] as Map? ?? {};

                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BookReadingView(bObj: bObj,) ) );
                              },
                              child: BookSummaryWidget(
                                bObj: bObj,
                              ),
                            );
                          })),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Popular Author & Series",
                            style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: media.width * 0.7,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                        scrollDirection: Axis.horizontal,
                        itemCount: popularArr.length,
                        itemBuilder: (context, index) {
                          var bObj = popularArr[index] as Map? ?? {};

                          return GestureDetector( // Ensure the GestureDetector is returned here
                            onTap: () {
                              String pdfPath = bObj['pdf'];

                              // Navigate to PdfViewerPage with the correct PDF path
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PdfViewerPage(pdfPath: pdfPath),
                                ),
                              );
                            },
                            child: PopularCell(iObj: bObj),
                          );
                        },
                      ),
                    ),

                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
