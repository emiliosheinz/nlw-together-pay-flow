import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_style.dart';

class BoletoInfoWidget extends StatelessWidget {
  final int quantityOfBoletos;
  const BoletoInfoWidget({Key? key, required this.quantityOfBoletos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppImages.logomini,
              color: AppColors.background,
              width: 56,
              height: 34,
            ),
            Container(
              width: 1,
              height: 32,
              color: AppColors.background,
            ),
            Text.rich(TextSpan(
              text: "Você tem ",
              style: AppTextStyles.captionBackground,
              children: [
                TextSpan(
                  text: "$quantityOfBoletos boletos\n",
                  style: AppTextStyles.captionBoldBackground,
                ),
                TextSpan(
                  text: "cadastrados para pagar",
                  style: AppTextStyles.captionBackground,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
