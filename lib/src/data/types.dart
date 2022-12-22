// enum int {
//   int('int'),
//   number('number');
//
//   final String _str;
//   const int(this._str);
//   String get str => _str;
// }
/// => enum member 이름으로 int 사용불가.

List<String> dataKeywords = ['const', 'static', 'final', 'late', ':', ';', '?'];

//TODO: 타입이 먼저 나오지 않는 언어일 경우, ex; 변수명이 inter~ 라면 int타입으로 잡힐 수 있음.
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
  ...typeIterable,
  ...typeString,
  ...typeInt,
  ...typeDouble,
  ...typeBool,
  ...typeDynamic,
];

const Map<String, List<String>> primitiveTypes = {
  'typeString' : typeString,
  'typeInt': typeInt,
  'typeDouble': typeDouble,
  'typeBool': typeBool,
  'typeList': typeList,
  'typeMap': typeMap,
  'typeSet': typeSet,
};

/// ex, Person, School 등등..
const typeCustomObjectName = {};
