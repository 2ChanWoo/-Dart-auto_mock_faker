import 'dart:io';

import 'package:args/args.dart';
import 'package:auto_mock_faker/src/runner.dart';
import 'package:path/path.dart' as p;

const lineNumber = 'line-number';

void main(List<String> arguments) async {

  exitCode = 0; // presume success
  final parser = ArgParser()..addFlag(lineNumber, negatable: false, abbr: 'n')..addFlag('test', negatable: false, abbr: 't');

  ArgResults argResults = parser.parse(arguments);
  final paths = argResults.rest;
  print("path : $paths , ${p  .current}");
  print("-------------------------------------");
  print("ArgResults\n\n"
      "name: ${argResults.name},\n"
      "command ${argResults.command},\n"
      "arguments: ${argResults.arguments},\n"
      "options: ${argResults.options}");
  print("-------------------------------------");
  if(arguments.first == 'run') {
    exit(await AMFCommandRunner().run(arguments));
}}
