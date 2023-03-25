import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:hexcolor/hexcolor.dart';

Widget defualtButton({
  double? width    ,
  double? height,
  double? fontSize,
  Color background = Colors.blue,
  Color textColor = Colors.white,
  @required VoidCallback? onPressed,
  bool isUpperCase = true,
  @required String? text,
  double radius = 5.0,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ),
    );

Widget defualtTextFormField({
  @required TextEditingController? controller,
  ValueChanged<String>? onChanged,
  ValueChanged<String>? onFieldSubmitted,
  GestureTapCallback? onTap,
  TextInputType? keyboardType,
  @required String? label,
  @required IconData? prefixIcon,
  Widget? suffixIcon,
   int? lim ,
  @required FormFieldValidator<String>? validate,
  bool isobscureText = false,
  VoidCallback? suffixPressed,
}) =>
    Container(
      decoration: BoxDecoration(
        boxShadow: [
         ],
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(lim)

        ],
        controller: controller,

        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        onTap: onTap,
        keyboardType: keyboardType,
        validator: validate,
        obscureText: isobscureText,
        decoration: InputDecoration(

          labelText: label,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0.r)),
              borderSide: BorderSide(color: HexColor("#FFD700"))),
          contentPadding: EdgeInsets.only( left: 35.w,),

          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );


void navigatorTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget ) );

void navigatorToReplacement(context, Widget) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => Widget));

Widget buildBookItem(String? name) => Container(
  color: Colors.white,
  child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(
          image: AssetImage("assets/images/PDF.png"),
          width: double.infinity,
          height: 110,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          name!,
          textAlign: TextAlign.start,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  ),
);





