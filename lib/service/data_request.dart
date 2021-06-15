class DataRequest<T> {
  Function(T data) onSuccess;
  Function(String message, dynamic) onFailure;
  Function(String error) onErrorHttp;

  DataRequest(
      {required this.onSuccess,
      required this.onFailure,
      required this.onErrorHttp});
}
