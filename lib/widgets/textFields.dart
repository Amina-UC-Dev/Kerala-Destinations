import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField({
    Key? key,
    required this.type,
    required this.hint,
    required this.controller,
    required this.validator,
    required this.icon,
  }) : super(key: key);

  String hint;

  TextInputType type;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  Widget icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Style().textStyle(size: 14, w: FontWeight.w400, color: black),
      controller: controller,
      keyboardType: type,
      validator: validator,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: Style().textStyle(size: 13, w: FontWeight.w300, color: g5),
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
            padding: const EdgeInsets.only(right: 5, top: 0, left: 5),
            child: icon,
          )),
    );
  }
}

class CommonPasswordTextField extends StatelessWidget {
  CommonPasswordTextField({
    Key? key,
    required this.type,
    required this.hint,
    required this.icon,
    required this.isConfirm,
    required this.oldPass,
    required this.onC,
  }) : super(key: key);

  String hint, oldPass;
  IconData icon;
  TextEditingController controller = TextEditingController();
  TextInputType type;
  bool isConfirm;
  Function(String val) onC;

  RxBool showPass = true.obs;
  RxString errorMessage = "".obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          style: Style().textStyle(size: 14, w: FontWeight.w400, color: black),
          controller: controller,
          onFieldSubmitted: onC,
          validator: (val) {
            if (val!.isEmpty) {
              errorMessage.value = !isConfirm
                  ? "Password is required!"
                  : "Confirm Password is required!";
              return errorMessage.value;
            } else if (val.isNotEmpty && isConfirm) {
              if (val.toString() != oldPass.toString()) {
                print("old pass : ${oldPass}");
                errorMessage.value = "Password mismatch!";
                return errorMessage.value;
              } else {
                return null;
              }
            } else {
              return null;
            }
          },
          keyboardType: type,
          obscureText: showPass.value,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle:
                  Style().textStyle(size: 13, w: FontWeight.w300, color: g5),
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
                padding: const EdgeInsets.only(right: 5, top: 0, left: 5),
                child: Icon(
                  icon,
                  size: 18,
                  color: primary,
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  showPass.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 18,
                ),
                onPressed: () {
                  showPass.value = !showPass.value;
                },
              )),
        ));
  }
}

class CommonTextField2 extends StatelessWidget {
  CommonTextField2({
    Key? key,
    required this.controller,
    required this.type,
    required this.icon,
    this.onC,
    this.read,
    this.valText,
  }) : super(key: key);

  TextEditingController controller;
  TextInputType type;
  bool? read;
  IconData icon;
  String? valText;
  Function(String val)? onC;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: read!,
      validator: (val) {
        if (val!.isEmpty) {
          return valText;
        } else {
          return null;
        }
      },
      style: Style().textStyle(size: 14, w: FontWeight.w400, color: black),
      controller: controller,
      keyboardType: type,
      onChanged: onC,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only( left: 15),
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
            padding: const EdgeInsets.only(right: 0, top: 0, left: 5),
            child: Icon(
              icon,
              size: 18,
              color: primary,
            ),
          )),
    );
  }
}

class CommonTextField4 extends StatelessWidget {
  CommonTextField4({
    Key? key,
    required this.controller,
    required this.type,
    required this.icon,
    required this.callB,
    this.valText,
  }) : super(key: key);

  TextEditingController controller;
  TextInputType type;
  IconData icon;
  String? valText;

  Function() callB;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        if (val!.isEmpty) {
          return valText;
        } else {
          return null;
        }
      },
      readOnly: true,
      onTap: callB,
      controller: controller,
      keyboardType: type,
      style: Style().textStyle(size: 14, w: FontWeight.w400, color: black),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15),
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
            padding: const EdgeInsets.only(right: 0, top: 0, left: 5),
            child: Icon(
              icon,
              size: 18,
              color: primary,
            ),
          )),
    );
  }
}

class CommonTextField3 extends StatelessWidget {
  CommonTextField3({
    Key? key,
    required this.controller,
    required this.type,
    this.onC,
    this.valText,
    this.read,
  }) : super(key: key);

  TextEditingController controller;
  TextInputType type;
  String? valText;
  bool? read;
  Function(String val)? onC;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: read!,
      validator: (val) {
        if (val!.isEmpty) {
          return valText;
        } else {
          return null;
        }
      },
      controller: controller,
      keyboardType: type,
      onChanged: onC,
      style: Style().textStyle(size: 14, w: FontWeight.w400, color: black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only( left: 15),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: g3,
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
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: primary,
              width: 1,
            )),
      ),
    );
  }
}

class CommonDescriptionTextField extends StatelessWidget {
  CommonDescriptionTextField({
    Key? key,
    required this.controller,
    this.onC,
    this.valText,
    this.read,
  }) : super(key: key);

  TextEditingController controller;
  Function(String val)? onC;
  String? valText;

  bool? read;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: read!,
      validator: (val) {
        if (val!.isEmpty) {
          return valText;
        } else {
          return null;
        }
      },
      controller: controller,
      maxLines: 4,
      // expands: true,
      style: Style().textStyle(size: 14, w: FontWeight.w400, color: black),
      keyboardType: TextInputType.text,
      onChanged: onC,
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
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
    );
  }
}


