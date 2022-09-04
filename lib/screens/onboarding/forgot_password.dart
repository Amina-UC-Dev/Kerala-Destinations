import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';
import 'package:destinations/providers/auth_provider.dart';
import 'package:destinations/widgets/commonButton.dart';
import 'package:destinations/widgets/commonHeadTile.dart';
import 'package:destinations/widgets/textFields.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Consumer<AuthProvider>(
            builder: (context,provider,child){
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Text("Kerala Temples",style: Style().logoStyle(size: 30, w: FontWeight.w500, color: primary))),
                        SizedBox(
                          height: 30,
                        ),
                        Center(child: Text("Reset your password",style: Style().textStyle(size: 25, w: FontWeight.w800, color: black))),
                        SizedBox(
                          height: 15,
                        ),
                        Center(child:
                        Text("Enter your email address and we'll send you a link to reset"
                            " your password.",style: Style().textStyle(size: 16, w: FontWeight.w500,
                            color: black),textAlign: TextAlign.center,)),
                        SizedBox(
                          height: w/5,
                        ),
                        CommonHeadTile(
                          title: "Email",
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CommonTextField(
                          controller: provider.email,
                          validator: (val){
                            if (val!.isEmpty) {
                              return "Email is required!";
                            } else {
                              return null;
                            }
                          },
                          type: TextInputType.emailAddress,
                          hint: "Enter your email",
                          icon: Icon(
                            Icons.email_sharp,
                            size: 18,
                            color: primary,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonButton(
                          color: primary,
                          title: "SEND",
                          ontap: () {

                            if (_formKey.currentState!.validate()) {
                              print("SUCCESS VALIDATION");
                              provider.forgotPassword(context: context);
                            } else {
                              print("FAIL VALIDATION");
                            }
                          },
                        ),
                      ],
                    ),
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