/// Plugin for FairBid 2.x SDK from Fyber
///
/// See [FairBid SDK official documentation](https://developer.fyber.com/fairbid2/).
///
/// Starting point is a [FairBid] class which is used to initialize the native SDK
library fairbid_flutter;

import 'src/internal.dart';
export 'src/banner_view.dart' show BannerView;
export 'src/internal.dart'
    show
        Options,
        AdEvent,
        AdType,
        InterstitialAd,
        RewardedAd,
        AdEventType,
        GDPR,
        UserData,
        Gender,
        Location,
        BannerAd,
        BannerAlignment,
        ImpressionData;

/// Starting point for interacting with FairBid native SDK.
///
/// You MUST create instance of [FairBid] before any other interaction with library, even when using [BannerView]s.
class FairBid {
  final FairBidInternal _delegate;

  /// Prepares FairBid SDK for running with provided [Options].
  static FairBid forOptions(Options options) {
    FairBid instance = FairBid._(options);
    return instance;
  }

  FairBid._(Options options)
      : assert(options != null),
        _delegate = FairBidInternal.forOptions(options);

  /// Returns a [Future] that completes to the version of integrated FairBid SDK.
  static Future<String> get version => FairBidInternal.platformVersion;

  /// Returns a [Future] that completes to `true` when native SDK has been started.
  Future<bool> get started => _delegate.started;

  /// Stream of [AdEvent]s for all ads combined
  Stream<AdEvent> get events => _delegate.events;

  /// Opens FairBid's Test Suite native view.
  ///
  /// The Test Suite is a tool provided in the SDK that allows for checking
  /// the state of integration of mediated ad networks.
  void showTestSuite() => _delegate.showTestSuite();

  /// Prepares [InterstitialAd] instance for requesting and showing interstitial ad
  InterstitialAd prepareInterstitial(String placementId) =>
      _delegate.prepareInterstitial(placementId);

  /// Prepares [RewardedAd] instance for requesting and showing rewarded ad
  RewardedAd prepareRewarded(String placementId) =>
      _delegate.prepareRewarded(placementId);

  /// Prepares [BannerAd] instance for showing and destroying banner ad
  BannerAd prepareBanner(String placementId) =>
      _delegate.prepareBanner(placementId);
}
