import 'package:camera/camera.dart';

class BarCodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barCode;
  final bool stopScanner;

  CameraController? cameraController;

  BarCodeScannerStatus({
    this.isCameraAvailable = false,
    this.cameraController,
    this.error = "",
    this.barCode = "",
    this.stopScanner = false,
  });

  factory BarCodeScannerStatus.available() =>
      BarCodeScannerStatus(isCameraAvailable: true, stopScanner: false);

  factory BarCodeScannerStatus.error(String message) =>
      BarCodeScannerStatus(error: message, stopScanner: true);

  factory BarCodeScannerStatus.barCode(String barcode) =>
      BarCodeScannerStatus(barCode: barcode, stopScanner: true);

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarCode => barCode.isNotEmpty;

  BarCodeScannerStatus copyWith({
    bool? isAvailable,
    String? error,
    String? barcode,
    bool? stopScanner,
    CameraController? cameraController,
  }) {
    return BarCodeScannerStatus(
      isCameraAvailable: isAvailable ?? this.isCameraAvailable,
      error: error ?? this.error,
      barCode: barcode ?? this.barCode,
      stopScanner: stopScanner ?? this.stopScanner,
    );
  }
}
