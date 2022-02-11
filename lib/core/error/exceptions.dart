import 'package:equatable/equatable.dart';

abstract class CustomeException extends Equatable implements Exception {
  final String msg;
  final String? _prefix;
  const CustomeException(this._prefix, this.msg);
  String toString() {
    return "${_prefix ?? ""}$msg";
  }

  @override
  List<Object> get props => [msg];
}

class ServerException extends CustomeException {
  const ServerException(String msg, {String? prefix}) : super(prefix, msg);
}

class CacheException extends CustomeException {
  CacheException(String msg) : super("Exception: ", msg);
}
