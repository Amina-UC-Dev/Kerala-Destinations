import 'package:flutter/material.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';


class CommonDropDown extends StatefulWidget {
  CommonDropDown({Key? key,required this.data,required this.hint}) : super(key: key);

  String hint;
  List<String> data;

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}


class _CommonDropDownState extends State<CommonDropDown> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: g3, width: 1)),
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 2),
            child: DropdownButton<String>(
              value: dropdownValue,
              hint: Text(
                widget.hint,
                style: Style().textStyle(size: 13, w: FontWeight.w300, color: g8),
              ),
              // icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              isExpanded: true,
              style: Style().textStyle(size: 14, w: FontWeight.w400, color: black),
              underline: Container(
                height: 0,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: widget.data
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),

      ],
    );
  }
}
