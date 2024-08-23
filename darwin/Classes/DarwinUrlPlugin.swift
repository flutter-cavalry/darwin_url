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
      let components = args["components"] as? [String] ?? []
      let isDir = args["isDir"] as! Bool
      guard let urlObj = URL(string: url) else {
        result(FlutterError(code: "PluginError", message: "Invalid URL", details: nil))
        return
      }
      
      var u = urlObj
      for c in components {
        u = u.appendingPathComponent(c, isDirectory: isDir)
      }
      result(u.absoluteString)
      
    case "filePathToUrl":
      let filePath = args["filePath"] as! String
      let url = URL(fileURLWithPath: filePath)
      result(url.absoluteString)
      
    case "dirUrl":
      let url = args["url"] as? String ?? ""
      guard let urlObj = URL(string: url) else {
        result(FlutterError(code: "PluginError", message: "Invalid URL", details: nil))
        return
      }
      let newUrl = urlObj.deletingLastPathComponent()
      result(newUrl.absoluteString)
      
    case "urlToFilePath":
      let url = args["url"] as? String ?? ""
      guard let urlObj = URL(string: url) else {
        result(FlutterError(code: "PluginError", message: "Invalid URL", details: nil))
        return
      }
      result(urlObj.path)
      
    case "isUbiquitousUrlItem":
      let url = args["url"] as? String ?? ""
      guard let urlObj = URL(string: url) else {
        result(FlutterError(code: "PluginError", message: "Invalid URL", details: nil))
        return
      }
      result(FileManager.default.isUbiquitousItem(at: urlObj))
      
    case "isUbiquitousPathItem":
      let filePath = args["filePath"] as! String
      let url = URL(fileURLWithPath: filePath)
      result(FileManager.default.isUbiquitousItem(at: url))
      
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
