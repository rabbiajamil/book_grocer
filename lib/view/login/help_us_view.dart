import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:book_grocer/common/color_extenstion.dart';
import 'package:book_grocer/view/onboarding/welcome_view.dart';
class HelpUsView extends StatefulWidget {
  const HelpUsView({super.key});

  @override
  State<HelpUsView> createState() => _HelpUsViewState();
}

class _HelpUsViewState extends State<HelpUsView> {
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: TColor.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Help Us Help You",
                style: TextStyle(
                    color: TColor.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "It seems this is your first time using our app. Please enter your location so we can filter our results and stock accordingly to your local store.",
                style: TextStyle(color: TColor.subTitle, fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "If you choose to skip, you can change your location at any time in your account settings.",
                style: TextStyle(color: TColor.subTitle, fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Choose Country"),

              const SizedBox(
                height: 15,
              ),
              // Country List Picker
              CountryListPick(
                onChanged: (CountryCode? country) {
                  setState(() {
                    selectedCountry = country?.name;
                  });
                  print("Selected Country: ${country?.name}");
                },
                initialSelection: '+92', // Pakistan by default
              ),

              const SizedBox(
                height: 15,
              ),
              if (selectedCountry != null) ...[
                Text(
                  "Selected Country: $selectedCountry",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
              const SizedBox(
                height: 15,
              ),
              // Skip Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const WelcomeView()),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: TColor.primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
