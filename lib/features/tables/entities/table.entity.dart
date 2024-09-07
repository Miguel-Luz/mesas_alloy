// ignore_for_file: library_private_types_in_public_api

import 'package:teste_flutter/features/customers/entities/customer.entity.dart';

import 'package:mobx/mobx.dart';
part 'table.entity.g.dart';

class TableEntity = _TableEntityBase with _$TableEntity;

abstract class _TableEntityBase with Store {
  _TableEntityBase({
    required this.id,
    required this.identification,
    required this.customers,
  });

  @observable
  int id;

  @observable
  String identification;

  @observable
  List<CustomerEntity> customers;

  TableEntity copyWith({
    String? identification,
    List<CustomerEntity>? customers,
  }) {
    return TableEntity(
      id: id,
      identification: identification ?? this.identification,
      customers: customers ?? this.customers,
    );
  }
}
