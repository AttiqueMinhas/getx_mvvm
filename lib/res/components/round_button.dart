import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/colors/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      this.buttonColor = AppColor.amberColor,
      this.textColor = AppColor.whiteColor,
      required this.title,
      required this.onPress,
      this.width = 60,
      this.height = 50,
      this.loading = false});
  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(50)),
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColor.whiteColor),
                ),
              ),
      ),
    );
  }
}
