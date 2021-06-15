import 'package:flutter_news/model/news_model.dart';
import 'package:flutter_news/modules/main/repository.dart';
import 'package:flutter_news/service/data_request.dart';
import 'package:get/get.dart';

class ControllerListNews extends GetxController {
  MainRepository _repository = MainRepository(apiService: Get.find());

  late String path;
  String? query;
  int currentPage = 1;
  int pageSize = 20;
  bool isLastPage = false;
  bool isLoading = false;
  Rx<ListNewsModel?> _listNewsModel = Rx(null);
  ListNewsModel? get listNewsModelValue => _listNewsModel.value;

  ControllerListNews(this.path, this.query);

  int get getItemCount {
    if (listNewsModelValue == null) return 3;
    int count = listNewsModelValue!.articles.length;
    return isLastPage ? count : count + 1;
  }

  @override
  void onInit() {
    super.onInit();
    setupData();
  }

  Future<void> setupData() async {
    currentPage = 1;
    isLastPage = false;
    isLoading = false;
    await loadData();
  }

  Future<void> loadData() async {
    if (isLastPage || isLoading) return;
    isLoading = true;
    await _repository.getNews(
      path: path,
      query: query,
      page: currentPage,
      pageSize: pageSize,
      dataRequest: DataRequest(
        onSuccess: (data) {
          if (listNewsModelValue == null) {
            _listNewsModel.value = data;
          } else {
            if (currentPage == 1) {
              _listNewsModel.value!.articles = [];
            }
            _listNewsModel.value!.articles.addAll(data.articles);
          }
          if (_listNewsModel.value!.articles.length >=
              _listNewsModel.value!.totalResults) {
            isLastPage = true;
          }
          currentPage += 1;
          _listNewsModel.refresh();
        },
        onFailure: (_, __) {},
        onErrorHttp: (_) {},
      ),
    );
    isLoading = false;
  }
}
