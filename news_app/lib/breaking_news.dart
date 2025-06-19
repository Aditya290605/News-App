import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BreakingNews extends StatelessWidget {
  final String url;
  final String news;
  final String publish;
  const BreakingNews({
  super.key,
  required this.url,
  required this.news,
  required this.publish
  }
  );

  @override
  Widget build(BuildContext context) {
    final time = DateTime.parse(publish);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(colors: [Colors.grey,Colors.white],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight),
                      color: const Color.fromARGB(137, 219, 219, 219)
                    ),
                    child: SizedBox(
                      width: 365,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              
                              child: Image.network(
              
                                  url,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.network(
                                      "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png?20210219185637",
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.fill,
                                    );
                                  },
                                
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  ),
                            ),
                        
                            const SizedBox(height: 8,),

                            Text(news,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                            ),

                            Text(DateFormat.MMMMEEEEd().format(time),
                               style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                               ),)
                            
                          ],
                        ),
                      ),
                    ),
                  ),
    );
  }
}