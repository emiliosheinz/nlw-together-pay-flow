import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_controlle.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_style.dart';

class HomePage extends StatefulWidget {
  static final routeName = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final pages = [
    Container(color: Colors.red),
    Container(color: Colors.blue),
    Container(color: Colors.green),
  ];

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
                    text: "Emilio",
                    style: AppTextStyles.titleBoldBackground,
                  )
                ],
              ),
            ),
            subtitle: Text(
              "Mantenha as suas contas em dia",
              style: AppTextStyles.captionShape,
            ),
            trailing: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
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
            icon: Icon(Icons.home_outlined),
            color: AppColors.primary,
          ),
          InkWell(
            onTap: () {
              setCurrentPage(1);
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
              setCurrentPage(2);
            },
            icon: Icon(Icons.description_outlined),
            color: AppColors.body,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: pages[controller.currentPage],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
