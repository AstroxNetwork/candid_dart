# Candid Dart Core

[![pub,dev](https://img.shields.io/pub/v/candid_dart_core?color=%230175C2&label=candid_dart_core&logo=dart)](https://pub.dev/packages/candid_dart_core)
[![package publisher](https://img.shields.io/pub/publisher/candid_dart_core.svg)](https://pub.dev/packages/candid_dart_core/publisher)
![MIT](https://img.shields.io/github/license/AstroxNetwork/candid_dart)

[English](README.md) | 简体中文

提供 `did2dart` 方法处理 `Candid` 内容，快速生成 `Candid` 对应的Dart代码。

生成代码包括：

- `IDL`
- `Service` 以及相关方法
- `Candid` 内容对应的对象以及相关方法

> 生成的代码依赖于 [agent_dart](https://github.com/AstroxNetwork/agent_dart)

## 快速开始

### 引入依赖

- 执行以下命令（推荐）

```shell
# With Dart
dart pub add candid_dart_core

# With Flutter
flutter pub add candid_dart_core
```

- 手动将其添加到项目下的 `pubspec.yaml` 中

```yaml
dev_dependencies:
  candid_dart_core: any
```

## 示例

```dart
import 'package:candid_dart_core/core.dart';

void main(){
  final code = did2dart(
    'test.did',
    '''
service : () -> {
    echo: (nat)->(nat) query;
}
            ''',
    GenOption(
      freezed: false,
      makeCollectionsUnmodifiable: false,
      equal: true,
      copyWith: true,
    ),
  );
  print(code);
}
```

## License

```text
MIT License

Copyright (c) 2022 AstroxNetwork

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

