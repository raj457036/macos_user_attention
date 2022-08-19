import Cocoa
import FlutterMacOS

public class MacosUserAttentionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "macos_user_attention", binaryMessenger: registrar.messenger)
    let instance = MacosUserAttentionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
      break
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
