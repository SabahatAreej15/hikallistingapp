import 'package:flutter/material.dart';
import 'package:realestate/screens/listings.dart';
import 'package:realestate/theme/theme.dart';

import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:realestate/widgets/houseswidget.dart';

// import 'houseswidget.dart';
import '../login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class ItemData {
  final IconData icon;
  final String text;

  ItemData(this.icon, this.text);
}

class _HomeState extends State<Home> {
  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    List<ItemData> itemsData = [
      ItemData(Icons.home, "Home"),
      ItemData(Icons.business, "Office"),
      ItemData(Icons.apartment, "Apartment"),
      ItemData(Icons.villa_sharp, "Mall"),
    ];

    return Scaffold(
      backgroundColor: dark ? CustomAppTheme().colorBlack : CustomAppTheme().colorWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(9),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  // FIRST ROW

                  child: Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );
                            },
                            child: Icon(
                              Icons.arrow_left,
                              color: dark ? CustomAppTheme().cardWhite : CustomAppTheme().colorBlack,
                            ),
                          ),
                          Text(
                            "Location",
                            style: TextStyle(fontSize: 20, color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack),
                          ),
                        ],
                      )),
                      Container(
                        decoration:
                            BoxDecoration(color: dark ? CustomAppTheme().colorBlack : CustomAppTheme().colorWhite, borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Icon(
                            Icons.notifications_active,
                            size: 18,
                            color: CustomAppTheme().redBright,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SECOND ROW

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 18,
                        color: CustomAppTheme().redBright,
                      ),
                      Text(
                        "Dubai",
                        style: TextStyle(color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack, fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                // THIRD ROW

                // Search bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 15),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: dark ? CustomAppTheme().blackFade : CustomAppTheme().creamLight, borderRadius: BorderRadius.circular(5)),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(width: 1, color: CustomAppTheme().colorGrey)),
                          contentPadding: EdgeInsets.symmetric(vertical: 17),
                          filled: true,
                          fillColor: dark ? CustomAppTheme().colorBlack : CustomAppTheme().colorWhite,
                          hintText: 'Search',
                          hintStyle: TextStyle(color: dark ? CustomAppTheme().creamLight : CustomAppTheme().colorGrey),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 18,
                            color: dark ? CustomAppTheme().creamLight : CustomAppTheme().colorGrey,
                          ),
                          suffixIcon: Icon(
                            Icons.filter_list_sharp,
                            color: dark ? CustomAppTheme().creamLight : CustomAppTheme().colorGrey,
                          )),
                    ),
                  ),
                ),
                // FOURTH ROW

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                  child: Text(
                    "Find Properties",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack),
                  ),
                ),
                //CARDS OF GRIDVIEW

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 6),
                  child: Card(
                    color: dark ? CustomAppTheme().blackFade.withOpacity(0.6) : CustomAppTheme().colorWhite.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(3),
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: itemsData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.2,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(7),
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          decoration: BoxDecoration(
                            color: dark ? CustomAppTheme().colorBlack : CustomAppTheme().creamLight,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: Stack(
                              children: [
                                Center(
                                  child: Icon(
                                    itemsData[index].icon,
                                    size: 70,
                                    color: CustomAppTheme().redBright.withOpacity(0.1),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    itemsData[index].text,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // SIXTH ROW

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Near by to you",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack),
                      ),
                      // SEE ALL BUTTON
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Listings(),
                            ),
                          );
                        },
                        child: Text(
                          "See all",
                          style: TextStyle(color: CustomAppTheme().colorBlue),
                        ),
                      ),
                    ],
                  ),
                ),
                // HOUSES WIDGET
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 250,
                        width: 220,
                        child: HousesWidget(),
                      ),
                    ),
                  ],
                ),
                // HousesWidget(),
              ],
            ),
          ),
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: CircleNavBar(
        onTap: null,
        height: 60,
        circleWidth: 50,
        activeIndex: 2,
        circleColor: dark ? CustomAppTheme().colorBlack : CustomAppTheme().colorWhite,
        color: dark ? CustomAppTheme().colorBlack : CustomAppTheme().creamLight,
        activeIcons: [
          Icon(
            Icons.location_city_rounded,
            color: CustomAppTheme().redBright,
          ),
          Icon(
            Icons.compass_calibration,
            color: CustomAppTheme().redBright,
          ),
          Icon(
            Icons.bookmark,
            color: CustomAppTheme().redBright,
          ),
          Icon(
            Icons.mail,
            color: CustomAppTheme().redBright,
          ),
          Icon(
            Icons.person,
            color: CustomAppTheme().redBright,
          ),
        ],
        inactiveIcons: [
          Icon(
            Icons.location_city_rounded,
            color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack,
          ),
          Icon(
            Icons.compass_calibration,
            color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack,
          ),
          Icon(
            Icons.bookmark,
            color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack,
          ),
          Icon(
            Icons.mail,
            color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack,
          ),
          Icon(
            Icons.person,
            color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack,
          ),
        ],
      ),
    );
  }
}
