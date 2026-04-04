// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserProfileRecordCollection on Isar {
  IsarCollection<UserProfileRecord> get userProfileRecords => this.collection();
}

const UserProfileRecordSchema = CollectionSchema(
  name: r'UserProfileRecord',
  id: -3596844978006719488,
  properties: {
    r'educationLevel': PropertySchema(
      id: 0,
      name: r'educationLevel',
      type: IsarType.string,
    ),
    r'firstName': PropertySchema(
      id: 1,
      name: r'firstName',
      type: IsarType.string,
    ),
    r'languageCode': PropertySchema(
      id: 2,
      name: r'languageCode',
      type: IsarType.string,
    ),
    r'onboardingComplete': PropertySchema(
      id: 3,
      name: r'onboardingComplete',
      type: IsarType.bool,
    ),
    r'stressTriggers': PropertySchema(
      id: 4,
      name: r'stressTriggers',
      type: IsarType.stringList,
    ),
  },
  estimateSize: _userProfileRecordEstimateSize,
  serialize: _userProfileRecordSerialize,
  deserialize: _userProfileRecordDeserialize,
  deserializeProp: _userProfileRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userProfileRecordGetId,
  getLinks: _userProfileRecordGetLinks,
  attach: _userProfileRecordAttach,
  version: '3.1.0+1',
);

int _userProfileRecordEstimateSize(
  UserProfileRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.educationLevel.length * 3;
  bytesCount += 3 + object.firstName.length * 3;
  bytesCount += 3 + object.languageCode.length * 3;
  bytesCount += 3 + object.stressTriggers.length * 3;
  {
    for (var i = 0; i < object.stressTriggers.length; i++) {
      final value = object.stressTriggers[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _userProfileRecordSerialize(
  UserProfileRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.educationLevel);
  writer.writeString(offsets[1], object.firstName);
  writer.writeString(offsets[2], object.languageCode);
  writer.writeBool(offsets[3], object.onboardingComplete);
  writer.writeStringList(offsets[4], object.stressTriggers);
}

UserProfileRecord _userProfileRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserProfileRecord();
  object.educationLevel = reader.readString(offsets[0]);
  object.firstName = reader.readString(offsets[1]);
  object.id = id;
  object.languageCode = reader.readString(offsets[2]);
  object.onboardingComplete = reader.readBool(offsets[3]);
  object.stressTriggers = reader.readStringList(offsets[4]) ?? [];
  return object;
}

P _userProfileRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userProfileRecordGetId(UserProfileRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userProfileRecordGetLinks(
  UserProfileRecord object,
) {
  return [];
}

void _userProfileRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  UserProfileRecord object,
) {
  object.id = id;
}

extension UserProfileRecordQueryWhereSort
    on QueryBuilder<UserProfileRecord, UserProfileRecord, QWhere> {
  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserProfileRecordQueryWhere
    on QueryBuilder<UserProfileRecord, UserProfileRecord, QWhereClause> {
  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension UserProfileRecordQueryFilter
    on QueryBuilder<UserProfileRecord, UserProfileRecord, QFilterCondition> {
  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  educationLevelEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'educationLevel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  educationLevelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'educationLevel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  educationLevelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'educationLevel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  educationLevelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'educationLevel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  educationLevelStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'educationLevel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  educationLevelEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'educationLevel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  educationLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'educationLevel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  educationLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'educationLevel',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  educationLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'educationLevel', value: ''),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  educationLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'educationLevel', value: ''),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  firstNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'firstName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  firstNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'firstName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  firstNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'firstName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  firstNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'firstName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  firstNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'firstName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  firstNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'firstName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  firstNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'firstName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  firstNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'firstName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  firstNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'firstName', value: ''),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  firstNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'firstName', value: ''),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  languageCodeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'languageCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  languageCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'languageCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  languageCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'languageCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  languageCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'languageCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  languageCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'languageCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  languageCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'languageCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  languageCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'languageCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  languageCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'languageCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  languageCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'languageCode', value: ''),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  languageCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'languageCode', value: ''),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  onboardingCompleteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'onboardingComplete', value: value),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'stressTriggers',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'stressTriggers',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'stressTriggers',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'stressTriggers',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'stressTriggers',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'stressTriggers',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'stressTriggers',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'stressTriggers',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'stressTriggers', value: ''),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'stressTriggers', value: ''),
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'stressTriggers', length, true, length, true);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'stressTriggers', 0, true, 0, true);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'stressTriggers', 0, false, 999999, true);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'stressTriggers', 0, true, length, include);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'stressTriggers', length, include, 999999, true);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterFilterCondition>
  stressTriggersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stressTriggers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension UserProfileRecordQueryObject
    on QueryBuilder<UserProfileRecord, UserProfileRecord, QFilterCondition> {}

extension UserProfileRecordQueryLinks
    on QueryBuilder<UserProfileRecord, UserProfileRecord, QFilterCondition> {}

extension UserProfileRecordQuerySortBy
    on QueryBuilder<UserProfileRecord, UserProfileRecord, QSortBy> {
  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  sortByEducationLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'educationLevel', Sort.asc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  sortByEducationLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'educationLevel', Sort.desc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  sortByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  sortByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  sortByLanguageCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.asc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  sortByLanguageCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.desc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  sortByOnboardingComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboardingComplete', Sort.asc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  sortByOnboardingCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboardingComplete', Sort.desc);
    });
  }
}

extension UserProfileRecordQuerySortThenBy
    on QueryBuilder<UserProfileRecord, UserProfileRecord, QSortThenBy> {
  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  thenByEducationLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'educationLevel', Sort.asc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  thenByEducationLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'educationLevel', Sort.desc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  thenByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  thenByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  thenByLanguageCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.asc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  thenByLanguageCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.desc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  thenByOnboardingComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboardingComplete', Sort.asc);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QAfterSortBy>
  thenByOnboardingCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboardingComplete', Sort.desc);
    });
  }
}

extension UserProfileRecordQueryWhereDistinct
    on QueryBuilder<UserProfileRecord, UserProfileRecord, QDistinct> {
  QueryBuilder<UserProfileRecord, UserProfileRecord, QDistinct>
  distinctByEducationLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'educationLevel',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QDistinct>
  distinctByFirstName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QDistinct>
  distinctByLanguageCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'languageCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QDistinct>
  distinctByOnboardingComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onboardingComplete');
    });
  }

  QueryBuilder<UserProfileRecord, UserProfileRecord, QDistinct>
  distinctByStressTriggers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stressTriggers');
    });
  }
}

extension UserProfileRecordQueryProperty
    on QueryBuilder<UserProfileRecord, UserProfileRecord, QQueryProperty> {
  QueryBuilder<UserProfileRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserProfileRecord, String, QQueryOperations>
  educationLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'educationLevel');
    });
  }

  QueryBuilder<UserProfileRecord, String, QQueryOperations>
  firstNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstName');
    });
  }

  QueryBuilder<UserProfileRecord, String, QQueryOperations>
  languageCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'languageCode');
    });
  }

  QueryBuilder<UserProfileRecord, bool, QQueryOperations>
  onboardingCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onboardingComplete');
    });
  }

  QueryBuilder<UserProfileRecord, List<String>, QQueryOperations>
  stressTriggersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stressTriggers');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNotificationPreferenceRecordCollection on Isar {
  IsarCollection<NotificationPreferenceRecord>
  get notificationPreferenceRecords => this.collection();
}

