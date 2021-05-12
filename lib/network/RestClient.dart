import 'package:dio/dio.dart';
import 'package:new_app_dio/model/NewsListModel.dart';
import 'package:new_app_dio/network/ApiUrls.dart';
import 'package:retrofit/http.dart';

part 'RestClient.g.dart';
@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(ApiUrls.POPULAR_NEWS)
  Future<NewsListModel> getPopularNews();
  @GET(ApiUrls.RECENT_NEWS)
  Future<NewsListModel> getRecentNews();
  @GET(ApiUrls.BUSINESS_NEWS)
  Future<NewsListModel> getBusinessNews();
  @GET(ApiUrls.TECHCRUNCH_NEWS)
  Future<NewsListModel> getTechNews();
}
