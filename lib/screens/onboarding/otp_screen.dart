import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';
import 'package:destinations/providers/auth_provider.dart';
import 'package:destinations/widgets/commonButton.dart';
import 'package:destinations/widgets/commonWidget.dart';

class OtpVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Kerala Destinations",
                        style: Style().logoStyle(
                            size: 30,
                            w: FontWeight.w500,
                            color: primary)),
                    SizedBox(
                      height: 35,
                    ),
                    Text("Enter your OTP code for Verification."
                      ,style: Style().textStyle(size: 16, w: FontWeight.w500,
                        color: black),textAlign: TextAlign.left,),
                    SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Center(
                        child: PinCodeTextField(
                          validator: (val) {
                            return null;
                          },
                          onChanged: (val) {
                            provider.setOtp(val);
                          },
                          controller: provider.otp,
                          autoFocus: true,
                          appContext: context,
                          length: 6,
                          textStyle:  Style().textStyle(
                              size: 15,
                              w: FontWeight.w500,
                              color: black),
                          obscureText: false,
                          blinkWhenObscuring: true,
                          pinTheme: PinTheme(
                            inactiveColor: g4,
                            borderWidth: 1.5,
                            fieldHeight: 40,
                            activeColor: primary,
                            fieldWidth: 40,
                            shape: PinCodeFieldShape.box,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CommonButton(
                      color: primary,
                      title: "VERIFY",
                      ontap: () {
                        if (provider.otpValue.isEmpty) {
                          CommonWidgets().showSnack(msg: "OTP required!", context: context);
                        } else if (provider.otpValue.length != 6) {
                          CommonWidgets().showSnack(msg: "Valid OTP required!", context: context);
                        } else {
                          provider.verifyOTPByFirebase(context: context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't receive the code? ",
                          style: Style().textStyle(
                              size: 15,
                              w: FontWeight.w500,
                              color: black),
                        ),
                        InkWell(
                          onTap: () async {
                            provider.resendOTPByFirebase(context: context);
                          },
                          child: Text(
                            "Resend OTP",
                            style: Style().textStyle(
                                size: 15,
                                w: FontWeight.w600,
                                color: primary),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
