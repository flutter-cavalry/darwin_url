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
      setState(() {
        _tmpDir = tmpDir;
        _joinResult = joinResult;
        _filePathToUrlResult = filePathToUrlResult;
        _dirUrlResult = dirUrlResult;
        _urlToFilePathResult = urlToFilePathResult;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('tmpDir: $_tmpDir'),
                const SizedBox(height: 5),
                Text('joinResult: $_joinResult'),
                const SizedBox(height: 5),
                Text('filePathToUrlResult: $_filePathToUrlResult'),
                const SizedBox(height: 5),
                Text('dirUrlResult: $_dirUrlResult'),
                const SizedBox(height: 5),
                Text('urlToFilePathResult: $_urlToFilePathResult'),
              ],
            ),
          )),
    );
  }
}
