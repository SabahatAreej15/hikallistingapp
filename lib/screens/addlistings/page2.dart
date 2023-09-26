import 'package:flutter/material.dart';
import 'package:realestate/screens/addlistings/page1.dart';
import 'package:realestate/screens/addlistings/page3.dart';
// import 'package:realestate/screens/addlisting1.dart';
import 'package:realestate/theme/theme.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  TextEditingController _property = TextEditingController(text: 'house');

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
            // APP BAR
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
            // BASIC INFO CONTAINER
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 8),
              child: Container(
                height: 100,
                width: double.infinity,
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
                                ? CustomAppTheme().creamLight.withOpacity(0.7)
                                : CustomAppTheme().blackFade,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
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
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Property Type",
                        style: TextStyle(
                          color: dark
                              ? CustomAppTheme().colorWhite
                              : CustomAppTheme().colorBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(),
                          width: double.infinity,
                          height: 62,
                          child: DropdownButtonFormField<String>(
                            style: TextStyle(
                              color: dark
                                  ? CustomAppTheme().cardWhite
                                  : CustomAppTheme().colorBlack,
                            ),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: CustomAppTheme().colorGrey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: CustomAppTheme().colorGrey),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            isExpanded: true,
                            value: _property.text,
                            onChanged: (newValue) {
                              setState(() {
                                _property.text = newValue!;
                              });
                            },
                            items: <DropdownMenuItem<String>>[
                              DropdownMenuItem(
                                child: Text(
                                  'house',
                                  style: TextStyle(
                                      color: dark
                                          ? CustomAppTheme().colorBlack
                                          : CustomAppTheme().colorBlack),
                                ),
                                value: 'house',
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'villa',
                                  style: TextStyle(
                                      color: dark
                                          ? CustomAppTheme().colorBlack
                                          : CustomAppTheme().colorBlack),
                                ),
                                value: 'villa',
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'appartment',
                                  style: TextStyle(
                                      color: dark
                                          ? CustomAppTheme().colorBlack
                                          : CustomAppTheme().colorBlack),
                                ),
                                value: 'appartment',
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'office',
                                  style: TextStyle(
                                      color: dark
                                          ? CustomAppTheme().colorBlack
                                          : CustomAppTheme().colorBlack),
                                ),
                                value: 'office',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Listing Type",
                          style: TextStyle(
                              color: dark
                                  ? CustomAppTheme().colorWhite
                                  : CustomAppTheme().colorBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: CustomAppTheme().colorGrey,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "For Sale",
                                  style: TextStyle(
                                      color: dark
                                          ? CustomAppTheme().colorWhite
                                          : CustomAppTheme().colorBlack),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: CustomAppTheme().colorGrey,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "For Rent",
                                  style: TextStyle(
                                      color: dark
                                          ? CustomAppTheme().colorWhite
                                          : CustomAppTheme().colorBlack),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Rooms detail
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Property Room",
                              style: TextStyle(
                                  color: dark
                                      ? CustomAppTheme().colorWhite
                                      : CustomAppTheme().colorBlack,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 40.0),
                                  child: Text(
                                    "Bedroom",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: dark
                                          ? CustomAppTheme().colorWhite
                                          : CustomAppTheme().colorBlack,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 25.0),
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      border: Border.all(
                                        color: CustomAppTheme().colorGrey,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.add_circle_outline,
                                          color: dark
                                              ? CustomAppTheme().colorWhite
                                              : CustomAppTheme().colorBlack,
                                          size: 18,
                                        ),
                                        Text(
                                          "1",
                                          style: TextStyle(
                                              color: dark
                                                  ? CustomAppTheme().colorWhite
                                                  : CustomAppTheme()
                                                      .colorBlack),
                                        ),
                                        Icon(
                                          Icons.remove_circle_outline_outlined,
                                          color: dark
                                              ? CustomAppTheme().colorWhite
                                              : CustomAppTheme().colorBlack,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Text(
                                    "Bathroom",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: dark
                                          ? CustomAppTheme().colorWhite
                                          : CustomAppTheme().colorBlack,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(
                                      color: CustomAppTheme().colorGrey,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.add_circle_outline,
                                        color: dark
                                            ? CustomAppTheme().colorWhite
                                            : CustomAppTheme().colorBlack,
                                        size: 18,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            color: dark
                                                ? CustomAppTheme().colorWhite
                                                : CustomAppTheme().colorBlack),
                                      ),
                                      Icon(
                                        Icons.remove_circle_outline_outlined,
                                        color: dark
                                            ? CustomAppTheme().colorWhite
                                            : CustomAppTheme().colorBlack,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Page1(),
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
                                    builder: (context) => Page3(),
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
