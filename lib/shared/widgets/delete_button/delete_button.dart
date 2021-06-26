import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_style.dart';

class DeleteButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const DeleteButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith(
              (states) => Colors.red.withOpacity(0.1)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.delete_outline,
              color: AppColors.delete,
            ),
            SizedBox(width: 10),
            Text(
              label,
              style: AppTextStyles.buttonDelete,
            )
          ],
        ),
      ),
    );
  }
}
