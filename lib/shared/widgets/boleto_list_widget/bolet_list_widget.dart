import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_style.dart';
import 'package:payflow/shared/widgets/boleto_bottom_sheet_modal/boleto_bottom_sheet_modal.dart';
import 'package:payflow/shared/widgets/boleto_list_widget/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_tile_widget/boleto_tile_widget.dart';

class BoletoListWidget extends StatefulWidget {
  final BoletoListController controller;

  BoletoListWidget({Key? key, required this.controller}) : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
      valueListenable: widget.controller.boletosNotifier,
      builder: (_, boletos, __) => boletos.length > 0
          ? Column(
              children: boletos
                  .map(
                    (boleto) => InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return BoletoBottomSheetModal(
                              onDeletePress: () async {
                                await widget.controller.deleteBoleto(boleto);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Boleto deletado!"),
                                    backgroundColor: AppColors.primary,
                                  ),
                                );
                                Navigator.pop(context);
                              },
                              onPrimaryPress: () {},
                              onSecondaryPress: () {
                                Navigator.pop(context);
                              },
                              boletoName: boleto.name ?? "sem nome",
                              boletoValue: boleto.value ?? 0,
                            );
                          },
                        );
                      },
                      child: BoletoTileWidget(data: boleto),
                    ),
                  )
                  .toList())
          : Center(
              child: SizedBox(
              width: 250,
              child: Text(
                "Não temos nada para exibir aqui no momento!\n Cadastre algum boleto para que sejá possível visualizá-lo.",
                style: AppTextStyles.buttonBoldPrimary,
                textAlign: TextAlign.center,
              ),
            )),
    );
  }
}
