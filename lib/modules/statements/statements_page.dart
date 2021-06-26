import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_style.dart';
import 'package:payflow/shared/widgets/boleto_list_widget/bolet_list_widget.dart';
import 'package:payflow/shared/widgets/boleto_list_widget/boleto_list_controller.dart';

class StatementsPage extends StatefulWidget {
  const StatementsPage({Key? key}) : super(key: key);

  @override
  _StatementsPageState createState() => _StatementsPageState();
}

class _StatementsPageState extends State<StatementsPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24),
            child: Row(
              children: [
                Text(
                  "Meus Extratos",
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
    );
  }
}
