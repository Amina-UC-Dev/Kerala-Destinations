import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:destinations/models/detination_list_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';
import 'package:destinations/providers/temple_provider.dart';
import 'package:destinations/routes/routes.dart';
import 'package:destinations/widgets/commonButton.dart';
import 'package:destinations/widgets/commonWidget.dart';

class TempleTile extends StatelessWidget {
  TempleTile({
    Key? key,
    required this.data,
    required this.fromNear
  }) : super(key: key);

  DestinationD data;
  bool fromNear;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: white,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: CachedNetworkImage(imageUrl: data.destinationPhoto!,fit: BoxFit.cover,
                placeholder: (context,ind) {
                  return CommonWidgets().showLoader();
                },),
              ),
              SizedBox(width: 10,),
              Container(width: w-187,height: 95,
                child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${data.destinationName}",
                          style: Style()
                              .textStyle(size: 14, w: FontWeight.w600, color: black),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.place_outlined,size: 18,color: g6,),
                            SizedBox(width: 5,),
                            Container(width: w-210,
                              child: Text(
                                "${data.cityName}, ${data.provinceName}",
                                style: Style()
                                    .textStyle(size: 13, w: FontWeight.w400, color: g6),maxLines: 1,overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data.destinationTypeNames}",
                          style: Style()
                              .textStyle(size: 13, w: FontWeight.w400, color: g6),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       fromNear ? Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Image.asset(
                             'assets/destination.png',
                             height: 15,
                             color: g6,
                           ),
                           SizedBox(width: 5,),
                           Text(
                            "${double.parse(data.distance!).toStringAsFixed(3)} km",
                             style: Style()
                                 .textStyle(size: 13, w: FontWeight.w400, color: g6),
                           ),
                         ],
                       ) : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.date_range_outlined,size: 18,color: g6,),
                            SizedBox(width: 5,),
                            Text(
                              DateFormat("dd/MM/yyyy").format(data.createdDate!),
                              style: Style()
                                  .textStyle(size: 13, w: FontWeight.w400, color: g6),
                            ),
                          ],
                        ),
                        Container(
                            width: 80,
                            height: 30,
                            child: CommonButton(
                                title: "View",
                                ontap: () {
                                  PageNavigation().gotoTempleDetail(
                                    context,
                                    data.destinationId!,
                                      fromNear
                                  );
                                },
                                color: primary)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TempleTile2 extends StatelessWidget {
  TempleTile2({
    Key? key,
    required this.data,
    required this.fromNear
  }) : super(key: key);

  DestinationLD data;
  bool fromNear;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: white,
        child: Padding(
          padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image.file(
              File(data.destinationPhoto!,),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10,),
              Container(width: w-213,height: 95,
                child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${data.destinationName}",
                          style: Style()
                              .textStyle(size: 14, w: FontWeight.w600, color: black),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.place_outlined,size: 18,color: g6,),
                            SizedBox(width: 5,),
                            Container(width: w-236,
                              child: Text(
                                "${data.cityName}, ${data.provinceName}",
                                style: Style()
                                    .textStyle(size: 13, w: FontWeight.w400, color: g6),maxLines: 1,overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data.destinationTypeNames}",
                          style: Style()
                              .textStyle(size: 13, w: FontWeight.w400, color: g6),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.date_range_outlined,size: 18,color: g6,),
                            SizedBox(width: 5,),
                            Text(
                              "${DateFormat("dd/MM/yyyy"
                              ).format(DateTime.parse(data.createdDate!))} ${DateFormat.jm().format(DateTime.parse(data.createdDate!))}",
                              style: Style()
                                  .textStyle(size: 13, w: FontWeight.w400, color: g6),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(height: 100,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(height: 40,width: 40,
                      child: IconButton(
                          onPressed: () {
                            PageNavigation()
                                .gotoLocalEditTemples(context, data);
                          },
                          icon: Image.asset(
                            "assets/edit.png",
                            height: 21,
                            color: black,
                          )),
                    ),
                    Container(
                      height: 45,width: 45,
                      child: IconButton(
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                title: Text(
                                  'Delete Destination?',
                                  style: Style().textStyle(
                                      size: 16,
                                      w: FontWeight.w600,
                                      color: black),
                                ),
                                content: Text(
                                    'Are you sure want to destination?',
                                    style: Style().textStyle(
                                        size: 14,
                                        w: FontWeight.w300,
                                        color: black)),
                                actionsPadding: EdgeInsets.only(
                                    bottom: 15, right: 10, left: 10),
                                actions: <Widget>[
                                  Container(
                                      width: 90,
                                      height: 35,
                                      child: CommonButton(
                                          title: "Cancel",
                                          ontap: () {
                                            Navigator.pop(context);
                                          },
                                          color: black)),
                                  Container(
                                      width: 90,
                                      height: 35,
                                      child: CommonButton(
                                          title: "Yes",
                                          ontap: () {
                                            Provider.of<TempleProvider>(context,listen: false).deleteLocalDestination(context: context, localId: data.localId!);
                                          },
                                          color: red)),
                                ],
                              ),
                            );
                          },
                          icon: Image.asset(
                            "assets/delete.png",
                            height: 25,
                            color: red,
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
