import 'package:flutter/material.dart';
import 'News.dart';

class NewsDetails extends StatefulWidget {

  News news;
  NewsDetails({super.key,required this.news});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,weight: 2,),
        onPressed: (){
          Navigator.pop(context);
        },),
    centerTitle: true,
    elevation: 0,
        title: Text("News App",
        style: TextStyle(
        letterSpacing: 4, fontSize: 20, fontWeight: FontWeight.w600)),
    titleTextStyle:
    TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
    backgroundColor: Colors.white,),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network(
              widget.news.imgurl,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,

            ),
            SizedBox(height: 15,),
            Text(
              widget.news.title,
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              widget.news.description,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 5,),
            Text(
              widget.news.content,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
