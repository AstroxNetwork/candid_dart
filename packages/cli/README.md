# Candid Dart CLI

[![pub,dev](https://img.shields.io/pub/v/candid_dart_cli?color=%230175C2&label=candid_dart_cli&logo=dart)](https://pub.dev/packages/candid_dart_cli)
[![package publisher](https://img.shields.io/pub/publisher/candid_dart_cli.svg)](https://pub.dev/packages/candid_dart_cli/publisher)
![MIT](https://img.shields.io/github/license/AstroxNetwork/candid_dart)

English | [简体中文](README-ZH.md)

Provide a command-line tool for handing `.did` files and quickly generate Dart code corresponding to the `.did` file.

The generated code includes:

- `IDL`
- `Service` and related methods
- Object corresponding to the `.did` file and related methods

> The generated code depends on [agent_dart](https://github.com/AstroxNetwork/agent_dart)

<!-- toc -->

- [Quick Start](#quick-start)
  * [Install CLI](#install-cli)
  * [Run CLI](#run-cli)
- [CLI Options](#cli-options)
- [License](#license)

<!-- tocstop -->

## Quick Start

### Install CLI

```shell
dart pub global activate candid_dart_cli
```

### Run CLI

```shell
did2dart -d ./ -r
```

## CLI Options

```text
-p, --path                           Specify the path of the `.did` file.
-i, --inject-packages                Import packages with settings into each generated Dart file.
-b, --pre-actor-call                 Inject a piece of code before calling the Actor method, which can reference the request parameters `request` and the parameter of type CanisterActor `actor`.
-a, --post-actor-call                Inject a piece of code after calling the Actor method, which can reference the request parameters `request`, the parameter of type CanisterActor `actor`, and the return result of the method `response`.
-d, --dir                            Specify the directory where the `.did` file is located.
-r, --recursive                      Whether to recursively search for `.did` files, only valid when specifying a directory.
-f, --freezed                        Whether to use `Freezed`.
-e, --equal                          Whether to generate `equals` and `hashCode` methods.
                                     (Enabled by default)
-c, --copy-with                      Whether to generate `copyWith` method.
                                     (Enabled by default)
-u, --make-collections-unmodifiable  Whether collection fields are unmodifiable, only valid when `Freezed` is enabled.
                                     (Enabled by default)
-h, --help                           View help options.
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
