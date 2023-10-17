import Foundation

#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#endif

public class DarwinUrlPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
#if os(iOS)
    let binaryMessenger = registrar.messenger()
#elseif os(macOS)
    let binaryMessenger = registrar.messenger
#endif
    let channel = FlutterMethodChannel(name: "darwin_url", binaryMessenger: binaryMessenger)
    let instance = DarwinUrlPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
  
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let args = call.arguments as? Dictionary<String, Any> else {
      result(FlutterError(code: "InvalidArgsType", message: "Invalid args type", details: nil))
      return
    }
    switch call.method {
    case "tmpDir":
      let tmpDir = FileManager.default.temporaryDirectory
      result(tmpDir.absoluteString)
      
    case "append":
      let url = args["url"] as? String ?? ""
      let component = args["component"] as? String ?? ""
      let isDir = args["isDir"] as! Bool
      guard let urlObj = URL(string: url) else {
        result(FlutterError(code: "PluginError", message: "Invalid URL", details: nil))
        return
      }
      let newUrl = urlObj.appendingPathComponent(component, isDirectory: isDir)
      result(newUrl.absoluteString)
      
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
