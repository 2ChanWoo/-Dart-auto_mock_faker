
import 'package:args/command_runner.dart';

class RunCommand extends Command<int> {
  static String TAG = 'RunCommand';

  @override
  String get description => 'Make mock data files using Class files in directory.';

  @override
  String get name => 'run';

  final Future Function() exec;

  RunCommand(this.exec) {
    //argParser.addFlag(name);
  }

  @override
  Future<int> run() async {
    print("$TAG/run");

    //TODO: -

    await exec();
    return 0;
  }

}