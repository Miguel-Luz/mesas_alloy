// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:teste_flutter/features/customers/entities/customer.entity.dart';
import 'package:teste_flutter/features/tables/entities/table.entity.dart';
part 'tables.store.g.dart';

class TablesStore = _TablesStoreBase with _$TablesStore;

abstract class _TablesStoreBase with Store {
  @observable
  ObservableList<TableEntity> tables = ObservableList<TableEntity>();

  @observable
  String searchField = '';

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

  @action
  void updateCustomerAtTable({
    required CustomerEntity customer,
    required TableEntity table,
  }) {
    final int indexTable =
        tables.indexWhere((element) => element.id == table.id);

    if (indexTable != -1) {
      final int indexCustomer =
          tables[indexTable].customers.indexWhere((el) => el.id == customer.id);

      if (indexCustomer != -1) {
        tables[indexTable].customers[indexCustomer] = customer;
      }
    }
  }

  @action
  void removeCustomerAtTable({
    required CustomerEntity customer,
    required TableEntity table,
  }) {
    final int indexTable =
        tables.indexWhere((element) => element.id == table.id);

    if (indexTable != -1) {
      final int indexCustomer =
          tables[indexTable].customers.indexWhere((el) => el.id == customer.id);

      if (indexCustomer != -1) {
        tables[indexTable].customers[indexCustomer] =
            CustomerEntity.empty(indexCustomer);
      }
    }
  }

  @computed
  String get occupation {
    int totalSpace =
        tables.fold(0, (sum, table) => sum + table.customers.length);

    int busySpace = tables.fold(
        0,
        (sum, table) =>
            sum + table.customers.where((item) => item.busy).length);

    return '${busySpace.toString()}/${totalSpace.toString()}';
  }

  @computed
  int get totalSpace =>
      tables.fold(0, (sum, table) => sum + table.customers.length);

  @computed
  int get busySpace => tables.fold(0,
      (sum, table) => sum + table.customers.where((item) => item.busy).length);

  @computed
  ObservableList<TableEntity> get filtredTables {
    if (searchField.isEmpty) {
      return tables;
    }

    final filtered = tables
        .where((table) => table.identification
            .toLowerCase()
            .contains(searchField.toLowerCase()))
        .toList();

    return ObservableList<TableEntity>.of(filtered);
  }
}
