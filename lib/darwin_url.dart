import 'darwin_url_platform_interface.dart';

class DarwinUrl {
  Future<String> append(String url, String component,
      {required bool isDir}) async {
    return DarwinUrlPlatform.instance.append(url, component, isDir: isDir);
  }

  Future<String> tmpDir() async {
    return DarwinUrlPlatform.instance.tmpDir();
  }
}
