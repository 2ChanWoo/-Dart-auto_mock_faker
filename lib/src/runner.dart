import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:auto_mock_faker/src/data/model.dart';
import 'package:io/io.dart';

import 'app/config.dart';
import 'app/util/logger.dart';
import 'io/class_parser.dart';
import 'io/commands.dart';

//TODO: 1. 어노테이션 사용해서 리스트로 받아올지 정하기? - 단일 데이터일수도,  리스트 데이터일수도 있으니까. { } or [{ }]
//TODO: 어노테이션 없는건 디폴트로 봐야할지, 아니면 어노테이션 붙은 것만 제네레이트 할 지..

/// Auto Mock Faker
class AMFCommandRunner extends CommandRunner<int> {
  static late AMFCommandRunner instance;
  static String TAG = 'AMFCommandRunner';
  
  AMFCommandRunner() : super(CliConfig.cliName, 'Make mock data files using Class files in directory.') {
    instance = this;

    /// run 커맨드 등록.
    addCommand(RunCommand(startRun));

    argParser
    ..addFlag('version', help: 'Show the current fts version', negatable: false, abbr: 'v')
    ..addFlag('select-file', help: 'Select file for mocking', negatable: false, abbr: 'f')
    /*..addFlag('mock-length', help: 'specify a mock data length', negatable: false, abbr: 'l')*/;
    // ㄴ> 싱글 데이터로 내려오는 경우가 있으니,,

  }


  @override
  Future<int> run(Iterable<String> args) async {
    print("$TAG/run");
    try {
      final _args = parse(args);
      // final cmd = _args.command;
      // print("cmd: ${cmd.toString()}");
      // print("cmd name: ${cmd?.name}"); //=> cmd: run

      final res = await runCommand(_args) ?? ExitCode.success.code;
      return res;
    } catch(e) {
      error(e);
    }
    return ExitCode.usage.code;
  }


  @override
  Future<int?> runCommand(ArgResults topLevelResults) async {
    print("$TAG/runCommand");
    if(topLevelResults['version'] == true) {
      // print version.
      return ExitCode.success.code;
    }

    return super.runCommand(topLevelResults); // Command 의 run을 호출함.
  }

  /// executes the logic for 'amf run'
  Future<void> startRun() async {
    classParser();
  }

  Future classParser() async {
    List<ClassModel> classModels = [];
    List<File> dartFiles = await getDartFiles(CliConfig.parseDirName); //TODO: path, argㄹㅗ 전달 받을 수 있도록.
    List<String> classContents = [];
    for(var file in dartFiles) {
      String content = File(file.path).readAsStringSync();
      List<String> classNames = [];
      classNames = extractClassNames(content);

      for(var name in classNames) {
        String classContent = extractClassContent(className: name, content: content);
        classModels.add(ClassModel(name: name, content: classContent, properties: []));

        print("========================================================================================");
        print("name: $name");
        print("content: $classContent");
      }
    }
  }
}