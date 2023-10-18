import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'darwin_url_method_channel.dart';

abstract class DarwinUrlPlatform extends PlatformInterface {
  /// Constructs a DarwinUrlPlatform.
  DarwinUrlPlatform() : super(token: _token);

  static final Object _token = Object();

  static DarwinUrlPlatform _instance = MethodChannelDarwinUrl();

  /// The default instance of [DarwinUrlPlatform] to use.
  ///
  /// Defaults to [MethodChannelDarwinUrl].
  static DarwinUrlPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DarwinUrlPlatform] when
  /// they register themselves.
  static set instance(DarwinUrlPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> append(String url, String component,
      {required bool isDir}) async {
    throw UnimplementedError('join() has not been implemented.');
  }

  Future<String> tmpDir() async {
    throw UnimplementedError('tmpDir() has not been implemented.');
  }

  Future<String> filePathToUrl(String filePath) async {
    throw UnimplementedError('filePathToUrl() has not been implemented.');
  }

  Future<String> dirUrl(String url) async {
    throw UnimplementedError('dirUrl() has not been implemented.');
  }
}
