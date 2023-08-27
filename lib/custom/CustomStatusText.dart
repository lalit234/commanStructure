
import 'package:dog_medical/utility/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStatusText extends StatefulWidget {
  const CustomStatusText({Key? key, required this.colorCode, required this.title, this.textsize}) : super(key: key);

  final String colorCode;
  final String title;
  final double? textsize;

  @override
  State<CustomStatusText> createState() => _CustomStatusTextState();
}

class _CustomStatusTextState extends State<CustomStatusText> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding:const EdgeInsets.only(top: 5,bottom: 5,left: 7,right: 7),
        decoration: BoxDecoration(
            color: Utils.getColor(widget.colorCode).withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(5))
        ),
        child: Text(widget.title,style: TextStyle(color:Utils.getColor(widget.colorCode),fontFamily: 'Gilroy_medium',decoration: TextDecoration.none,fontSize: widget.textsize ?? 11.sp))
    );
  }
}
