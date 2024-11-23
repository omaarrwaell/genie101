class CommandDto {
  final String command;
  final Map<String, dynamic> payload;

  CommandDto({
    required this.command,
    required this.payload,
  });

  factory CommandDto.fromJson(Map<String, dynamic> json) {
    return CommandDto(
      command: json['command'] ?? '',
      payload: json['payload'] != null
          ? Map<String, dynamic>.from(json['payload'])
          : {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'command': command,
      'payload': payload,
    };
  }
}