const NotificationPreferenceRecordSchema = CollectionSchema(
  name: r'NotificationPreferenceRecord',
  id: -14003919946724848,
  properties: {
    r'detoxProgressEnabled': PropertySchema(
      id: 0,
      name: r'detoxProgressEnabled',
      type: IsarType.bool,
    ),
    r'eveningHour': PropertySchema(
      id: 1,
      name: r'eveningHour',
      type: IsarType.long,
    ),
    r'eveningMinute': PropertySchema(
      id: 2,
      name: r'eveningMinute',
      type: IsarType.long,
    ),
    r'morningHour': PropertySchema(
      id: 3,
      name: r'morningHour',
      type: IsarType.long,
    ),
    r'morningMinute': PropertySchema(
      id: 4,
      name: r'morningMinute',
      type: IsarType.long,
    ),
    r'remindersEnabled': PropertySchema(
      id: 5,
      name: r'remindersEnabled',
      type: IsarType.bool,
    ),
    r'weeklyInsightsEnabled': PropertySchema(
      id: 6,
      name: r'weeklyInsightsEnabled',
      type: IsarType.bool,
    ),
  },
  estimateSize: _notificationPreferenceRecordEstimateSize,
  serialize: _notificationPreferenceRecordSerialize,
  deserialize: _notificationPreferenceRecordDeserialize,
  deserializeProp: _notificationPreferenceRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _notificationPreferenceRecordGetId,
  getLinks: _notificationPreferenceRecordGetLinks,
  attach: _notificationPreferenceRecordAttach,
  version: '3.1.0+1',
);

int _notificationPreferenceRecordEstimateSize(
  NotificationPreferenceRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _notificationPreferenceRecordSerialize(
  NotificationPreferenceRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.detoxProgressEnabled);
  writer.writeLong(offsets[1], object.eveningHour);
  writer.writeLong(offsets[2], object.eveningMinute);
  writer.writeLong(offsets[3], object.morningHour);
  writer.writeLong(offsets[4], object.morningMinute);
  writer.writeBool(offsets[5], object.remindersEnabled);
  writer.writeBool(offsets[6], object.weeklyInsightsEnabled);
}

NotificationPreferenceRecord _notificationPreferenceRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NotificationPreferenceRecord();
  object.detoxProgressEnabled = reader.readBool(offsets[0]);
  object.eveningHour = reader.readLong(offsets[1]);
  object.eveningMinute = reader.readLong(offsets[2]);
  object.id = id;
  object.morningHour = reader.readLong(offsets[3]);
  object.morningMinute = reader.readLong(offsets[4]);
  object.remindersEnabled = reader.readBool(offsets[5]);
  object.weeklyInsightsEnabled = reader.readBool(offsets[6]);
  return object;
}

P _notificationPreferenceRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _notificationPreferenceRecordGetId(NotificationPreferenceRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _notificationPreferenceRecordGetLinks(
  NotificationPreferenceRecord object,
) {
  return [];
}

void _notificationPreferenceRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  NotificationPreferenceRecord object,
) {
  object.id = id;
}

extension NotificationPreferenceRecordQueryWhereSort
    on
        QueryBuilder<
          NotificationPreferenceRecord,
          NotificationPreferenceRecord,
          QWhere
        > {
  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterWhere
  >
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NotificationPreferenceRecordQueryWhere
    on
        QueryBuilder<
          NotificationPreferenceRecord,
          NotificationPreferenceRecord,
          QWhereClause
        > {
  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterWhereClause
  >
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterWhereClause
  >
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterWhereClause
  >
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterWhereClause
  >
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension NotificationPreferenceRecordQueryFilter
    on
        QueryBuilder<
          NotificationPreferenceRecord,
          NotificationPreferenceRecord,
          QFilterCondition
        > {
  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  detoxProgressEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'detoxProgressEnabled',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  eveningHourEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'eveningHour', value: value),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  eveningHourGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'eveningHour',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  eveningHourLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'eveningHour',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  eveningHourBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'eveningHour',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  eveningMinuteEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'eveningMinute', value: value),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  eveningMinuteGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'eveningMinute',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  eveningMinuteLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'eveningMinute',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  eveningMinuteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'eveningMinute',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  morningHourEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'morningHour', value: value),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  morningHourGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'morningHour',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  morningHourLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'morningHour',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  morningHourBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'morningHour',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  morningMinuteEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'morningMinute', value: value),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  morningMinuteGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'morningMinute',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  morningMinuteLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'morningMinute',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  morningMinuteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'morningMinute',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  remindersEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'remindersEnabled', value: value),
      );
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterFilterCondition
  >
  weeklyInsightsEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'weeklyInsightsEnabled',
          value: value,
        ),
      );
    });
  }
}

extension NotificationPreferenceRecordQueryObject
    on
        QueryBuilder<
          NotificationPreferenceRecord,
          NotificationPreferenceRecord,
          QFilterCondition
        > {}

extension NotificationPreferenceRecordQueryLinks
    on
        QueryBuilder<
          NotificationPreferenceRecord,
          NotificationPreferenceRecord,
          QFilterCondition
        > {}

extension NotificationPreferenceRecordQuerySortBy
    on
        QueryBuilder<
          NotificationPreferenceRecord,
          NotificationPreferenceRecord,
          QSortBy
        > {
  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  sortByDetoxProgressEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detoxProgressEnabled', Sort.asc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  sortByDetoxProgressEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detoxProgressEnabled', Sort.desc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  sortByEveningHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningHour', Sort.asc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  sortByEveningHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningHour', Sort.desc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  sortByEveningMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningMinute', Sort.asc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  sortByEveningMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningMinute', Sort.desc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  sortByMorningHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningHour', Sort.asc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  sortByMorningHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningHour', Sort.desc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  sortByMorningMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningMinute', Sort.asc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  sortByMorningMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningMinute', Sort.desc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  sortByRemindersEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersEnabled', Sort.asc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  sortByRemindersEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersEnabled', Sort.desc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  sortByWeeklyInsightsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyInsightsEnabled', Sort.asc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  sortByWeeklyInsightsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyInsightsEnabled', Sort.desc);
    });
  }
}

extension NotificationPreferenceRecordQuerySortThenBy
    on
        QueryBuilder<
          NotificationPreferenceRecord,
          NotificationPreferenceRecord,
          QSortThenBy
        > {
  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenByDetoxProgressEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detoxProgressEnabled', Sort.asc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenByDetoxProgressEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detoxProgressEnabled', Sort.desc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenByEveningHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningHour', Sort.asc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenByEveningHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningHour', Sort.desc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenByEveningMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningMinute', Sort.asc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenByEveningMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningMinute', Sort.desc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenByMorningHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningHour', Sort.asc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenByMorningHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningHour', Sort.desc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenByMorningMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningMinute', Sort.asc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenByMorningMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningMinute', Sort.desc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenByRemindersEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersEnabled', Sort.asc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenByRemindersEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersEnabled', Sort.desc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenByWeeklyInsightsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyInsightsEnabled', Sort.asc);
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QAfterSortBy
  >
  thenByWeeklyInsightsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyInsightsEnabled', Sort.desc);
    });
  }
}

extension NotificationPreferenceRecordQueryWhereDistinct
    on
        QueryBuilder<
          NotificationPreferenceRecord,
          NotificationPreferenceRecord,
          QDistinct
        > {
  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QDistinct
  >
  distinctByDetoxProgressEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detoxProgressEnabled');
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QDistinct
  >
  distinctByEveningHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eveningHour');
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QDistinct
  >
  distinctByEveningMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eveningMinute');
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QDistinct
  >
  distinctByMorningHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'morningHour');
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QDistinct
  >
  distinctByMorningMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'morningMinute');
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QDistinct
  >
  distinctByRemindersEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remindersEnabled');
    });
  }

  QueryBuilder<
    NotificationPreferenceRecord,
    NotificationPreferenceRecord,
    QDistinct
  >
  distinctByWeeklyInsightsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weeklyInsightsEnabled');
    });
  }
}

