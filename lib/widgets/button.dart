import 'package:flutter/material.dart';
import 'package:posresto/shared/shared_thames.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color color;
  final VoidCallback? onPressed;
  const CustomFilledButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final Color color;
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const CustomTextButton({
    Key? key,
    required this.title,
    required this.color,
    this.width = double.infinity,
    this.height = 40,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: graydarkTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class CustomInputButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const CustomInputButton({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kGrayBackgraundColor,
        ),
        child: Center(
          child: Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 22,
              fontWeight: semiBold,
            ),
          ),
        ),
      ),
    );
  }
}
