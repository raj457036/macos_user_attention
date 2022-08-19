// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'macos_user_attention_platform_interface.dart';

class MacosUserAttention {
  Future<String?> getPlatformVersion() {
    return MacosUserAttentionPlatform.instance.getPlatformVersion();
  }
}
