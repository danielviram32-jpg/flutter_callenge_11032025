// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sorted_email.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSortedEmailCollection on Isar {
  IsarCollection<SortedEmail> get sortedEmails => this.collection();
}

const SortedEmailSchema = CollectionSchema(
  name: r'SortedEmail',
  id: -7428428360672003554,
  properties: {
    r'emailId': PropertySchema(
      id: 0,
      name: r'emailId',
      type: IsarType.string,
    ),
    r'isRead': PropertySchema(
      id: 1,
      name: r'isRead',
      type: IsarType.bool,
    ),
    r'receivedAt': PropertySchema(
      id: 2,
      name: r'receivedAt',
      type: IsarType.dateTime,
    ),
    r'sender': PropertySchema(
      id: 3,
      name: r'sender',
      type: IsarType.string,
    ),
    r'subject': PropertySchema(
      id: 4,
      name: r'subject',
      type: IsarType.string,
    ),
    r'summary': PropertySchema(
      id: 5,
      name: r'summary',
      type: IsarType.string,
    ),
    r'unsubscribeLink': PropertySchema(
      id: 6,
      name: r'unsubscribeLink',
      type: IsarType.string,
    )
  },
  estimateSize: _sortedEmailEstimateSize,
  serialize: _sortedEmailSerialize,
  deserialize: _sortedEmailDeserialize,
  deserializeProp: _sortedEmailDeserializeProp,
  idName: r'id',
  indexes: {
    r'emailId': IndexSchema(
      id: -48821443603457296,
      name: r'emailId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'emailId',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'category': LinkSchema(
      id: 2131924870236639935,
      name: r'category',
      target: r'EmailCategory',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _sortedEmailGetId,
  getLinks: _sortedEmailGetLinks,
  attach: _sortedEmailAttach,
  version: '3.1.0+1',
);

int _sortedEmailEstimateSize(
  SortedEmail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.emailId.length * 3;
  bytesCount += 3 + object.sender.length * 3;
  bytesCount += 3 + object.subject.length * 3;
  bytesCount += 3 + object.summary.length * 3;
  {
    final value = object.unsubscribeLink;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _sortedEmailSerialize(
  SortedEmail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.emailId);
  writer.writeBool(offsets[1], object.isRead);
  writer.writeDateTime(offsets[2], object.receivedAt);
  writer.writeString(offsets[3], object.sender);
  writer.writeString(offsets[4], object.subject);
  writer.writeString(offsets[5], object.summary);
  writer.writeString(offsets[6], object.unsubscribeLink);
}

SortedEmail _sortedEmailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SortedEmail(
    emailId: reader.readString(offsets[0]),
    id: id,
    isRead: reader.readBoolOrNull(offsets[1]) ?? false,
    receivedAt: reader.readDateTime(offsets[2]),
    sender: reader.readString(offsets[3]),
    subject: reader.readString(offsets[4]),
    summary: reader.readString(offsets[5]),
    unsubscribeLink: reader.readStringOrNull(offsets[6]),
  );
  return object;
}

P _sortedEmailDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sortedEmailGetId(SortedEmail object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sortedEmailGetLinks(SortedEmail object) {
  return [object.category];
}

void _sortedEmailAttach(
    IsarCollection<dynamic> col, Id id, SortedEmail object) {
  object.id = id;
  object.category
      .attach(col, col.isar.collection<EmailCategory>(), r'category', id);
}

extension SortedEmailQueryWhereSort
    on QueryBuilder<SortedEmail, SortedEmail, QWhere> {
  QueryBuilder<SortedEmail, SortedEmail, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterWhere> anyEmailId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'emailId'),
      );
    });
  }
}

