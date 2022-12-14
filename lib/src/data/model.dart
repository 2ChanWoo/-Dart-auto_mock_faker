class YamlClassModel {
  final String name;
  final bool? isIterable;
  final int? length;
  final List<dynamic>? range;
  final List<Properties> properties;

  YamlClassModel({required this.name, this.isIterable, this.length, this.range, required this.properties});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['iterable'] = isIterable;
    data['length'] = length;
    data['range'] = range;
    data['properties'] = properties.map((e) => e.toJson()).toList();
    return data;
  }

}

class Properties {
  final String name;
  final String type;
  final bool? isIterable;
  final int? length;
  final List<dynamic>? range;

  Properties({required this.name, required this.type, this.isIterable, this.length, this.range});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['type'] = type;
    data['iterable'] = isIterable;
    data['length'] = length;
    data['range'] = range;
    return data;
  }
}