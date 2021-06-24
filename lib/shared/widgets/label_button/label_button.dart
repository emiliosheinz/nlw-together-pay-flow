import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_style.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? lableStyle;

  const LabelButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.lableStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: lableStyle ?? AppTextStyles.buttonHeading,
        ),
      ),
    );
  }
}
