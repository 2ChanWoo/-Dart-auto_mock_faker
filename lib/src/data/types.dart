// enum int {
//   int('int'),
//   number('number');
//
//   final String _str;
//   const int(this._str);
//   String get str => _str;
// }
/// => enum member 이름으로 int 사용불가.

List<String> dataKeywords = ['const', 'static', 'final', ':', ';', '?'];

// 대소문자 구분 해야 함.
const typeString = ['String'];
const typeInt = ['int', 'number'];
const typeDouble = ['double', 'number'];
const typeBool = ['bool'];
const typeDynamic = ['dynamic'];

const typeList = ['List'];
const typeMap = ['Map', 'dictionary'];
const typeSet = ['Set'];

//TODO: time

const List<String> typeIterable = [...typeList, ...typeSet, ...typeMap];

const types = [
  ...typeString,
  ...typeInt,
  ...typeDouble,
  ...typeBool,
  ...typeList,
  ...typeMap,
  ...typeSet,
  ...typeDynamic,
];

const Map<String, List<String>> primitiveTypes = {
  'typeString' : typeString,
  'typeInt': typeInt,
  'typeDouble': typeDouble,
  'typeBool': typeBool,
  'typeList': typeList,
  'typeMap': typeMap,
};

/// ex, Person, School 등등..
const typeCustomObjectName = {};
