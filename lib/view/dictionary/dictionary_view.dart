import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../common/color_extenstion.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dictionary App',
      theme: ThemeData(
        primaryColor: TColor.primary,
      ),
      home: DictionaryScreen(),
    );
  }
}

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final TextEditingController _controller = TextEditingController();
  String _definition = "Enter a word to get its definition.";
  bool _loading = false;

  Future<void> _fetchDefinition(String word) async {
    if (word.isEmpty) {
      setState(() {
        _definition = "Please enter a word.";
      });
      return;
    }

    setState(() {
      _loading = true;
      _definition = "";
    });

    final url = Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        setState(() {
          _definition = data[0]['meanings'][0]['definitions'][0]['definition'];
        });
      } else {
        setState(() {
          _definition = "Word not found. Try another.";
        });
      }
    } catch (e) {
      setState(() {
        _definition = "Failed to fetch definition.";
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.dColor,
      appBar: AppBar(
        title: Text(
          'Dictionary',
          style: TextStyle(color: TColor.text, fontWeight: FontWeight.bold),
        ),
        backgroundColor: TColor.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Search input
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: TColor.textbox,
                hintText: 'Enter any word...',
                hintStyle: TextStyle(color: TColor.subTitle, fontSize: 16),
                prefixIcon: Icon(Icons.search, color: TColor.primary),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear, color: TColor.primary),
                  onPressed: () {
                    _controller.clear();
                    setState(() {
                      _definition = "Enter a word to get its definition.";
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
            ),
            SizedBox(height: 20),

            // Search button
            ElevatedButton(
              onPressed: () => _fetchDefinition(_controller.text),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: TColor.primary,
              ),
              child: _loading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
                'Search',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(height: 20),

            // Definition card
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: TColor.primaryLight,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                _definition,
                style: TextStyle(
                  color: TColor.text,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
