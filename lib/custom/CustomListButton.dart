import 'package:dog_medical/utility/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListButton extends StatefulWidget {
  const CustomListButton({Key? key,required this.onClick, required this.text, required this.textcolor, required this.bgcolor, this.textsize});
  final Function onClick;
  final String text;
  final String textcolor;
  final String bgcolor;
  final double? textsize;

  @override
  State<CustomListButton> createState() => _CustomListButtonState();
}

class _CustomListButtonState extends State<CustomListButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(top: 5,bottom: 5,left: 7,right: 7),
      decoration: BoxDecoration(
          color: Utils.getColor(widget.bgcolor).withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child:Center(child: Text(widget.text,style:TextStyle(color: Utils.getColor(widget.textcolor),decoration: TextDecoration.none,fontSize: widget.textsize ?? 11.sp))),
          onTap: ()
          {
            widget.onClick();
          },
        ),
      ),
    );
  }
}
