import 'dart:io';

import 'package:flutter/material.dart';
import 'package:darwin_url/darwin_url.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _tmpDir = '';
  String _joinResult = '';
  String _filePathToUrlResult = '';
  String _dirUrlResult = '';
  String _urlToFilePathResult = '';
  String _basenameResult = '';

  final _darwinUrlPlugin = DarwinUrl();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final tmpDir = await _darwinUrlPlugin.tmpDir();
      final joinResult = await _darwinUrlPlugin
          .append(tmpDir, ['foo', '一二三', 'bar'], isDir: true);
      final filePathToUrlResult =
          await _darwinUrlPlugin.filePathToUrl(Directory.systemTemp.path);
      final dirUrlResult = await _darwinUrlPlugin.dirUrl(joinResult);
      final urlToFilePathResult =
          await _darwinUrlPlugin.urlToFilePath(filePathToUrlResult);
      final basenameResult = await _darwinUrlPlugin.basename(joinResult);
      setState(() {
        _tmpDir = tmpDir;
        _joinResult = joinResult;
        _filePathToUrlResult = filePathToUrlResult;
        _dirUrlResult = dirUrlResult;
        _urlToFilePathResult = urlToFilePathResult;
        _basenameResult = basenameResult;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('tmpDir: $_tmpDir'),
                Text('joinResult: $_joinResult'),
                Text('filePathToUrlResult: $_filePathToUrlResult'),
                Text('dirUrlResult: $_dirUrlResult'),
                Text('urlToFilePathResult: $_urlToFilePathResult'),
                Text('basenameResult: $_basenameResult'),
              ],
            ),
          )),
    );
  }
}