extension NotificationPreferenceRecordQueryProperty
    on
        QueryBuilder<
          NotificationPreferenceRecord,
          NotificationPreferenceRecord,
          QQueryProperty
        > {
  QueryBuilder<NotificationPreferenceRecord, int, QQueryOperations>
  idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NotificationPreferenceRecord, bool, QQueryOperations>
  detoxProgressEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detoxProgressEnabled');
    });
  }

  QueryBuilder<NotificationPreferenceRecord, int, QQueryOperations>
  eveningHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eveningHour');
    });
  }

  QueryBuilder<NotificationPreferenceRecord, int, QQueryOperations>
  eveningMinuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eveningMinute');
    });
  }

  QueryBuilder<NotificationPreferenceRecord, int, QQueryOperations>
  morningHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'morningHour');
    });
  }

  QueryBuilder<NotificationPreferenceRecord, int, QQueryOperations>
  morningMinuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'morningMinute');
    });
  }

  QueryBuilder<NotificationPreferenceRecord, bool, QQueryOperations>
  remindersEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remindersEnabled');
    });
  }

  QueryBuilder<NotificationPreferenceRecord, bool, QQueryOperations>
  weeklyInsightsEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weeklyInsightsEnabled');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoodEntryRecordCollection on Isar {
  IsarCollection<MoodEntryRecord> get moodEntryRecords => this.collection();
}

const MoodEntryRecordSchema = CollectionSchema(
  name: r'MoodEntryRecord',
  id: 1265543824057994496,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'emotionTags': PropertySchema(
      id: 1,
      name: r'emotionTags',
      type: IsarType.stringList,
    ),
    r'manualScrollMinutes': PropertySchema(
      id: 2,
      name: r'manualScrollMinutes',
      type: IsarType.long,
    ),
    r'note': PropertySchema(id: 3, name: r'note', type: IsarType.string),
    r'score': PropertySchema(id: 4, name: r'score', type: IsarType.long),
  },
  estimateSize: _moodEntryRecordEstimateSize,
  serialize: _moodEntryRecordSerialize,
  deserialize: _moodEntryRecordDeserialize,
  deserializeProp: _moodEntryRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _moodEntryRecordGetId,
  getLinks: _moodEntryRecordGetLinks,
  attach: _moodEntryRecordAttach,
  version: '3.1.0+1',
);

int _moodEntryRecordEstimateSize(
  MoodEntryRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.emotionTags.length * 3;
  {
    for (var i = 0; i < object.emotionTags.length; i++) {
      final value = object.emotionTags[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.note.length * 3;
  return bytesCount;
}

void _moodEntryRecordSerialize(
  MoodEntryRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeStringList(offsets[1], object.emotionTags);
  writer.writeLong(offsets[2], object.manualScrollMinutes);
  writer.writeString(offsets[3], object.note);
  writer.writeLong(offsets[4], object.score);
}

MoodEntryRecord _moodEntryRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoodEntryRecord();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.emotionTags = reader.readStringList(offsets[1]) ?? [];
  object.id = id;
  object.manualScrollMinutes = reader.readLongOrNull(offsets[2]);
  object.note = reader.readString(offsets[3]);
  object.score = reader.readLong(offsets[4]);
  return object;
}

P _moodEntryRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _moodEntryRecordGetId(MoodEntryRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moodEntryRecordGetLinks(MoodEntryRecord object) {
  return [];
}

void _moodEntryRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  MoodEntryRecord object,
) {
  object.id = id;
}

extension MoodEntryRecordQueryWhereSort
    on QueryBuilder<MoodEntryRecord, MoodEntryRecord, QWhere> {
  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MoodEntryRecordQueryWhere
    on QueryBuilder<MoodEntryRecord, MoodEntryRecord, QWhereClause> {
  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MoodEntryRecordQueryFilter
    on QueryBuilder<MoodEntryRecord, MoodEntryRecord, QFilterCondition> {
  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'emotionTags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'emotionTags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'emotionTags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'emotionTags',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'emotionTags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'emotionTags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'emotionTags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'emotionTags',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'emotionTags', value: ''),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'emotionTags', value: ''),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'emotionTags', length, true, length, true);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'emotionTags', 0, true, 0, true);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'emotionTags', 0, false, 999999, true);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'emotionTags', 0, true, length, include);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'emotionTags', length, include, 999999, true);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  emotionTagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'emotionTags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  manualScrollMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'manualScrollMinutes'),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  manualScrollMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'manualScrollMinutes'),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  manualScrollMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'manualScrollMinutes', value: value),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  manualScrollMinutesGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'manualScrollMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  manualScrollMinutesLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'manualScrollMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  manualScrollMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'manualScrollMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  noteEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  noteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  noteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  noteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'note',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  noteStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  noteEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'note',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  scoreEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'score', value: value),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  scoreGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'score',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  scoreLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'score',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterFilterCondition>
  scoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'score',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MoodEntryRecordQueryObject
    on QueryBuilder<MoodEntryRecord, MoodEntryRecord, QFilterCondition> {}

extension MoodEntryRecordQueryLinks
    on QueryBuilder<MoodEntryRecord, MoodEntryRecord, QFilterCondition> {}

extension MoodEntryRecordQuerySortBy
    on QueryBuilder<MoodEntryRecord, MoodEntryRecord, QSortBy> {
  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy>
  sortByManualScrollMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualScrollMinutes', Sort.asc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy>
  sortByManualScrollMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualScrollMinutes', Sort.desc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy>
  sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy> sortByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy>
  sortByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }
}

extension MoodEntryRecordQuerySortThenBy
    on QueryBuilder<MoodEntryRecord, MoodEntryRecord, QSortThenBy> {
  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy>
  thenByManualScrollMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualScrollMinutes', Sort.asc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy>
  thenByManualScrollMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualScrollMinutes', Sort.desc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy>
  thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy> thenByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QAfterSortBy>
  thenByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }
}

extension MoodEntryRecordQueryWhereDistinct
    on QueryBuilder<MoodEntryRecord, MoodEntryRecord, QDistinct> {
  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QDistinct>
  distinctByEmotionTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emotionTags');
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QDistinct>
  distinctByManualScrollMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'manualScrollMinutes');
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QDistinct> distinctByNote({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoodEntryRecord, MoodEntryRecord, QDistinct> distinctByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score');
    });
  }
}

extension MoodEntryRecordQueryProperty
    on QueryBuilder<MoodEntryRecord, MoodEntryRecord, QQueryProperty> {
  QueryBuilder<MoodEntryRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MoodEntryRecord, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MoodEntryRecord, List<String>, QQueryOperations>
  emotionTagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emotionTags');
    });
  }

  QueryBuilder<MoodEntryRecord, int?, QQueryOperations>
  manualScrollMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'manualScrollMinutes');
    });
  }

  QueryBuilder<MoodEntryRecord, String, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<MoodEntryRecord, int, QQueryOperations> scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetJournalEntryRecordCollection on Isar {
  IsarCollection<JournalEntryRecord> get journalEntryRecords =>
      this.collection();
}

const JournalEntryRecordSchema = CollectionSchema(
  name: r'JournalEntryRecord',
  id: 8487060306741730304,
  properties: {
    r'body': PropertySchema(id: 0, name: r'body', type: IsarType.string),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'locked': PropertySchema(id: 2, name: r'locked', type: IsarType.bool),
    r'moodEntryId': PropertySchema(
      id: 3,
      name: r'moodEntryId',
      type: IsarType.long,
    ),
    r'promptCategory': PropertySchema(
      id: 4,
      name: r'promptCategory',
      type: IsarType.string,
    ),
    r'promptId': PropertySchema(
      id: 5,
      name: r'promptId',
      type: IsarType.string,
    ),
    r'title': PropertySchema(id: 6, name: r'title', type: IsarType.string),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },
  estimateSize: _journalEntryRecordEstimateSize,
  serialize: _journalEntryRecordSerialize,
  deserialize: _journalEntryRecordDeserialize,
  deserializeProp: _journalEntryRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _journalEntryRecordGetId,
  getLinks: _journalEntryRecordGetLinks,
  attach: _journalEntryRecordAttach,
  version: '3.1.0+1',
);

