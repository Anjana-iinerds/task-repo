import 'package:flutter/material.dart';
import 'package:api_project/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:api_project/views/register.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Body extends StatefulWidget {
  const Body({super.key});
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification notification = message.notification as RemoteNotification;
    AndroidNotification android = message.notification?.android as AndroidNotification;
    if(notification != null && android != null){
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
         notification.title, 
         notification.body, 
         NotificationDetails(android: AndroidNotificationDetails(
           channel.id,
           channel.name,
           color: Colors.blue,
           playSound: true,
           icon: '@mipmap/ic_launcher',
         ),
         )
         );
    }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new event was published');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if(notification != null && android != null){
        showDialog(context: context, builder: (_){
          return AlertDialog(
            title: Text(notification.title as String),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(notification.body as String)
                ],
              )
              ),
          );
        }
        );
      }
    });
  }
  void showNotification(){
    flutterLocalNotificationsPlugin.show(0, 'Running', 'Welcome Succesfully Registered',NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        importance: Importance.high,
        color: Colors.blue,
        playSound: true,
        icon: '@mipmap/ic_launcher'

      )
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions:[
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Registerpage()),);
              },
              child: Text('Signup',
              style: TextStyle(color: Colors.deepPurple),),
            ),   ],
          title:Text("Have an Account?",
          style: TextStyle(color: Colors.black,fontSize: 13),
          ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height *0.9,
    // ignore: sized_box_for_whitespace
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Welcome To AOT",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          height: 3,
        ),
        ),
        Text("Complete the registration here by entering your details",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'E-mail',
              hintText: 'example@gmail.com',
              suffixIcon: Icon(Icons.mail)
            ),
          ),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: '6+ strong character',
              suffixIcon: Icon(Icons.lock)
            ),
          ),
        ),

        SizedBox(height: 50,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(onPressed: showNotification,
          height: 55,
          minWidth: 790,
          color: Colors.deepPurple[600],
          child: Text('Sign in',
          style: TextStyle(color: Colors.white,fontSize: 20),
          
          )
          ),
        ),

        SizedBox(height: 30,),
        
        Text(' Or Sign in With',
        style: TextStyle(
          fontSize: 12
        ),
        ),

        SizedBox(height: 15,),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: FaIcon(FontAwesomeIcons.google,size: 25,color: Colors.blue),
                ),
                SizedBox(width: 58,),

                GestureDetector(
                  onTap: () {},
                  child: FaIcon(FontAwesomeIcons.facebook,size: 25,color: Colors.blue[900],),
                ),
                SizedBox(width: 58,),
                GestureDetector(
                  onTap: () {},
                  child: FaIcon(FontAwesomeIcons.apple,size: 30,),
                ),                
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