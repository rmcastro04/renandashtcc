import 'dart:convert';

class ListIdhmModel {
  String state;
  double idhm;
  ListIdhmModel({
    this.state = '',
    this.idhm = 0.0,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'state': state});
    result.addAll({'idhm': idhm});
  
    return result;
  }

  factory ListIdhmModel.fromMap(Map<String, dynamic> map) {
    return ListIdhmModel(
      state: map['state'] ?? '',
      idhm: map['idhm']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListIdhmModel.fromJson(String source) => ListIdhmModel.fromMap(json.decode(source));
}
