import 'package:flutter/material.dart';

class HouseView extends StatelessWidget {
  final herotag;
  HouseView(this.herotag);
  List<String> Locations = [
    "Richardson, California",
    "Los angles, california",
    "Naerobi, Uk",
  ];
  List<String> HousesName = [
    "Summer house",
    "dubai place",
    "Dubai place",
  ];
  List<String> HouseImages = [
    "assets/house1.jpg",
    "assets/house4.jpg",
    "assets/house3.jpg",
  ];
  final HouseTextstyle = TextStyle(fontSize: 20, color: Colors.black54);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.brown,
                        boxShadow: [BoxShadow(color: Colors.brown.shade300, blurRadius: 5, spreadRadius: 3)]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Hero(tag: herotag, child: Image.asset("assets/house1.jpg")),
                    ),
                  ),
                  Positioned(
                      child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Elite House",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Elite House is best place",
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "5 Bed",
                    style: HouseTextstyle,
                  ),
                  Text(
                    "2 Bath",
                    style: HouseTextstyle,
                  ),
                  Text(
                    "502 sqft",
                    style: HouseTextstyle,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        "Location text here i8/4 street90, islamabad",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "125AED",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 23),
                      ),
                      Text(
                        "Monthly",
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red.shade400),
                    child: Center(
                      child: Text(
                        "Book Now",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
