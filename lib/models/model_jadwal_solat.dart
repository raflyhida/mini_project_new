// To parse this JSON data, do
//
//     final jadwalSolat = jadwalSolatFromJson(jsonString);

import 'dart:convert';

JadwalSolat jadwalSolatFromJson(Map<String, dynamic> map) => JadwalSolat.fromJson(map);

String jadwalSolatToJson(JadwalSolat data) => json.encode(data.toJson());

class JadwalSolat {
  String status;
  Query query;
  Jadwal jadwal;

  JadwalSolat({
    required this.status,
    required this.query,
    required this.jadwal,
  });

  factory JadwalSolat.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('json cannot be null');
    }

    return JadwalSolat(
      status: json["status"] as String? ?? '',
      query: Query.fromJson(json["query"] as Map<String, dynamic>? ?? {}),
      jadwal: Jadwal.fromJson(json["jadwal"] as Map<String, dynamic>? ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "query": query.toJson(),
    "jadwal": jadwal.toJson(),
  };
}


class Jadwal {
    String status;
    Data data;

    Jadwal({
        required this.status,
        required this.data,
    });

    factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    String ashar;
    String dhuha;
    String dzuhur;
    String imsak;
    String isya;
    String maghrib;
    String subuh;
    String tanggal;
    String terbit;

    Data({
        required this.ashar,
        required this.dhuha,
        required this.dzuhur,
        required this.imsak,
        required this.isya,
        required this.maghrib,
        required this.subuh,
        required this.tanggal,
        required this.terbit,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        ashar: json["ashar"],
        dhuha: json["dhuha"],
        dzuhur: json["dzuhur"],
        imsak: json["imsak"],
        isya: json["isya"],
        maghrib: json["maghrib"],
        subuh: json["subuh"],
        tanggal: json["tanggal"],
        terbit: json["terbit"],
    );

    Map<String, dynamic> toJson() => {
        "ashar": ashar,
        "dhuha": dhuha,
        "dzuhur": dzuhur,
        "imsak": imsak,
        "isya": isya,
        "maghrib": maghrib,
        "subuh": subuh,
        "tanggal": tanggal,
        "terbit": terbit,
    };
}

class Query {
    String format;
    String kota;
    DateTime tanggal;

    Query({
        required this.format,
        required this.kota,
        required this.tanggal,
    });

    factory Query.fromJson(Map<String, dynamic> json) => Query(
        format: json["format"],
        kota: json["kota"],
        tanggal: DateTime.parse(json["tanggal"]),
    );

    Map<String, dynamic> toJson() => {
        "format": format,
        "kota": kota,
        "tanggal": "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
    };
}


