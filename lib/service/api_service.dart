import 'package:flutter_news/language/string_manager.dart';
import 'package:get/get.dart';

const Map<String, String> MEDIA_TYPES = const {
  "dart": "application/dart",
  "js": "application/javascript",
  "html": "text/html; charset=UTF-8",
  "htm": "text/html; charset=UTF-8",
  "css": "text/css",
  "txt": "text/plain",
  "json": "application/json",
  "ico": "image/vnd.microsoft.icon",
  "png": "image/png",
  "bmp": "image/bmp",
  "jpg": "image/jpeg",
  "jpeg": "image/jpeg",
  "tiff": "image/tiff",
  "ogg": "audio/ogg",
  "mp3": "audio/mpeg",
  "ogv": "video/ogg",
  "mp4": "video/mp4",
  "mov": "video/mov",
  "webm": "video/webm",
  "pdf": "application/pdf"
};

abstract class IApiService {
  String getMediatype(String filename);

  Future<void> requestApi(String url,
      {Method method = Method.post,
        dynamic body,
        String? contentType,
        Map<String, String>? headers,
        Map<String, dynamic>? query,
        required Function(dynamic) onSuccess,
        required Function(String, dynamic) onFailure,
        required Function(String) onErrorHttp,
        Progress? uploadProgress});
}

class ApiService extends GetxService implements IApiService {
  final GetConnect _connector;

  ApiService({required GetConnect connector}) : this._connector = connector;

  Future<void> requestApi(String url,
      {Method method = Method.post,
      dynamic body,
      String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      required Function(dynamic) onSuccess,
      required Function(String, dynamic) onFailure,
      required Function(String) onErrorHttp,
      Progress? uploadProgress}) async {
    final Map Function(dynamic) _defaultDecoder = (json) => json;

    if (headers == null) headers = {};

    headers.addAll({"localization": Get.locale?.languageCode ?? 'en'});

    print("-------- REQUEST -----------");
    print("url: $url");
    print("method: $method");
    print("headers: $headers");
    print("query: $query");
    print("body: $body");

    Response<Map<dynamic, dynamic>>? result;
    if (method == Method.get) {
      result = await _connector.get(url,
          headers: headers,
          contentType: contentType,
          query: query,
          decoder: _defaultDecoder);
    }

    if (method == Method.post) {
      result = await _connector.post(url, body,
          contentType: contentType,
          headers: headers,
          query: query,
          uploadProgress: uploadProgress,
          decoder: _defaultDecoder);
    }

    if (method == Method.put) {
      result = await _connector.put(url, body,
          contentType: contentType,
          headers: headers,
          query: query,
          uploadProgress: uploadProgress,
          decoder: _defaultDecoder);
    }

    if (result == null) {
      onErrorHttp(StringManager.textErrorNetwork.tr);
      return;
    }

    dynamic json = result.body;
    print("-------- RESPONSE -----------");
    print("url: ${result.request?.url}");
    print("statusCode: ${result.statusCode}");
    print("json: $json");
    if (json != null && json is Map && result.isOk) {
      String status = json["status"] ?? "";
      if (status == "ok") {
        onSuccess(json);
        return;
      } else {
        String message = StringManager.textError.tr;
        onFailure(
          message,
          json,
        );
        return;
      }
    } else {
      onErrorHttp(StringManager.textErrorNetwork.tr);
    }

    return null;
  }

  @override
  String getMediatype(String filename) {
    int dot = filename.lastIndexOf('.');
    if (dot != -1) {
      var fileType = filename.substring(dot + 1);
      var mediaType = MEDIA_TYPES[fileType.toLowerCase()];
      if (mediaType != null) {
        return mediaType;
      }
    }
    return 'application/octet-stream';
  }
}

enum Method { post, get, put }
