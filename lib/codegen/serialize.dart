import 'package:tuple/tuple.dart';

import 'extension.dart';

abstract class Ser {
  final String did;
  final String idl;
  final String type;
  final bool opt;
  final String? ser;
  final String? deser;

  const Ser._(
    this.idl,
    this.type,
    this.did, {
    this.opt = false,
    this.ser,
    this.deser,
  });

  static const String ph = "{{val}}";

  static Tuple2<String, String> principal([bool opt = false]) {
    String s;
    String d;
    if (opt) {
      s = "$ph?.toJson()";
      d = "$ph == null ? null : Principal.from($ph)";
    } else {
      s = "$ph.toJson()";
      d = "Principal.from($ph)";
    }
    return Tuple2(s, d);
  }

  static Tuple2<String, String> obj(String clazz, [bool opt = false]) {
    String s;
    String d;
    if (opt) {
      s = "$ph?.toJson()";
      d = "$ph == null ? null : $clazz.fromMap($ph,)";
    } else {
      s = "$ph.toJson()";
      d = "$clazz.fromMap($ph,)";
    }
    return Tuple2(s, d);
  }

  static Tuple2<String, String> uint8List([bool opt = false]) {
    String s;
    String d;
    if (opt) {
      s = "$ph?.toList(growable: false)";
      d = "$ph == null ? null : Uint8List.fromList($ph)";
    } else {
      s = "$ph.toList(growable: false)";
      d = "Uint8List.fromList($ph)";
    }
    return Tuple2(s, d);
  }

  static Tuple2<String?, String?> list(
    Ser ser, [
    bool opt = false,
  ]) {
    var s = ser.ser;
    if (s != null) {
      s = "$ph${opt ? '?' : ''}.map<${ser.type.opt(ser.opt)}>((dynamic e) { return ${s.replaceAll(ph, "e")}; })";
    }
    var d = ser.deser;
    if (d != null) {
      d = "$ph${opt ? '?' : ''}.map<${ser.type.opt(ser.opt)}>((dynamic e) { return ${d.replaceAll(ph, "e")}; }).toList(growable: false)";
    }
    return Tuple2(s, d);
  }

  static Tuple4<String, String, String, String> tuple(Iterable<Ser> sers) {
    var ser = StringBuffer();
    var deser = StringBuffer();
    var types = [];
    var idl = [];
    for (var i = 0; i < sers.length; ++i) {
      var f = sers.elementAt(i);
      types.add(f.type.opt(f.opt));
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
