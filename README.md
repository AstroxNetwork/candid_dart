![candid_dart](https://socialify.git.ci/AstroxNetwork/candid_dart/image?description=1&font=Source%20Code%20Pro&forks=1&issues=1&logo=https%3A%2F%2Fraw.githubusercontent.com%2FAstroxNetwork%2Fcandid_dart%2Fmain%2Fdocs%2Fassets%2Fic.svg&name=1&pattern=Circuit%20Board&pulls=1&stargazers=1&theme=Auto)

# Candid Dart

[![pub,dev](https://img.shields.io/pub/v/candid_dart_core?color=%230175C2&label=candid_dart_core&logo=dart)](https://pub.dev/packages/candid_dart_core)
[![pub,dev](https://img.shields.io/pub/v/candid_dart_build?color=%230175C2&label=candid_dart_build&logo=dart)](https://pub.dev/packages/candid_dart_build)
[![pub,dev](https://img.shields.io/pub/v/candid_dart_cli?color=%230175C2&label=candid_dart_cli&logo=dart)](https://pub.dev/packages/candid_dart_cli)
![MIT](https://img.shields.io/github/license/AstroxNetwork/candid_dart)

English | [简体中文](README-ZH.md)

Provide [candid_dart_core](packages/core), [candid_dart](packages/candid), [candid_dart_build](packages/build),
and [candid_dart_cli](packages/cli) to
handle `Candid` and quickly generate corresponding Dart code for `Candid`.

The generated code includes:

- `IDL`
- `Service` and related methods
- `Candid` corresponding objects and related methods

> The generated code depends on [agent_dart](https://github.com/AstroxNetwork/agent_dart)

<!-- toc -->

- [Projects](#projects)
    * [candid_dart_core](#candid_dart_core)
    * [candid_dart](#candid_dart)
    * [candid_dart_build](#candid_dart_build)
    * [candid_dart_cli](#candid_dart_cli)
    * [did2dart](#did2dart)
- [Example Application](#example-application)
- [License](#license)

<!-- tocstop -->

## Projects

### [candid_dart_core](packages/core) [![pub,dev](https://img.shields.io/pub/v/candid_dart_core?color=%230175C2&label=candid_dart_core&logo=dart)](https://pub.dev/packages/candid_dart_core)

Provide the `did2dart` method to process `Candid` content, and quickly generate corresponding Dart code.

### [candid_dart](packages/candid) [![pub,dev](https://img.shields.io/pub/v/candid_dart?color=%230175C2&label=candid_dart&logo=dart)](https://pub.dev/packages/candid_dart) (Recommend)

Provides [Dart Build System](https://github.com/dart-lang/build) builders and command-line tool
for handling `.did` files
and quickly generate
Dart code corresponding to `.did` files.

### [candid_dart_build](packages/build) [![pub,dev](https://img.shields.io/pub/v/candid_dart_build?color=%230175C2&label=candid_dart_build&logo=dart)](https://pub.dev/packages/candid_dart_build)

Provides [Dart Build System](https://github.com/dart-lang/build) builders for handling `.did` files and quickly generate
Dart code corresponding to `.did` files.

### [candid_dart_cli](packages/cli) [![pub,dev](https://img.shields.io/pub/v/candid_dart_cli?color=%230175C2&label=candid_dart_cli&logo=dart)](https://pub.dev/packages/candid_dart_cli)

Provide a command-line tool for handing `.did` files and quickly generate Dart code corresponding to the `.did` file.

### [did2dart](https://github.com/iota9star/did2dart)

Provide applications on different platforms to quickly convert Candid to Dart code.

[Click to open](https://did2dart.astrox.app/#/)

## Example Application

Please see the [demo_app](apps/demo_app) project.

<table>
<tr>
<td><img src="docs/assets/iphone1.PNG" alt="iPhone home"></td>
<td><img src="docs/assets/iphone2.PNG" alt="iPhone token detail"></td>
</tr>
<tr>
<td><img src="docs/assets/mac1.png" alt="MacOS home"></td>
<td><img src="docs/assets/mac2.png" alt="MacOS token detail"></td>
</tr>
</table> 

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