int _journalEntryRecordEstimateSize(
  JournalEntryRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.body.length * 3;
  {
    final value = object.promptCategory;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.promptId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _journalEntryRecordSerialize(
  JournalEntryRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.body);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeBool(offsets[2], object.locked);
  writer.writeLong(offsets[3], object.moodEntryId);
  writer.writeString(offsets[4], object.promptCategory);
  writer.writeString(offsets[5], object.promptId);
  writer.writeString(offsets[6], object.title);
  writer.writeDateTime(offsets[7], object.updatedAt);
}

JournalEntryRecord _journalEntryRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = JournalEntryRecord();
  object.body = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.locked = reader.readBool(offsets[2]);
  object.moodEntryId = reader.readLongOrNull(offsets[3]);
  object.promptCategory = reader.readStringOrNull(offsets[4]);
  object.promptId = reader.readStringOrNull(offsets[5]);
  object.title = reader.readString(offsets[6]);
  object.updatedAt = reader.readDateTime(offsets[7]);
  return object;
}

P _journalEntryRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _journalEntryRecordGetId(JournalEntryRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _journalEntryRecordGetLinks(
  JournalEntryRecord object,
) {
  return [];
}

void _journalEntryRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  JournalEntryRecord object,
) {
  object.id = id;
}

extension JournalEntryRecordQueryWhereSort
    on QueryBuilder<JournalEntryRecord, JournalEntryRecord, QWhere> {
  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension JournalEntryRecordQueryWhere
    on QueryBuilder<JournalEntryRecord, JournalEntryRecord, QWhereClause> {
  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension JournalEntryRecordQueryFilter
    on QueryBuilder<JournalEntryRecord, JournalEntryRecord, QFilterCondition> {
  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  bodyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'body',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  bodyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'body',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  bodyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'body',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  bodyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'body',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  bodyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'body',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  bodyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'body',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  bodyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'body',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  bodyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'body',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  bodyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'body', value: ''),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  bodyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'body', value: ''),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  lockedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'locked', value: value),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  moodEntryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'moodEntryId'),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  moodEntryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'moodEntryId'),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  moodEntryIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'moodEntryId', value: value),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  moodEntryIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'moodEntryId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  moodEntryIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'moodEntryId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  moodEntryIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'moodEntryId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptCategoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'promptCategory'),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptCategoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'promptCategory'),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptCategoryEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'promptCategory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptCategoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'promptCategory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptCategoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'promptCategory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptCategoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'promptCategory',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptCategoryStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'promptCategory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptCategoryEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'promptCategory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'promptCategory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'promptCategory',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'promptCategory', value: ''),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'promptCategory', value: ''),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'promptId'),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'promptId'),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'promptId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'promptId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'promptId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'promptId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'promptId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'promptId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'promptId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'promptId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'promptId', value: ''),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  promptIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'promptId', value: ''),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  titleEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  titleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  titleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterFilterCondition>
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension JournalEntryRecordQueryObject
    on QueryBuilder<JournalEntryRecord, JournalEntryRecord, QFilterCondition> {}

extension JournalEntryRecordQueryLinks
    on QueryBuilder<JournalEntryRecord, JournalEntryRecord, QFilterCondition> {}

extension JournalEntryRecordQuerySortBy
    on QueryBuilder<JournalEntryRecord, JournalEntryRecord, QSortBy> {
  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByLockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByMoodEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moodEntryId', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByMoodEntryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moodEntryId', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByPromptCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promptCategory', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByPromptCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promptCategory', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByPromptId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promptId', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByPromptIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promptId', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension JournalEntryRecordQuerySortThenBy
    on QueryBuilder<JournalEntryRecord, JournalEntryRecord, QSortThenBy> {
  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByLockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByMoodEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moodEntryId', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByMoodEntryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moodEntryId', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByPromptCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promptCategory', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByPromptCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promptCategory', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByPromptId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promptId', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByPromptIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promptId', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension JournalEntryRecordQueryWhereDistinct
    on QueryBuilder<JournalEntryRecord, JournalEntryRecord, QDistinct> {
  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QDistinct>
  distinctByBody({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'body', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QDistinct>
  distinctByLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locked');
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QDistinct>
  distinctByMoodEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'moodEntryId');
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QDistinct>
  distinctByPromptCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'promptCategory',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QDistinct>
  distinctByPromptId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promptId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QDistinct>
  distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JournalEntryRecord, JournalEntryRecord, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension JournalEntryRecordQueryProperty
    on QueryBuilder<JournalEntryRecord, JournalEntryRecord, QQueryProperty> {
  QueryBuilder<JournalEntryRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<JournalEntryRecord, String, QQueryOperations> bodyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'body');
    });
  }

  QueryBuilder<JournalEntryRecord, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<JournalEntryRecord, bool, QQueryOperations> lockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locked');
    });
  }

  QueryBuilder<JournalEntryRecord, int?, QQueryOperations>
  moodEntryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moodEntryId');
    });
  }

  QueryBuilder<JournalEntryRecord, String?, QQueryOperations>
  promptCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promptCategory');
    });
  }

  QueryBuilder<JournalEntryRecord, String?, QQueryOperations>
  promptIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promptId');
    });
  }

  QueryBuilder<JournalEntryRecord, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<JournalEntryRecord, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHabitRecordCollection on Isar {
  IsarCollection<HabitRecord> get habitRecords => this.collection();
}

const HabitRecordSchema = CollectionSchema(
  name: r'HabitRecord',
  id: -8253752743009167360,
  properties: {
    r'active': PropertySchema(id: 0, name: r'active', type: IsarType.bool),
    r'category': PropertySchema(
      id: 1,
      name: r'category',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'frequency': PropertySchema(
      id: 3,
      name: r'frequency',
      type: IsarType.string,
    ),
    r'name': PropertySchema(id: 4, name: r'name', type: IsarType.string),
  },
  estimateSize: _habitRecordEstimateSize,
  serialize: _habitRecordSerialize,
  deserialize: _habitRecordDeserialize,
  deserializeProp: _habitRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _habitRecordGetId,
  getLinks: _habitRecordGetLinks,
  attach: _habitRecordAttach,
  version: '3.1.0+1',
);

int _habitRecordEstimateSize(
  HabitRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.frequency.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _habitRecordSerialize(
  HabitRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeString(offsets[1], object.category);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.frequency);
  writer.writeString(offsets[4], object.name);
}

HabitRecord _habitRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HabitRecord();
  object.active = reader.readBool(offsets[0]);
  object.category = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.frequency = reader.readString(offsets[3]);
  object.id = id;
  object.name = reader.readString(offsets[4]);
  return object;
}

P _habitRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _habitRecordGetId(HabitRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _habitRecordGetLinks(HabitRecord object) {
  return [];
}

void _habitRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  HabitRecord object,
) {
  object.id = id;
}

extension HabitRecordQueryWhereSort
    on QueryBuilder<HabitRecord, HabitRecord, QWhere> {
  QueryBuilder<HabitRecord, HabitRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HabitRecordQueryWhere
    on QueryBuilder<HabitRecord, HabitRecord, QWhereClause> {
  QueryBuilder<HabitRecord, HabitRecord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension HabitRecordQueryFilter
    on QueryBuilder<HabitRecord, HabitRecord, QFilterCondition> {
  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> activeEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'active', value: value),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> categoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  categoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  categoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> categoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'category',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  categoryStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  categoryEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> categoryMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'category',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'category', value: ''),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'category', value: ''),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  frequencyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'frequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  frequencyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'frequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  frequencyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'frequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  frequencyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'frequency',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  frequencyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'frequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  frequencyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'frequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  frequencyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'frequency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  frequencyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'frequency',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  frequencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'frequency', value: ''),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  frequencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'frequency', value: ''),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }
}

extension HabitRecordQueryObject
    on QueryBuilder<HabitRecord, HabitRecord, QFilterCondition> {}

