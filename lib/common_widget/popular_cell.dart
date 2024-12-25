import 'package:flutter/material.dart';
import '../common/color_extenstion.dart';
import 'package:book_grocer/view/pdf_viewer/pdf_viewer.dart';

class PopularCell extends StatelessWidget {
  final Map iObj;

  const PopularCell({super.key, required this.iObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    // Retrieve image, name, and PDF path with null checks
    String imagePath = iObj["img"]?.toString() ?? 'assets/images/default_cover.png'; // Fallback image
    String name = iObj["name"]?.toString() ?? "Unknown";
    String pdfPath = iObj["pdf"]?.toString() ?? "";

    return GestureDetector(
      onTap: () {
        if (pdfPath.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PdfViewerPage(pdfPath: pdfPath),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("PDF not available for $name")),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: media.width * 0.32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0, 2),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: media.width * 0.32,
                  height: media.width * 0.50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: TColor.text,
                fontSize: 12, // Adjusted font size for better visibility
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
