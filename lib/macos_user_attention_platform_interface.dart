import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'macos_user_attention_method_channel.dart';

abstract class MacosUserAttentionPlatform extends PlatformInterface {
  /// Constructs a MacosUserAttentionPlatform.
  MacosUserAttentionPlatform() : super(token: _token);

  static final Object _token = Object();

  static MacosUserAttentionPlatform _instance = MethodChannelMacosUserAttention();

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

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