extension HabitRecordQueryLinks
    on QueryBuilder<HabitRecord, HabitRecord, QFilterCondition> {}

extension HabitRecordQuerySortBy
    on QueryBuilder<HabitRecord, HabitRecord, QSortBy> {
  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> sortByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> sortByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> sortByFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.asc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> sortByFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.desc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension HabitRecordQuerySortThenBy
    on QueryBuilder<HabitRecord, HabitRecord, QSortThenBy> {
  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> thenByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> thenByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> thenByFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.asc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> thenByFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.desc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension HabitRecordQueryWhereDistinct
    on QueryBuilder<HabitRecord, HabitRecord, QDistinct> {
  QueryBuilder<HabitRecord, HabitRecord, QDistinct> distinctByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'active');
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QDistinct> distinctByCategory({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QDistinct> distinctByFrequency({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frequency', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HabitRecord, HabitRecord, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension HabitRecordQueryProperty
    on QueryBuilder<HabitRecord, HabitRecord, QQueryProperty> {
  QueryBuilder<HabitRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HabitRecord, bool, QQueryOperations> activeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'active');
    });
  }

  QueryBuilder<HabitRecord, String, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<HabitRecord, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<HabitRecord, String, QQueryOperations> frequencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frequency');
    });
  }

  QueryBuilder<HabitRecord, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHabitCompletionRecordCollection on Isar {
  IsarCollection<HabitCompletionRecord> get habitCompletionRecords =>
      this.collection();
}

const HabitCompletionRecordSchema = CollectionSchema(
  name: r'HabitCompletionRecord',
  id: -8299100987193896960,
  properties: {
    r'completedAt': PropertySchema(
      id: 0,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'day': PropertySchema(id: 1, name: r'day', type: IsarType.dateTime),
    r'habitId': PropertySchema(id: 2, name: r'habitId', type: IsarType.long),
  },
  estimateSize: _habitCompletionRecordEstimateSize,
  serialize: _habitCompletionRecordSerialize,
  deserialize: _habitCompletionRecordDeserialize,
  deserializeProp: _habitCompletionRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _habitCompletionRecordGetId,
  getLinks: _habitCompletionRecordGetLinks,
  attach: _habitCompletionRecordAttach,
  version: '3.1.0+1',
);

int _habitCompletionRecordEstimateSize(
  HabitCompletionRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _habitCompletionRecordSerialize(
  HabitCompletionRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.completedAt);
  writer.writeDateTime(offsets[1], object.day);
  writer.writeLong(offsets[2], object.habitId);
}

HabitCompletionRecord _habitCompletionRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HabitCompletionRecord();
  object.completedAt = reader.readDateTime(offsets[0]);
  object.day = reader.readDateTime(offsets[1]);
  object.habitId = reader.readLong(offsets[2]);
  object.id = id;
  return object;
}

P _habitCompletionRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _habitCompletionRecordGetId(HabitCompletionRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _habitCompletionRecordGetLinks(
  HabitCompletionRecord object,
) {
  return [];
}

void _habitCompletionRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  HabitCompletionRecord object,
) {
  object.id = id;
}

extension HabitCompletionRecordQueryWhereSort
    on QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QWhere> {
  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HabitCompletionRecordQueryWhere
    on
        QueryBuilder<
          HabitCompletionRecord,
          HabitCompletionRecord,
          QWhereClause
        > {
  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension HabitCompletionRecordQueryFilter
    on
        QueryBuilder<
          HabitCompletionRecord,
          HabitCompletionRecord,
          QFilterCondition
        > {
  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  completedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completedAt', value: value),
      );
    });
  }

  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  completedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'completedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  completedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'completedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  completedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'completedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  dayEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'day', value: value),
      );
    });
  }

  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  dayGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'day',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  dayLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'day',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  dayBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'day',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  habitIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'habitId', value: value),
      );
    });
  }

  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  habitIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'habitId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  habitIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'habitId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  habitIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'habitId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    HabitCompletionRecord,
    HabitCompletionRecord,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension HabitCompletionRecordQueryObject
    on
        QueryBuilder<
          HabitCompletionRecord,
          HabitCompletionRecord,
          QFilterCondition
        > {}

extension HabitCompletionRecordQueryLinks
    on
        QueryBuilder<
          HabitCompletionRecord,
          HabitCompletionRecord,
          QFilterCondition
        > {}

extension HabitCompletionRecordQuerySortBy
    on QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QSortBy> {
  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterSortBy>
  sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterSortBy>
  sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterSortBy>
  sortByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.asc);
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterSortBy>
  sortByDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.desc);
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterSortBy>
  sortByHabitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.asc);
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterSortBy>
  sortByHabitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.desc);
    });
  }
}

extension HabitCompletionRecordQuerySortThenBy
    on QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QSortThenBy> {
  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterSortBy>
  thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterSortBy>
  thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterSortBy>
  thenByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.asc);
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterSortBy>
  thenByDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.desc);
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterSortBy>
  thenByHabitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.asc);
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterSortBy>
  thenByHabitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.desc);
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension HabitCompletionRecordQueryWhereDistinct
    on QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QDistinct> {
  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QDistinct>
  distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QDistinct>
  distinctByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'day');
    });
  }

  QueryBuilder<HabitCompletionRecord, HabitCompletionRecord, QDistinct>
  distinctByHabitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'habitId');
    });
  }
}

extension HabitCompletionRecordQueryProperty
    on
        QueryBuilder<
          HabitCompletionRecord,
          HabitCompletionRecord,
          QQueryProperty
        > {
  QueryBuilder<HabitCompletionRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HabitCompletionRecord, DateTime, QQueryOperations>
  completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<HabitCompletionRecord, DateTime, QQueryOperations>
  dayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'day');
    });
  }

  QueryBuilder<HabitCompletionRecord, int, QQueryOperations> habitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'habitId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDetoxSessionRecordCollection on Isar {
  IsarCollection<DetoxSessionRecord> get detoxSessionRecords =>
      this.collection();
}

const DetoxSessionRecordSchema = CollectionSchema(
  name: r'DetoxSessionRecord',
  id: -6001073010105153536,
  properties: {
    r'endedAt': PropertySchema(
      id: 0,
      name: r'endedAt',
      type: IsarType.dateTime,
    ),
    r'plannedMinutes': PropertySchema(
      id: 1,
      name: r'plannedMinutes',
      type: IsarType.long,
    ),
    r'reflectionNote': PropertySchema(
      id: 2,
      name: r'reflectionNote',
      type: IsarType.string,
    ),
    r'replacementActivity': PropertySchema(
      id: 3,
      name: r'replacementActivity',
      type: IsarType.string,
    ),
    r'startedAt': PropertySchema(
      id: 4,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(id: 5, name: r'status', type: IsarType.string),
    r'type': PropertySchema(id: 6, name: r'type', type: IsarType.string),
  },
  estimateSize: _detoxSessionRecordEstimateSize,
  serialize: _detoxSessionRecordSerialize,
  deserialize: _detoxSessionRecordDeserialize,
  deserializeProp: _detoxSessionRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _detoxSessionRecordGetId,
  getLinks: _detoxSessionRecordGetLinks,
  attach: _detoxSessionRecordAttach,
  version: '3.1.0+1',
);

int _detoxSessionRecordEstimateSize(
  DetoxSessionRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.reflectionNote.length * 3;
  bytesCount += 3 + object.replacementActivity.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _detoxSessionRecordSerialize(
  DetoxSessionRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.endedAt);
  writer.writeLong(offsets[1], object.plannedMinutes);
  writer.writeString(offsets[2], object.reflectionNote);
  writer.writeString(offsets[3], object.replacementActivity);
  writer.writeDateTime(offsets[4], object.startedAt);
  writer.writeString(offsets[5], object.status);
  writer.writeString(offsets[6], object.type);
}

DetoxSessionRecord _detoxSessionRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DetoxSessionRecord();
  object.endedAt = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  object.plannedMinutes = reader.readLong(offsets[1]);
  object.reflectionNote = reader.readString(offsets[2]);
  object.replacementActivity = reader.readString(offsets[3]);
  object.startedAt = reader.readDateTime(offsets[4]);
  object.status = reader.readString(offsets[5]);
  object.type = reader.readString(offsets[6]);
  return object;
}

