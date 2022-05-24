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
  
  void getData() async{

    var data = await  http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));

    var jsonData =json.decode(data.body);
    
  @override
  Widget build(BuildContext context) {

        return Container(
          child: FutureBuilder(builder: (BuildContext context, AsyncSnapshot snapshot){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
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
              },
            ),
        );
          }
    }
      @override
       Widget build(BuildContext context) {
        return Container();
      }
      }
class Users{
  String name;
  String username;
  String email;
  List<Address> address;

  Users({required this.name, required this.username, required this.email, required this.address});

  Users.fromJson(Map<String, dynamic> usersJson)
  : name = usersJson['name'],
  username = usersJson['username'],
  email = usersJson['email'],
  address = List.from(usersJson['address'])
  .map((address) => Address.fromJson(address)).toList();
}
class Address{
  String street;
  String suite;
  String city;
  String zipcode;
  Company company;

  Address.fromJson(Map<String, dynamic> addressJson)
  :street =addressJson['street'],
   suite = addressJson['suite'],
   city = addressJson['city'],
   zipcode = addressJson['zipcode'],
   company = Company.fromJson(addressJson['company']);
}
class Company{
  String name;
  String catchPhrase;
  String bs;

  Company.fromJson(Map<String, dynamic> companyJson)
  :name = companyJson['name'],
   catchPhrase = companyJson['catchPhrase'],
   bs = companyJson['bs'];
}