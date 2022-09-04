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
import 'package:destinations/widgets/textFields.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Form(
            key: _formKey,
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Welcome to",
                                  style: Style().textStyle(
                                      size: 25,
                                      w: FontWeight.w800,
                                      color: black)),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Kerala Destinations",
                                  style: Style().logoStyle(
                                      size: 30,
                                      w: FontWeight.w500,
                                      color: primary)),
                            ],
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Text("Enter your Mobile number and we'll\nsend you a code."
                            ,style: Style().textStyle(size: 16, w: FontWeight.w500,
                                color: black),textAlign: TextAlign.left,),
                          SizedBox(
                            height: 60,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonHeadTile(
                                title: "Mobile Number",
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                style: Style().textStyle(
                                    size: 14, w: FontWeight.w400, color: black),
                                controller: provider.mobile,
                                keyboardType: TextInputType.number,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Mobile is required!";
                                  } else {
                                    return null;
                                  }
                                },

                                decoration: InputDecoration(
                                    hintText: "Enter your Mobile number",
                                    hintStyle: Style().textStyle(
                                        size: 13,
                                        w: FontWeight.w300,
                                        color: g5),
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
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5, top: 0, left: 10),
                                      child: Container(width: 50,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.phone,
                                              size: 18,
                                              color: primary,
                                            ),
                                            Text("  +91")
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                              // const SizedBox(
                              //   height: 15,
                              // ),
                              // CommonHeadTile(
                              //   title: "Password",
                              // ),
                              // const SizedBox(
                              //   height: 8,
                              // ),
                              // Obx(() => TextFormField(
                              //       style: Style().textStyle(
                              //           size: 14,
                              //           w: FontWeight.w400,
                              //           color: black),
                              //       controller: provider.email,
                              //       validator: (val) {
                              //         if (val!.isEmpty) {
                              //           return "Password is required!";
                              //         } else {
                              //           return null;
                              //         }
                              //       },
                              //       keyboardType: TextInputType.name,
                              //       obscureText: showPass.value,
                              //       decoration: InputDecoration(
                              //           hintText: "Enter your password",
                              //           hintStyle: Style().textStyle(
                              //               size: 13,
                              //               w: FontWeight.w300,
                              //               color: g5),
                              //           enabledBorder: OutlineInputBorder(
                              //               borderRadius:
                              //                   BorderRadius.circular(10),
                              //               borderSide: BorderSide(
                              //                 color: g3,
                              //                 width: 1,
                              //               )),
                              //           focusedBorder: OutlineInputBorder(
                              //               borderRadius:
                              //                   BorderRadius.circular(10),
                              //               borderSide: BorderSide(
                              //                 color: primary,
                              //                 width: 1,
                              //               )),
                              //           errorBorder: OutlineInputBorder(
                              //               borderRadius:
                              //                   BorderRadius.circular(10),
                              //               borderSide: BorderSide(
                              //                 color: red,
                              //                 width: 1,
                              //               )),
                              //           focusedErrorBorder: OutlineInputBorder(
                              //               borderRadius:
                              //                   BorderRadius.circular(10),
                              //               borderSide: BorderSide(
                              //                 color: primary,
                              //                 width: 1,
                              //               )),
                              //           prefixIcon: Padding(
                              //             padding: const EdgeInsets.only(
                              //                 right: 5, top: 0, left: 5),
                              //             child: Icon(
                              //               Icons.lock,
                              //               size: 18,
                              //               color: primary,
                              //             ),
                              //           ),
                              //           suffixIcon: IconButton(
                              //             icon: Icon(
                              //               showPass.value
                              //                   ? Icons.visibility_outlined
                              //                   : Icons.visibility_off_outlined,
                              //               size: 18,
                              //             ),
                              //             onPressed: () {
                              //               showPass.value = !showPass.value;
                              //             },
                              //           )),
                              //     )),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       top: 8, bottom: 8, right: 2, left: 2),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.end,
                              //     children: [
                              //       InkWell(
                              //           onTap: () {
                              //             PageNavigation()
                              //                 .gotoForgotPassword(context);
                              //           },
                              //           child: Text(
                              //             "Forgot Password   ",
                              //             style: Style().textStyle(
                              //               size: 13,
                              //               w: FontWeight.w400,
                              //               color: primary,
                              //             ),
                              //           ))
                              //     ],
                              //   ),
                              // ),
                              const SizedBox(
                                height: 20,
                              ),
                              CommonButton(
                                color: primary,
                                title: "CONTINUE",
                                ontap: () {
                                  if (_formKey.currentState!.validate()) {
                                    print("SUCCESS VALIDATION");
                                    provider.register(context: context);
                                  } else {
                                    print("FAIL VALIDATION");
                                  }
                                  // PageNavigation().gotoDashboard(context);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
