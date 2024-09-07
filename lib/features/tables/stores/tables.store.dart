// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:teste_flutter/features/tables/entities/table.entity.dart';
part 'tables.store.g.dart';

class TablesStore = _TablesStoreBase with _$TablesStore;

abstract class _TablesStoreBase with Store {
  @observable
  ObservableList<TableEntity> tables = ObservableList<TableEntity>();

  @action
  void addtable(TableEntity table) {
    tables.add(table);
  }

  @action
  void removetable(TableEntity table) {
    tables.remove(table);
  }

  @action
  void updatetable(TableEntity table) {
    final index = tables.indexWhere((element) => element.id == table.id);
    tables[index] = table;
  }
}
