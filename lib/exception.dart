library shelf_exception_response.exception;
import "dart:io" show HttpStatus;

/**
 * HTTP exception enables to immediately stop request execution
 * and send an appropriate error message to the client. An option
 * [Map] data can be provided to add additional information as
 * the response body.
 */
class HttpException implements Exception {

  final int status;
  final String message;
  final Map<String, dynamic> data;

  const HttpException([this.status = HttpStatus.INTERNAL_SERVER_ERROR,
      this.message = "Internal Server Error", this.data]);

  Map<String, dynamic> toMap() {
    Map<String, dynamic>result = {
        "status": status,
        "message": message
    };
    if(data != null && !data.isEmpty) {
      data.forEach((name, value) {
        result[name] = value;
      });
    }
    return result;
  }

  String toString() {
    return "Status ${status.toString()}: ${message}";
  }

}

// 400 Bad Request
class BadRequestException extends HttpException {
  const BadRequestException([Map<String, dynamic> data,
                             String detail = ""])
      : super(HttpStatus.BAD_REQUEST, _toMessage("Bad Request", detail), data);
}

// 401 Unauthorized
class UnauthorizedException extends HttpException {
  const UnauthorizedException([Map<String, dynamic> data,
                            String detail = ""])
      : super(HttpStatus.UNAUTHORIZED, _toMessage("Unauthorized", detail), data);
}

// 402 Payment Required
class PaymentRequiredException extends HttpException {
  const PaymentRequiredException([Map<String, dynamic> data,
                              String detail = ""])
  : super(HttpStatus.PAYMENT_REQUIRED, _toMessage("Payment Required", detail), data);
}

// 403 Forbidden
class ForbiddenException extends HttpException {
  const ForbiddenException([Map<String, dynamic> data,
                                 String detail = ""])
  : super(HttpStatus.FORBIDDEN, _toMessage("Forbidden", detail), data);
}

// 404 Not Found
class NotFoundException extends HttpException {
  const NotFoundException([Map<String, dynamic> data,
                                 String detail = ""])
  : super(HttpStatus.NOT_FOUND, _toMessage("Not Found", detail), data);
}

// 405 Method Not Allowed
class MethodNotAllowed extends HttpException {
  const MethodNotAllowed([Map<String, dynamic> data,
                          String detail = ""])
  : super(HttpStatus.METHOD_NOT_ALLOWED, _toMessage("Method Not Allowed", detail), data);
}

// 406 Not Acceptable
class NotAcceptableException extends HttpException {
  const NotAcceptableException([Map<String, dynamic> data,
                         String detail = ""])
  : super(HttpStatus.NOT_ACCEPTABLE, _toMessage("Not Acceptable", detail), data);
}

// 409 Conflict
class ConflictException extends HttpException {
  const ConflictException([Map<String, dynamic> data,
                               String detail = ""])
  : super(HttpStatus.CONFLICT, _toMessage("Conflict", detail), data);
}

// 410 Gone
class GoneException extends HttpException {
  const GoneException([Map<String, dynamic> data,
                          String detail = ""])
  : super(HttpStatus.GONE, _toMessage("Gone", detail), data);
}

// 412 Precondition Failed
class PreconditionFailedException extends HttpException {
  const PreconditionFailedException([Map<String, dynamic> data,
                      String detail = ""])
  : super(HttpStatus.PRECONDITION_FAILED, _toMessage("Precondition Failed", detail), data);
}

// 415 Unsupported Media Type
class UnsupportedMediaTypeException extends HttpException {
  const UnsupportedMediaTypeException([Map<String, dynamic> data,
                                    String detail = ""])
  : super(HttpStatus.UNSUPPORTED_MEDIA_TYPE, _toMessage("Unsupported Media Type", detail),
    data);
}

// 429 Too Many Requests
class TooManyRequestsException extends HttpException {
  const TooManyRequestsException([Map<String, dynamic> data,
                                    String detail = ""])
  : super(429, _toMessage("Too Many Requests", detail), data);
}

// 501 Not Implemented
class NotimplementedException extends HttpException {
  const NotimplementedException([Map<String, dynamic> data,
                                    String detail = ""])
  : super(HttpStatus.NOT_IMPLEMENTED, _toMessage("Not Implemented", detail), data);
}

// 503 Service Unavailable
class ServiceUnavailableException extends HttpException {
  const ServiceUnavailableException([Map<String, dynamic> data,
                                String detail = ""])
  : super(HttpStatus.SERVICE_UNAVAILABLE, _toMessage("Service Unavailable", detail), data);
}



String _toMessage(String message, String detail) {
  var part2 = detail != null ? ': $detail' : '';
  return '${message}${part2}';
}

