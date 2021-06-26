import 'package:flutter/material.dart';
import 'package:payflow/modules/bar_code_scanner/bar_code_scanner_controller.dart';
import 'package:payflow/modules/bar_code_scanner/bar_code_scanner_status.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_page.dart';
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
  final controller = BarCodeScannerController();

  void goToInsetBoletoPage() {
    Navigator.pushNamed(
      context,
      InsertBoletoPage.routeName,
      arguments: controller.status.barCode,
    );
    Future.delayed(Duration(seconds: 1), () {
      controller.pause();
    });
  }

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarCode) {
        goToInsetBoletoPage();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

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
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarCodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: controller.cameraController!.buildPreview(),
                );
              }

              return Container();
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              appBar: buildAppBar(),
              backgroundColor: Colors.transparent,
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
                primaryOnPressed: goToInsetBoletoPage,
                secondaryLabel: "Adicionar da galeria",
                secondaryOnPressed: () {},
              ),
            ),
          ),
          ValueListenableBuilder<BarCodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return CustomBottomSheet(
                  title: "Não foi possível identificar um código de barras.",
                  subtitle:
                      "Tente escanear novamente ou digite o código do seu boleto.",
                  primaryLabel: "Escanear novamente",
                  primaryOnPressed: () {
                    controller.scanWithCamera();
                  },
                  secondaryLabel: "Digitar código",
                  secondaryOnPressed: goToInsetBoletoPage,
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
