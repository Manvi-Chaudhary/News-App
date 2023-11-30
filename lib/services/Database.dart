import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:triveous_news_app/News.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Dataservice {
  String uid = "";
  Dataservice({required this.uid});

  CollectionReference record = FirebaseFirestore.instance.collection("data");

  Future cred(String email, String username, String password) async {
    try{
      return await record
          .doc(uid)
          .set({"Email": email, "Username": username, "Password": password});
    }catch(e){
      print("error in db: "+e.toString());
    }
  }

  Future<String?> getemail(String username, String password) async {
    QuerySnapshot s = await record
        .where("Username", isEqualTo: username)
        .where("Password", isEqualTo: password)
        .get();
    if (s.docs == []) {
      return null;
    }
    return s.docs[0]["Email"];
  }

  Future<List<News>?> getNews() async {
    try{
      dynamic res= await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=in&apiKey=40c075ce3d854601b39a5c43643388be&page=1&pageSize=10'));
      if (res.statusCode == 200) {

        var data=jsonDecode(res.body);
        print(data['articles'][0]);
        var r = (data['articles'] as List)
            .map((data) => new News.fromJson(data))
            .toList();
        return r;
      } else {
        return null;
      }

    }catch(e){
      print(e.toString());
      return null;
    }

  }
}
