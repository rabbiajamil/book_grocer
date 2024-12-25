import 'package:book_grocer/common/color_extenstion.dart';
import 'package:flutter/material.dart';

class OurBooksView extends StatefulWidget {
  const OurBooksView({super.key});

  @override
  State<OurBooksView> createState() => _OurBooksViewState();
}

class _OurBooksViewState extends State<OurBooksView> {
  List<String> imageArr = ["assets/img/bb.jpeg", "assets/img/aa.jpeg", "assets/img/98.webp"];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  "assets/img/our_books_top.png",
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: SizedBox(
                    height: media.width * 0.9,
                    width: media.width,
                    child: PageView.builder(
                      itemCount: imageArr.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(
                            imageArr[index],
                            height: 120,
                            fit: BoxFit.fitHeight,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      imageArr.length,
                          (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: currentIndex == index ? 10 : 8,
                        height: currentIndex == index ? 10 : 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == index
                              ? TColor.primary
                              : TColor.subTitle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    """The "Book Grocer" app is a simple and easy-to-use app designed for people who love reading and want to buy books online. Developed by us, a team of university students, the app is made for students and young professionals looking for an easy shopping experience.

With a small budget, we focused on key features like personalized book recommendations, easy browsing, and a smooth checkout process. In addition to buying books, users can also read books online and add them to their cart for later purchase.

The goal of the app is to make buying and reading books online quick and easy.""",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: TColor.textSecondary, fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LearnMorePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColor.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 25,
                      ),
                    ),
                    child: const Text(
                      "Learn More",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LearnMorePage extends StatelessWidget {
  const LearnMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        title: const Text("Learn More"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          "Explore more features of the 'Book Grocer' app, including curated book lists, exclusive deals, and an interactive reading experience tailored just for you!",
          style: TextStyle(fontSize: 16, color: TColor.textSecondary),
        ),
      ),
    );
  }
}
