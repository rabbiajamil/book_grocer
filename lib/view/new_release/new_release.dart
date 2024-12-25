import 'package:flutter/material.dart';
import 'package:book_grocer/view/pdf_viewer/pdf_viewer.dart';
import '../../common/color_extenstion.dart';

class NewReleasePage extends StatelessWidget {
  final List books;

  const NewReleasePage({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,  // Removes shadow
        backgroundColor: TColor.primary,  // Use primary color from TColor extension
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: TColor.primaryLight,  // Use light green background from TColor
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Center(
            child: Text(
              "New Releases",  // Title of the page
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: TColor.text,  // Text color from TColor
              ),
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.75,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          var book = books[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfViewerPage(pdfPath: book['pdf']),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      book['img'],
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    book['name'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: TColor.text,  // Use primary text color
                    ),
                  ),
                ),
                Text(
                  book['author'],
                  style: TextStyle(
                    fontSize: 14,
                    color: TColor.textSecondary,  // Use secondary text color
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
