class News{
  String title;
  String imgurl;
  String description;
  String content;
  News({required this.title,required this.imgurl,required this.description,required this.content});

  factory News.fromJson(Map<String, dynamic> parsedJson){
    return News(
        title : parsedJson['title'].toString() ,
        imgurl : parsedJson['urlToImage'].toString(),
        description : parsedJson['description'].toString(),
        content : parsedJson['content'].toString()
    );
  }

}