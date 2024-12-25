import 'package:flutter/material.dart';

class GenresCell extends StatelessWidget {
  final Map bObj;
  final Color bgcolor;
  const GenresCell({super.key, required this.bObj, required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bgcolor, // Ensure this color is visible
        borderRadius: BorderRadius.circular(15),
      ),
      width: media.width * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: media.width * 0.6,
            height: media.width * 0.25,
            decoration: BoxDecoration(
              color: bgcolor, // Set the same background color for the image container
              borderRadius: BorderRadius.circular(8), // Optional for rounded corners
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Match container corners
              child: Image.asset(
                bObj["img"].toString(),
                fit: BoxFit.cover, // Ensures image fits without distortion
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text(
                      "Image not found",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            bObj["name"].toString(),
            maxLines: 3,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
