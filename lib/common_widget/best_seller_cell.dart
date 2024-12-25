import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../common/color_extenstion.dart';
import 'package:book_grocer/view/pdf_viewer/pdf_viewer.dart';

class BestSellerCell extends StatelessWidget {
  final Map bObj;
  const BestSellerCell({super.key, required this.bObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: media.width * 0.27, // Adjust width as per your design
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ensure column takes only necessary space
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book Image
          GestureDetector(
            onTap: () {
              String pdfPath = bObj['pdf'] ?? '';
              if (pdfPath.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfViewerPage(pdfPath: pdfPath),
                  ),
                );
              }
            },
            child: Container(
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
                  bObj["img"].toString(),
                  width: media.width * 0.25,
                  height: media.width * 0.45, // Adjust height as per your design
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8, // Reduced space between image and text
          ),
          // Book Name
          Container(
            width: media.width * 0.32, // Ensure the name fits within the available width
            child: Text(
              bObj["name"].toString(),
              maxLines: 1, // Limit the number of lines to 2
              overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
              textAlign: TextAlign.left,
              style: TextStyle(
                color: TColor.text,
                fontSize: 9, // Adjusted font size for better fit
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 5, // Reduced space between book name and author
          ),
          // Book Author
          Container(
            width: media.width * 0.32, // Ensure the author fits within the available width
            child: Text(
              bObj["author"].toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
              textAlign: TextAlign.left,
              style: TextStyle(
                color: TColor.subTitle,
                fontSize: 8, // Adjust font size for author name
              ),
            ),
          ),
          const SizedBox(
            height: 5, // Reduced space between author and rating
          ),
          // Rating Bar
          IgnorePointer(
            ignoring: true,
            child: RatingBar.builder(
              initialRating: double.tryParse(bObj["rating"].toString()) ?? 1,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 12,
              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: TColor.primary,
              ),
              onRatingUpdate: (rating) {},
            ),
          ),
        ],
      ),
    );
  }
}
