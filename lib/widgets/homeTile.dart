import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';
import 'package:destinations/providers/temple_provider.dart';
import 'package:destinations/widgets/commonWidget.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Consumer<TempleProvider>(builder: (context, provider, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: w / 2.7,
            width: w / 2.7,
            child: Card(
              elevation: 10,
              shadowColor: g8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(80),
              )),
              child: provider.destinationList != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total",
                                  style: Style().textStyle(
                                      size: 15,
                                      w: FontWeight.w900,
                                      color: black),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Destinations",
                                  style: Style().textStyle(
                                      size: 15,
                                      w: FontWeight.w900,
                                      color: black),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: w / 6,
                            width: w / 6,
                            decoration: BoxDecoration(
                                color: primary.withOpacity(.15),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    topRight: Radius.circular(35),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(35))),
                            child: Center(
                              child: Text(
                                provider.destinationList!.totalRows!.toString(),
                                style: Style().textStyle(
                                    size: 15, w: FontWeight.w900, color: black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : CommonWidgets().showLoader(),
            ),
          ),
          SizedBox(
            height: w / 2.7,
            width: w / 2.7,
            child: Card(
              elevation: 10,
              shadowColor: g8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(80),
              )),
              child: provider.nearDestinationList != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Destinations",
                                  style: Style().textStyle(
                                      size: 15,
                                      w: FontWeight.w900,
                                      color: black),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Near",
                                  style: Style().textStyle(
                                      size: 15,
                                      w: FontWeight.w900,
                                      color: black),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: w / 6,
                            width: w / 6,
                            decoration: BoxDecoration(
                                color: primary.withOpacity(.15),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    topRight: Radius.circular(35),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(35))),
                            child: Center(
                              child: Text(
                                provider.nearDestinationList!.totalRows!.toString(),
                                style: Style().textStyle(
                                    size: 15, w: FontWeight.w900, color: black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : CommonWidgets().showLoader(),
            ),
          ),
        ],
      );
    });
  }
}
