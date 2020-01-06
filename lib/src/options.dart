part of 'internal.dart';

/// Options for starting the FairBid SDK
class Options {
  /// The Fyber App ID. Can be found in the App Management Dashboard.
  ///
  /// For more information visit [official guide](https://ui.fyber.com/docs/adding-placements-for-your-apps).
  final String appId;

  /// Turns on/off auto-requesting ads feature. Default: `true`.
  ///
  /// Official articles about auto-requesting feature: [iOS](https://dev-ios.fyber.com/docs/auto-request), [Android](https://dev-android.fyber.com/docs/auto-request).
  final bool autoRequesting;

  /// Turns on/off debug logging of the SDK. Default: `false`.
  final bool debugLogging;

  Options({
    @required this.appId,
    this.autoRequesting = true,
    this.debugLogging = false,
  }) : assert(appId != null && appId.isNotEmpty);

  Map<String, dynamic> _toMap() => {
        "publisherId": appId,
        "autoRequesting": autoRequesting,
        "logging": debugLogging,
      };
}
