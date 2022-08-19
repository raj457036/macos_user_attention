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
    case "requestUserAttention":
        requestUserAttention(call, result: result)
      break
    case "cancelAttentionRequest":
      cancelAttentionRequest(call, result: result)
      break
    default:
      result(FlutterMethodNotImplemented)
    }
  }
  
    public func requestUserAttention(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let args: [String:Any] = call.arguments as! [String:Any]
        let attentionType: NSApplication.RequestUserAttentionType = args["attentionType"] as! String == "critical" ? .criticalRequest : .informationalRequest
        let reqId: Int = NSApp.requestUserAttention(attentionType)
        result(reqId)
    }
    
    public func cancelAttentionRequest(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let args: [String:Any] = call.arguments as! [String:Any]
        let reqId: Int = args["requestId"] as! Int
        NSApp.cancelUserAttentionRequest(reqId)
        result(true)
    }
}
