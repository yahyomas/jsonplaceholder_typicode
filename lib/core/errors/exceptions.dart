class ServerException implements Exception{
  final int code;
  ServerException({required this.code});
}