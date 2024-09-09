// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table.entity.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TableEntity on _TableEntityBase, Store {
  Computed<String>? _$spaceBusyComputed;

  @override
  String get spaceBusy =>
      (_$spaceBusyComputed ??= Computed<String>(() => super.spaceBusy,
              name: '_TableEntityBase.spaceBusy'))
          .value;
  Computed<String>? _$spaceQuantityComputed;

  @override
  String get spaceQuantity =>
      (_$spaceQuantityComputed ??= Computed<String>(() => super.spaceQuantity,
              name: '_TableEntityBase.spaceQuantity'))
          .value;

  late final _$idAtom = Atom(name: '_TableEntityBase.id', context: context);

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$identificationAtom =
      Atom(name: '_TableEntityBase.identification', context: context);

  @override
  String get identification {
    _$identificationAtom.reportRead();
    return super.identification;
  }

  @override
  set identification(String value) {
    _$identificationAtom.reportWrite(value, super.identification, () {
      super.identification = value;
    });
  }

  late final _$customersAtom =
      Atom(name: '_TableEntityBase.customers', context: context);

  @override
  ObservableList<CustomerEntity> get customers {
    _$customersAtom.reportRead();
    return super.customers;
  }

  @override
  set customers(ObservableList<CustomerEntity> value) {
    _$customersAtom.reportWrite(value, super.customers, () {
      super.customers = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
identification: ${identification},
customers: ${customers},
spaceBusy: ${spaceBusy},
spaceQuantity: ${spaceQuantity}
    ''';
  }
}
