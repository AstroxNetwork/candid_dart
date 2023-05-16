# Candid Dart

[![pub,dev](https://img.shields.io/pub/v/candid_dart?color=%230175C2&label=candid_dart&logo=dart)](https://pub.dev/packages/candid_dart)
[![package publisher](https://img.shields.io/pub/publisher/candid_dart.svg)](https://pub.dev/packages/candid_dart/publisher)
![MIT](https://img.shields.io/github/license/AstroxNetwork/candid_dart)

English | [简体中文](README-ZH.md)

Provide [Dart Build System](https://github.com/dart-lang/build) builder and command-line tools to process `.did` files
and quickly generate Dart code corresponding to the `.did` files.

The generated code includes:

- `IDL`
- `Service` and related methods
- Objects and related methods corresponding to `.did` files

> The generated code depends on [agent_dart](https://github.com/AstroxNetwork/agent_dart)

<!-- toc -->

- [Using Command Line Tools (Recommend)](#using-command-line-tools-recommend)
  * [Installing Command Line Tools](#installing-command-line-tools)
  * [Running Command-Line Tools](#running-command-line-tools)
  * [Command Line Options](#command-line-options)
- [Using Generators](#using-generators)
  * [Importing Dependencies](#importing-dependencies)
  * [Running Generators](#running-generators)
  * [Generator Optional Options](#generator-optional-options)
- [Example](#example)
- [License](#license)

<!-- tocstop -->

## Using Command Line Tools (Recommend)

### Installing Command Line Tools

```shell
dart pub global activate candid_dart
```

### Running Command-Line Tools

```shell
did2dart -d ./ -r
```

### Command Line Options

```text
-p, --path                           Specify the path of `.did` file.
-i, --inject-packages                Import packages with settings into each generated Dart file.
-b, --pre-actor-call                 Inject a piece of code before calling Actor method. The code can reference the request parameter `request` and CanisterActor type parameter `actor`.
-a, --post-actor-call                Inject a piece of code after calling Actor method. The code can reference the request parameter `request`, CanisterActor type parameter `actor`, and the return result `response` of the method.
-d, --dir                            Specify the directory where `.did` file is located.
-r, --recursive                      Whether to recursively search for `.did` files. Only valid when specifying a directory.
-s, --service                        Whether to generate `Service` automatically. Default value is `false`.
-f, --freezed                        Whether to use `Freezed`.
-e, --equal                          Whether to generate `equals` and `hashCode` methods. (Default on)
-c, --copy-with                      Whether to generate `copyWith` method. (Default on)
-u, --make-collections-unmodifiable  Whether the collection fields can be modified. Only valid when Freezed is turned on. (Default on)
-h, --help                           View help options.
```

## Using Generators

### Importing Dependencies

- Execute the following command (recommended)

```shell
# With Dart
dart pub add --dev candid_dart
dart pub add --dev build_runner

# With Flutter
flutter pub add --dev candid_dart
flutter pub add --dev build_runner
```

- Manually add it to `pubspec.yaml` under the project

```yaml
dev_dependencies:
  candid_dart: any
  build_runner: any
```

### Running Generators

```shell
# With Dart
dart run build_runner build

# With Flutter
flutter pub run build_runner build
```

### Generator Optional Options

```yaml
targets:
  $default:
    builders:
      candid_dart|candid2dart:
        options:
          # Whether to use Freezed. Default value is `false`.
          freezed: false
          # Whether to generate `copyWith` method. Default value is `true`.
          copy_with: true
          # Whether to generate `equals` and `hashCode` methods. Default value is `true`.
          equal: true
          # Whether the collection fields can be modified. Only valid when Freezed is turned on. Default value is `true`.
          make_collections_unmodifiable: true
          # Whether to generate `Service` automatically. Default value is `false`.
          service: true
          # Import packages with settings into each generated Dart file.
          inject_packages:
            - package:recase/recase.dart
            - package:dart_style/dart_style.dart
          # Inject a piece of code before calling Actor method. The code can reference the request parameter `request` and CanisterActor type parameter `actor`.
          pre_actor_call: |
            print(method);
            print(request);
            print(actor);
            // ...
          # Inject a piece of code after calling Actor method. The code can reference the request parameter `request`, CanisterActor type parameter `actor`, and the return result `response` of the method.
          post_actor_call: |
            print(method);
            print(request);
            print(actor);
            print(response);
            // ...
```

## Example

Please refer to the [example](example) project.

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


