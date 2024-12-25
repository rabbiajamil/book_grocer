import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart'; // Import audioplayers package
import '../../common/color_extenstion.dart';

class SpotifySearchScreen extends StatefulWidget {
  @override
  _SpotifySearchScreenState createState() => _SpotifySearchScreenState();
}

class _SpotifySearchScreenState extends State<SpotifySearchScreen> {
  final String clientId = '97746b62a0b04982a35babd33366c422'; // Replace with your Spotify Client ID
  final String clientSecret = '0920ae0e1019453195ddb3502aca39c9'; // Replace with your Spotify Client Secret
  final TextEditingController searchController = TextEditingController();
  String? accessToken;
  bool isLoading = false;
  List<dynamic> searchResults = [];
  final AudioPlayer _audioPlayer = AudioPlayer(); // Initialize the audio player

  @override
  void initState() {
    super.initState();
    fetchAccessToken();
  }

  Future<void> fetchAccessToken() async {
    final String tokenUrl = 'https://accounts.spotify.com/api/token';
    final response = await http.post(
      Uri.parse(tokenUrl),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: 'grant_type=client_credentials',
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        accessToken = data['access_token'];
      });
    } else {
      print('Failed to fetch access token: ${response.body}');
    }
  }

  Future<void> searchSpotify(String query) async {
    if (accessToken == null) return;

    setState(() {
      isLoading = true;
    });

    final String searchUrl = 'https://api.spotify.com/v1/search?q=$query&type=track&limit=10';
    final response = await http.get(
      Uri.parse(searchUrl),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        searchResults = data['tracks']['items'];
        isLoading = false;
      });
    } else {
      print('Failed to search: ${response.body}');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> playAudio(String url) async {
    await _audioPlayer.play(UrlSource(url)); // Use UrlSource here directly, no need for Uri.parse
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Books'),
        backgroundColor: TColor.primary, // Use the primary green color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search for a Book...',
                labelStyle: TextStyle(color: TColor.text), // Adjust label color
                border: OutlineInputBorder(),
                filled: true,
                fillColor: TColor.textbox, // Light background for the search box
                suffixIcon: IconButton(
                  icon: Icon(Icons.search, color: TColor.primary), // Green search icon
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      searchSpotify(searchController.text);
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            if (isLoading)
              CircularProgressIndicator(
                color: TColor.primary, // Green loading indicator
              ),
            if (!isLoading && searchResults.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final track = searchResults[index];
                    final previewUrl = track['preview_url'];
                    return Card(
                      color: TColor.dColor, // Light background for each item
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        leading: Image.network(
                          track['album']['images'][0]['url'],
                          width: 50,
                          height: 50,
                        ),
                        title: Text(
                          track['name'],
                          style: TextStyle(color: TColor.text), // Text color
                        ),
                        subtitle: Text(
                          track['artists'][0]['name'],
                          style: TextStyle(color: TColor.textSecondary), // Lighter subtitle text
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.play_arrow, color: TColor.primary),
                          onPressed: () {
                            if (previewUrl != null && previewUrl.isNotEmpty) {
                              print("Preview URL: $previewUrl");
                              playAudio(previewUrl); // Play the audio
                            } else {
                              print("No preview available for this track.");
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}