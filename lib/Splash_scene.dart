import 'dart:core';
import 'package:drappnpc/Login.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/electrical.png")
          )
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              height: 600,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/EVNNPC.png"))),),
                      SizedBox(height: 5,),
                      Text("Quản Lý Kế Hoạch Sử Dụng Điện",
                        style: TextStyle(
                          fontFamily: ".SF UI Display",
                          color: Color(0XFF0B00A6),
                          fontSize: 28.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text("",
                        style: TextStyle(
                          fontFamily: ".SF UI Display",
                          color: Color(0XFF0B00A6),
                          fontSize: 28.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 40,),
                      Text("Hãy đăng nhập để tiếp tục",
                        style: TextStyle(
                          fontFamily: ".SF UI Display",
                          color: Colors.black54,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),),
                      SizedBox(height: 10,),
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
                        ),
                        icon: const Icon(Icons.login, size: 20,),
                        label: const Text('Đăng Nhập',
                          style: TextStyle(
                            fontFamily: ".SF UI Display",
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                      )
                    ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}