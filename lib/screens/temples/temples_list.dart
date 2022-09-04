import 'package:destinations/screens/temples/temple_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';
import 'package:destinations/providers/temple_provider.dart';
import 'package:destinations/routes/routes.dart';
import 'package:destinations/screens/dashboard/bottom_nav.dart';
import 'package:destinations/widgets/commonButton.dart';
import 'package:destinations/widgets/commonFloatingButton.dart';
import 'package:destinations/widgets/commonWidget.dart';

class Temples extends StatelessWidget {
  Temples({Key? key}) : super(key: key);

  RxString from = "".obs, to = "".obs, typeId = "".obs, search = "".obs;
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  Rx<DateTime> startD = DateTime.now().obs;
  Rx<DateTime> endD = DateTime.now().obs;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: AppBar(
              backgroundColor: white,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  )),
              iconTheme: IconThemeData(color: primary),
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Destinations",
                style: Style()
                    .textStyle(size: 18, w: FontWeight.w600, color: black),
              ))),
      bottomNavigationBar: BottomBarUI(context, 2),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButton(context, 2),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Consumer<TempleProvider>(builder: (context, provider, child) {
            return SizedBox(
                    height: h,
                    child: SingleChildScrollView(
                      controller: provider.controller1,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  color: white,
                                  child: Container(
                                    width: w -150,
                                    height: 45,
                                    child: TextField(
                                      controller: provider.templeName,
                                      onChanged: (val) {
                                      if(val.length >= 2){
                                         provider.getDestinationsSearch(context: context);
                                       }
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Destination name...",
                                          prefixIcon: Container(
                                            height: 20,
                                            width: 20,
                                            child: Center(
                                              child: Image.asset(
                                                "assets/search.png",
                                                height: 18,
                                                color: primary,
                                              ),
                                            ),
                                          ),
                                          hintStyle: Style().textStyle(
                                              size: 15,
                                              w: FontWeight.w300,
                                              color: g5),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 15)),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 42,
                                  width: 100,
                                  child: MaterialButton(
                                    onPressed: () {
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context2) =>
                                              Consumer<TempleProvider>(builder:
                                                  (context3, pro, child) {
                                                return Dialog(
                                                  insetPadding: const EdgeInsets.all(20),
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(20)),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 15,
                                                      right: 15,
                                                      top: 20,
                                                      bottom: 20,
                                                    ),
                                                    child: SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  provider.setSort(val: 1, sortBy: "destinationName", direction: "ASC");
                                                                },
                                                                child: Card(
                                                                  elevation: 15,
                                                                  color: provider.selectedSort == 1 ? primary : white,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(10)),
                                                                  child: Container(
                                                                    width: w / 2.7,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(10),
                                                                      child: Column(
                                                                        children: [
                                                                          Text(
                                                                            "Destination Name",
                                                                            style: Style().textStyle(size: 14, w: FontWeight.w500, color: provider.selectedSort == 1 ? white : black)
                                                                            // selected == 2 ? f14WB : f14B,
                                                                          ),
                                                                          Text(
                                                                            "Ascending",
                                                                           style: Style().textStyle(size: 14, w: FontWeight.w500, color: provider.selectedSort == 1 ? white : black)
                                                                            // selected == 2 ? f14WB : f14B,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  provider.setSort(val: 2, sortBy: "destinationName", direction: "DESC");
                                                                },
                                                                child: Card(
                                                                  elevation: 15,
                                                                  color:provider.selectedSort == 2 ? primary : white,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(10)),
                                                                  child: Container(
                                                                    width: w / 2.7,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(10),
                                                                      child: Column(
                                                                        children: [
                                                                          Text(
                                                                            "Destination Name",
                                                                            style: Style().textStyle(size: 14, w: FontWeight.w500, color: provider.selectedSort == 2 ? white : black)
                                                                            // selected == 2 ? f14WB : f14B,
                                                                          ),
                                                                          Text(
                                                                            "Descending",
                                                                           style: Style().textStyle(size: 14, w: FontWeight.w500, color: provider.selectedSort == 2 ? white : black)
                                                                            // selected == 2 ? f14WB : f14B,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(height: 10,),
                                                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  provider.setSort(val: 3, sortBy: "cityName", direction: "ASC");
                                                                },
                                                                child: Card(
                                                                  elevation: 15,
                                                                  color: provider.selectedSort == 3 ? primary : white,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(10)),
                                                                  child: Container(
                                                                    width: w / 2.7,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(10),
                                                                      child: Column(
                                                                        children: [
                                                                          Text(
                                                                            "Destination City",
                                                                            style: Style().textStyle(size: 14, w: FontWeight.w500, color: provider.selectedSort == 3 ? white : black)
                                                                            // selected == 2 ? f14WB : f14B,
                                                                          ),
                                                                          Text(
                                                                            "Ascending",
                                                                           style: Style().textStyle(size: 14, w: FontWeight.w500, color: provider.selectedSort == 3 ? white : black)
                                                                            // selected == 2 ? f14WB : f14B,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  provider.setSort(val: 4, sortBy: "cityName", direction: "DESC");
                                                                },
                                                                child: Card(
                                                                  elevation: 15,
                                                                  color: provider.selectedSort == 4 ? primary : white,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(10)),
                                                                  child: Container(
                                                                    width: w / 2.7,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(10),
                                                                      child: Column(
                                                                        children: [
                                                                          Text(
                                                                            "Destination City",
                                                                            style: Style().textStyle(size: 14, w: FontWeight.w500, color: provider.selectedSort == 4 ? white : black)
                                                                            // selected == 2 ? f14WB : f14B,
                                                                          ),
                                                                          Text(
                                                                            "Descending",
                                                                           style: Style().textStyle(size: 14, w: FontWeight.w500, color: provider.selectedSort == 4 ? white : black)
                                                                            // selected == 2 ? f14WB : f14B,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(height: 10,),
                                                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  provider.setSort(val: 5, sortBy: "createdAt", direction: "ASC");
                                                                },
                                                                child: Card(
                                                                  elevation: 15,
                                                                  color: provider.selectedSort == 5 ? primary : white,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(10)),
                                                                  child: Container(
                                                                    width: w / 2.7,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(10),
                                                                      child: Column(
                                                                        children: [
                                                                          Text(
                                                                            "Created At",
                                                                            style: Style().textStyle(size: 14, w: FontWeight.w500, color: provider.selectedSort == 5 ? white : black)
                                                                            // selected == 2 ? f14WB : f14B,
                                                                          ),
                                                                          Text(
                                                                            "Ascending",
                                                                           style: Style().textStyle(size: 14, w: FontWeight.w500, color: provider.selectedSort == 5 ? white : black)
                                                                            // selected == 2 ? f14WB : f14B,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  provider.setSort(val: 6, sortBy: "createdAt", direction: "DESC");
                                                                },
                                                                child: Card(
                                                                  elevation: 15,
                                                                  color: provider.selectedSort == 6 ? primary : white,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(10)),
                                                                  child: Container(
                                                                    width: w / 2.7,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(10),
                                                                      child: Column(
                                                                        children: [
                                                                          Text(
                                                                            "Created At",
                                                                            style: Style().textStyle(size: 14, w: FontWeight.w500, color: provider.selectedSort == 6 ? white : black)
                                                                            // selected == 2 ? f14WB : f14B,
                                                                          ),
                                                                          Text(
                                                                            "Descending",
                                                                           style: Style().textStyle(size: 14, w: FontWeight.w500, color: provider.selectedSort == 6 ? white : black)
                                                                            // selected == 2 ? f14WB : f14B,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(height: 15,),
                                                          Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                                children: [
                                                                  Container(
                                                                      width: 90,
                                                                      height: 35,
                                                                      child: CommonButton(
                                                                          title: "Cancel",
                                                                          ontap: () {
                                                                            Navigator.pop(
                                                                                context);
                                                                            provider.clearSearch(context);
                                                                          },
                                                                          color: black)),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Container(
                                                                      width: 100,
                                                                      height: 35,
                                                                      child: CommonButton(
                                                                          title: "Sort",
                                                                          ontap: () {
                                                                            Navigator.pop(
                                                                                context);
                                                                            provider
                                                                                .getDestinationsSearch(
                                                                                context:
                                                                                context);
                                                                            // Provider.of<HomeProvider>(context,
                                                                            //     listen: false)
                                                                            //     .getIncomeList(context, search.value, from.value, to.value, typeId.value);
                                                                          },
                                                                          color:
                                                                          primary)),
                                                                ],
                                                              ),
                                                        ],
                                                      )
                                                    ),
                                                  ),
                                                );
                                              }),
                                        );
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    color: primary,
                                    padding: EdgeInsets.all(0),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/filter.png",
                                                height: 15,
                                                color: white,
                                              ),
                                            SizedBox(width: 10,),
                                            Text("Sort By",style: Style()
                                                .textStyle(size: 14, w: FontWeight.w600, color: Colors.white),)
                                          ],
                                        )

                                  ),
                                )
                              ],
                            ),
                          ),
                          provider.destinationList != null
                              ? Container(
                            child:   provider.destinationList!.result!.isNotEmpty
                                ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.only(
                                    bottom: provider.showMoreTemple1 &&
                                        provider.showMoreTempleLoader1
                                        ? 0
                                        : 70),
                                itemCount:
                                provider.destinationList!.result!.length,
                                itemBuilder: (context, index) {
                                  return TempleTile(
                                    data:
                                    provider.destinationList!.result![index],
                                    fromNear: false,
                                  );
                                })
                                : Padding(
                                padding: EdgeInsets.only(top: h/5),
                                  child: CommonWidgets().showNoData(context),
                                ),
                          )  : Padding(padding: EdgeInsets.only(top: h/3),child: CommonWidgets().showLoader(),),
                          provider.showMoreTemple1 &&
                                  provider.showMoreTempleLoader1
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 70),
                                  child: CommonWidgets().showLoader(),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  );
          }),
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 20),
            child: CommonFloatingButton(
              width: 170,
              title: "Add Destination",
              image: "assets/destination.png",
              callB: () {
                PageNavigation().gotoAddTemples(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
