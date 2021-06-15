import 'package:flutter_news/model/news_model.dart';
import 'package:flutter_news/service/api_service.dart';
import 'package:flutter_news/service/data_request.dart';

abstract class IMainRepository {
  Future<void> getNews(
      {int page = 1,
      int pageSize = 10,
      String? query,
      required String path,
      required DataRequest<ListNewsModel> dataRequest});
}

class MainRepository extends IMainRepository {
  final IApiService _apiService;

  MainRepository({required IApiService apiService}) : _apiService = apiService;

  @override
  Future<void> getNews(
      {int page = 1,
      int pageSize = 10,
      String? query,
      required String path,
      required DataRequest<ListNewsModel> dataRequest}) async {
    Map<String, dynamic> queryParams = {
      'page': "$page",
      'pageSize': "$pageSize",
      'apiKey': '316d1c95744b4cd0ae8bd8f1008520d9'
    };
    if (query != null) {
      queryParams['q'] = query;
    }
    await _apiService.requestApi(
      '/$path',
      method: Method.get,
      query: queryParams,
      onSuccess: (response) {
        ListNewsModel data = ListNewsModel.fromJson(response);
        dataRequest.onSuccess(data);
      },
      onFailure: (String message, response) {
        dataRequest.onFailure(message, response);
      },
      onErrorHttp: (e) {
        dataRequest.onErrorHttp(e);
      },
    );
  }
}
