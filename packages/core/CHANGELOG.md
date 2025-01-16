## 1.2.5

- Fix reading serialized values for explicit methods.

## 1.2.4

- Fix nested opt vec serialization with explicit serialization method.
- Improve nested variant type JSON serialization.

## 1.2.3

- Improve serialization with boolean values.
- Improve `Principal` serialization.
- Add explicit IDL serialize option.
- Remove generated enum values doc.

## 1.2.2

- Provide extra serialization methods for enum classes.

## 1.2.1

- Fix deserialization cache in vec types.

## 1.2.0

- Add `explicitSerializationMethods` for generate options.
- Log the configured options when generating.
- Use the raw field name when generating `toJson` if no explicit serialization.

## 1.1.18

- Fix `BigInt` type prediction in `fromJson`.

## 1.1.17

- Adds `fromIDLDeserializable` for generated type classes.

## 1.1.16

- Adds `toIDLSerializable` for generated type classes.

## 1.1.15

- Remove did comments from all `copyWith` methods.
- Do not serialize boolean type with `toJson`.
- Do not add null-aware operator when serializing `VecType`.

## 1.1.14

- Improve how type alias getting serialized.
- Improve how record class getting serialized.

## 1.1.13

- Fix enumeration classes `toJson`.

## 1.1.12

- Improve `fromJson` and `toJson` for Enum classes to compatible with other libraries.

## 1.1.10

- Improve how enumeration classes being parsed and serialized.

## 1.1.9

- Improve how `BigInt` being parsed and serialized.

## 1.1.8

- Use `agent_dart_base` as the import package instead of `agent_dart`.

## 1.1.7

- Use the current Dart version to format files.
- Remove unnecessary comments for generated files.
- Cast list item to the targeting Dart type.

## 1.1.6

- Generate `Object` for equality comparison rather than `dynamic`.
- Ignore unused imports.
- Better outputs for Enum classes.

## 1.1.5

- Support `composite_query` in candid.

## 1.1.4

- Fix nullable vec.

## 1.1.3

- Add IDL type.

## 1.1.2

- Fix circular dependency issue.

## 1.1.1

- Compatible with the new version of code_builder.

## 1.1.0

- Support for more Candid syntax.

## 1.0.1

- Add comments to the Service methods.
- Fix the issue of code generation failure caused by incorrect file name.

## 1.0.0

- Initial version.
