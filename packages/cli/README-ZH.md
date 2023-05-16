# Candid Dart CLI

[![pub,dev](https://img.shields.io/pub/v/candid_dart_cli?color=%230175C2&label=candid_dart_cli&logo=dart)](https://pub.dev/packages/candid_dart_cli)
[![package publisher](https://img.shields.io/pub/publisher/candid_dart_cli.svg)](https://pub.dev/packages/candid_dart_cli/publisher)
![MIT](https://img.shields.io/github/license/AstroxNetwork/candid_dart)

[English](README.md) | 简体中文

提供命令行工具以处理 `.did` 文件，快速生成 `.did` 文件对应的Dart代码。

生成代码包括：

- `IDL`
- `Service` 以及相关方法
- `.did` 文件对应的对象以及相关方法

> 生成的代码依赖于 [agent_dart](https://github.com/AstroxNetwork/agent_dart)

<!-- toc -->

- [快速开始](#%E5%BF%AB%E9%80%9F%E5%BC%80%E5%A7%8B)
  * [安装命令行工具](#%E5%AE%89%E8%A3%85%E5%91%BD%E4%BB%A4%E8%A1%8C%E5%B7%A5%E5%85%B7)
  * [运行命令行工具](#%E8%BF%90%E8%A1%8C%E5%91%BD%E4%BB%A4%E8%A1%8C%E5%B7%A5%E5%85%B7)
- [命令行工具](#%E5%91%BD%E4%BB%A4%E8%A1%8C%E5%B7%A5%E5%85%B7)
- [License](#license)

<!-- tocstop -->

## 快速开始

### 安装命令行工具

```shell
dart pub global activate candid_dart_cli
```

### 运行命令行工具

```shell
did2dart -d ./ -r
```

## 命令行工具

```text
-p, --path                           指定 `.did` 文件路径
-i, --inject-packages                给每个生成的dart文件导入设置的packages
-b, --pre-actor-call                 在Actor调用方法之前注入一段代码，代码可以引用到方法的请求参数 `request` 和 CanisterActor 类型的参数 `actor`
-a, --post-actor-call                在Actor调用方法之后注入一段代码，代码可以引用到方法的请求参数 `request` 和 CanisterActor 类型的参数 `actor` ，以及方法的返回结果 `response`
-d, --dir                            指定 `.did` 文件所在目录
-r, --recursive                      是否递归查找 `.did` 文件，仅在指定目录时生效
-f, --freezed                        是否使用 `Freezed`
-e, --equal                          是否生成 `equals` 和 `hashCode` 方法
                                     (默认开启)
-c, --copy-with                      是否生成 `copyWith` 方法
                                     (默认开启)
-u, --make-collections-unmodifiable  集合字段是否不可修改，仅在开启 `Freezed` 时生效
                                     (默认开启)
-h, --help                           查看帮助选项
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

