class APIResponse {
  final bool error;
  final String message;
  Map<String, dynamic>? data;

  APIResponse({
    required this.error,
    required this.message,
    required this.data,
  });

  factory APIResponse.fromJson(Map<String, dynamic> json, int statusCode) {
    return APIResponse(
      error: false,
      message: json['message'],
      data: json['data'],
    );
  }

  factory APIResponse.failure(String message, int code) => APIResponse(
        error: true,
        message: message,
        data: null,
      );
}