P _detoxSessionRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _detoxSessionRecordGetId(DetoxSessionRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _detoxSessionRecordGetLinks(
  DetoxSessionRecord object,
) {
  return [];
}

void _detoxSessionRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  DetoxSessionRecord object,
) {
  object.id = id;
}

extension DetoxSessionRecordQueryWhereSort
    on QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QWhere> {
  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DetoxSessionRecordQueryWhere
    on QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QWhereClause> {
  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension DetoxSessionRecordQueryFilter
    on QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QFilterCondition> {
  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  endedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'endedAt'),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  endedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'endedAt'),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  endedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'endedAt', value: value),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  endedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'endedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  endedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'endedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  endedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'endedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  plannedMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'plannedMinutes', value: value),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  plannedMinutesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'plannedMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  plannedMinutesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'plannedMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  plannedMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'plannedMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  reflectionNoteEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'reflectionNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  reflectionNoteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reflectionNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  reflectionNoteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reflectionNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  reflectionNoteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reflectionNote',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  reflectionNoteStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'reflectionNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  reflectionNoteEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'reflectionNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  reflectionNoteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'reflectionNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  reflectionNoteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'reflectionNote',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  reflectionNoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'reflectionNote', value: ''),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  reflectionNoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'reflectionNote', value: ''),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  replacementActivityEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'replacementActivity',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  replacementActivityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'replacementActivity',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  replacementActivityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'replacementActivity',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  replacementActivityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'replacementActivity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  replacementActivityStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'replacementActivity',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  replacementActivityEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'replacementActivity',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  replacementActivityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'replacementActivity',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  replacementActivityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'replacementActivity',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  replacementActivityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'replacementActivity', value: ''),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  replacementActivityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'replacementActivity',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  startedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startedAt', value: value),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  startedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  startedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  startedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  statusEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  statusStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  statusEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'status',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  typeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'type',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  typeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  typeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'type',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterFilterCondition>
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }
}

extension DetoxSessionRecordQueryObject
    on QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QFilterCondition> {}

extension DetoxSessionRecordQueryLinks
    on QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QFilterCondition> {}

extension DetoxSessionRecordQuerySortBy
    on QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QSortBy> {
  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  sortByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.asc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  sortByEndedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.desc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  sortByPlannedMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedMinutes', Sort.asc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  sortByPlannedMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedMinutes', Sort.desc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  sortByReflectionNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reflectionNote', Sort.asc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  sortByReflectionNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reflectionNote', Sort.desc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  sortByReplacementActivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replacementActivity', Sort.asc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  sortByReplacementActivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replacementActivity', Sort.desc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension DetoxSessionRecordQuerySortThenBy
    on QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QSortThenBy> {
  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.asc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenByEndedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.desc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenByPlannedMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedMinutes', Sort.asc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenByPlannedMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedMinutes', Sort.desc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenByReflectionNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reflectionNote', Sort.asc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenByReflectionNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reflectionNote', Sort.desc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenByReplacementActivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replacementActivity', Sort.asc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenByReplacementActivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replacementActivity', Sort.desc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QAfterSortBy>
  thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension DetoxSessionRecordQueryWhereDistinct
    on QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QDistinct> {
  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QDistinct>
  distinctByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endedAt');
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QDistinct>
  distinctByPlannedMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedMinutes');
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QDistinct>
  distinctByReflectionNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'reflectionNote',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QDistinct>
  distinctByReplacementActivity({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'replacementActivity',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QDistinct>
  distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QDistinct>
  distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QDistinct>
  distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension DetoxSessionRecordQueryProperty
    on QueryBuilder<DetoxSessionRecord, DetoxSessionRecord, QQueryProperty> {
  QueryBuilder<DetoxSessionRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DetoxSessionRecord, DateTime?, QQueryOperations>
  endedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endedAt');
    });
  }

  QueryBuilder<DetoxSessionRecord, int, QQueryOperations>
  plannedMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedMinutes');
    });
  }

  QueryBuilder<DetoxSessionRecord, String, QQueryOperations>
  reflectionNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reflectionNote');
    });
  }

  QueryBuilder<DetoxSessionRecord, String, QQueryOperations>
  replacementActivityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'replacementActivity');
    });
  }

  QueryBuilder<DetoxSessionRecord, DateTime, QQueryOperations>
  startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<DetoxSessionRecord, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<DetoxSessionRecord, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDetoxChallengeRecordCollection on Isar {
  IsarCollection<DetoxChallengeRecord> get detoxChallengeRecords =>
      this.collection();
}

const DetoxChallengeRecordSchema = CollectionSchema(
  name: r'DetoxChallengeRecord',
  id: 2527373554133336064,
  properties: {
    r'active': PropertySchema(id: 0, name: r'active', type: IsarType.bool),
    r'completedDays': PropertySchema(
      id: 1,
      name: r'completedDays',
      type: IsarType.long,
    ),
    r'name': PropertySchema(id: 2, name: r'name', type: IsarType.string),
    r'startedAt': PropertySchema(
      id: 3,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'templateId': PropertySchema(
      id: 4,
      name: r'templateId',
      type: IsarType.string,
    ),
    r'totalDays': PropertySchema(
      id: 5,
      name: r'totalDays',
      type: IsarType.long,
    ),
  },
  estimateSize: _detoxChallengeRecordEstimateSize,
  serialize: _detoxChallengeRecordSerialize,
  deserialize: _detoxChallengeRecordDeserialize,
  deserializeProp: _detoxChallengeRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _detoxChallengeRecordGetId,
  getLinks: _detoxChallengeRecordGetLinks,
  attach: _detoxChallengeRecordAttach,
  version: '3.1.0+1',
);

int _detoxChallengeRecordEstimateSize(
  DetoxChallengeRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.templateId.length * 3;
  return bytesCount;
}

void _detoxChallengeRecordSerialize(
  DetoxChallengeRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeLong(offsets[1], object.completedDays);
  writer.writeString(offsets[2], object.name);
  writer.writeDateTime(offsets[3], object.startedAt);
  writer.writeString(offsets[4], object.templateId);
  writer.writeLong(offsets[5], object.totalDays);
}

DetoxChallengeRecord _detoxChallengeRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DetoxChallengeRecord();
  object.active = reader.readBool(offsets[0]);
  object.completedDays = reader.readLong(offsets[1]);
  object.id = id;
  object.name = reader.readString(offsets[2]);
  object.startedAt = reader.readDateTime(offsets[3]);
  object.templateId = reader.readString(offsets[4]);
  object.totalDays = reader.readLong(offsets[5]);
  return object;
}

P _detoxChallengeRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _detoxChallengeRecordGetId(DetoxChallengeRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _detoxChallengeRecordGetLinks(
  DetoxChallengeRecord object,
) {
  return [];
}

void _detoxChallengeRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  DetoxChallengeRecord object,
) {
  object.id = id;
}

