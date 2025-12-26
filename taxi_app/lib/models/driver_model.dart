class Driver {
  final int? id;
  final String name;
  final String car;
  final String distance;
  final String eta;

  Driver({
    this.id,
    required this.name,
    required this.car,
    required this.distance,
    required this.eta,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'car': car,
      'distance': distance,
      'eta': eta,
    };
  }

  factory Driver.fromMap(Map<String, dynamic> map) {
    return Driver(
      id: map['id'],
      name: map['name'],
      car: map['car'],
      distance: map['distance'],
      eta: map['eta'],
    );
  }
}
