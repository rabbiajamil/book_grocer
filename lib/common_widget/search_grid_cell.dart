import 'package:flutter/material.dart';
import 'package:book_grocer/view/genre/Business.dart';
import 'package:book_grocer/view/genre/Children.dart';
import 'package:book_grocer/view/genre/book_grid.dart';
import '../../common/color_extenstion.dart';

class SearchGridCell extends StatelessWidget {
  final Map sObj;
  final int index;

  const SearchGridCell({super.key, required this.sObj, required this.index});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        // Navigate to the category-specific page when tapped
        String category = sObj["name"].toString();

        if (category == "Biography") {
          // Navigate to BookGridPage for Biography
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookGridPage(),
            ),
          );
        } else if (category == "Children") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Children(),
            ),
          );
        } else if (category == "Business") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Business(),
            ),
          );
        } else {
          // Default case: open BookGridPage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookGridPage(),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: TColor.primary, // Use the green color from TColor
          borderRadius: BorderRadius.circular(15),
        ),

        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
        child: Column(
          children: [
            Text(
              sObj["name"].toString(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: sObj.containsKey("img") && sObj["img"].toString().isNotEmpty
                  ? Image.asset(
                sObj["img"].toString(),
                width: media.width * 0.23,
                height: media.width * 0.23 * 1.6,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: media.width * 0.23,
                    height: media.width * 0.23 * 1.6,
                    color: TColor.primary, // Green background color
                    child: const Icon(
                      Icons.broken_image,
                      color: Colors.white,
                      size: 50,
                    ), // Placeholder for broken images
                  );
                },
              )
                  : Container(
                width: media.width * 0.23,
                height: media.width * 0.23 * 1.6,
                color: TColor.primary, // Green background color
                child: const Icon(
                  Icons.image,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
