import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) => ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
    int? statusCode;
    String? message;

    ErrorResponse({
         this.statusCode,
         this.message,
    });

    factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        statusCode: json["statusCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
    };
}