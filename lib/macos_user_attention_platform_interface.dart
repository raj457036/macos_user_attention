import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'macos_user_attention_method_channel.dart';

/// These constants specify the level of severity of a user attention
/// request and are used by [requestUserAttention].
enum RequestUserAttentionType {
  critical,
  informational,
}

abstract class MacosUserAttentionPlatform extends PlatformInterface {
  /// Constructs a MacosUserAttentionPlatform.
  MacosUserAttentionPlatform() : super(token: _token);

  static final Object _token = Object();

  static MacosUserAttentionPlatform _instance =
      MethodChannelMacosUserAttention();

  /// The default instance of [MacosUserAttentionPlatform] to use.
  ///
  /// Defaults to [MethodChannelMacosUserAttention].
  static MacosUserAttentionPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MacosUserAttentionPlatform] when
  /// they register themselves.
  static set instance(MacosUserAttentionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int> requestUserAttention(RequestUserAttentionType type) {
    throw UnimplementedError(
        'requestUserAttention(RequestUserAttentionType type) has not been implemented.');
  }

  Future<bool> cancelAttentionRequest(int requestId) {
    throw UnimplementedError(
        'cancelAttentionRequest(int requestId) has not been implemented.');
  }
}
