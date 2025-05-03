class DatasourceResponse {
  final int status;
  final dynamic error;

  final Map<String, dynamic> data;

  DatasourceResponse({
    required this.status,
    required this.error,
    required this.data,
  });
}
