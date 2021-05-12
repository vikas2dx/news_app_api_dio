import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_dio/cubits/CubitState.dart';
import 'package:new_app_dio/cubits/NewsListCubit.dart';
import 'package:new_app_dio/model/NewsListModel.dart';
import 'package:new_app_dio/resources/AppColor.dart';
import 'package:new_app_dio/ui/widget/NewsListWidget.dart';
import 'package:new_app_dio/ui/widget/ProgressLoader.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key key}) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  NewsListCubit _newCubit = NewsListCubit();
  String title = "Popular";

  @override
  void initState() {
    _newCubit.requestPopularNewsList();
  }

  void handleClickFilter(String value) {
    setState(() {
      this.title = value;
    });
    switch (value) {
      case 'Popular':
        _newCubit.requestPopularNewsList();
        break;
      case 'Recent':
        _newCubit.requestRecentNewsList();

        break;
      case 'Business':
        _newCubit.requestBussinessList();

        break;
      case 'Technology':
        _newCubit.requestTechList();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("$title News"),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.filter_alt,
              color: AppColor.white,
            ),
            onSelected: handleClickFilter,
            itemBuilder: (context) {
              return {'Popular', 'Recent', 'Business', 'Technology'}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: BlocConsumer(
        cubit: _newCubit,
        builder: (context, state) {
          return handleState(context, state, _newCubit.newsList);
        },
        listener: (context, state) {},
      ),
    ));
  }

  Widget handleState(BuildContext context, state, List<Articles> newsList) {
    if (state is FailedState) {
      return Center(
        child: Text(state.message),
      );
    } else if (state is LoadingState) {
      return ProgressLoader();
    } else if (state is SuccessState) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return NewsListWidget(newsList[index]);
          },
        ),
      );
    } else {
      return ProgressLoader();
    }
  }
}
