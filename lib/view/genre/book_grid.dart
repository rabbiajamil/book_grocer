import 'package:flutter/material.dart';
import 'package:book_grocer/view/pdf_viewer/pdf_viewer.dart';
import '../../common/color_extenstion.dart';

class BookGridPage extends StatelessWidget {
  const BookGridPage ({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> businessBooks = [
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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TColor.primary,
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: TColor.primaryLight,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Center(
            child: Text(
              "Business",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: TColor.text,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            itemCount: businessBooks.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 0.7,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PdfViewerPage(
                        pdfPath: businessBooks[index]["pdf"]!,
                      ),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Image.asset(
                            businessBooks[index]["img"]!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                businessBooks[index]["name"]!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                businessBooks[index]["author"]!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
