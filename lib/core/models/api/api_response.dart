class APIResponse {
  final bool error;
  final String message;
  final int? statusCode;
  Map<String, dynamic>? data;

  APIResponse({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory APIResponse.fromJson(Map<String, dynamic> json, int statusCode) {
    return APIResponse(
      error: false,
      message: json['message'],
      statusCode: json['statusCode'] ?? statusCode,
      data: json['data'],
    );
  }

  factory APIResponse.failure(String message, int code) => APIResponse(
        error: true,
        message: message,
        statusCode: code,
        data: null,
      );
}

// abstract class Serializable {
//   Map<String, dynamic> toJson();
// }
