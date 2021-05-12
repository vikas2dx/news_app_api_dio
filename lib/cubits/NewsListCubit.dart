import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_dio/cubits/CubitState.dart';
import 'package:new_app_dio/model/NewsListModel.dart';
import 'package:new_app_dio/network/ApiRepository.dart';
import 'package:new_app_dio/resources/AppStrings.dart';
import 'package:new_app_dio/utils/NetworkUtils.dart';

class NewsListCubit extends Cubit<CubitState> {
  NewsListModel newsResponse;
  List<Articles> newsList = [];

  NewsListCubit() : super(InitialState());

  void requestPopularNewsList() async {
    if (!await NetworkUtils.isInternetAvailable()) {
      emit(FailedState(message: AppStrings.NO_INTERNET));
      return;
    }
    emit(LoadingState());
    newsResponse = await ApiRepository().getPopularList();
    if (newsResponse != null) {
      if (newsResponse.status == "ok") {
        newsList = newsResponse.articles;
        emit(SuccessState());
      }
    }
  }

  void requestRecentNewsList() async {
    if (!await NetworkUtils.isInternetAvailable()) {
      emit(FailedState(message: AppStrings.NO_INTERNET));
      return;
    }
    emit(LoadingState());
    newsResponse = await ApiRepository().getRecentList();
    if (newsResponse != null) {
      if (newsResponse.status == "ok") {
        newsList = newsResponse.articles;
        emit(SuccessState());
      } else {
        emit(FailedState(message: "No Data Found"));
      }
    }
  }

  void requestBussinessList() async {
    if (!await NetworkUtils.isInternetAvailable()) {
      emit(FailedState(message: AppStrings.NO_INTERNET));
      return;
    }
    emit(LoadingState());
    newsResponse = await ApiRepository().getRecentList();
    if (newsResponse != null) {
      if (newsResponse.status == "ok") {
        newsList = newsResponse.articles;
        emit(SuccessState());
      }
    }
  }

  void requestTechList() async {
    if (!await NetworkUtils.isInternetAvailable()) {
      emit(FailedState(message: AppStrings.NO_INTERNET));
      return;
    }
    emit(LoadingState());
    newsResponse = await ApiRepository().getTechList();
    if (newsResponse != null) {
      if (newsResponse.status == "ok") {
        newsList = newsResponse.articles;
        emit(SuccessState());
      }
    }
  }
}
