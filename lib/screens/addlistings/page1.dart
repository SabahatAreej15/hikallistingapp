import 'package:flutter/material.dart';
// import 'package:realestate/screens/addlisting.dart';
import 'package:realestate/screens/addlistings/page2.dart';
import 'package:realestate/screens/listings.dart';
import 'package:realestate/theme/theme.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          dark ? CustomAppTheme().colorBlack : CustomAppTheme().colorWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Bar
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: CustomAppTheme().redBright),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Add Listings',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: CustomAppTheme().colorWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.arrow_left,
                          color: CustomAppTheme().colorWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Expanded Container
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 13),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Basic Info Container
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: dark
                                ? CustomAppTheme().blackFade
                                : CustomAppTheme().creamLight),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Basic Information",
                                style: TextStyle(
                                    color: dark
                                        ? CustomAppTheme()
                                            .creamLight
                                            .withOpacity(0.7)
                                        : CustomAppTheme().blackFade,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Provide information that could help users easily find your property.",
                                  style: TextStyle(
                                      color: dark
                                          ? CustomAppTheme().colorWhite
                                          : CustomAppTheme().colorBlack,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // First TextField
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: dark
                                ? CustomAppTheme().blackFade
                                : CustomAppTheme().creamLight,
                            hintText: 'Title',
                            hintStyle: TextStyle(
                                color: dark
                                    ? CustomAppTheme().colorWhite
                                    : CustomAppTheme().colorBlack),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),

                      // Second TextField
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: dark
                              ? CustomAppTheme().blackFade
                              : CustomAppTheme().creamLight,
                          hintText: 'Location',
                          hintStyle: TextStyle(
                              color: dark
                                  ? CustomAppTheme().colorWhite
                                  : CustomAppTheme().colorBlack),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          "Please enter a title and loction to get best possible reponses to your listing. Tell other users about the property and its location",
                          style: TextStyle(color: CustomAppTheme().colorGrey),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Listings(),
                                ),
                              );
                            },
                            child: Text(
                              "Back",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: dark
                                      ? CustomAppTheme().colorWhite
                                      : CustomAppTheme().colorBlack),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Page2(),
                                ),
                              );
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: dark
                                      ? CustomAppTheme().colorWhite
                                      : CustomAppTheme().colorBlack),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
