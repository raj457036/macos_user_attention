import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'macos_user_attention_platform_interface.dart';

/// An implementation of [MacosUserAttentionPlatform] that uses method channels.
class MethodChannelMacosUserAttention extends MacosUserAttentionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('macos_user_attention');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
