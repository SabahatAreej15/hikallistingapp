import 'package:flutter/material.dart';
import 'package:realestate/theme/theme.dart';
import 'package:realestate/widgets/houseview.dart';

class HousesWidget extends StatelessWidget {
  List<String> Locations = [
    "Richardson, California",
    "Los angles, california",
    "Naerobi, Uk",
  ];
  List<String> HousesName = [
    "Summer house",
    "Dubai place",
    "Dubai place",
  ];
  List<String> HouseImages = [
    "assets/house1.jpg",
    "assets/house4.jpg",
    "assets/house3.jpg",
  ];
  List<String> HouseSize = [
    "5 Bed - 4 bath - 3,325 sqft",
    "4 Bed - 3 bath - 2,800 sqft",
    "3 Bed - 2 bath - 2,000 sqft",
  ];

  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Row(
      children: [
        // for (var i = 0; i < 3; i++)
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(8),
                height: 250,
                width: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: dark
                      ? CustomAppTheme().blackFade.withOpacity(0.4)
                      : CustomAppTheme().creamLight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 140,
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => HouseView(),
                              //   ),
                              // );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HouseView(index),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Hero(
                                  tag: index,
                                  child: Image.asset(HouseImages[index])),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.favorite,
                                color: CustomAppTheme().redBright,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      HousesName[index],
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: dark
                              ? CustomAppTheme().colorWhite
                              : CustomAppTheme().colorBlack),
                    ),
                    //row
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: CustomAppTheme().redBright,
                        ),
                        Text(
                          Locations[index],
                          style: TextStyle(
                              color: dark
                                  ? CustomAppTheme().colorWhite
                                  : CustomAppTheme().colorBlack),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Text(
                      HouseSize[index],
                      style: TextStyle(
                          color: dark
                              ? CustomAppTheme().colorWhite
                              : CustomAppTheme().colorBlack,
                          fontSize: 15),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
