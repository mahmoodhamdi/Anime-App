import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;
  final String? title;
  final String? detail;
  final String? code;
  final int? status;
  final String? pointer;
  final String? parameter;

  const Failure({
    required this.errorMessage,
    this.title,
    this.detail,
    this.code,
    this.status,
    this.pointer,
    this.parameter,
  });

  @override
  List<Object?> get props => [errorMessage, title, detail, code, status];
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.errorMessage,
    super.title,
    super.detail,
    super.code,
    super.status,
    super.pointer,
    super.parameter,
  });

  factory ServerFailure.fromException(Exception exception) {
    return ServerFailure(errorMessage: exception.toString());
  }

  factory ServerFailure.fromStatusCode(int statusCode,
      [Map<String, dynamic>? errorResponse]) {
    String errorMessage;
    switch (statusCode) {
      case 400:
        errorMessage = "Bad request";
        break;
      case 401:
        errorMessage = "Unauthorized";
        break;
      case 403:
        errorMessage = "Forbidden";
        break;
      case 404:
        errorMessage = "Not found";
        break;
      case 500:
        errorMessage = "Internal server error";
        break;
      default:
        errorMessage = "Oops something went wrong";
        break;
    }

    return ServerFailure(
      errorMessage: errorMessage,
      title: errorResponse?['title'],
      detail: errorResponse?['detail'],
      code: errorResponse?['code'],
      status: errorResponse?['status'],
      pointer: errorResponse?['source']?['pointer'],
      parameter: errorResponse?['source']?['parameter'],
    );
  }

  factory ServerFailure.fromDioException(DioException dioException) {
    String errorMessage;
    switch (dioException.type) {
      case DioExceptionType.cancel:
        errorMessage = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = "Connection timeout with API server";
        break;
      case DioExceptionType.unknown:
        errorMessage =
            "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        errorMessage =
            "Invalid status code: ${dioException.response?.statusCode}";
        break;
      case DioExceptionType.badCertificate:
        errorMessage = "Invalid certificate";
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "Send timeout in connection with API server";
        break;
      default:
        errorMessage = "Something went wrong";
        break;
    }

    final errorResponse = dioException.response?.data['errors']?.first;

    return ServerFailure(
      errorMessage: errorMessage,
      title: errorResponse?['title'],
      detail: errorResponse?['detail'],
      code: errorResponse?['code'],
      status: errorResponse?['status'],
      pointer: errorResponse?['source']?['pointer'],
      parameter: errorResponse?['source']?['parameter'],
    );
  }
}
