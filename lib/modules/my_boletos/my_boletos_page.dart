import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_style.dart';
import 'package:payflow/shared/widgets/boleto_info_widget/boleto_info_widget.dart';
import 'package:payflow/shared/widgets/boleto_list_widget/bolet_list_widget.dart';
import 'package:payflow/shared/widgets/boleto_list_widget/boleto_list_controller.dart';

class MyBoletosPage extends StatefulWidget {
  const MyBoletosPage({Key? key}) : super(key: key);

  @override
  _MyBoletosPageState createState() => _MyBoletosPageState();
}

class _MyBoletosPageState extends State<MyBoletosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ValueListenableBuilder<List<BoletoModel>>(
                  valueListenable: controller.boletosNotifier,
                  builder: (_, boletos, __) => AnimatedCard(
                    direction: AnimatedCardDirection.top,
                    child: BoletoInfoWidget(quantityOfBoletos: boletos.length),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Row(
                    children: [
                      Text(
                        "Meus boletos",
                        style: AppTextStyles.titleBoldHeading,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.stroke,
                  height: 48,
                  thickness: 1,
                ),
                BoletoListWidget(controller: controller)
              ],
            ),
          )
        ],
      ),
    );
  }
}
