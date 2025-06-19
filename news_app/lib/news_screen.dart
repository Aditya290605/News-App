import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_app/breaking_news.dart';
import 'package:news_app/detailed_news.dart';
import 'package:news_app/recent_news.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/secrets.dart';

class NewsScreen extends StatefulWidget{

  const NewsScreen({super.key,
  }
  );

  @override
  State<NewsScreen> createState() => _NewsScreen();
}

class _NewsScreen extends State<NewsScreen>{

final List<String> categories = [
  "politics",
  "sports",
  "business",
  "health",
  "entertainment"
];
late String category;



Future<Map<String,dynamic>> getBreakingNews() async{
  
  const key = apikey;
  try{
    final res = await http.get(
    Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$key")
    );
  
  final data = jsonDecode(res.body);

  if(data['status'] != 'ok'){
    throw "something unexpected happed";
  }
  

  return data;
  }
  catch(e){
    throw e.toString();
  }
}

@override
  void initState() {
    super.initState();
    category = categories[0];
  }

  @override
  Widget build(BuildContext context) {

    
    return FutureBuilder(
      future: getBreakingNews(),
      builder: (context,snapshot){
      
     
      if(snapshot.connectionState == ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator());
      }

      if(snapshot.hasError){
        throw Text("${snapshot.error}");
      }

      final alldata = snapshot.data!;
      
      return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: const Text("News App",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold
          ),
          ),
          toolbarHeight: 60,
          backgroundColor: const Color.fromARGB(255, 94, 180, 251),
          actions: [
          
            IconButton(onPressed: (){
              setState(() {
                getBreakingNews();
              });
            }, 
            icon: const Icon(Icons.refresh),
            )
          ],
        ),
      
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 

                SizedBox(
                  height: 65,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context,index){
                      return Padding
                      ( 
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              category = categories[index];
                            }
                            );
                          },
                          child: Chip(
                            backgroundColor: category == categories[index]?
                            const Color.fromARGB(255, 80, 197, 251):
                            const Color.fromARGB(137, 219, 219, 219),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                color: category == categories[index]?
                                Colors.blue:
                                 Colors.white
                              )
                            ),
                          label: Text(categories[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),)
                          ),
                        )
                        );
                  }
                  ),
                ),

                const Text("Breaking News",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
                ),
                const SizedBox(height: 10,),
            
                SizedBox(
                
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context,counter){
                      final newTitle = alldata["articles"][counter]["title"];
                      String? imurl = alldata['articles'][counter]['urlToImage'];
                      String pub = alldata['articles'][counter]['publishedAt'];
                  
                      imurl ??= "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png?20210219185637";              
                  
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>DetailedNews(
                              data: alldata['articles'][counter])
                              )
                          );
                        },
                        child: BreakingNews(
                        news: newTitle,
                        url : imurl,
                        publish: pub,
                        ),
                      );
                    }
                    ),
                ),
                const SizedBox(height: 15,),
            
                const Text("Recent News",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),),
              
                const SizedBox(height: 10,),
            
                for(int i=10;i<20;i++)
                Builder(
                  builder: (context) {
                    final newTitle = alldata["articles"][i]["title"];
                    String? imgurl = alldata['articles'][i]['urlToImage'];
                    String? des = alldata['articles'][i]['description'];

                    imgurl ??= "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png?20210219185637";
                    des ??= "";

                    debugPrint(imgurl);
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: 
                          (context){
                            return DetailedNews(data: alldata['articles'][i]);
                          })
                        );
                      },
                      child: RecentNews(
                        publish: alldata['articles'][i]['publishedAt'],
                      title: newTitle,
                      imageUrl: imgurl,
                      description: des,
                                        
                      ),
                    );
                  }
                )
              ]
            ),
          ),
        ),
      );
  });
  }
}