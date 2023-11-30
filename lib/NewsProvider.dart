
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'News.dart';
import 'services/Database.dart';

class NewsProvider extends ChangeNotifier {
  List<News> res = [];

  List<News> getlist() => res;

  Future getres() async {
    List<News>? r=await Dataservice(uid: " ").getNews();
    if(r!=null){
      res=r;
    }
    notifyListeners();
  }
}