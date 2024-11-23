class Device {
  Device({
    required this.id,
    required this.name,
    required this.protocol,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String? id;
  late final String? name;
  late final String? protocol;
  late final Map<String, dynamic>? status;
  late final String? createdAt;
  late final String? updatedAt;

  Device.onInit(
    this.status,
  );

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        id: json['_id'],
        name: json['name'],
        protocol: json['protocol'],
        status: json['status'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['protocol'] = protocol;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  static List<Device> jsonToList(List jsonString) {
    return jsonString.map((json) => Device.fromJson(json)).toList();
  }
}
