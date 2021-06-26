import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_style.dart';

enum RectButtonType { primary, secondary }

class RectButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final RectButtonType buttonType;

  const RectButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.buttonType = RectButtonType.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderColor = buttonType == RectButtonType.primary
        ? AppColors.primary
        : AppColors.stroke;
    final buttonColor = buttonType == RectButtonType.primary
        ? AppColors.primary
        : AppColors.shape;
    final labelStyle = buttonType == RectButtonType.primary
        ? AppTextStyles.buttonBackground
        : AppTextStyles.buttonHeading;

    return Expanded(
      flex: 1,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(5),
          color: buttonColor,
        ),
        child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith(
              (states) => Colors.white.withOpacity(0.1),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: labelStyle,
          ),
        ),
      ),
    );
  }
}
