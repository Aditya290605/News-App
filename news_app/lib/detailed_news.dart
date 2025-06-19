import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailedNews extends StatefulWidget {

  final Map<String,dynamic> data ;

  const DetailedNews({super.key,
  required this.data});

  @override
  State<DetailedNews> createState() => _DetailedNewsState();
}

class _DetailedNewsState extends State<DetailedNews> {
  
  

  @override
  Widget build(BuildContext context) {

    String? des = widget.data['description'];
    String? url = widget.data['urlToImage'];
    String? content = widget.data['content'];

    url ??= "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png?20210219185637";
    des ??= "Description not available for this news ";
    content ??= "";

    final time = DateTime.parse(widget.data['publishedAt']);
    return Scaffold(
      appBar: AppBar(
        title: const Text("See Detailed news"),
        titleTextStyle: Theme.of(context).textTheme.bodyMedium,
        centerTitle: true,
        leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded,
        size: 30,
        ),
      ),
    ),

    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${widget.data['title']}",
            style: Theme.of(context).textTheme.titleLarge,),
    
            const SizedBox(height: 30),
    
            Text("By ${widget.data['author']}"),
    
            const SizedBox(height: 30),
    
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 239, 239, 239),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(url,
                ),
              ),
            ),
    
            const SizedBox(height: 30),
    
            Text("$des \n\n$content",
            style: Theme.of(context).textTheme.bodyMedium,),
    
            const SizedBox(height: 30),
    
            Align
            ( alignment: Alignment.centerRight,
              child: Text("pulished at :- ${DateFormat.jmz().format(time)}")
            ),
    
            const SizedBox(height: 20,)
            
    
    
          ],
        ),
      ),
    ),
    );
  }
}