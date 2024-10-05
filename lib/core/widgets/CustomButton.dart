import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressd, required this.color, required this.colorb,
  });
  final String text;
  final void Function() onPressd;
  final Color color;
  final Color colorb;
  @override
  Widget build(BuildContext context) {
    return Container(
      //  padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 56,
      child: FilledButton(
        onPressed: onPressd,
        child: Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: colorb),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                side: BorderSide(color: colorb,width: 0),
                borderRadius: BorderRadius.circular(16))),
        ),
      ),
    );
  }
}
