import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realestate/screens/addlistings/page2.dart';
import 'package:realestate/theme/theme.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List<XFile>? _selectedImages;

  Future<void> _selectImagesFromGallery() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();

    if (pickedImages != null) {
      setState(() {
        _selectedImages = pickedImages;
      });
    }
  }

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
                          Icons.arrow_back,
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
                      : CustomAppTheme().creamLight,
                  // border: Border.all(
                  //   color: dark
                  //       ? CustomAppTheme().colorWhite
                  //       : CustomAppTheme().colorBlack,
                  //   width: 1.0,
                  // ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Images",
                        style: TextStyle(
                          color: dark
                              ? CustomAppTheme().colorWhite
                              : CustomAppTheme().colorBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Select at least 3 images and a maximum of 10.",
                          style: TextStyle(
                            color: dark
                                ? CustomAppTheme().colorWhite
                                : CustomAppTheme().colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  children: [
                    // DOTTED CONTAINER
                    DottedBorder(
                      borderType: BorderType.RRect,
                      strokeWidth: 1,
                      dashPattern: [4, 4],
                      radius: Radius.circular(12),
                      padding: EdgeInsets.all(6),
                      color: dark
                          ? CustomAppTheme().colorWhite
                          : CustomAppTheme().colorBlack,
                      child: _selectedImages != null &&
                              _selectedImages!.isNotEmpty
                          ? Column(
                              children: _selectedImages!
                                  .map((image) => Image.file(File(image.path)))
                                  .toList(),
                            )
                          : Container(
                              height: 300,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  "No picture has been selected",
                                  style: TextStyle(
                                    color: dark
                                        ? CustomAppTheme().colorWhite
                                        : CustomAppTheme().colorBlack,
                                  ),
                                ),
                              ),
                            ),
                    ),
                    // SELECTED IMAGE BUTTON
                    GestureDetector(
                      onTap: _selectImagesFromGallery,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50.0, horizontal: 5),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: dark
                                  ? CustomAppTheme().colorWhite
                                  : CustomAppTheme().colorBlack,
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                            child: _selectedImages != null
                                ? Text(
                                    'Selected ${_selectedImages!.length} images',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: dark
                                          ? CustomAppTheme().colorWhite
                                          : CustomAppTheme().colorBlack,
                                    ),
                                  )
                                : Text(
                                    'Select Images',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: dark
                                          ? CustomAppTheme().colorWhite
                                          : CustomAppTheme().colorBlack,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    // BACK AND NEXT BUTTON

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // BACK BUTTON
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Page2(),
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
                        // NEXT BUTTON
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
