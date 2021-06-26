import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_style.dart';
import 'package:payflow/shared/widgets/delete_button/delete_button.dart';
import 'package:payflow/shared/widgets/rect_button/rect_button.dart';

class BoletoBottomSheetModal extends StatelessWidget {
  final VoidCallback onDeletePress;
  final VoidCallback onPrimaryPress;
  final VoidCallback onSecondaryPress;
  final String boletoName;
  final double boletoValue;

  const BoletoBottomSheetModal({
    Key? key,
    required this.onDeletePress,
    required this.onPrimaryPress,
    required this.onSecondaryPress,
    required this.boletoName,
    required this.boletoValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: AppColors.background,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 45,
              height: 2,
              color: AppColors.stroke,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: SizedBox(
                width: screenWidth * 0.6,
                child: Text.rich(
                  TextSpan(
                    text: "O boleto ",
                    style: AppTextStyles.bottomSheetRegularDescription,
                    children: [
                      TextSpan(
                        text: "$boletoName ",
                        style: AppTextStyles.bottomSheetBoldDescription,
                      ),
                      TextSpan(text: "no valor de "),
                      TextSpan(text: "R\$ ", children: [
                        TextSpan(
                          text:
                              "${NumberFormat("#,##0.00", "pt_BR").format(boletoValue)} ",
                          style: AppTextStyles.bottomSheetBoldDescription,
                        ),
                      ]),
                      TextSpan(text: "foi pago?"),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              children: [
                RectButton(
                  label: "Ainda não",
                  onPressed: onSecondaryPress,
                  buttonType: RectButtonType.secondary,
                ),
                SizedBox(width: 20),
                RectButton(
                  label: "Sim",
                  onPressed: onPrimaryPress,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Divider(),
            ),
            DeleteButton(
              label: "Deletar boleto",
              onPressed: onDeletePress,
            )
          ],
        ),
      ),
    );
  }
}
