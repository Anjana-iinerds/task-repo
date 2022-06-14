import 'dart:convert';
import 'package:api_project/list.dart';
import 'package:api_project/usersmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final List<Users> _list = [];
  var loading = false;
  Future<void> _fetchData() async{
    setState(() {
      loading = true;
    });
    final response = await http.get(Uri.https("jsonplaceholder.typicode.com","users"));
    if (response.statusCode == 200){
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data){
          _list.add(Users.fromJson(i as Map<String,dynamic>));
        }
        loading =false;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    _fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details'),),
       body: ChangeNotifierProvider(create: (context) => UsersModel(),
      child: Builder(builder: (context){
        final model =Provider.of<UsersModel>(context);
        if (model.newState == NewState.Loading){
          return Center( child: CircularProgressIndicator());
        }
        if (model.newState == NewState.Error){
          return Center( child: Text('An error occured ${model.message}'));
      }
      return Container(
          child: Center(
            child: ListView.builder(
              itemCount:_list.length,
              itemBuilder: (context, i){
              final a = _list[i];
              return Card(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(a.name),
                      Text(a.username),
                      Text(a.email),
                      Text(a.phone),
              
                      SizedBox(
                        height: 8.0,
                      ),
                      
                      Text("Address",
                      style: TextStyle(
                        fontSize: 16
                      ),
                      ),
              
                      Text(a.address.street),
                      Text(a.address.suite),
                      Text(a.address.city),
                
                      SizedBox(
                        height: 8,
                      ),
              
                      Text(
                        "Company",
                        style: TextStyle(
                          fontSize: 16
                        ),),
              
                        Text(a.company.name),
                      
                    ],
                  ),
                ),
              );
            }),
          ),

        );
      }
      ),
  
      ),
      
      );
    
  }
}