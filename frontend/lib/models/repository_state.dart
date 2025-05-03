class RepositoryState<T> {
  final T data;
  final int status;

  final dynamic error;

  RepositoryState({
    required this.data,
    required this.status,
    required this.error,
  });
}
