class ClassModel {
  final String name;
  final String content;
  final bool? isIterable;
  final int? length;
  final List<dynamic>? range;
  List<Properties> properties;

  ClassModel({required this.name, required this.content, this.isIterable, this.length, this.range, required this.properties});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['content'] = content;
    data['iterable'] = isIterable;
    data['length'] = length;
    data['range'] = range;
    data['properties'] = properties.map((e) => e.toJson()).toList();
    return data;
  }
//TODO: nullable 옵션?
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
