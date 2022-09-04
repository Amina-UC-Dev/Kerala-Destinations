import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';
import 'package:destinations/providers/temple_provider.dart';
import 'package:destinations/routes/routes.dart';
import 'package:destinations/widgets/commonAppBAr.dart';
import 'package:destinations/widgets/commonButton.dart';
import 'package:destinations/widgets/commonHeadTile.dart';
import 'package:destinations/widgets/commonWidget.dart';
import 'package:destinations/widgets/commondropDown.dart';
import 'package:destinations/widgets/textFields.dart';

class AddLocalTemples extends StatelessWidget {
  AddLocalTemples({Key? key}) : super(key: key);

  RxInt step = 1.obs;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: Consumer<TempleProvider>(builder: (context,provider,child){
          return CommonAppBar(
            showB: true,
            title: provider.editDest ? "Edit Destination" : "Add Destination",
          );
        },),
      ),
      body: SafeArea(child: Consumer<TempleProvider>(
        builder: (context, provider, child) {
          return provider.typesList.isNotEmpty
              ? SingleChildScrollView(
            controller: provider.scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  step.value == 1
                      ? Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      CommonHeadTile(
                        title: "Destination Type",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(10),
                            border: Border.all(
                                color: g3, width: 1)),
                        child: provider.typesList.isNotEmpty
                            ? Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 2),
                          child: DropdownButton(
                            style: Style().textStyle(
                                size: 14,
                                w: FontWeight.w400,
                                color: black),
                            value: provider
                                .selectedDestinationType,
                            hint: Text(
                              "Select destination type",
                              style: Style().textStyle(
                                  size: 14,
                                  w: FontWeight.w300,
                                  color: g5),
                            ),
                            dropdownColor: Colors.white,
                            iconSize: 27,
                            elevation: 16,
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                            ),
                            onChanged: (
                                newValue,
                                ) {},
                            items: provider
                                .typesList
                                .map((item) {
                              return DropdownMenuItem(
                                onTap: () {
                                  provider.selectTempleType(
                                      item.destinationType!);
                                },
                                value: item.destinationType,
                                child: Text(
                                  item.destinationType!,
                                ),
                              );
                            }).toList(),
                          ),
                        )
                            : Container(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonHeadTile(
                        title: "Destination Name",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        style: Style().textStyle(
                            size: 14,
                            w: FontWeight.w400,
                            color: black),
                        controller: provider.templeName,
                        keyboardType: TextInputType.name,
                        onChanged: (val) {
                          // provider.setValue(
                          //     controller: provider.email, value: val);
                        },
                        decoration: InputDecoration(
                          hintText: "Enter destination name",
                          hintStyle: Style().textStyle(
                              size: 14,
                              w: FontWeight.w300,
                              color: g5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: g3,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: red,
                                width: 1,
                              )),
                          focusedErrorBorder:
                          OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonHeadTile(
                        title: "Destination Local Name (Optional)",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        style: Style().textStyle(
                            size: 14,
                            w: FontWeight.w400,
                            color: black),
                        controller: provider.templeLocalName,
                        keyboardType: TextInputType.name,
                        onChanged: (val) {
                          // provider.setValue(
                          //     controller: provider.email, value: val);
                        },
                        decoration: InputDecoration(
                          hintText: "Enter destination local name",
                          hintStyle: Style().textStyle(
                              size: 14,
                              w: FontWeight.w300,
                              color: g5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: g3,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: red,
                                width: 1,
                              )),
                          focusedErrorBorder:
                          OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonHeadTile(
                        title: "Destination City",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        style: Style().textStyle(
                            size: 14,
                            w: FontWeight.w400,
                            color: black),
                        controller: provider.templeCity,
                        keyboardType: TextInputType.name,
                        onChanged: (val) {
                          // provider.setValue(
                          //     controller: provider.email, value: val);
                        },
                        decoration: InputDecoration(
                          hintText: "Enter city",
                          hintStyle: Style().textStyle(
                              size: 14,
                              w: FontWeight.w300,
                              color: g5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: g3,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: red,
                                width: 1,
                              )),
                          focusedErrorBorder:
                          OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonHeadTile(
                        title: "Destination State",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(10),
                            border: Border.all(
                                color: g3, width: 1)),
                        child: provider.statesList.isNotEmpty
                            ? Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 2),
                          child: DropdownButton(
                            style: Style().textStyle(
                                size: 14,
                                w: FontWeight.w400,
                                color: black),
                            value: provider.selectedState,
                            hint: Text(
                              "Select state",
                              style: Style().textStyle(
                                  size: 14,
                                  w: FontWeight.w300,
                                  color: g5),
                            ),
                            dropdownColor: Colors.white,
                            iconSize: 27,
                            elevation: 16,
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                            ),
                            onChanged: (
                                newValue,
                                ) {},
                            items: provider
                                .statesList
                                .map((item) {
                              return DropdownMenuItem(
                                onTap: () {
                                  provider.selectState(
                                      item.stateName!);
                                },
                                value: item.stateName,
                                child: Text(
                                  item.stateName!,
                                ),
                              );
                            }).toList(),
                          ),
                        )
                            : Container(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonHeadTile(
                        title: "Destination Country",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(10),
                            border: Border.all(
                                color: g3, width: 1)),
                        child: provider.countriesList.isNotEmpty
                            ? Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 2),
                          child: DropdownButton(
                            style: Style().textStyle(
                                size: 14,
                                w: FontWeight.w400,
                                color: black),
                            value:
                            provider.selectedCountry,
                            hint: Text(
                              "Select country",
                              style: Style().textStyle(
                                  size: 14,
                                  w: FontWeight.w300,
                                  color: g5),
                            ),
                            dropdownColor: Colors.white,
                            iconSize: 27,
                            elevation: 16,
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                            ),
                            onChanged: (
                                newValue,
                                ) {},
                            items: provider
                                .countriesList
                                .map((item) {
                              return DropdownMenuItem(
                                onTap: () {
                                  provider.selectCountry(
                                      item.countryName!);
                                },
                                value: item.countryName,
                                child: Text(
                                  item.countryName!,
                                ),
                              );
                            }).toList(),
                          ),
                        )
                            : Container(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonHeadTile(
                        title: "Zip Code",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        style: Style().textStyle(
                            size: 14,
                            w: FontWeight.w400,
                            color: black),
                        controller: provider.zipCode,
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          // provider.setValue(
                          //     controller: provider.email, value: val);
                        },
                        decoration: InputDecoration(
                          hintText: "Enter zip code",
                          hintStyle: Style().textStyle(
                              size: 14,
                              w: FontWeight.w300,
                              color: g5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: g3,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: red,
                                width: 1,
                              )),
                          focusedErrorBorder:
                          OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonHeadTile(
                        title: "Destination Image",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      provider.selectedImage != null
                          ? Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.all(8.0),
                            child: Container(
                              height: 80,
                              width: 80,
                              clipBehavior:
                              Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius
                                      .circular(10),
                                  border: Border.all(
                                    color: g3,
                                    width: 1,
                                  )),
                              child: Center(
                                  child: Image.file(
                                    File(provider
                                        .selectedImage!),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            child: MaterialButton(
                              padding: EdgeInsets.zero,
                              color: red,
                              onPressed: () {
                                provider.clearImage();
                              },
                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    100),
                              ),
                              child: Center(
                                  child: Icon(
                                    Icons.close,
                                    color: white,
                                    size: 17,
                                  )),
                            ),
                          )
                        ],
                      )
                          : InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              title: Text(
                                'Select Image',
                                style: Style().textStyle(
                                    size: 16,
                                    w: FontWeight.w600,
                                    color: black),
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    InkWell(onTap: (){
                                      Navigator.pop(context);
                                      provider.selectImageCamera();
                                    },
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          height: 50,width: w,
                                          child: Text("Camera",style: Style().textStyle(size: 14, w: FontWeight.w300, color: black),)),),
                                    InkWell(onTap: (){
                                      Navigator.pop(context);
                                      provider.selectImage();
                                    },
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          height: 50,width: w,
                                          child: Text("Gallery",style: Style().textStyle(size: 14, w: FontWeight.w300, color: black),)),),
                                    SizedBox(height: 10,),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius
                                  .circular(10),
                              border: Border.all(
                                color: g3,
                                width: 1,
                              )),
                          child: Center(
                              child: Image.asset(
                                "assets/images.png",
                                height: 30,
                                color: primary,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonHeadTile(
                        title: "Image Courtesy (Optional)",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        style: Style().textStyle(
                            size: 14,
                            w: FontWeight.w400,
                            color: black),
                        controller: provider.imageCourtesy,
                        keyboardType: TextInputType.name,
                        onChanged: (val) {
                          // provider.setValue(
                          //     controller: provider.email, value: val);
                        },
                        decoration: InputDecoration(
                          hintText: "Enter image courtesy",
                          hintStyle: Style().textStyle(
                              size: 14,
                              w: FontWeight.w300,
                              color: g5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: g3,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: red,
                                width: 1,
                              )),
                          focusedErrorBorder:
                          OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                        ),
                      ),
                    ],
                  )
                      : Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      CommonHeadTile(
                        title: "Other Images",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: provider.selectedImage1 !=
                                null
                                ? Stack(
                              alignment:
                              Alignment.topRight,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets
                                      .all(8.0),
                                  child: Container(
                                    height: w / 6,
                                    width: w / 6,
                                    clipBehavior:
                                    Clip.antiAlias,
                                    decoration:
                                    BoxDecoration(
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            10),
                                        border: Border
                                            .all(
                                          color: g3,
                                          width: 1,
                                        )),
                                    child: Center(
                                        child: Image.file(
                                          File(provider
                                              .selectedImage1!),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  child: MaterialButton(
                                    padding:
                                    EdgeInsets.zero,
                                    color: red,
                                    onPressed: () {
                                      provider
                                          .clearImage1();
                                    },
                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          100),
                                    ),
                                    child: Center(
                                        child: Icon(
                                          Icons.close,
                                          color: white,
                                          size: 17,
                                        )),
                                  ),
                                )
                              ],
                            )
                                : InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    title: Text(
                                      'Select Image',
                                      style: Style().textStyle(
                                          size: 16,
                                          w: FontWeight.w600,
                                          color: black),
                                    ),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          InkWell(onTap: (){
                                            Navigator.pop(context);
                                            provider.selectImageCamera1();
                                          },
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                height: 50,width: w,
                                                child: Text("Camera",style: Style().textStyle(size: 14, w: FontWeight.w300, color: black),)),),
                                          InkWell(onTap: (){
                                            Navigator.pop(context);
                                            provider.selectImage1();
                                          },
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                height: 50,width: w,
                                                child: Text("Gallery",style: Style().textStyle(size: 14, w: FontWeight.w300, color: black),)),),
                                          SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: w / 6,
                                width: w / 6,
                                decoration:
                                BoxDecoration(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        10),
                                    border: Border
                                        .all(
                                      color: g3,
                                      width: 1,
                                    )),
                                child: Center(
                                    child:
                                    Image.asset(
                                      "assets/images.png",
                                      height: 30,
                                      color: primary,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            child: provider.selectedImage2 !=
                                null
                                ? Stack(
                              alignment:
                              Alignment.topRight,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets
                                      .all(8.0),
                                  child: Container(
                                    height: w / 6,
                                    width: w / 6,
                                    clipBehavior:
                                    Clip.antiAlias,
                                    decoration:
                                    BoxDecoration(
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            10),
                                        border: Border
                                            .all(
                                          color: g3,
                                          width: 1,
                                        )),
                                    child: Center(
                                        child: Image.file(
                                          File(provider
                                              .selectedImage2!),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  child: MaterialButton(
                                    padding:
                                    EdgeInsets.zero,
                                    color: red,
                                    onPressed: () {
                                      provider
                                          .clearImage2();
                                    },
                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          100),
                                    ),
                                    child: Center(
                                        child: Icon(
                                          Icons.close,
                                          color: white,
                                          size: 17,
                                        )),
                                  ),
                                )
                              ],
                            )
                                : InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    title: Text(
                                      'Select Image',
                                      style: Style().textStyle(
                                          size: 16,
                                          w: FontWeight.w600,
                                          color: black),
                                    ),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          InkWell(onTap: (){
                                            Navigator.pop(context);
                                            provider.selectImageCamera2();
                                          },
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                height: 50,width: w,
                                                child: Text("Camera",style: Style().textStyle(size: 14, w: FontWeight.w300, color: black),)),),
                                          InkWell(onTap: (){
                                            Navigator.pop(context);
                                            provider.selectImage2();
                                          },
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                height: 50,width: w,
                                                child: Text("Gallery",style: Style().textStyle(size: 14, w: FontWeight.w300, color: black),)),),
                                          SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: w / 6,
                                width: w / 6,
                                decoration:
                                BoxDecoration(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        10),
                                    border: Border
                                        .all(
                                      color: g3,
                                      width: 1,
                                    )),
                                child: Center(
                                    child:
                                    Image.asset(
                                      "assets/images.png",
                                      height: 30,
                                      color: primary,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            child: provider.selectedImage3 !=
                                null
                                ? Stack(
                              alignment:
                              Alignment.topRight,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets
                                      .all(8.0),
                                  child: Container(
                                    height: w / 6,
                                    width: w / 6,
                                    clipBehavior:
                                    Clip.antiAlias,
                                    decoration:
                                    BoxDecoration(
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            10),
                                        border: Border
                                            .all(
                                          color: g3,
                                          width: 1,
                                        )),
                                    child: Center(
                                        child: Image.file(
                                          File(provider
                                              .selectedImage3!),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  child: MaterialButton(
                                    padding:
                                    EdgeInsets.zero,
                                    color: red,
                                    onPressed: () {
                                      provider
                                          .clearImage3();
                                    },
                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          100),
                                    ),
                                    child: Center(
                                        child: Icon(
                                          Icons.close,
                                          color: white,
                                          size: 17,
                                        )),
                                  ),
                                )
                              ],
                            )
                                : InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    title: Text(
                                      'Select Image',
                                      style: Style().textStyle(
                                          size: 16,
                                          w: FontWeight.w600,
                                          color: black),
                                    ),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          InkWell(onTap: (){
                                            Navigator.pop(context);
                                            provider.selectImageCamera3();
                                          },
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                height: 50,width: w,
                                                child: Text("Camera",style: Style().textStyle(size: 14, w: FontWeight.w300, color: black),)),),
                                          InkWell(onTap: (){
                                            Navigator.pop(context);
                                            provider.selectImage3();
                                          },
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                height: 50,width: w,
                                                child: Text("Gallery",style: Style().textStyle(size: 14, w: FontWeight.w300, color: black),)),),
                                          SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: w / 6,
                                width: w / 6,
                                decoration:
                                BoxDecoration(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        10),
                                    border: Border
                                        .all(
                                      color: g3,
                                      width: 1,
                                    )),
                                child: Center(
                                    child:
                                    Image.asset(
                                      "assets/images.png",
                                      height: 30,
                                      color: primary,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            child: provider.selectedImage4 !=
                                null
                                ? Stack(
                              alignment:
                              Alignment.topRight,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets
                                      .all(8.0),
                                  child: Container(
                                    height: w / 6,
                                    width: w / 6,
                                    clipBehavior:
                                    Clip.antiAlias,
                                    decoration:
                                    BoxDecoration(
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            10),
                                        border: Border
                                            .all(
                                          color: g3,
                                          width: 1,
                                        )),
                                    child: Center(
                                        child: Image.file(
                                          File(provider
                                              .selectedImage4!),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  child: MaterialButton(
                                    padding:
                                    EdgeInsets.zero,
                                    color: red,
                                    onPressed: () {
                                      provider
                                          .clearImage4();
                                    },
                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          100),
                                    ),
                                    child: Center(
                                        child: Icon(
                                          Icons.close,
                                          color: white,
                                          size: 17,
                                        )),
                                  ),
                                )
                              ],
                            )
                                : InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    title: Text(
                                      'Select Image',
                                      style: Style().textStyle(
                                          size: 16,
                                          w: FontWeight.w600,
                                          color: black),
                                    ),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          InkWell(onTap: (){
                                            Navigator.pop(context);
                                            provider.selectImageCamera4();
                                          },
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                height: 50,width: w,
                                                child: Text("Camera",style: Style().textStyle(size: 14, w: FontWeight.w300, color: black),)),),
                                          InkWell(onTap: (){
                                            Navigator.pop(context);
                                            provider.selectImage4();
                                          },
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                height: 50,width: w,
                                                child: Text("Gallery",style: Style().textStyle(size: 14, w: FontWeight.w300, color: black),)),),
                                          SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: w / 6,
                                width: w / 6,
                                decoration:
                                BoxDecoration(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        10),
                                    border: Border
                                        .all(
                                      color: g3,
                                      width: 1,
                                    )),
                                child: Center(
                                    child:
                                    Image.asset(
                                      "assets/images.png",
                                      height: 30,
                                      color: primary,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonHeadTile(
                        title: "Destination Description",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        style: Style().textStyle(
                            size: 14,
                            w: FontWeight.w400,
                            color: black),
                        controller: provider.templeDescription,
                        keyboardType: TextInputType.name,
                        maxLines: 6,
                        minLines: 4,
                        onChanged: (val) {
                          // provider.setValue(
                          //     controller: provider.email, value: val);
                        },
                        decoration: InputDecoration(
                            hintText: "Enter description",
                            hintStyle: Style().textStyle(
                                size: 14,
                                w: FontWeight.w300,
                                color: g5),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: g3,
                                  width: 1,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: primary,
                                  width: 1,
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: red,
                                  width: 1,
                                )),
                            focusedErrorBorder:
                            OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    10),
                                borderSide: BorderSide(
                                  color: primary,
                                  width: 1,
                                )),
                            contentPadding:
                            const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonHeadTile(
                        title: "Best Season",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        style: Style().textStyle(
                            size: 14,
                            w: FontWeight.w400,
                            color: black),
                        controller: provider.bestSeason,
                        keyboardType: TextInputType.name,
                        onChanged: (val) {
                          // provider.setValue(
                          //     controller: provider.email, value: val);
                        },
                        decoration: InputDecoration(
                          hintText: "Enter season",
                          hintStyle: Style().textStyle(
                              size: 14,
                              w: FontWeight.w300,
                              color: g5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: g3,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: red,
                                width: 1,
                              )),
                          focusedErrorBorder:
                          OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonHeadTile(
                        title: "Destination Attractions (Optional)",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        style: Style().textStyle(
                            size: 14,
                            w: FontWeight.w400,
                            color: black),
                        controller: provider.destAttraction,
                        keyboardType: TextInputType.name,
                        maxLines: 6,
                        minLines: 4,
                        onChanged: (val) {
                          // provider.setValue(
                          //     controller: provider.email, value: val);
                        },
                        decoration: InputDecoration(
                            hintText: "Enter destination attraction",
                            hintStyle: Style().textStyle(
                                size: 14,
                                w: FontWeight.w300,
                                color: g5),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: g3,
                                  width: 1,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: primary,
                                  width: 1,
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: red,
                                  width: 1,
                                )),
                            focusedErrorBorder:
                            OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    10),
                                borderSide: BorderSide(
                                  color: primary,
                                  width: 1,
                                )),
                            contentPadding:
                            const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      step.value == 2
                          ? Container(
                        width: w / 2.5,
                        child: CommonButton(
                          color: g4,
                          title: "Previous",
                          ontap: () {
                            if (step.value == 2) {
                              step.value = 1;
                            }
                          },
                        ),
                      )
                          : Container(),
                      SizedBox(
                        width: step.value == 1 ? 0 : 15,
                      ),
                      SizedBox(
                        width: w / 2.5,
                        child: CommonButton(
                          color: primary,
                          title:
                          step.value == 1 ? "Next" : provider.editDest ? "Save Destination" : "Add Destination",
                          ontap: () {
                            if (step.value == 1) {
                              if (provider.selectedDestinationType ==
                                  null) {
                                CommonWidgets().showSnack(
                                    context: context,
                                    msg: "Destination type required!");
                              } else if (provider
                                  .templeName.text.isEmpty) {
                                CommonWidgets().showSnack(
                                    context: context,
                                    msg: "Destination name required!");
                              } else if (provider
                                  .templeCity.text.isEmpty) {
                                CommonWidgets().showSnack(
                                    context: context,
                                    msg: "Destination city required!");
                              } else if (provider.selectedState ==
                                  null) {
                                CommonWidgets().showSnack(
                                    context: context,
                                    msg: "destination state required!");
                              } else if (provider.selectedCountry ==
                                  null) {
                                CommonWidgets().showSnack(
                                    context: context,
                                    msg: "Destination country required!");
                              } else if (provider
                                  .zipCode.text.isEmpty) {
                                CommonWidgets().showSnack(
                                    context: context,
                                    msg: "Destination zipcode required!");
                              }else {
                                if (provider.selectedImage == null) {
                                  if (provider.editDest) {
                                    if (provider.templeImage ==
                                        null) {
                                      CommonWidgets().showSnack(
                                          context: context,
                                          msg:
                                          "Destination image required!");
                                    }else{
                                      step.value = 2;
                                      provider.scrollToTop();
                                    }
                                  } else {
                                    CommonWidgets().showSnack(
                                        context: context,
                                        msg:
                                        "Destination image required!");
                                  }
                                } else {
                                  step.value = 2;
                                  provider.scrollToTop();
                                }
                              }
                            }
                            else {
                              if (provider
                                  .templeDescription.text.isEmpty) {
                                CommonWidgets().showSnack(
                                    context: context,
                                    msg:
                                    "Destination description required!");
                              } else if (provider
                                  .bestSeason.text.isEmpty) {
                                CommonWidgets().showSnack(
                                    context: context,
                                    msg: "Best Season required!");
                              } else {
                                if(provider.editDest){
                                  provider.editLocalDestination(context: context);
                                }else{
                                  provider.addLocalDestination(context: context);
                                }
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              )),
            ),
          )
              : CommonWidgets().showLoader();
        },
      )),
    );
  }
}
