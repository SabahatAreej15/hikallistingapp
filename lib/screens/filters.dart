import 'package:flutter/material.dart';
import 'package:realestate/theme/theme.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    var selectedRange = RangeValues(400, 1000);
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Filter",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: dark
                        ? CustomAppTheme().colorWhite
                        : CustomAppTheme().colorBlack),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "your search",
                style: TextStyle(
                    fontSize: 24,
                    color: dark
                        ? CustomAppTheme().colorWhite
                        : CustomAppTheme().colorBlack),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
            child: Row(
              children: [
                Text(
                  "Price ",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: dark
                          ? CustomAppTheme().colorWhite
                          : CustomAppTheme().colorBlack),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "range",
                  style: TextStyle(
                      fontSize: 24,
                      color: dark
                          ? CustomAppTheme().colorWhite
                          : CustomAppTheme().colorBlack),
                ),
              ],
            ),
          ),
          RangeSlider(
            values: selectedRange,
            onChanged: (RangeValues newRange) {
              setState(() {
                selectedRange = newRange;
              });
            },
            min: 70,
            max: 1000,
            activeColor: CustomAppTheme().redBright,
            inactiveColor: CustomAppTheme().colorGrey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                r"$70k",
                style: TextStyle(fontSize: 14),
              ),
              Text(
                r"$1000k",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Rooms",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildOption("Any", false),
              buildOption("1", false),
              buildOption("2", true),
              buildOption("3", false),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Bathrooms",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildOption("Any", false),
              buildOption("1", true),
              buildOption("2", false),
              buildOption("3", false),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildOption(String text, bool selected) {
    return Container(
      height: 45,
      width: 65,
      decoration: BoxDecoration(
        color: selected ? CustomAppTheme().redBright : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          width: selected ? 0 : 1,
          color: CustomAppTheme().colorGrey,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: selected
                ? CustomAppTheme().colorWhite
                : CustomAppTheme().colorBlack,
          ),
        ),
      ),
    );
  }
}
