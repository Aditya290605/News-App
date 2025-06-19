import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecentNews extends StatelessWidget {

  final String imageUrl;
  final String title;
  final String description;
  final String publish;


  const RecentNews({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.publish});

  @override
  Widget build(BuildContext context) {

    final time = DateTime.parse(publish);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        
        height: 150,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.grey,Colors.white],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft),
          color: const Color.fromARGB(255, 228, 228, 228),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [

           Container(
            decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 239, 239, 239)
          ),
              
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network('https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png?20210219185637',
                  width: 200,);
                },
                height: 200,
                width: 150,
                fit: BoxFit.fill,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                
                width: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    ),

                  

                    Text(DateFormat.MMMMEEEEd().format(time),
                    style: const TextStyle(
                     fontSize: 12,
                     fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}