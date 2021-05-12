// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RestClient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<NewsListModel> getPopularNews() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/v2/everything?q=apple&from=2021-05-06&to=2021-05-06&sortBy=popularity&apiKey=fbc1189b168b41e9b2d0e1b7d41cf9ca',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NewsListModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<NewsListModel> getRecentNews() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/v2/everything?q=tesla&from=2021-04-08&sortBy=publishedAt&apiKey=fbc1189b168b41e9b2d0e1b7d41cf9ca',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NewsListModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<NewsListModel> getBusinessNews() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/v2/top-headlines?country=us&category=business&apiKey=fbc1189b168b41e9b2d0e1b7d41cf9ca',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NewsListModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<NewsListModel> getTechNews() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/v2/top-headlines?sources=techcrunch&apiKey=fbc1189b168b41e9b2d0e1b7d41cf9ca',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NewsListModel.fromJson(_result.data);
    return value;
  }
}
