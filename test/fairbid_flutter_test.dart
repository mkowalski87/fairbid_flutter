import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fairbid_flutter/src/internal.dart';

void main() {
  const MethodChannel channel = MethodChannel('fairbid_flutter');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FairBidInternal.platformVersion, '42');
  });
}
