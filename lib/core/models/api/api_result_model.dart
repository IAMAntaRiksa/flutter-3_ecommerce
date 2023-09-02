class ApiResult<T extends Serializable> {
  int? code;
  String? message;
  bool? error;
  T? data;
  ApiResult({
    required this.code,
    required this.message,
    required this.error,
    required this.data,
  });

  factory ApiResult.fromJson(Map<String, dynamic>? json,
      Function(Map<String, dynamic>) create, String field) {
    return ApiResult<T>(
      code: json?['code'],
      message: json?['message'] ?? "",
      error: json?['error'] ?? false,
      data: json?[field] != null && json?[field] is Map
          ? create(json?[field] ?? {})
          : create({}),
    );
  }

  factory ApiResult.failure(String message, int statusCode) {
    return ApiResult<T>(
      code: statusCode,
      error: false,
      message: message,
      data: null,
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "error": error,
        "data": data?.toJson(),
      };
}

class ApiResultList<T extends Serializable> {
  String? message;
  bool? error;
  List<T>? data;

  ApiResultList({this.message, this.error, this.data});

  factory ApiResultList.fromJson(
      Map<String, dynamic>? json, Function(List<dynamic>) build, String field) {
    return ApiResultList<T>(
      message: json?['message'] ?? "",
      error: json?['error'] ?? false,
      data: json?[field] != null && json?[field] is List
          ? build(json?[field])
          : build([]),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "data": data?.toList(),
      };
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}
