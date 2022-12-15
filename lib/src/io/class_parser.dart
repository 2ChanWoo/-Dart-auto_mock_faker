import 'dart:io';

import 'package:path/path.dart' as p;

import '../app/config.dart';
import '../data/model.dart';
import '../data/types.dart';

Future<List<String>> extractClassNames() async {
  String path = CliConfig.parseDirName;
  if (path.isEmpty) {
    print('입력된 디렉토리가 없습니다. 현재 디텍토리에서 클래스를 찾아 파싱합니다.'); //TODO: 입력 받아서 진행될 수 있도록.
    path = p.current;
  }

  final dir = Directory(path);
  final List<FileSystemEntity> entities = dir.listSync().toList();
  final List<File> dartFiles =
      entities.whereType<File>().toList().where((e) => (e.path.endsWith(".dart"))).toList();

  print("-------------------------------------");
  List<String> classNames = [];

  for (var file in dartFiles) {
    String content = File(file.path).readAsStringSync();  //TODO: 파일선택
    List<String> classes = content.split('class ');

    // 종속코드(import) 또는 빈 문자열('') 이 있으므로 제거.
    // if(classes.first.isEmpty) {
    classes.removeAt(0);
    // }

    for(int i=0; i<classes.length; i++) {
      if(classes[i].isEmpty) continue;

      String str = classes[i];
      String containClassNameString = str.split('{').first;
      print(containClassNameString);
      String className = containClassNameString.trim().split(' ').first;  // 앞 뒤 공백 제거 후, 가장 앞에 있을 클래스 네임 추출.
      print(className);
      classNames.add(className);

      // for(int s=1; s<=lines.length; s++) {
      //   print("$s: ${lines[s-1]}");
      // }

    }
  }
  print(classNames);
  return classNames;
}

void classParser() async {
  String path = CliConfig.parseDirName;
  if(path.isEmpty) {
    print('입력된 디렉토리가 없습니다. 현재 디텍토리에서 클래스를 찾아 파싱합니다.');  //TODO: 입력 받아서 진행될 수 있도록.
    path = p.current;
  }

  final dir = Directory(path);
  final List<FileSystemEntity> entities = dir.listSync().toList();
  final List<File> dartFiles = entities.whereType<File>().toList().where((e) => (e.path.endsWith(".dart"))).toList();

  print("-------------------------------------");
  for(var a in dartFiles) {
    print(a.path);
  }
  String content = File(dartFiles[1].path).readAsStringSync();  //TODO: 파일선택
  List<String> classes = content.split('class ');
  List<String> classNames = [];

  // 종속코드(import) 또는 빈 문자열('') 이 있으므로 제거.
  // if(classes.first.isEmpty) {
    classes.removeAt(0);
  // }

  for(int i=0; i<classes.length; i++) {
    if(classes[i].isEmpty) continue;

    String str = classes[i];
    String containClassNameString = str.split('{').first;
    print(containClassNameString);
    String className = containClassNameString.trim().split(' ').first;  // 앞 뒤 공백 제거 후, 가장 앞에 있을 클래스 네임 추출.
    print(className);
    classNames.add(className);

    // for(int s=1; s<=lines.length; s++) {
    //   print("$s: ${lines[s-1]}");
    // }

  }

  Map<String, dynamic> yamlConfig = {}; //TODO: 글로벌 변수로? 갖고가서 한 번에 yaml만드는게 나을까?
  List<YamlClassModel> yamlClassModels = [];
  // 파일의 클래스 갯수만큼 실행.
  for(var className in classNames) {
    int classStartIndex = content.indexOf(className);
    int classScopeStartIndex = content.indexOf('{', classStartIndex);
    print(classScopeStartIndex);
    List<String> contentCharSet = content.split('');

    int bracketStartIndex = classScopeStartIndex + 1;    // class 시작 브라켓(open bracket) '{' 의 직후 문자
    int bracketEndIndex = bracketStartIndex;
    int bracketNum = 1;
    while(true) {
      if(content[bracketEndIndex] == '{') {
        bracketNum++;
      } else if (content[bracketEndIndex] == '}') {
        bracketNum--;
      }

      if(bracketNum == 0) { // class의 scope가 감지되면 탈출.
        break;
      }
      bracketEndIndex++;
    } //
    print(content.substring(bracketEndIndex- 100, bracketEndIndex));
    print('$className / ${classNames.length}');
    // content.runes

    /// 클래스 scope 내에서 파싱작업.
    String classContent = content.substring(bracketStartIndex, bracketEndIndex);
    List<String> contentLineSet = classContent.split('\n'); // 한 줄씩 분석.
    List<Properties> properties = [];

    for (var e in contentLineSet) {
      bool isVar = false;
      String? varType;
      String? varName;
      bool isNullable = false;

      e = e.split('//').first; // 주석제거

      for (var t in types) {
        //TODO: 소문자비교 => 하려다가 아래 replaceFirst에서 걸러주질 못함. 해당 구문에서도 소문자로 반환하게되면 !*변수명도 소문자*!로 되어버려서 힘듬.
        if(e.contains(t)) {     //TODO: iterable 일 경우를 위해 iterable type을 먼저 검사할 수 있도록 하는게.. 타입이 여러 개 나올 수 도 있고..
          isVar = true;
          varType = t;
          e = e.replaceFirst(t, '');
        } else { /// 해당 열에 기본 변수 타입이 없을 경우. class 타입 일 수도 있고, 아니면 의미없는 한 줄 일 수도 있다.
          //TODO: 모든 파일 search해서 클래스 이름부터 다 가져와야 할 것 같다. 아니면 구분하기 너무 힘드니...
        }
        if(e.contains('?')) {          // delete nullable, optional character
          isNullable = true;
          e = e.replaceFirst('?', '');
        }
        // 이제 이걸로 yaml을 생성하는게..
      }

      List<String> dataKeywords = ['const', 'static', 'final', ':', ';', '?'];  //TODO: global
      for(var re in dataKeywords) {
        e = e.replaceFirst(re, ''); //
      }

      if(isVar) print(e.trim() + ' ' + e.trim().split(' ').length.toString());  //이름분리됨.


      if(isVar && e.trim().split(' ').length == 1) {
        properties.add(Properties(name: e.trim().split(' ').first, type: varType!));
      }
    }
    yamlClassModels.add(YamlClassModel(name: className, properties: properties));
  }
  print("----------------------------------");
  print(yamlClassModels.first.toJson());
  print("----------------------------------");

  // for(int i=1; i<=classes.length; i++) {
  //   print("$i: ${classes[i-1]}");
  // }
}