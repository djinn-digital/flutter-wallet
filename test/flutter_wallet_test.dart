import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_wallet/flutter_wallet.dart';
import 'package:flutter_wallet/flutter_wallet_platform_interface.dart';
import 'package:flutter_wallet/flutter_wallet_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterWalletPlatform
    with MockPlatformInterfaceMixin
    implements FlutterWalletPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterWalletPlatform initialPlatform = FlutterWalletPlatform.instance;

  test('$MethodChannelFlutterWallet is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterWallet>());
  });

  test('getPlatformVersion', () async {
    FlutterWallet flutterWalletPlugin = FlutterWallet();
    MockFlutterWalletPlatform fakePlatform = MockFlutterWalletPlatform();
    FlutterWalletPlatform.instance = fakePlatform;

    expect(await flutterWalletPlugin.getPlatformVersion(), '42');
  });
}
