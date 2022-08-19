import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_user_attention/macos_user_attention_method_channel.dart';

void main() {
  MethodChannelMacosUserAttention platform = MethodChannelMacosUserAttention();
  const MethodChannel channel = MethodChannel('macos_user_attention');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
