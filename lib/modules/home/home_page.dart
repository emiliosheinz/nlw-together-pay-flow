import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/modules/bar_code_scanner/bar_code_scanner_page.dart';
import 'package:payflow/modules/home/home_controlle.dart';
import 'package:payflow/modules/my_boletos/my_boletos_page.dart';
import 'package:payflow/modules/statements/statements_page.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_style.dart';
import 'package:payflow/shared/widgets/profile_bottom_sheet_modal/profile_bottom_sheet_modal.dart';

class HomePage extends StatefulWidget {
  static final routeName = "/home";

  final UserModel user;
  final AuthController authController;

  const HomePage({Key? key, required this.user, required this.authController})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  void setCurrentPage(int page) {
    controller.setPage(page);
    setState(() {});
  }

  PreferredSizeWidget buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(152),
      child: Container(
        height: 152,
        color: AppColors.primary,
        child: Center(
          child: ListTile(
            title: Text.rich(
              TextSpan(
                text: "Olá, ",
                style: AppTextStyles.titleRegular,
                children: [
                  TextSpan(
                    text: "${widget.user.name}",
                    style: AppTextStyles.titleBoldBackground,
                  )
                ],
              ),
            ),
            subtitle: Text(
              "Mantenha as suas contas em dia",
              style: AppTextStyles.captionShape,
            ),
            trailing: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ProfileBottomSheetModal(onLogoutPress: () {
                        widget.authController.logout(context);
                      });
                    });
              },
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(widget.user.photoUrl),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return Container(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              setCurrentPage(0);
            },
            icon: Icon(
              Icons.home_outlined,
              color: controller.currentPage == 0
                  ? AppColors.primary
                  : AppColors.body,
            ),
          ),
          InkWell(
            onTap: () async {
              await Navigator.pushNamed(context, BarCodeScannerPage.routeName);
              setState(() {});
            },
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                Icons.add_box_outlined,
                color: AppColors.background,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setCurrentPage(1);
            },
            icon: Icon(
              Icons.description_outlined,
              color: controller.currentPage == 1
                  ? AppColors.primary
                  : AppColors.body,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      MyBoletosPage(key: UniqueKey()),
      StatementsPage(key: UniqueKey()),
    ];

    return Scaffold(
      appBar: buildAppBar(),
      body: pages[controller.currentPage],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
