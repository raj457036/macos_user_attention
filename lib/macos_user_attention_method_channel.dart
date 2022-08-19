import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'macos_user_attention_platform_interface.dart';

/// An implementation of [MacosUserAttentionPlatform] that uses method channels.
class MethodChannelMacosUserAttention extends MacosUserAttentionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('macos_user_attention');

  @override
  Future<int> requestUserAttention(RequestUserAttentionType type) async {
    final reqType = type == RequestUserAttentionType.critical
        ? 'critical'
        : 'informational';
    final result = await methodChannel.invokeMethod('requestUserAttention', {
      'attentionType': reqType,
    });

    return result as int;
  }

  @override
  Future<bool> cancelAttentionRequest(int requestId) {
    return methodChannel.invokeMethod('cancelAttentionRequest', {
      'requestId': requestId,
    }) as Future<bool>;
  }
}
