import 'package:fauconsil/views/utils/appcolors.dart';
import 'package:flutter/material.dart';



class TextStyles {
  TextStyles._();

  static TextStyle get onPrimaryTitleText {
    return const TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 24);
  }

  static TextStyle get onPrimaryTitleText2 {
    return const TextStyle(
        color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24);
  }

  static TextStyle get onPresentationText {
    return TextStyle(
        fontFamily: 'Montserrat',
        color: AppColor.appPresentationText,
        fontWeight: FontWeight.w400,
        fontSize: 16);
  }

  static TextStyle get onPresentationText2 {
    return TextStyle(
      // fontFamily: 'Montserrat',
        color: AppColor.appPresentationText,
        fontWeight: FontWeight.w400,
        fontSize: 16);
  }

  static TextStyle get onPrimarySubTitleText {
    return const TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.white,
    );
  }

  static TextStyle get onPrimarySubTitleText2 {
    return const TextStyle(
      // fontFamily: 'Montserrat',
      color: Colors.white,
    );
  }

  static TextStyle get titleStyle {
    return const TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle get subtitleStyle {
    return  TextStyle(
        fontFamily: 'Montserrat',
        color: AppColor.black,
        fontSize: 14,
        fontWeight: FontWeight.bold);
  }

  static TextStyle get userNameStyle {
    return const TextStyle(
        fontFamily: 'Montserrat',
        color: AppColor.darkGrey,
        fontSize: 14,
        fontWeight: FontWeight.bold);
  }

  static TextStyle get textStyle14 {
    return const TextStyle(
      fontFamily: 'Montserrat',
      color: AppColor.darkGrey,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
  }
}

final richtext_style = TextStyle(color: AppColor.textGrey, fontSize: 15.0);
const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
const appbar_style_tab = TextStyle(
    fontFamily: "Kanit",
    fontSize: 25,
    color: AppColor.white,
    fontWeight: FontWeight.w500);
const appbar_style = TextStyle(
  //fontFamily: "Kanit",
    fontSize: 20,
    color: AppColor.white,
    fontWeight: FontWeight.w500);
const double defaultPadding = 16.0;
const double defaultBorderRadius = 12.0;
TextStyle textStyle1 = const TextStyle(
    color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600);
TextStyle textstyle_title = const TextStyle(
    color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600);

final text_field_focus_border = OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.blue, width: 1.3),
    borderRadius: BorderRadius.circular(12));
final text_field_error_border = OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.red, width: 1),
    borderRadius: BorderRadius.circular(12));
final text_form_field_decoration = InputDecoration(
  filled: true,
  fillColor: AppColor.textFieldColor,
  hintStyle: textStyle1.copyWith(
    color: AppColor.black,
    fontSize: 15,
  ),
  border: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColor.black,
        width: 0.5,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12.0))),
  focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.0,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12.0))),
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColor.red,
        width: 0.5,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12.0))),
);
final text_form_field_decoration_app =
InputDecoration(
    focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green, width: 2)),
    border: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.textGrey, width: 1)));
final text_form_field_decoration_without_border = InputDecoration(
    border: InputBorder.none,
    hintStyle: textStyle1.copyWith(
      color: AppColor.black,
      fontSize: 15,
    ));
final TextStyle textstyle = TextStyle(
    color: AppColor.black, fontSize: 15, fontWeight: FontWeight.w600);

AppBar appBarText(BuildContext context, String text) {
  return AppBar(
    backgroundColor: AppColor.blue,
    centerTitle: true,
    title: Text(
      text,
      style: appbar_style,
    ),
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back,
        color: AppColor.white,
      ),
    ),
  );
}

final TextStyle textStyle=TextStyle(
    color: AppColor.black, fontSize: 15,fontWeight: FontWeight.w600);
final TextStyle textStyle2=TextStyle(
    color: AppColor.black, fontSize: 15,fontWeight: FontWeight.normal);


final text_form_field_decoration_two = InputDecoration(
  filled: true,
  fillColor: Colors.white.withOpacity(0.15),
  border:  const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 0.5,
      ),
      borderRadius:  BorderRadius.all(Radius.circular(12.0))
  ),
  focusedBorder: const OutlineInputBorder(
      borderSide:BorderSide(
        color: Colors.blue,
        width: 1.0,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12.0))
  ),
  errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 0.5,
      ),
      borderRadius: BorderRadius.all(Radius.circular(12.0))
  ),
);
final List<String> check_list=["Oui", "Non"];
