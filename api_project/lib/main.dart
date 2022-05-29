import 'dart:convert';
import 'dart:core';
import 'package:api_project/list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() => runApp(MaterialApp(
  home: Screen(),
  debugShowCheckedModeBanner: false,
));
class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<Users> _list = [];
  var loading = false;
  Future<Null> _fetchData() async{
    setState(() {
      loading = true;
    });
    final response = await http.get(Uri.https("jsonplaceholder.typicode.com","users"));
    if (response.statusCode == 200){
      final data = jsonDecode(response.body);
      setState(() {
        for (Map  i in data){
          _list.add(Users.fromJson(i));
        }
        loading =false;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 2.0),
      body: Container(
        child: ListView.builder(
          itemCount:_list.length,
          itemBuilder: ((context, i){
          final a = _list[i];
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(a.name),
                Text(a.username),
                Text(a.email),
                Text(a.phone),
                SizedBox(
                  height: 5.0,
                ),
                Text("Address",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),

                Text(a.address.street),
                Text(a.address.suite),
                Text(a.address.city),
  
                SizedBox(
                  height: 5,
                ),

                Text(
                  "Company",
                  style: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.bold
                  ),),

                  Text(a.company.name),
                
              ],
            ),
          );
        }),

      ),
    ),
    );
    
  }
}