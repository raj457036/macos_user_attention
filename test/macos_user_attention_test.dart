import 'package:flutter_test/flutter_test.dart';
import 'package:macos_user_attention/macos_user_attention.dart';
import 'package:macos_user_attention/macos_user_attention_platform_interface.dart';
import 'package:macos_user_attention/macos_user_attention_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMacosUserAttentionPlatform 
    with MockPlatformInterfaceMixin
    implements MacosUserAttentionPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MacosUserAttentionPlatform initialPlatform = MacosUserAttentionPlatform.instance;

  test('$MethodChannelMacosUserAttention is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMacosUserAttention>());
  });

  test('getPlatformVersion', () async {
    MacosUserAttention macosUserAttentionPlugin = MacosUserAttention();
    MockMacosUserAttentionPlatform fakePlatform = MockMacosUserAttentionPlatform();
    MacosUserAttentionPlatform.instance = fakePlatform;
  
    expect(await macosUserAttentionPlugin.getPlatformVersion(), '42');
  });
}
