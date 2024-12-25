import 'package:flutter/material.dart';
import 'package:book_grocer/view/pdf_viewer/pdf_viewer.dart';
import '../../common/color_extenstion.dart';

class Children extends StatelessWidget {
  const Children ({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> businessBooks = [
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