extension SortedEmailQueryWhere
    on QueryBuilder<SortedEmail, SortedEmail, QWhereClause> {
  QueryBuilder<SortedEmail, SortedEmail, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<SortedEmail, SortedEmail, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterWhereClause> emailIdEqualTo(
      String emailId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'emailId',
        value: [emailId],
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterWhereClause> emailIdNotEqualTo(
      String emailId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'emailId',
              lower: [],
              upper: [emailId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'emailId',
              lower: [emailId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'emailId',
              lower: [emailId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'emailId',
              lower: [],
              upper: [emailId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterWhereClause> emailIdGreaterThan(
    String emailId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'emailId',
        lower: [emailId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterWhereClause> emailIdLessThan(
    String emailId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'emailId',
        lower: [],
        upper: [emailId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterWhereClause> emailIdBetween(
    String lowerEmailId,
    String upperEmailId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'emailId',
        lower: [lowerEmailId],
        includeLower: includeLower,
        upper: [upperEmailId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterWhereClause> emailIdStartsWith(
      String EmailIdPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'emailId',
        lower: [EmailIdPrefix],
        upper: ['$EmailIdPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterWhereClause> emailIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'emailId',
        value: [''],
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterWhereClause>
      emailIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'emailId',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'emailId',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'emailId',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'emailId',
              upper: [''],
            ));
      }
    });
  }
}

extension SortedEmailQueryFilter
    on QueryBuilder<SortedEmail, SortedEmail, QFilterCondition> {
  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> emailIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      emailIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> emailIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> emailIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emailId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      emailIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> emailIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> emailIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> emailIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emailId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      emailIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailId',
        value: '',
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      emailIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emailId',
        value: '',
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> isReadEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRead',
        value: value,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      receivedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receivedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      receivedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receivedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      receivedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receivedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      receivedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receivedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> senderEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      senderGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> senderLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> senderBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      senderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> senderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> senderContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> senderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      senderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sender',
        value: '',
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      senderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sender',
        value: '',
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> subjectEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      subjectGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> subjectLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> subjectBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subject',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      subjectStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> subjectEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> subjectContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> subjectMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subject',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      subjectIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subject',
        value: '',
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      subjectIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subject',
        value: '',
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> summaryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      summaryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> summaryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> summaryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'summary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      summaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> summaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> summaryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> summaryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'summary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      summaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summary',
        value: '',
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      summaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'summary',
        value: '',
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      unsubscribeLinkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unsubscribeLink',
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      unsubscribeLinkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unsubscribeLink',
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      unsubscribeLinkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unsubscribeLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      unsubscribeLinkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unsubscribeLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      unsubscribeLinkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unsubscribeLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      unsubscribeLinkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unsubscribeLink',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      unsubscribeLinkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unsubscribeLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      unsubscribeLinkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unsubscribeLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      unsubscribeLinkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unsubscribeLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      unsubscribeLinkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unsubscribeLink',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      unsubscribeLinkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unsubscribeLink',
        value: '',
      ));
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      unsubscribeLinkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unsubscribeLink',
        value: '',
      ));
    });
  }
}

extension SortedEmailQueryObject
    on QueryBuilder<SortedEmail, SortedEmail, QFilterCondition> {}

extension SortedEmailQueryLinks
    on QueryBuilder<SortedEmail, SortedEmail, QFilterCondition> {
  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition> category(
      FilterQuery<EmailCategory> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'category');
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterFilterCondition>
      categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'category', 0, true, 0, true);
    });
  }
}

extension SortedEmailQuerySortBy
    on QueryBuilder<SortedEmail, SortedEmail, QSortBy> {
  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> sortByEmailId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailId', Sort.asc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> sortByEmailIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailId', Sort.desc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> sortByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.asc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> sortByIsReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.desc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> sortByReceivedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedAt', Sort.asc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> sortByReceivedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedAt', Sort.desc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> sortBySender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sender', Sort.asc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> sortBySenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sender', Sort.desc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> sortBySubject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.asc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> sortBySubjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.desc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> sortBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> sortBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> sortByUnsubscribeLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unsubscribeLink', Sort.asc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy>
      sortByUnsubscribeLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unsubscribeLink', Sort.desc);
    });
  }
}

extension SortedEmailQuerySortThenBy
    on QueryBuilder<SortedEmail, SortedEmail, QSortThenBy> {
  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> thenByEmailId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailId', Sort.asc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> thenByEmailIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailId', Sort.desc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> thenByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.asc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> thenByIsReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.desc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> thenByReceivedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedAt', Sort.asc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> thenByReceivedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedAt', Sort.desc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> thenBySender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sender', Sort.asc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> thenBySenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sender', Sort.desc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> thenBySubject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.asc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> thenBySubjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.desc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> thenBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> thenBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy> thenByUnsubscribeLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unsubscribeLink', Sort.asc);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QAfterSortBy>
      thenByUnsubscribeLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unsubscribeLink', Sort.desc);
    });
  }
}

extension SortedEmailQueryWhereDistinct
    on QueryBuilder<SortedEmail, SortedEmail, QDistinct> {
  QueryBuilder<SortedEmail, SortedEmail, QDistinct> distinctByEmailId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emailId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QDistinct> distinctByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRead');
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QDistinct> distinctByReceivedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receivedAt');
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QDistinct> distinctBySender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QDistinct> distinctBySubject(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subject', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QDistinct> distinctBySummary(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'summary', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SortedEmail, SortedEmail, QDistinct> distinctByUnsubscribeLink(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unsubscribeLink',
          caseSensitive: caseSensitive);
    });
  }
}

extension SortedEmailQueryProperty
    on QueryBuilder<SortedEmail, SortedEmail, QQueryProperty> {
  QueryBuilder<SortedEmail, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SortedEmail, String, QQueryOperations> emailIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emailId');
    });
  }

  QueryBuilder<SortedEmail, bool, QQueryOperations> isReadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRead');
    });
  }

  QueryBuilder<SortedEmail, DateTime, QQueryOperations> receivedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receivedAt');
    });
  }

  QueryBuilder<SortedEmail, String, QQueryOperations> senderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sender');
    });
  }

  QueryBuilder<SortedEmail, String, QQueryOperations> subjectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subject');
    });
  }

  QueryBuilder<SortedEmail, String, QQueryOperations> summaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'summary');
    });
  }

  QueryBuilder<SortedEmail, String?, QQueryOperations>
      unsubscribeLinkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unsubscribeLink');
    });
  }
}
