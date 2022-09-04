import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';

class ImagePreview extends StatelessWidget {
  ImagePreview({required this.url});

  String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
