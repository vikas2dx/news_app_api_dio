import 'package:dio/dio.dart';
import 'package:new_app_dio/model/NewsListModel.dart';

import '../AppConfig.dart';
import 'ApiInterceptor.dart';
import 'RestClient.dart';

class ApiRepository {
  static ApiRepository _apiRepository = ApiRepository._private();
  RestClient _restClient;

  factory ApiRepository() {
    return _apiRepository;
  }

  ApiRepository._private() {
    _restClient = _createClient(AppConfig().baseUrl);
  }

  RestClient _createClient(String baseUrl, {Map<String, String> header}) {
    Dio _dio = Dio();
    _dio.options.connectTimeout = 30 * 1000;
    _dio.interceptors.add(ApiInterceptor());

    if (baseUrl == null) {
      return RestClient(_dio);
    } else {
      return RestClient(_dio, baseUrl: baseUrl);
    }
  }

  Future<NewsListModel> getPopularList() async {
    var response = await _apiRepository._restClient.getPopularNews();
    return response;
  }
  Future<NewsListModel> getRecentList() async {
    var response = await _apiRepository._restClient.getRecentNews();
    return response;
  }  Future<NewsListModel> getBusinessList() async {
    var response = await _apiRepository._restClient.getBusinessNews();
    return response;
  }  Future<NewsListModel> getTechList() async {
    var response = await _apiRepository._restClient.getTechNews();
    return response;
  }
}
