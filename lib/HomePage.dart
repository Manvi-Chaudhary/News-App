import 'package:flutter/material.dart';
import 'package:triveous_news_app/NewsDetails.dart';
import 'services/Authentication.dart';
import 'services/Database.dart';
import 'News.dart';
import 'NewsProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).getres();


  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text("News App",
              style: TextStyle(
                  letterSpacing: 4, fontSize: 20, fontWeight: FontWeight.w600)),
          titleTextStyle:
          TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.logout,color: Colors.black,),
                onPressed: () async {
                  await Authservice().signout();
                })
          ]),
      body: Consumer<NewsProvider>(builder: (context, value, child) {
        List<News> res = value.getlist();
        return ListView.separated(
            itemBuilder: (context, index) {
              print(res[index].imgurl=="null");
              if(res[index].imgurl=="null"){

                return Container();
              }else{
                return InkWell(
                  onTap: (){
                    News n=News(title: res[index].title, imgurl: res[index].imgurl, description: res[index].description, content: res[index].content);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetails(news: n)));
                  },
                  child: Card(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),

                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Image.network(
                          res[index].imgurl,
                          height: 160,
                          width: double.infinity,
                          fit: BoxFit.cover,

                        ),

                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text(
                                res[index].title,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[700],
                                ),
                              ),

                            ],
                          ),
                        ),

                        Container(height: 5),
                      ],
                    ),
                  ),
                );

              }

            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 7);
            },
            itemCount: res.length);
      }),
    ));
  }
}
