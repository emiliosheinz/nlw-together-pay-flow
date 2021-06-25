import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_style.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;

  const SetLabelButtons(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secondaryLabel,
      required this.secondaryOnPressed,
      this.enablePrimaryColor = false,
      this.enableSecondaryColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Divider(
          thickness: 1,
          height: 1,
          color: AppColors.stroke,
        ),
        Container(
          height: 55,
          child: Row(
            children: [
              Expanded(
                child: LabelButton(
                  label: primaryLabel,
                  onPressed: primaryOnPressed,
                  lableStyle:
                      enablePrimaryColor ? AppTextStyles.buttonPrimary : null,
                ),
              ),
              VerticalDivider(
                width: 1,
                thickness: 1,
                color: AppColors.stroke,
              ),
              Expanded(
                child: LabelButton(
                  label: secondaryLabel,
                  onPressed: secondaryOnPressed,
                  lableStyle:
                      enableSecondaryColor ? AppTextStyles.buttonPrimary : null,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
