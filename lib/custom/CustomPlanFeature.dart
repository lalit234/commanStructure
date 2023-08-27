

import 'package:dog_medical/custom/CustomText.dart';
import 'package:dog_medical/utility/ColorCode.dart';
import 'package:dog_medical/utility/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomPlanFeature extends StatefulWidget {

  const CustomPlanFeature({Key? key,required this.title}) : super(key: key);

  final String title;

  @override
  State<CustomPlanFeature> createState() => _CustomPlanFeatureState();
}

class _CustomPlanFeatureState extends State<CustomPlanFeature> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.check_circle,color: Utils.getColor(ColorCode.green),size: 20),
          SizedBox(width: 5.w,),
          Expanded(
            child: CustomText(
                text: widget.title,
                colorCode: ColorCode.black,
                fontSize: 15,
                fontFamily: 'Gilroy_semi_bold'),
          ),
        ],
      ),
    );
  }
}
