# Candid Dart Build

[![pub,dev](https://img.shields.io/pub/v/candid_dart_build?color=%230175C2&label=candid_dart_build&logo=dart)](https://pub.dev/packages/candid_dart_build)
[![package publisher](https://img.shields.io/pub/publisher/candid_dart_build.svg)](https://pub.dev/packages/candid_dart_build/publisher)
![MIT](https://img.shields.io/github/license/AstroxNetwork/candid_dart)

[English](README.md) | 简体中文

提供 [Dart Build System](https://github.com/dart-lang/build) 构建器以处理 `.did` 文件，快速生成 `.did` 文件对应的Dart代码。

生成代码包括：

- `IDL`
- `Service` 以及相关方法
- `.did` 文件对应的对象以及相关方法

> 生成的代码依赖于 [agent_dart](https://github.com/AstroxNetwork/agent_dart)

## 快速开始

### 引入依赖

- 执行以下命令（推荐）

```shell
# With Dart
dart pub add --dev candid_dart_build
dart pub add --dev build_runner

# With Flutter
flutter pub add --dev candid_dart_build
flutter pub add --dev build_runner
```

- 手动将其添加到项目下的 `pubspec.yaml` 中

```yaml
dev_dependencies:
  candid_dart_build: any
  build_runner: any
```

### 运行生成器

```shell
# With Dart
dart run build_runner build

# With Flutter
flutter pub run build_runner build
```

## 配置

```yaml
targets:
  $default:
    builders:
      candid_dart_build|candid2dart:
        options:
          # 是否使用 Freezed，默认 `false`
          freezed: false
          # 是否生成 `copyWith` 方法，默认 `true`
          copy_with: true
          # 是否生成 `equals` 和 `hashCode` 方法，默认 `true`
          equal: true
          # 集合字段是否不可修改，仅在开启 Freezed 时生效，默认 `true`
          make_collections_unmodifiable: true
```

## 示例

请查看 [example](example) 项目

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