extension DetoxChallengeRecordQueryWhereSort
    on QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QWhere> {
  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DetoxChallengeRecordQueryWhere
    on QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QWhereClause> {
  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension DetoxChallengeRecordQueryFilter
    on
        QueryBuilder<
          DetoxChallengeRecord,
          DetoxChallengeRecord,
          QFilterCondition
        > {
  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  activeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'active', value: value),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  completedDaysEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completedDays', value: value),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  completedDaysGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'completedDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  completedDaysLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'completedDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  completedDaysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'completedDays',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  nameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  startedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startedAt', value: value),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  startedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  startedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  startedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  templateIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'templateId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  templateIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'templateId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  templateIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'templateId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  templateIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'templateId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  templateIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'templateId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  templateIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'templateId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  templateIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'templateId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  templateIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'templateId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  templateIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'templateId', value: ''),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  templateIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'templateId', value: ''),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  totalDaysEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalDays', value: value),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  totalDaysGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  totalDaysLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    DetoxChallengeRecord,
    DetoxChallengeRecord,
    QAfterFilterCondition
  >
  totalDaysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalDays',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension DetoxChallengeRecordQueryObject
    on
        QueryBuilder<
          DetoxChallengeRecord,
          DetoxChallengeRecord,
          QFilterCondition
        > {}

extension DetoxChallengeRecordQueryLinks
    on
        QueryBuilder<
          DetoxChallengeRecord,
          DetoxChallengeRecord,
          QFilterCondition
        > {}

extension DetoxChallengeRecordQuerySortBy
    on QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QSortBy> {
  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  sortByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  sortByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  sortByCompletedDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedDays', Sort.asc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  sortByCompletedDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedDays', Sort.desc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  sortByTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.asc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  sortByTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.desc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  sortByTotalDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDays', Sort.asc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  sortByTotalDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDays', Sort.desc);
    });
  }
}

extension DetoxChallengeRecordQuerySortThenBy
    on QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QSortThenBy> {
  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  thenByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  thenByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  thenByCompletedDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedDays', Sort.asc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  thenByCompletedDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedDays', Sort.desc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  thenByTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.asc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  thenByTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.desc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  thenByTotalDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDays', Sort.asc);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QAfterSortBy>
  thenByTotalDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDays', Sort.desc);
    });
  }
}

extension DetoxChallengeRecordQueryWhereDistinct
    on QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QDistinct> {
  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QDistinct>
  distinctByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'active');
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QDistinct>
  distinctByCompletedDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedDays');
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QDistinct>
  distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QDistinct>
  distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QDistinct>
  distinctByTemplateId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'templateId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DetoxChallengeRecord, DetoxChallengeRecord, QDistinct>
  distinctByTotalDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDays');
    });
  }
}

extension DetoxChallengeRecordQueryProperty
    on
        QueryBuilder<
          DetoxChallengeRecord,
          DetoxChallengeRecord,
          QQueryProperty
        > {
  QueryBuilder<DetoxChallengeRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DetoxChallengeRecord, bool, QQueryOperations> activeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'active');
    });
  }

  QueryBuilder<DetoxChallengeRecord, int, QQueryOperations>
  completedDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedDays');
    });
  }

  QueryBuilder<DetoxChallengeRecord, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<DetoxChallengeRecord, DateTime, QQueryOperations>
  startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<DetoxChallengeRecord, String, QQueryOperations>
  templateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'templateId');
    });
  }

  QueryBuilder<DetoxChallengeRecord, int, QQueryOperations>
  totalDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDays');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPointsLedgerRecordCollection on Isar {
  IsarCollection<PointsLedgerRecord> get pointsLedgerRecords =>
      this.collection();
}

const PointsLedgerRecordSchema = CollectionSchema(
  name: r'PointsLedgerRecord',
  id: 2141088611863774976,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'points': PropertySchema(id: 1, name: r'points', type: IsarType.long),
    r'reason': PropertySchema(id: 2, name: r'reason', type: IsarType.string),
  },
  estimateSize: _pointsLedgerRecordEstimateSize,
  serialize: _pointsLedgerRecordSerialize,
  deserialize: _pointsLedgerRecordDeserialize,
  deserializeProp: _pointsLedgerRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pointsLedgerRecordGetId,
  getLinks: _pointsLedgerRecordGetLinks,
  attach: _pointsLedgerRecordAttach,
  version: '3.1.0+1',
);

int _pointsLedgerRecordEstimateSize(
  PointsLedgerRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.reason.length * 3;
  return bytesCount;
}

void _pointsLedgerRecordSerialize(
  PointsLedgerRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeLong(offsets[1], object.points);
  writer.writeString(offsets[2], object.reason);
}

PointsLedgerRecord _pointsLedgerRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PointsLedgerRecord();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.points = reader.readLong(offsets[1]);
  object.reason = reader.readString(offsets[2]);
  return object;
}

P _pointsLedgerRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pointsLedgerRecordGetId(PointsLedgerRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pointsLedgerRecordGetLinks(
  PointsLedgerRecord object,
) {
  return [];
}

void _pointsLedgerRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  PointsLedgerRecord object,
) {
  object.id = id;
}

extension PointsLedgerRecordQueryWhereSort
    on QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QWhere> {
  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PointsLedgerRecordQueryWhere
    on QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QWhereClause> {
  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension PointsLedgerRecordQueryFilter
    on QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QFilterCondition> {
  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  pointsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'points', value: value),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  pointsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'points',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  pointsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'points',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  pointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'points',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  reasonEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  reasonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  reasonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  reasonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reason',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  reasonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  reasonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  reasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  reasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'reason',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  reasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'reason', value: ''),
      );
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterFilterCondition>
  reasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'reason', value: ''),
      );
    });
  }
}

extension PointsLedgerRecordQueryObject
    on QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QFilterCondition> {}

extension PointsLedgerRecordQueryLinks
    on QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QFilterCondition> {}

extension PointsLedgerRecordQuerySortBy
    on QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QSortBy> {
  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterSortBy>
  sortByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.asc);
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterSortBy>
  sortByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.desc);
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterSortBy>
  sortByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterSortBy>
  sortByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }
}

extension PointsLedgerRecordQuerySortThenBy
    on QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QSortThenBy> {
  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterSortBy>
  thenByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.asc);
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterSortBy>
  thenByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.desc);
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterSortBy>
  thenByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QAfterSortBy>
  thenByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }
}

extension PointsLedgerRecordQueryWhereDistinct
    on QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QDistinct> {
  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QDistinct>
  distinctByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'points');
    });
  }

  QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QDistinct>
  distinctByReason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reason', caseSensitive: caseSensitive);
    });
  }
}

extension PointsLedgerRecordQueryProperty
    on QueryBuilder<PointsLedgerRecord, PointsLedgerRecord, QQueryProperty> {
  QueryBuilder<PointsLedgerRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PointsLedgerRecord, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<PointsLedgerRecord, int, QQueryOperations> pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'points');
    });
  }

  QueryBuilder<PointsLedgerRecord, String, QQueryOperations> reasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reason');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBadgeUnlockRecordCollection on Isar {
  IsarCollection<BadgeUnlockRecord> get badgeUnlockRecords => this.collection();
}

const BadgeUnlockRecordSchema = CollectionSchema(
  name: r'BadgeUnlockRecord',
  id: -4660795246300731392,
  properties: {
    r'badgeId': PropertySchema(id: 0, name: r'badgeId', type: IsarType.string),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'title': PropertySchema(id: 2, name: r'title', type: IsarType.string),
    r'unlockedAt': PropertySchema(
      id: 3,
      name: r'unlockedAt',
      type: IsarType.dateTime,
    ),
  },
  estimateSize: _badgeUnlockRecordEstimateSize,
  serialize: _badgeUnlockRecordSerialize,
  deserialize: _badgeUnlockRecordDeserialize,
  deserializeProp: _badgeUnlockRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _badgeUnlockRecordGetId,
  getLinks: _badgeUnlockRecordGetLinks,
  attach: _badgeUnlockRecordAttach,
  version: '3.1.0+1',
);

int _badgeUnlockRecordEstimateSize(
  BadgeUnlockRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.badgeId.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _badgeUnlockRecordSerialize(
  BadgeUnlockRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.badgeId);
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.title);
  writer.writeDateTime(offsets[3], object.unlockedAt);
}

