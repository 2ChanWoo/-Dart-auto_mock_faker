// enum int {
//   int('int'),
//   number('number');
//
//   final String _str;
//   const int(this._str);
//   String get str => _str;
// }
/// => enum member 이름으로 int 사용불가.

const typeString = ['String'];
const typeInt = ['int', 'number'];
const typeDouble = ['double', 'number'];
const typeBool = ['bool'];
const typeList = ['List'];
const typeMap = ['Map', 'dictionary'];
//TODO: time

const types = [...typeString, ...typeInt, ...typeDouble, ...typeBool, ...typeList, ...typeMap];

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
