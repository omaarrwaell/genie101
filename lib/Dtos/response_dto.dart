class StatusResponse {
  StatusResponse({
    required this.message,
    required this.updatedStatus,
  });
  late final String message;
  late final Map<String, dynamic> updatedStatus;

  factory StatusResponse.fromJson(Map<String, dynamic> json) {
    return StatusResponse(
        message: json['message'], updatedStatus: json['updatedStatus']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['updatedStatus'] = updatedStatus;
    return _data;
  }
}
