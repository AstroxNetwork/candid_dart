import 'dart:convert';

import 'package:tuple/tuple.dart';

import 'extension.dart';

class SerField {
  final String? id;
  final String did;
  final String idl;
  final String type;
  final bool nullable;
  final String? ser;
  final String? deser;

  const SerField({
    required this.idl,
    required this.type,
    required this.did,
    this.id,
    this.nullable = false,
    this.ser,
    this.deser,
  });

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "did": did,
      "type": type,
      "idl": idl,
      "null": nullable,
      if (ser != null) "ser": ser,
      if (deser != null) "deser": deser,
    };
  }

  static const String ph = "{{val}}";

  static Tuple2<String, String> bigInt([bool nullable = false]) {
    String d;
    if (nullable) {
      d = "$ph == null ? null : BigInt.from($ph)";
    } else {
      d = "BigInt.from($ph)";
    }
    return Tuple2(ph, d);
  }

  static Tuple2<String, String> principal([bool nullable = false]) {
    // String s;
    String d;
    if (nullable) {
      // s = "$ph?.toJson()";
      d = "$ph == null ? null : Principal.from($ph)";
    } else {
      // s = "$ph.toJson()";
      d = "Principal.from($ph)";
    }
    return Tuple2(ph, d);
  }

  static Tuple2<String, String> object(String clazz, [bool nullable = false]) {
    // String s;
    String d;
    if (nullable) {
      // s = "$ph?.toJson()";
      d = "$ph == null ? null : $clazz.fromMap($ph,)";
    } else {
      // s = "$ph.toJson()";
      d = "$clazz.fromMap($ph,)";
    }
    return Tuple2(ph, d);
  }

  static Tuple2<String, String> uint8List([bool nullable = false]) {
    // String s;
    String d;
    if (nullable) {
      // s = "$ph?.toList(growable: false)";
      d = "$ph == null ? null : Uint8List.fromList($ph.cast<int>())";
    } else {
      // s = "$ph.toList(growable: false)";
      d = "Uint8List.fromList($ph.cast<int>())";
    }
    return Tuple2(ph, d);
  }

  static Tuple2<String?, String?> opt({String? ser, String? deser}) {
    String? s;
    String? d;
    // var type = ser.type.nullable(ser.nullable);
    if (ser != null) {
      s = "[if($ph != null) $ser]";
    } else {
      s = "[if($ph !=null) $ph]";
    }
    if (deser != null) {
      d = "($ph as List?)?.map((e) { return ${deser.replaceAll(ph, 'e')}; }).firstOrNull";
    } else {
      d = "($ph as List?)?.firstOrNull";
    }
    return Tuple2(s, d);
  }

  static Tuple2<String?, String?> list(
    SerField ser, [
    bool nullable = false,
  ]) {
    var s = ser.ser;
    if (s != null) {
      s = "$ph${nullable ? '?' : ''}.map((e) { return ${s.replaceAll(ph, "e")}; }).toList(growable: false)";
    }
    var d = ser.deser;
    if (d != null) {
      d = "$ph${nullable ? '?' : ''}.map<${ser.type.nullable(ser.nullable)}>((e) { return ${d.replaceAll(ph, "e")}; }).toList(growable: false)";
    }
    return Tuple2(s, d);
  }

  static Tuple4<String, String, String, String> tuple(Iterable<SerField> sers) {
    var ser = StringBuffer();
    var deser = StringBuffer();
    var types = [];
    var idl = [];
    for (var i = 0; i < sers.length; ++i) {
      var f = sers.elementAt(i);
      types.add(f.type.nullable(f.nullable));
      idl.add(f.idl);
      var ind = i + 1;
      var s = f.ser;
      if (s != null) {
        ser.write(s.replaceAll(ph, "$ph.item$ind"));
      } else {
        ser.write("$ph.item$ind");
      }
      ser.write(",");
      var d = f.deser;
      if (d != null) {
        deser.write(d.replaceAll(ph, "$ph[$i]"));
      } else {
        deser.write("$ph[$i]");
      }
      deser.write(",");
    }
    var dartTypes = types.join(",");
    return Tuple4(
      "<dynamic>[$ser]",
      "Tuple${sers.length}<$dartTypes>.fromList(<dynamic>[$deser],)",
      sers.length == 1 ? dartTypes : "Tuple${sers.length}<$dartTypes>",
      "IDL.Tuple(<CType<dynamic>>[${idl.join(",")}],)",
    );
  }
}
