class CustomerEntity {
  final int id;
  final String name;
  final String phone;
  final bool busy;

  CustomerEntity({
    required this.id,
    required this.name,
    required this.phone,
    this.busy = false,
  });

  CustomerEntity.empty(int index)
      : id = DateTime.now().microsecondsSinceEpoch + index,
        name = 'cliente ${++index}',
        phone = 'Não informado',
        busy = false;

  CustomerEntity copyWith({
    String? name,
    String? phone,
    bool? busy,
  }) {
    return CustomerEntity(
      id: id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      busy: busy ?? this.busy,
    );
  }
}
