import 'dart:convert';
import 'dart:core';
import 'package:drappnpc/Data/Data.dart';
import 'package:drappnpc/Login.dart';
import 'package:drappnpc/Thay_mat_khau.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'Quan_Ly_Thoa_Thuan_KH/Quan_ly_thoa_thuan_khach_hang.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  final support_number = 19006769;
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Trang Chủ',
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40,),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profile.png')
              ),
              borderRadius: BorderRadius.circular(50)
            ),
          ),
          SizedBox(height: 20),
          Text("${globalUserData.hOTEN}",
              style: TextStyle(
                fontFamily: ".SF UI Display",
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,)),
          SizedBox(height: 5,),
          Text('Mã khách hàng',
              style: TextStyle(
                fontFamily: ".SF UI Display",
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w400,)),
          SizedBox(height: 30,),
          Wrap(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Icon(Icons.location_on, size: 20, color: Colors.redAccent,),
                      SizedBox(width: 10,),
                      Text('${globalUserData.dIACHI}',
                          style: TextStyle(
                            fontFamily: ".SF UI Display",
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,))
                    ],),
                  SizedBox(height: 10,),
                  Wrap(
                    children: [
                      Icon(Icons.phone, size: 20, color: Colors.redAccent,),
                      SizedBox(width: 10,),
                      Text('${globalUserData.sDT}',
                          style: TextStyle(
                            fontFamily: ".SF UI Display",
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,))
                    ],),
                  SizedBox(height: 10,),
                  Wrap(
                    children: [
                      Icon(Icons.mail, size: 20, color: Colors.redAccent,),
                      SizedBox(width: 10,),
                      Text('${globalUserData.eMAIL}',
                          style: TextStyle(
                            fontFamily: ".SF UI Display",
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,))
                    ],),
                ],
              )
            ],
          ),
          SizedBox(height: 40,),
          Wrap(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(top: 10, left: 10, right: 5, bottom: 10),
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2
                      )
                    ),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('24',
                                style: TextStyle(
                                  fontFamily: ".SF UI Display",
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,)
                            ),
                            SizedBox(height: 5),
                            Text('Đã Tham Gia',
                                style: TextStyle(
                                  fontFamily: ".SF UI Display",
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,)
                            )
                          ],
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(top: 10, left: 5, right: 10, bottom: 10),
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.grey,
                          width: 2
                      ),
                    ),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('100',
                                style: TextStyle(
                                  fontFamily: ".SF UI Display",
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,)
                            ),
                            SizedBox(height: 5),
                            Text('Chưa Tham Gia',
                                style: TextStyle(
                                  fontFamily: ".SF UI Display",
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,)
                            )
                          ],
                        )),
                  ),
                ]
              )
            ]
          )
        ],
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(
                        color: Colors.grey,
                        width: 2
                    )
                ),
                height: 260,
                child: DrawerHeader(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 5),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image: AssetImage("assets/images/profile.png"),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("${globalUserData.hOTEN}",
                              style: TextStyle(
                            fontFamily: ".SF UI Display",
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,)),
                          SizedBox(height: 5),
                          Text("Mã Khách Hàng",
                              style: TextStyle(
                            fontFamily: ".SF UI Display",
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,)),
                          SizedBox(height: 15,),
                          Wrap(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    children: [
                                      Icon(Icons.location_on, size: 18, color: Colors.redAccent,),
                                      SizedBox(width: 10,),
                                      Text('${globalUserData.dIACHI}',
                                          style: TextStyle(
                                            fontFamily: ".SF UI Display",
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,))
                                    ],),
                                  SizedBox(height: 5,),
                                  Wrap(
                                    children: [
                                      Icon(Icons.phone, size: 18, color: Colors.redAccent,),
                                      SizedBox(width: 10,),
                                      Text('${globalUserData.sDT}',
                                          style: TextStyle(
                                            fontFamily: ".SF UI Display",
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,))
                                    ],),
                                  SizedBox(height: 5,),
                                  Wrap(
                                    children: [
                                      Icon(Icons.mail, size: 18, color: Colors.redAccent,),
                                      SizedBox(width: 10,),
                                      Text('${globalUserData.eMAIL}',
                                          style: TextStyle(
                                            fontFamily: ".SF UI Display",
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,))
                                    ],),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                ),
              ),
              customerAcc ? Container() : new ListTile(
                leading: Icon(Icons.list_alt_rounded, size: 30,),
                title: Text("Quản Lý Thỏa Thuận Khách Hàng",
                  style: TextStyle(
                    fontFamily: ".SF UI Display",
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QLThoaThuanKHPage()));
                },
              ),
              ListTile(
                  leading: Icon(Icons.support_agent, size: 30,),
                  title: Text("Hỗ Trợ",
                    style: TextStyle(
                    fontFamily: ".SF UI Display",
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,),),
                  onTap: () async {
                    launch('tel://$support_number');
                    Navigator.pop(context);
                  }
              ),
              ListTile(
                  leading: Icon(Icons.edit, size: 30,),
                  title: Text("Đổi Thông Tin Tài Khoản",
                    style: TextStyle(
                    fontFamily: ".SF UI Display",
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordChangePage()));
                  }
              ),
              ListTile(
                  leading: Icon(Icons.logout, size: 30,),
                  title: Text("Đăng Xuất",
                    style: TextStyle(
                    fontFamily: ".SF UI Display",
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  }
                  ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Khách Hàng Gì Gì Đó"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        color: Colors.white,
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Expanded(
              flex: 1,
              child: _widgetOptions.elementAt(_selectedIndex),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Trang Chủ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: "Thư Mời",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}