import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class RealtimeData extends StatelessWidget {
   RealtimeData ({super.key});
  final ref = FirebaseDatabase.instance.ref("walk&win");
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(

body: Column(


  children: [


    Expanded(child: FirebaseAnimatedList(query: ref, itemBuilder: (context, snapshot, animation, index) {
      return Card(
        child: ListTile(
                 title: Text(snapshot.child("title").value.toString()),
               
                 subtitle: Text(snapshot.child("id").value.toString()),

                
                 
        ),
      );
    }))
  ],
),

    );
    

  }
  
}