BadgeUnlockRecord _badgeUnlockRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BadgeUnlockRecord();
  object.badgeId = reader.readString(offsets[0]);
  object.description = reader.readString(offsets[1]);
  object.id = id;
  object.title = reader.readString(offsets[2]);
  object.unlockedAt = reader.readDateTime(offsets[3]);
  return object;
}

P _badgeUnlockRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _badgeUnlockRecordGetId(BadgeUnlockRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _badgeUnlockRecordGetLinks(
  BadgeUnlockRecord object,
) {
  return [];
}

void _badgeUnlockRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  BadgeUnlockRecord object,
) {
  object.id = id;
}

extension BadgeUnlockRecordQueryWhereSort
    on QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QWhere> {
  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BadgeUnlockRecordQueryWhere
    on QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QWhereClause> {
  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension BadgeUnlockRecordQueryFilter
    on QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QFilterCondition> {
  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  badgeIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'badgeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  badgeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'badgeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  badgeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'badgeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  badgeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'badgeId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  badgeIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'badgeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  badgeIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'badgeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  badgeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'badgeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  badgeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'badgeId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  badgeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'badgeId', value: ''),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  badgeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'badgeId', value: ''),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  descriptionEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  titleEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  titleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  titleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  unlockedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'unlockedAt', value: value),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  unlockedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'unlockedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  unlockedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'unlockedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterFilterCondition>
  unlockedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'unlockedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension BadgeUnlockRecordQueryObject
    on QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QFilterCondition> {}

extension BadgeUnlockRecordQueryLinks
    on QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QFilterCondition> {}

extension BadgeUnlockRecordQuerySortBy
    on QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QSortBy> {
  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  sortByBadgeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'badgeId', Sort.asc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  sortByBadgeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'badgeId', Sort.desc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  sortByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.asc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  sortByUnlockedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.desc);
    });
  }
}

extension BadgeUnlockRecordQuerySortThenBy
    on QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QSortThenBy> {
  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  thenByBadgeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'badgeId', Sort.asc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  thenByBadgeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'badgeId', Sort.desc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  thenByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.asc);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QAfterSortBy>
  thenByUnlockedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.desc);
    });
  }
}

extension BadgeUnlockRecordQueryWhereDistinct
    on QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QDistinct> {
  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QDistinct>
  distinctByBadgeId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'badgeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QDistinct>
  distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QDistinct>
  distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QDistinct>
  distinctByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedAt');
    });
  }
}

extension BadgeUnlockRecordQueryProperty
    on QueryBuilder<BadgeUnlockRecord, BadgeUnlockRecord, QQueryProperty> {
  QueryBuilder<BadgeUnlockRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BadgeUnlockRecord, String, QQueryOperations> badgeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'badgeId');
    });
  }

  QueryBuilder<BadgeUnlockRecord, String, QQueryOperations>
  descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<BadgeUnlockRecord, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<BadgeUnlockRecord, DateTime, QQueryOperations>
  unlockedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAffirmationFavoriteRecordCollection on Isar {
  IsarCollection<AffirmationFavoriteRecord> get affirmationFavoriteRecords =>
      this.collection();
}

const AffirmationFavoriteRecordSchema = CollectionSchema(
  name: r'AffirmationFavoriteRecord',
  id: -3097453040667552768,
  properties: {
    r'affirmationId': PropertySchema(
      id: 0,
      name: r'affirmationId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
  },
  estimateSize: _affirmationFavoriteRecordEstimateSize,
  serialize: _affirmationFavoriteRecordSerialize,
  deserialize: _affirmationFavoriteRecordDeserialize,
  deserializeProp: _affirmationFavoriteRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _affirmationFavoriteRecordGetId,
  getLinks: _affirmationFavoriteRecordGetLinks,
  attach: _affirmationFavoriteRecordAttach,
  version: '3.1.0+1',
);

int _affirmationFavoriteRecordEstimateSize(
  AffirmationFavoriteRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.affirmationId.length * 3;
  return bytesCount;
}

void _affirmationFavoriteRecordSerialize(
  AffirmationFavoriteRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.affirmationId);
  writer.writeDateTime(offsets[1], object.createdAt);
}

AffirmationFavoriteRecord _affirmationFavoriteRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AffirmationFavoriteRecord();
  object.affirmationId = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.id = id;
  return object;
}

P _affirmationFavoriteRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _affirmationFavoriteRecordGetId(AffirmationFavoriteRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _affirmationFavoriteRecordGetLinks(
  AffirmationFavoriteRecord object,
) {
  return [];
}

void _affirmationFavoriteRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  AffirmationFavoriteRecord object,
) {
  object.id = id;
}

extension AffirmationFavoriteRecordQueryWhereSort
    on
        QueryBuilder<
          AffirmationFavoriteRecord,
          AffirmationFavoriteRecord,
          QWhere
        > {
  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterWhere
  >
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AffirmationFavoriteRecordQueryWhere
    on
        QueryBuilder<
          AffirmationFavoriteRecord,
          AffirmationFavoriteRecord,
          QWhereClause
        > {
  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterWhereClause
  >
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterWhereClause
  >
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterWhereClause
  >
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterWhereClause
  >
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension AffirmationFavoriteRecordQueryFilter
    on
        QueryBuilder<
          AffirmationFavoriteRecord,
          AffirmationFavoriteRecord,
          QFilterCondition
        > {
  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  affirmationIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'affirmationId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  affirmationIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'affirmationId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  affirmationIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'affirmationId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  affirmationIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'affirmationId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  affirmationIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'affirmationId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  affirmationIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'affirmationId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  affirmationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'affirmationId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  affirmationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'affirmationId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  affirmationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'affirmationId', value: ''),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  affirmationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'affirmationId', value: ''),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension AffirmationFavoriteRecordQueryObject
    on
        QueryBuilder<
          AffirmationFavoriteRecord,
          AffirmationFavoriteRecord,
          QFilterCondition
        > {}

extension AffirmationFavoriteRecordQueryLinks
    on
        QueryBuilder<
          AffirmationFavoriteRecord,
          AffirmationFavoriteRecord,
          QFilterCondition
        > {}

extension AffirmationFavoriteRecordQuerySortBy
    on
        QueryBuilder<
          AffirmationFavoriteRecord,
          AffirmationFavoriteRecord,
          QSortBy
        > {
  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterSortBy
  >
  sortByAffirmationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'affirmationId', Sort.asc);
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterSortBy
  >
  sortByAffirmationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'affirmationId', Sort.desc);
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterSortBy
  >
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterSortBy
  >
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }
}

extension AffirmationFavoriteRecordQuerySortThenBy
    on
        QueryBuilder<
          AffirmationFavoriteRecord,
          AffirmationFavoriteRecord,
          QSortThenBy
        > {
  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterSortBy
  >
  thenByAffirmationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'affirmationId', Sort.asc);
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterSortBy
  >
  thenByAffirmationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'affirmationId', Sort.desc);
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterSortBy
  >
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterSortBy
  >
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterSortBy
  >
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<
    AffirmationFavoriteRecord,
    AffirmationFavoriteRecord,
    QAfterSortBy
  >
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension AffirmationFavoriteRecordQueryWhereDistinct
    on
        QueryBuilder<
          AffirmationFavoriteRecord,
          AffirmationFavoriteRecord,
          QDistinct
        > {
  QueryBuilder<AffirmationFavoriteRecord, AffirmationFavoriteRecord, QDistinct>
  distinctByAffirmationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'affirmationId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<AffirmationFavoriteRecord, AffirmationFavoriteRecord, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }
}

extension AffirmationFavoriteRecordQueryProperty
    on
        QueryBuilder<
          AffirmationFavoriteRecord,
          AffirmationFavoriteRecord,
          QQueryProperty
        > {
  QueryBuilder<AffirmationFavoriteRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AffirmationFavoriteRecord, String, QQueryOperations>
  affirmationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'affirmationId');
    });
  }

  QueryBuilder<AffirmationFavoriteRecord, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }
}
