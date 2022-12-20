class CliConfig {
  static const cliName = 'amf';
  static const packageName = 'auto_mock_faker';

  static String parseDirName = '';
  static String outputDirName = '';

  // 언어별 클래스 키워드.
  //TODO: 추후 파싱언어를 입력받으면, 해당 언어로 파싱될 수 있도록...
  static Map<String, String> classPrefixes = {
    'dart': 'class ',
  };
  static String classPrefix = 'class '; // default: CliConfig.classPrefix['dart']
}