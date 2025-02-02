// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TablesStore on _TablesStoreBase, Store {
  Computed<String>? _$occupationComputed;

  @override
  String get occupation =>
      (_$occupationComputed ??= Computed<String>(() => super.occupation,
              name: '_TablesStoreBase.occupation'))
          .value;
  Computed<int>? _$totalSpaceComputed;

  @override
  int get totalSpace =>
      (_$totalSpaceComputed ??= Computed<int>(() => super.totalSpace,
              name: '_TablesStoreBase.totalSpace'))
          .value;
  Computed<int>? _$busySpaceComputed;

  @override
  int get busySpace =>
      (_$busySpaceComputed ??= Computed<int>(() => super.busySpace,
              name: '_TablesStoreBase.busySpace'))
          .value;
  Computed<ObservableList<TableEntity>>? _$filtredTablesComputed;

  @override
  ObservableList<TableEntity> get filtredTables => (_$filtredTablesComputed ??=
          Computed<ObservableList<TableEntity>>(() => super.filtredTables,
              name: '_TablesStoreBase.filtredTables'))
      .value;

  late final _$tablesAtom =
      Atom(name: '_TablesStoreBase.tables', context: context);

  @override
  ObservableList<TableEntity> get tables {
    _$tablesAtom.reportRead();
    return super.tables;
  }

  @override
  set tables(ObservableList<TableEntity> value) {
    _$tablesAtom.reportWrite(value, super.tables, () {
      super.tables = value;
    });
  }

  late final _$searchFieldAtom =
      Atom(name: '_TablesStoreBase.searchField', context: context);

  @override
  String get searchField {
    _$searchFieldAtom.reportRead();
    return super.searchField;
  }

  @override
  set searchField(String value) {
    _$searchFieldAtom.reportWrite(value, super.searchField, () {
      super.searchField = value;
    });
  }

  late final _$_TablesStoreBaseActionController =
      ActionController(name: '_TablesStoreBase', context: context);

  @override
  void addtable(TableEntity table) {
    final _$actionInfo = _$_TablesStoreBaseActionController.startAction(
        name: '_TablesStoreBase.addtable');
    try {
      return super.addtable(table);
    } finally {
      _$_TablesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removetable(TableEntity table) {
    final _$actionInfo = _$_TablesStoreBaseActionController.startAction(
        name: '_TablesStoreBase.removetable');
    try {
      return super.removetable(table);
    } finally {
      _$_TablesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatetable(TableEntity table) {
    final _$actionInfo = _$_TablesStoreBaseActionController.startAction(
        name: '_TablesStoreBase.updatetable');
    try {
      return super.updatetable(table);
    } finally {
      _$_TablesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCustomerAtTable(
      {required CustomerEntity customer, required TableEntity table}) {
    final _$actionInfo = _$_TablesStoreBaseActionController.startAction(
        name: '_TablesStoreBase.updateCustomerAtTable');
    try {
      return super.updateCustomerAtTable(customer: customer, table: table);
    } finally {
      _$_TablesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCustomerAtTable(
      {required CustomerEntity customer, required TableEntity table}) {
    final _$actionInfo = _$_TablesStoreBaseActionController.startAction(
        name: '_TablesStoreBase.removeCustomerAtTable');
    try {
      return super.removeCustomerAtTable(customer: customer, table: table);
    } finally {
      _$_TablesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tables: ${tables},
searchField: ${searchField},
occupation: ${occupation},
totalSpace: ${totalSpace},
busySpace: ${busySpace},
filtredTables: ${filtredTables}
    ''';
  }
}
