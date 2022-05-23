import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class listpage extends StatefulWidget {
  const listpage({super.key});

  @override
  State<listpage> createState() => _listpageState();
}

class _listpageState extends State<listpage> {
  
  Future<List<User>> _getUsers() async{

    var data = await  http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));

    var jsonData =json.decode(data.body);

    List<User> users = [];
    for(var u in jsonData){
      User user =User(u['id'], u['name'], u['username'], u['email'], u['address'], u['phone'], u['website'],u['company']);
      users.add(user);
    }
    print(users.length);
    return users;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _getUsers(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    title: Text(snapshot.data[index].name),
                    leading:Text(snapshot.data[index].username),
                    trailing: Text(snapshot.data[index].email),
                    
                  ),
                ),
              );
          }
          );
        }
        ),
    );
  }
}
class User{
  final int id,phone;
  final String name;
  final String username;
  final String email;
  final String address;
  final String website;
  final String company;

  User(this.id, this.name, this.username, this.email, this.address, this.phone, this.website, this.company);
}

