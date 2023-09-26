import 'package:flutter/material.dart';
import 'package:realestate/screens/addlistings/page1.dart';
import 'package:realestate/screens/addlistings/page2.dart';
import 'package:realestate/screens/detail.dart';
import 'package:realestate/screens/filters.dart';
import 'package:realestate/theme/theme.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class ListingItem {
  final String title;
  final String location;
  final String price;
  final String imageUrl;

  ListingItem(this.title, this.location, this.price, this.imageUrl);
}

class _ListingsState extends State<Listings> {
  List<ListingItem> listingItems = [
    ListingItem("Summer house", "Richardson, California", "30,000/ month", "assets/house1.jpg"),
    ListingItem("Cozy apartment", "Los Angeles, California", "25,000/ month", "assets/house2.jpg"),
    ListingItem("Luxury villa", "Malibu, California", "50,000/ month", "assets/house3.jpg"),
    ListingItem("Dubai Palace", "Malibu, California", "50,000/ month", "assets/house4.jpg"),
    ListingItem("Dubai city", "Malibu, California", "50,000/ month", "assets/house1.jpg"),
    ListingItem("Luxury villa", "Malibu, California", "50,000/ month", "assets/house2.jpg"),
    ListingItem("Luxury villa", "Malibu, California", "50,000/ month", "assets/house3.jpg"),
    ListingItem("Luxury villa", "Malibu, California", "50,000/ month", "assets/house4.jpg"),
    ListingItem("Luxury villa", "Malibu, California", "50,000/ month", "assets/house1.jpg"),
    ListingItem("Luxury villa", "Malibu, California", "50,000/ month", "assets/house3.jpg"),
  ];

  // final List<DetailOfHouse> listingdetail = List.generate(listingItems.length,
  //  (index) => DetailOfHouse(('${listingItems[index]}'), imageUrl, location, price));

  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: dark ? CustomAppTheme().colorBlack : CustomAppTheme().colorWhite,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Page1()),
          );
        },
        child: Icon(Icons.add),
      ), // appBar: AppBar(
      //   backgroundColor: CustomAppTheme().redBright,
      //   centerTitle: true,
      //   title: Text(
      //     "All Listings",
      //     style: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 18,
      //         color: dark
      //             ? CustomAppTheme().colorWhite
      //             : CustomAppTheme().colorWhite),
      //   ),

      // ),
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
                            'All Listings',
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

            // SEARCH BAR
            Padding(
              padding: EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 1),
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
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 32,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 26.0),
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                // SizedBox(
                                //   width: 24,
                                // ),
                                buildFilter("House", dark),
                                buildFilter("Location", dark),
                                buildFilter("PriceRange", dark),
                                buildFilter("Bedrooms", dark),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 24, left: 24, top: 24, bottom: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${listingItems.length} Results found",
                    style: TextStyle(
                      color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.filter_list,
                          color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack,
                        ),
                        Text(
                          "Filter",
                          style: TextStyle(
                            color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                color: dark ? CustomAppTheme().blackFade : CustomAppTheme().creamLight.withOpacity(0.4),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = listingItems[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 300),
                                transitionsBuilder: (context, animation, animationTime, child) {
                                  return ScaleTransition(
                                    scale: animation,
                                    alignment: Alignment.center,
                                    child: child,
                                  );
                                },
                                pageBuilder: (context, animation, animationTime) {
                                  return DetailofHouse(
                                    imgUrl: listingItems[index].imageUrl,
                                    location: listingItems[index].location,
                                    price: listingItems[index].price,
                                    title: listingItems[index].title,
                                  );
                                }));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 70,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(item.imageUrl),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                        // title
                                        child: Text(
                                          item.title,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 17,
                                            color: CustomAppTheme().redBright,
                                          ),
                                          Text(
                                            item.location,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: dark ? CustomAppTheme().creamLight : CustomAppTheme().blackFade,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          item.price,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: dark ? CustomAppTheme().redBright : CustomAppTheme().redBright,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 70,
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: CustomAppTheme().redBright,
                                        ),
                                        child: Icon(
                                          Icons.call,
                                          color: CustomAppTheme().colorWhite,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: CustomAppTheme().redBright,
                                          ),
                                          height: 35,
                                          width: 35,
                                          child: Center(
                                            child: Text(
                                              "sms",
                                              style: TextStyle(fontSize: 15, color: CustomAppTheme().colorWhite),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: listingItems.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilter(String filterName, dark) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          color: CustomAppTheme().colorGrey,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          filterName,
          style: TextStyle(
            color: dark ? CustomAppTheme().colorWhite : CustomAppTheme().colorBlack,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Material(
          child: Filters(),
        );
      },
    );
  }
}
