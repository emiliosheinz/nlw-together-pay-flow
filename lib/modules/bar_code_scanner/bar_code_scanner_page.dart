import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_style.dart';
import 'package:payflow/shared/widgets/custom_bottom_sheet/custom_bottom_seet.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarCodeScannerPage extends StatefulWidget {
  static final routeName = '/bar-code-scanner';

  BarCodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarCodeScannerPageState createState() => _BarCodeScannerPageState();
}

class _BarCodeScannerPageState extends State<BarCodeScannerPage> {
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Center(
        child: Text(
          "Escaneie o código de barras do boleto",
          style: AppTextStyles.buttonBackground,
        ),
      ),
      leading: BackButton(color: AppColors.background),
    );
  }

  Widget buildOpacityOverlay() {
    return Expanded(
      child: Container(
        color: Colors.black.withOpacity(0.6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: "Não foi possível identificar um código de barras.",
      subtitle: "Tente escanear novamente ou digite o código do seu boleto.",
      primaryLabel: "Escanear novamente",
      primaryOnPressed: () {},
      secondaryLabel: "Digitar código",
      secondaryOnPressed: () {},
    );

    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Scaffold(
          appBar: buildAppBar(),
          body: Column(
            children: [
              buildOpacityOverlay(),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              buildOpacityOverlay()
            ],
          ),
          bottomNavigationBar: SetLabelButtons(
            primaryLabel: "Inserir código do boleto",
            primaryOnPressed: () {},
            secondaryLabel: "Adicionar da galeria",
            secondaryOnPressed: () {},
          ),
        ),
      ),
    );
  }
}
