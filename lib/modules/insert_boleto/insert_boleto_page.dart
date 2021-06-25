import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/shared/input_text/input_text_widget.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_style.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatelessWidget {
  static final String routeName = "/insert-boleto";

  const InsertBoletoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 93, vertical: 24),
            child: Text(
              "Preencha os dados do boleto",
              style: AppTextStyles.titleBoldHeading,
              textAlign: TextAlign.center,
            ),
          ),
          InputTextWidget(
            label: "Nome do boleto",
            icon: Icons.description_outlined,
            onChanged: (value) {},
          ),
          InputTextWidget(
            label: "Vencimento",
            icon: Icons.calendar_today,
            onChanged: (value) {},
          ),
          InputTextWidget(
            label: "Valor",
            icon: Icons.monetization_on_outlined,
            onChanged: (value) {},
          ),
          InputTextWidget(
            label: "Código",
            icon: FontAwesomeIcons.barcode,
            onChanged: (value) {},
          )
        ],
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: "Cancelar",
        primaryOnPressed: () {},
        secondaryLabel: "Cadastrar",
        secondaryOnPressed: () {},
        enableSecondaryColor: true,
      ),
    );
  }
}
