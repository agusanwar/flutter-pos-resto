import 'package:flutter/material.dart';
import 'package:posresto/shared/shared_thames.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obsecureText;
  final TextEditingController? controlller;
  final bool isShowTitle;
  final TextInputType? keyboardType;
  final Function(String)? onFieldSubmitted;

  const CustomFormField({
    Key? key,
    // constuctor
    required this.title,
    this.obsecureText = false,
    this.controlller,
    this.isShowTitle = true,
    this.keyboardType,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        if (isShowTitle)
          const SizedBox(
            height: 8,
          ),
        TextFormField(
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          obscureText: obsecureText,
          keyboardType: keyboardType,
          controller: controlller,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            // hin text label
            hintText: !isShowTitle ? title : null,
            // if not show title add prefic icon in fom field
            prefixIcon: !isShowTitle ? const Icon(Icons.search) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
      ],
    );
  }
}
