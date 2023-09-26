import 'package:flutter/material.dart';

import '../theme/theme.dart';

class Feature {
  final String name;
  final IconData icon;

  Feature({required this.name, required this.icon});
}

class DetailofHouse extends StatefulWidget {
  final String imgUrl;
  final String title;
  final String location;
  final String price;
  const DetailofHouse({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.location,
    required this.price,
  });

  @override
  State<DetailofHouse> createState() => _DetailofHouseState();
}

class _DetailofHouseState extends State<DetailofHouse> {
  bool inforow = false;

  @override
  void initState() {
    _delay_timers();
    super.initState();
  }

  _delay_timers() {
    if (mounted) {
// Timer for info row
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          inforow = true;
        });
      });
    }
  }

  // List of features with icons
  List<Feature> features = [
    Feature(name: "Wifi", icon: Icons.wifi),
    Feature(name: "PlayArea", icon: Icons.support_sharp),
    Feature(name: "Airconditioner", icon: Icons.ac_unit_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: dark ? CustomAppTheme().colorBlack : CustomAppTheme().colorWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(image: AssetImage(widget.imgUrl), fit: BoxFit.cover),
                        color: Colors.black),
                    // child: Image.asset(
                    //   widget.imgUrl,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CircleAvatar(
                        backgroundColor: CustomAppTheme().redBright,
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: CustomAppTheme().colorWhite,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                flex: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DelayedText(
                            delay: Duration(milliseconds: 500),
                            text: widget.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack,
                            ),
                          ),
                          DelayedText(
                            delay: Duration(milliseconds: 1000),
                            text: widget.location,
                            style: TextStyle(
                              fontSize: 20,
                              color: dark ? CustomAppTheme().colorGrey : CustomAppTheme().colorGrey,
                            ),
                          ),
                          DelayedText(
                            delay: Duration(milliseconds: 1500),
                            text: widget.price,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: dark ? CustomAppTheme().redBright : CustomAppTheme().redBright,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (inforow)
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    controller: ScrollController(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.people,
                                    color: CustomAppTheme().colorGrey,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "4 people",
                                    style: TextStyle(color: CustomAppTheme().colorGrey, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.local_offer,
                                    color: CustomAppTheme().colorGrey,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "2 Beds",
                                    style: TextStyle(color: CustomAppTheme().colorGrey, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.airline_seat_legroom_reduced,
                                    color: CustomAppTheme().colorGrey,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "2 Bathrooms",
                                    style: TextStyle(color: CustomAppTheme().colorGrey, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: ClipRect(
                                      child: Image.asset(
                                        "assets/appstore.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Hikal",
                                        style: TextStyle(
                                            color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack, fontWeight: FontWeight.w500, fontSize: 18),
                                      ),
                                      Text(
                                        "Owner",
                                        style: TextStyle(color: dark ? CustomAppTheme().colorGrey : CustomAppTheme().colorGrey, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      color: CustomAppTheme().redBright,
                                      child: Icon(
                                        Icons.phone,
                                        color: CustomAppTheme().colorWhite,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  // CHAT BUTTON
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      color: CustomAppTheme().redBright,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.sms,
                                            color: CustomAppTheme().colorWhite,
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text("Chat",
                                              style: TextStyle(
                                                color: CustomAppTheme().colorWhite,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        // Features
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Features",
                                style: TextStyle(
                                  color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: features.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final feature = features[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          feature.icon,
                                          color: CustomAppTheme().redBright,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          feature.name,
                                          style: TextStyle(
                                            color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description",
                                style: TextStyle(
                                    color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack, fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Expanded cap with 2 bedroom, Livingroom, Dinningroom, Kitchen, 2 Bath, Expanded cap with 2 bedroom, Livingroom, Dinningroom, Kitchen, 2 Bath, Expanded cap with 2 bedroom, Livingroom, Dinningroom, Kitchen, 2 Bath, Expanded cap with 2 bedroom, Livingroom, Dinningroom, Kitchen, 2 Bath, ",
                                style: TextStyle(
                                    fontSize: 14, color: dark ? CustomAppTheme().colorWhite.withOpacity(0.8) : CustomAppTheme().colorBlack.withOpacity(0.8)),
                              )
                            ],
                          ),
                        ),
                        // DESCRIPTION
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Property Detail",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Type",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack.withOpacity(0.4)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                          child: Text(
                                            "For Sale",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Size Area",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack.withOpacity(0.4)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                          child: Text(
                                            "1,247 Sqft",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Book Now Button
                        Container(
                            margin: EdgeInsets.only(left: 250, right: 10, top: 30),
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(color: CustomAppTheme().redBright),
                            child: Center(
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  "Book Now",
                                  style: TextStyle(color: CustomAppTheme().colorWhite, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class DelayedText extends StatefulWidget {
  final Duration delay;
  final String text;
  final TextStyle style;

  DelayedText({
    required this.delay,
    required this.text,
    required this.style,
  });

  @override
  _DelayedTextState createState() => _DelayedTextState();
}

class _DelayedTextState extends State<DelayedText> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() {
          _visible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: Text(
        widget.text,
        style: widget.style,
      ),
    );
  }
}
