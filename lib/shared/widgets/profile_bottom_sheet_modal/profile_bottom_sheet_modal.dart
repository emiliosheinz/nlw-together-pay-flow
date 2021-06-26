import 'package:flutter/material.dart';

class ProfileBottomSheetModal extends StatelessWidget {
  final VoidCallback onLogoutPress;

  const ProfileBottomSheetModal({Key? key, required this.onLogoutPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: onLogoutPress,
              child: Text("Sair"),
            ),
          )
        ],
      ),
    );
  }
}
