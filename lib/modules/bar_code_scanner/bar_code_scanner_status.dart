import 'package:camera/camera.dart';

class BarCodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barCode;

  CameraController? cameraController;

  BarCodeScannerStatus({
    this.isCameraAvailable = false,
    this.cameraController,
    this.error = "",
    this.barCode = "",
  });

  factory BarCodeScannerStatus.available(CameraController controller) =>
      BarCodeScannerStatus(
        isCameraAvailable: true,
        cameraController: controller,
      );

  factory BarCodeScannerStatus.error(String message) =>
      BarCodeScannerStatus(error: message);

  factory BarCodeScannerStatus.barCode(String barCode) =>
      BarCodeScannerStatus(barCode: barCode);

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarCode => barCode.isNotEmpty;
}
