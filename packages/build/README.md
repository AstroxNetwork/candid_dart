# Candid Dart Build

[![pub,dev](https://img.shields.io/pub/v/candid_dart_build?color=%230175C2&label=candid_dart_build&logo=dart)](https://pub.dev/packages/candid_dart_build)
[![package publisher](https://img.shields.io/pub/publisher/candid_dart_build.svg)](https://pub.dev/packages/candid_dart_build/publisher)
![MIT](https://img.shields.io/github/license/AstroxNetwork/candid_dart)

English | [简体中文](README-ZH.md)

Provides [Dart Build System](https://github.com/dart-lang/build) builders for handling `.did` files and quickly generate Dart code corresponding to `.did` files.

The generated code includes:

- `IDL`
- `Service` and related methods
- Objects and related methods corresponding to `.did` files

> The generated code depends on [agent_dart](https://github.com/AstroxNetwork/agent_dart)

## Quick start

### Introduction of dependencies

- Execute the following command (recommended)

```shell
# With Dart
dart pub add --dev candid_dart_build
dart pub add --dev build_runner

# With Flutter
flutter pub add --dev candid_dart_build
flutter pub add --dev build_runner
```

- Manually add it to the `pubspec.yaml` under the project

```yaml
dev_dependencies:
  candid_dart_build: any
  build_runner: any
```

### Run the generator

```shell
# With Dart
dart run build_runner build

# With Flutter
flutter pub run build_runner build
```

## Configuration

```yaml
targets:
  $default:
    builders:
      candid_dart_build|candid2dart:
        options:
          # Whether to use Freezed, default is `false`
          freezed: false
          # Whether to generate the `copyWith` method, default is `true`
          copy_with: true
          # Whether to generate the `equals` and `hashCode` methods, default is `true`
          equal: true
          # Whether collection fields are unmodifiable, only effective when Freezed is turned on, default is `true`
          make_collections_unmodifiable: true
```

## Example

Please see the [example](example) project.

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

