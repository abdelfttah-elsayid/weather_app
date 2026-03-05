import 'package:flutter/material.dart';
import 'package:wheather_app/views/searchView.dart' show Searchview;

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // نخلي النص كله في منتصف الشاشة
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // لمحاذاة عمودي
          children: [
            const Text(
              'There is no data to show it 😞',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 10), // مسافة بين النصوص
            Center(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [ Text(
                  'search now',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                 IconButton(
                   onPressed: () {
                     Navigator.of(context).
                     push(MaterialPageRoute(builder: (context){
                       return Searchview();
                     },),);
                   },
                   icon: const Icon(Icons.search, color: Colors.black,
                   size: 32,),
                 ),
               ],

              ),
            )


          ],
        ),
      ),
    );
  }
}
