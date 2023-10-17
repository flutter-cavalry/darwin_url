# darwin_url

Helper functions for Swift `URL`/ Objc `NSURL`.

## Usage

```dart
final _darwinUrlPlugin = DarwinUrl();

// Get tmp directory URL.
final tmpDir = await _darwinUrlPlugin.tmpDir();
// file:/|/private/var/mobile/Containers/Data/Application/OC5E3F85-BB5A-4501-8C22-C1DC19412F10/tmp/

// Append a path component to a URL.
final joinResult =
  await _darwinUrlPlugin.append(tmpDir, 'foo/bar/一二三', isDir: true);
// file:/l/private/var/mobile/Containers/Data/ Application/OC5E3F85-BB5A-4501-8C22-C1DC19412F10/tmp/foo/bar/%E4%B8%80%E4%BA%8C%E4%B8%891
```
