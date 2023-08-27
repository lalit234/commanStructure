import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/ColorCode.dart';
import '../utility/Utils.dart';


class SearchFilter extends StatefulWidget {
  SearchFilter({Key? key, required this.onClickFilter, required this.searchHint, required this.onSearchTextChange, required this.controller});
  final Function onClickFilter;
  final String searchHint;
  final Function onSearchTextChange;
  final TextEditingController controller;

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
              height: 40.h,
              padding: const EdgeInsets.only(left: 15, right: 5,top: 2,bottom: 5),
              decoration: BoxDecoration(
                color: Utils.getColor(ColorCode.grey_white),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                controller: widget.controller,
                keyboardType: TextInputType.text,
                maxLines: 1,
                onChanged: (value)
                {
                    widget.onSearchTextChange(value);
                },
                textInputAction: TextInputAction.done,
                style: TextStyle(color: Utils.getColor(ColorCode.black),decoration: TextDecoration.none,fontSize: 13.sp,fontFamily: 'Gilroy_semi_bold'),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.searchHint,
                  counterText: "",
                  hintStyle:TextStyle(color: Utils.getColor(ColorCode.black).withOpacity(0.7),decoration: TextDecoration.none,fontSize: 13.sp,fontFamily: 'Gilroy_semi_bold'),
                ),
              ),
            )
        ),
        /*SizedBox(width: 10.w),
        InkWell(
          child: Container(
              height: 35.h,
              width: 35.h,
              padding: const EdgeInsets.only(left: 5, right: 5,top: 5,bottom: 5),
              decoration: BoxDecoration(
                color: Utils.getColor(ColorCode.white).withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Icon(Icons.filter_alt,size: 25,color: Utils.getColor(ColorCode.white),)
          ),
          onTap: (){

          },
        ),*/
      ],
    );
  }
}
