import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'darwin_url_platform_interface.dart';

/// An implementation of [DarwinUrlPlatform] that uses method channels.
class MethodChannelDarwinUrl extends DarwinUrlPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('darwin_url');

  @override
  Future<String> append(String url, String component,
      {required bool isDir}) async {
    final res = await methodChannel.invokeMethod<String>('append', {
      'url': url,
      'component': component,
      'isDir': isDir,
    });
    return res ?? '';
  }

  @override
  Future<String> tmpDir() async {
    final res = await methodChannel.invokeMethod<String>('tmpDir', {});
    return res ?? '';
  }

  @override
  Future<String> filePathToUrl(String filePath) async {
    final res = await methodChannel.invokeMethod<String>('filePathToUrl', {
      'filePath': filePath,
    });
    return res ?? '';
  }

  @override
  Future<String> dirUrl(String url) async {
    final res = await methodChannel.invokeMethod<String>('dirUrl', {
      'url': url,
    });
    return res ?? '';
  }
}
