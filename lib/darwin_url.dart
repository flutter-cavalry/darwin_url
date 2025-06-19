import 'darwin_url_platform_interface.dart';

class DarwinUrl {
  /// Appends components to a URL, returning a new URL.
  Future<String> append(String url, List<String> components,
      {required bool isDir}) async {
    return DarwinUrlPlatform.instance.append(url, components, isDir: isDir);
  }

  /// Returns `FileManager.default.temporaryDirectory`.
  Future<String> tmpDir() async {
    return DarwinUrlPlatform.instance.tmpDir();
  }

  /// Converts a file path to a URL.
  Future<String> filePathToUrl(String filePath) async {
    return DarwinUrlPlatform.instance.filePathToUrl(filePath);
  }

  /// Converts a URL to a file path.
  Future<String> urlToFilePath(String url) async {
    return DarwinUrlPlatform.instance.urlToFilePath(url);
  }

  /// Returns directory URL of the given file URL.
  Future<String> dirUrl(String url) async {
    return DarwinUrlPlatform.instance.dirUrl(url);
  }

  /// Calls `FileManager.default.isUbiquitousItem` with the given URL.
  Future<bool> isUbiquitousUrlItem(String url) async {
    return DarwinUrlPlatform.instance.isUbiquitousUrlItem(url);
  }

  /// Calls `FileManager.default.isUbiquitousItem` with the given file path.
  Future<bool> isUbiquitousPathItem(String filePath) async {
    return DarwinUrlPlatform.instance.isUbiquitousPathItem(filePath);
  }

  /// Returns the basename of the given URL.
  Future<String> basename(String url) async {
    return DarwinUrlPlatform.instance.basename(url);
  }
}
