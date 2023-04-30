import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Model/PostsModel.dart';


class HomScreen extends StatefulWidget {
  const HomScreen({Key? key}) : super(key: key);

  @override
  State<HomScreen> createState() => _HomScreenState();
}

class _HomScreenState extends State<HomScreen> {

  List<PostsModel> postList = [];
  Future<List<PostsModel>> getPostApi () async{

    final resposne = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var data = jsonDecode(resposne.body.toString());
    if(resposne.statusCode == 200){

      for(Map i in data){
        postList.add(PostsModel.fromJson(i));

      }

      return postList;

    }else{
      
      return postList;

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('api data'),
      ),
      body: Column(
        children: [
          
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot){

                if(!snapshot.hasData){
                  return Text("not comming");

                }else{
                  
                  return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index){

                    return Text(postList[index].title.toString());

                  });

                }

            },
            ),
          )

        ],
      ),
    );
  }
}
