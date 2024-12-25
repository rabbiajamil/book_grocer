import 'package:flutter/material.dart';
import 'package:book_grocer/view/pdf_viewer/pdf_viewer.dart';
import '../../common/color_extenstion.dart';

class Business extends StatelessWidget {
  const Business({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> businessBooks = [
      {
        "name": "Where the Crawdads Sing",
        "author": "by Delia Owens",
        "img": "assets/img/99.jpg",
        "pdf": "assets/pdf/1.pdf"
      },
      {
        "name": "It Ends With Us",
        "author": "by Colleen Hoover",
        "img": "assets/img/98.webp",
        "pdf": "assets/pdf/2.pdf"
      },
      {
        "name": "Atomic Habits",
        "author": "by James Clear",
        "img": "assets/img/97.jpg",
        "pdf": "assets/pdf/3.pdf"
      },
      {
        "name": "The Midnight Library",
        "author": "by Matt Haig",
        "img": "assets/img/96.jpg",
        "pdf": "assets/pdf/4.pdf"
      },
      {
        "name": "The Alchemist",
        "author": "by Paulo Coelho",
        "img": "assets/img/95.jpg",
        "pdf": "assets/pdf/5.pdf"
      },
      {
        "name": "The Four Agreements",
        "author": "by Don Miguel Ruiz",
        "img": "assets/img/94.jpg",
        "pdf": "assets/pdf/6.pdf"
      },
      {
        "name": "The 48 Laws of Power",
        "author": "by Robert Greene",
        "img": "assets/img/93.png",
        "pdf": "assets/pdf/7.pdf"
      },
      {
        "name": "Becoming",
        "author": "by Michelle Obama",
        "img": "assets/img/92.jpg",
        "pdf": "assets/pdf/8.pdf"
      },
      {
        "name": "Dune",
        "author": "by Frank Herbert",
        "img": "assets/img/91.jpg",
        "pdf": "assets/pdf/9.pdf"
      },
      {
        "name": "Educated",
        "author": "by Tara Westover",
        "img": "assets/img/80.jpg",
        "pdf": "assets/pdf/10.pdf"
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
