import 'dart:io';

import 'package:auto_mock_faker/src/data/types.dart';
import 'package:faker/faker.dart';

import '../data/model.dart';

Future mockFileGenerator(String? path) async {
  var file = File('path/to/file.dart');
  file.writeAsStringSync('string to write');
}

Future makeJsonMock(List<ClassModel> classes) async {

  for(var cls in classes) {
    String content = '';


  }

}


dynamic gerFakeValue(String type) {
  if(typeString.contains(type)) {
  } else if(typeInt.contains(type)) {

  } else if(typeDouble.contains(type)) {

  } else if(typeBool.contains(type)) {

  } else if(typeDynamic.contains(type)) {

  } else if(typeList.contains(type)) {

  }
  // else if(typeMap.contains(type)) {
  //
  // } else if(typeSet.contains(type)) {
  //
  // }
  else {
    // throw Exception("타입을 확정할 수 없습니다.");
    print("타입을 확정할 수 없습니다.");
    exit(0);
  }
}