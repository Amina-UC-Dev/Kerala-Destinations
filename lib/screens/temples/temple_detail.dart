import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:provider/provider.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';
import 'package:destinations/providers/temple_provider.dart';
import 'package:destinations/routes/routes.dart';
import 'package:destinations/widgets/commonAppBAr.dart';
import 'package:destinations/widgets/commonButton.dart';
import 'package:destinations/widgets/commonHeadTile.dart';
import 'package:destinations/widgets/commonWidget.dart';

class TempleDetailScreen extends StatelessWidget {
  TempleDetailScreen({Key? key,required this.fromNear}) : super(key: key);

  bool fromNear;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Consumer<TempleProvider>(
          builder: (context,provider,child){
            return provider.destinationDetail != null ? SizedBox(height: h-33,width: w,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(height: h-33,width: w,
                      child: ListView(
                        children: [
                          Container(height: 300,
                            child: Swiper(
                              loop: true,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                    onTap: (){
                                      PageNavigation().gotoImagePreview(context, provider.destinationImages[index]);
                                    },
                                    child: CachedNetworkImage(imageUrl: provider.destinationImages[index],fit: BoxFit.cover,
                                      placeholder: (context,ind) {
                                        return CommonWidgets().showLoader();
                                      },), );
                              },
                              pagination: SwiperPagination(
                                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                                builder: DotSwiperPaginationBuilder(
                                  color: g4,
                                  activeColor: primary,
                                  size: 5.0,
                                    activeSize: 10.0,
                                ),
                              ),
                              autoplay: true,
                              itemCount: provider.destinationImagesLength,
                              control: SwiperControl(color: Colors.transparent),
                            ),
                          ),
                          provider.destinationDetail!.result!.destinationPhotoCourtesy!.isNotEmpty ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 3),
                                child: Text("PC: ${provider.destinationDetail!.result!.destinationPhotoCourtesy}",style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: g6,fontStyle: FontStyle.italic),),
                              )
                            ],
                          ) : Container(),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${provider.destinationDetail!.result!.destinationName}", style:
                                Style().textStyle(size: 20, w: FontWeight.bold, color: black),),
                                SizedBox(height: 10,),
                                Row(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/location.png",height: 18,color: g6,),
                                    SizedBox(width: 10,),
                                    SizedBox(width: w-70,
                                      child: Text("${provider.destinationDetail!.result!.cityName}, ${provider.destinationDetail!.result!.provinceName}", style:
                                      Style().textStyle(size: 14, w: FontWeight.w300, color: g6),),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                RowTile(
                                  title: "Type",
                                  value: "${provider.destinationDetail!.result!.destinationTypeNames}",
                                ),
                                RowTile(
                                  title: "Description",
                                  value: "${provider.destinationDetail!.result!.destinationDescription}",
                                ),
                                provider.destinationDetail!.result!.localName!.isNotEmpty ? RowTile(
                                  title: "Local name",
                                  value: "${provider.destinationDetail!.result!.localName}",
                                ) : Container(),
                                RowTile(
                                  title: "Best Season",
                                  value: "${provider.destinationDetail!.result!.bestSeason}",
                                ),
                                provider.destinationDetail!.result!.destinationAttractions!.isNotEmpty ? RowTile(
                                  title: "Destination Attractions",
                                  value: "${provider.destinationDetail!.result!.destinationAttractions}"
                                ) : Container(),
                                const SizedBox(
                                  height: 50,
                                ),
                              ],),
                          ),
                        ],
                      ),
                    ),
                    PreferredSize(
                      preferredSize: Size.fromHeight(55),
                      child: AppBar(
                        backgroundColor: white.withOpacity(.5),
                        leading:  IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios,size: 20,)),
                        iconTheme: IconThemeData(color: primary),
                        centerTitle: true,
                        elevation: 0,
                        title: Text(
                          "Destination Detail",
                          style: Style().textStyle(size: 18, w: FontWeight.w600, color: black),
                        ),
                        actions: [
                          Row(
                            children: [
                              fromNear ? Container() : Container(height: 40,width: 40,
                                child: IconButton(
                                    onPressed: () {
                                      PageNavigation()
                                          .gotoEditTemples(context, provider.destinationDetail!.result!);
                                    },
                                    icon: Image.asset(
                                      "assets/edit.png",
                                      height: 21,
                                      color: black,
                                    )),
                              ),
                              fromNear ? Container() : Container(
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
                                                      provider.deleteDestination(context: context, destId: provider.destinationDetail!.result!.destinationId!);
                                                    },
                                                    color: red)),
                                          ],
                                        ),
                                      );
                                    },
                                    icon: Image.asset(
                                      "assets/delete.png",
                                      height: 23,
                                      color: red,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ) : CommonWidgets().showLoader();
          },
        ),
      ),
    );
  }
}

class RowTile extends StatelessWidget {
  RowTile({Key? key, required this.value, required this.title})
      : super(key: key);

  String title, value;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                Style().textStyle(size: 15, w: FontWeight.w600, color: black),
          ),
          Text(
            " : ",
            style:
                Style().textStyle(size: 15, w: FontWeight.w600, color: black),
          ),
          Container(width: w-160,
            child: Text(
              value,
              style: Style().textStyle(size: 14, w: FontWeight.w400, color: g9),
            ),
          ),
        ],
      ),
    );
  }
}
