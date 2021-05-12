import 'package:flutter/material.dart';
import 'package:new_app_dio/model/NewsListModel.dart';
import 'package:new_app_dio/resources/AppColor.dart';
import 'package:new_app_dio/resources/AppFont.dart';

class NewsListWidget extends StatelessWidget {
  final verticalSpace = SizedBox(
    height: 5,
  );
  Articles newsList;

  NewsListWidget(this.newsList, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            newsList.urlToImage!=null
                ? SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(newsList.urlToImage))
                : Container(),
            Text(
              newsList.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: AppFont.LARGE),
            ),
            verticalSpace,
            Text(
              newsList.description,
              style: TextStyle(fontSize: AppFont.MEDIUM),
            ),
            verticalSpace,
            Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Author : ${newsList.author}",
                  style: TextStyle(
                      fontSize: AppFont.SMALL, color: AppColor.themeColor),
                )),
          ],
        ),
      ),
    );
  }
}
