import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';
import 'package:destinations/providers/auth_provider.dart';
import 'package:destinations/routes/routes.dart';
import 'package:destinations/widgets/commonButton.dart';
import 'package:destinations/widgets/commonHeadTile.dart';
import 'package:destinations/widgets/commonWidget.dart';
import 'package:destinations/widgets/textFields.dart';

class SaveCustomer extends StatelessWidget {
  SaveCustomer({Key? key}) : super(key: key);

  RxBool isAdmin = false.obs;
  RxBool showPass = true.obs;
  RxBool showConfPass = true.obs;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Consumer<AuthProvider>(
            builder: (context,provider,child){
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50,),
                      Text("Register",
                          style: Style().textStyle(
                              size: 25,
                              w: FontWeight.w800,
                              color: black)),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Kerala Destinations",style: Style().logoStyle(size: 30, w: FontWeight.w500, color: primary)),
                      SizedBox(
                        height: 50,
                      ),
                      CommonHeadTile(
                        title: "Name",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        style: Style().textStyle(
                            size: 14, w: FontWeight.w400, color: black),
                        controller: provider.name,
                        keyboardType: TextInputType.name,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Name is required!";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          // provider.setValue(
                          //     controller: provider.email, value: val);
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your name",
                          hintStyle: Style().textStyle(
                              size: 13, w: FontWeight.w300, color: g5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: g3,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: red,
                                width: 1,
                              )),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                        title: "Email",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        style: Style().textStyle(
                            size: 14, w: FontWeight.w400, color: black),
                        controller: provider.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Email is required!";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          // provider.setValue(
                          //     controller: provider.email, value: val);
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          hintStyle: Style().textStyle(
                              size: 13, w: FontWeight.w300, color: g5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: g3,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: red,
                                width: 1,
                              )),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                        title: "Address",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        style: Style().textStyle(
                            size: 14, w: FontWeight.w400, color: black),
                        controller: provider.address,
                        minLines: 5,maxLines: 6,
                        keyboardType: TextInputType.name,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Address is required!";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          // provider.setValue(
                          //     controller: provider.email, value: val);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                          hintText: "Enter your address",
                          hintStyle: Style().textStyle(
                              size: 13, w: FontWeight.w300, color: g5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: g3,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: red,
                                width: 1,
                              )),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                        title: "City",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        style: Style().textStyle(
                            size: 14, w: FontWeight.w400, color: black),
                        controller: provider.city,
                        keyboardType: TextInputType.name,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "City is required!";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          // provider.setValue(
                          //     controller: provider.email, value: val);
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your city",
                          hintStyle: Style().textStyle(
                              size: 13, w: FontWeight.w300, color: g5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: g3,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: red,
                                width: 1,
                              )),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                        title: "State",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: g3, width: 1)),
                        child: provider.states != null ? Padding(
                          padding: EdgeInsets.only(left: 15, right: 2),
                          child: DropdownButton(
                            value: provider.selectedState,
                            hint: Text("Select", style: Style().textStyle(
                                size: 14, w: FontWeight.w300, color: g5),),
                            dropdownColor: Colors.white,
                            iconSize: 27,
                            elevation: 16,
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                            ),
                            onChanged: (newValue,) {},
                            items: provider.states!.result!.map((item) {
                              return DropdownMenuItem(
                                onTap: () {
                                  provider.setState(item.stateName!);
                                },
                                value: item.stateName,
                                child: Text(
                                  item.stateName!,
                                ),
                              );
                            }).toList(),
                          ),
                        ) : Container(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonHeadTile(
                        title: "Pin code",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        style: Style().textStyle(
                            size: 14, w: FontWeight.w400, color: black),
                        controller: provider.pinCode,
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Pin code is required!";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          // provider.setValue(
                          //     controller: provider.email, value: val);
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your pin code",
                          hintStyle: Style().textStyle(
                              size: 13, w: FontWeight.w300, color: g5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: g3,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: red,
                                width: 1,
                              )),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1,
                              )),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      CommonButton(
                        color: primary,
                        title: "CONTINUE",
                        ontap: () {
                          if (_formKey.currentState!.validate()) {
                            if(provider.selectedState == null){
                              CommonWidgets().showSnack(msg: "State required!", context: context);
                            }else{
                              provider.saveCustomer(context: context, );
                            }
                            print("SUCCESS VALIDATION");
                          // PageNavigation().gotoDashboard(context);
                          } else {
                            print("FAIL VALIDATION");
                          }
                          // PageNavigation().gotoDashboard(context);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have account? ",
                            style: Style().textStyle(
                              size: 14,
                              w: FontWeight.w400,
                              color: g6,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                PageNavigation().gotoLogin(context);
                              },
                              child: Text(
                                "Sign In",
                                style: Style().textStyle(
                                  size: 15,
                                  w: FontWeight.w500,
                                  color: primary,
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
