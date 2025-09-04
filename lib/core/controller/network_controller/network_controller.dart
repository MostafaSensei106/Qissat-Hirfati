import 'package:connectivity_plus/connectivity_plus.dart';

/// A controller to manage network connectivity status and updates for an application.
///
/// The `NetworkController` class provides methods to listen to network connectivity changes,
/// check the current internet connection status, and update the connection status with user notifications.
///
/// This class utilizes the `connectivity_plus` package to monitor network status changes
/// and inform the user via toast messages about the type of connection or if there is no connection.
class NetworkController {
  /// An instance of [Connectivity] used to access network connectivity status.
  final Connectivity _connectivity = Connectivity();

  /// Initializes the network controller to listen for connectivity changes.
  ///
  /// This method sets up a listener on the connectivity changes stream provided by
  /// the `connectivity_plus` package. Whenever there is a change in network status,
  /// it updates the connection status by calling [_updateConnectionStatus] for each result.
  void initNetworkController() {
    _connectivity.onConnectivityChanged.listen((results) {
      for (var result in results) {
        _updateConnectionStatus(result);
      }
    });
  }

  /// Checks the current internet connection status.
  ///
  /// This method checks if the device is currently connected to the internet.
  /// If not connected, it returns [false] and typically a toast message is shown
  /// to the user with the message 'لا يوجد اتصال بالانترنت'.
  /// Returns [true] if the device is connected to the internet, otherwise returns [false].
  ///
  /// Returns:
  ///   A [Future] that completes with a [bool] indicating the connection status.
  Future<bool> checkConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    }
    return true;
  }

  /// Updates the connection status based on the given [ConnectivityResult].
  ///
  /// This private method takes a [ConnectivityResult] and shows a toast message
  /// to the user about the connection type (e.g., Wi-Fi, mobile, ethernet, VPN).
  /// If the device is not connected to the internet, it shows an error toast message
  /// with the message 'لا يوجد اتصال بالانترنت'.
  ///
  /// Parameters:
  ///   - result: The [ConnectivityResult] indicating the current connectivity status.
  void _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        // AppToast.showToast('الجهاز متصل بالواي فاي');
        break;
      case ConnectivityResult.mobile:
        // AppToast.showToast('الجهاز متصل بالشبكة المحمولة');
        break;
      case ConnectivityResult.ethernet:
        // AppToast.showToast('الجهاز متصل بالشبكة السلكية');
        break;
      case ConnectivityResult.vpn:
        // AppToast.showToast('الجهاز متصل بالشبكة الافتراضية');
        break;
      case ConnectivityResult.none:
        // AppToast.showErrorToast('لا يوجد اتصال بالانترنت');
        break;
      default:
        // AppToast.showErrorToast('حدث خطأ ما');
        break;
    }
  }
}
