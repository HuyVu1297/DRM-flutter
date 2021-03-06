import 'dart:core';
import 'dart:ui';
import 'package:drappnpc/Data_and_config/Data.dart';
import 'package:drappnpc/Login.dart';
import 'package:drappnpc/Quan_Ly_Thoa_Thuan_KH/Danh_sach_thoa_thuan_KH.dart';
import 'package:drappnpc/Thay_mat_khau.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Khach_hang_dang_ky_chi_so/Khach_hang_tu_dang_ky_chi_so.dart';
import 'Quan_Ly_Ke_Hoach_Phan_Bo_Cap_3/Danh_sach_KH_Phan_Bo_Cap_3_Da_Duyet.dart';
import 'Quan_Ly_Ke_Hoach_Phan_Bo_Cap_3/Quan_ly_danh_sach_phan_bo_cap_3.dart';
import 'Quan_Ly_Ke_Hoach_Phan_Bo_Cap_4/Danh_sach_KH_Phan_Bo_Cap_4_Da_Duyet.dart';
import 'Quan_Ly_Ke_Hoach_Phan_Bo_Cap_4/Quan_ly_ke_hoach_phan_bo_cap_4_gd.dart';
import 'Quan_Ly_Thoa_Thuan_KH/Quan_ly_thoa_thuan_khach_hang.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  final supportNumber = 19006769;
  final supportTechNumber = 0988791188;
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Widget> _widgetOptions = <Widget>[
      SafeArea(
        child: Scaffold(
          drawer: Drawer(
            child: Container(
              color: Colors.white,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 0),
                    height: 280,
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
                              Text("",
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
                  Divider(
                    thickness: 1.0,
                    indent: 20.0,
                    endIndent: 20.0,
                    color: Colors.deepOrangeAccent,
                  ),
                  SizedBox(height: 5),
                  customerAcc ? Container() : new ListTile(
                    leading: Icon(Icons.list_alt_rounded, size: 30, color: Colors.deepOrangeAccent,),
                    title: Text("Qua??n Ly?? Tho??a Thu????n Kha??ch Ha??ng",
                      style: TextStyle(
                        fontFamily: ".SF UI Display",
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,),),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QLThoaThuanKHPage()));
                    },
                  ),
                  (globalUserData.nHOMQUYEN == 2 || globalUserData.nHOMQUYEN == 3) ? new ListTile(
                    leading: Icon(Icons.list_alt_rounded, size: 30, color: Colors.deepOrangeAccent),
                    title: Text("Qua??n Ly?? K???? Hoa??ch Ph??n B????",
                      style: TextStyle(
                        fontFamily: ".SF UI Display",
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,),),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QLKHPhanBoCap3ChuaDuyetPage()));
                    },
                  ) : Container(),
                  (globalUserData.nHOMQUYEN == 1 || globalUserData.nHOMQUYEN == 16) ? new ListTile(
                    leading: Icon(Icons.list_alt_rounded, size: 30, color: Colors.deepOrangeAccent),
                    title: Text("Qua??n Ly?? K???? Hoa??ch Ph??n B???? C????p 4",
                      style: TextStyle(
                        fontFamily: ".SF UI Display",
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,),),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QLKHPhanBoCap4ChuaDuyetGDPage()));
                    },
                  ) : Container(),
                  (globalUserData.nHOMQUYEN == 0) ? new ListTile(
                    leading: Icon(Icons.edit_road_outlined, size: 30, color: Colors.deepOrangeAccent),
                    title: Text("Kha??ch Ha??ng T???? Ph??n B???? K???? Hoa??ch",
                      style: TextStyle(
                        fontFamily: ".SF UI Display",
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,),),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => KhachHangDKChiSoPage()));
                    },
                  ) : Container(),
                  ListTile(
                      leading: Icon(Icons.support_agent, size: 30, color: Colors.deepOrangeAccent),
                      title: Text("T???ng ????i H???? Tr????",
                        style: TextStyle(
                          fontFamily: ".SF UI Display",
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,),),
                      onTap: () async {
                        launch('tel://$supportNumber');
                        Navigator.pop(context);
                      }
                  ),
                  ListTile(
                      leading: Icon(Icons.contact_support_rounded, size: 30, color: Colors.deepOrangeAccent),
                      title: Text("H???? Tr???? K??? Thu???t",
                        style: TextStyle(
                          fontFamily: ".SF UI Display",
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,),),
                      onTap: () async {
                        launch('tel://$supportTechNumber');
                        Navigator.pop(context);
                      }
                  ),
                  ListTile(
                    leading: Icon(Icons.email, size: 30, color: Colors.deepOrangeAccent),
                    title: Text("Email H??? Tr???: webmaster@npc.com.vn",
                      style: TextStyle(
                        fontFamily: ".SF UI Display",
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,),),
                  ),
                  ListTile(
                      leading: Icon(Icons.edit, size: 30, color: Colors.deepOrangeAccent),
                      title: Text("??????i Th??ng Tin Ta??i Khoa??n",
                        style: TextStyle(
                          fontFamily: ".SF UI Display",
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,),),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordChangePage()));
                      }
                  ),
                  SizedBox(height: 5),
                  Divider(
                    thickness: 1.0,
                    indent: 20.0,
                    endIndent: 20.0,
                    color: Colors.deepOrangeAccent,
                  ),
                  SizedBox(height: 5),
                  ListTile(
                      leading: Icon(Icons.logout, size: 30, color: Colors.deepOrangeAccent),
                      title: Text("????ng Xu????t",
                        style: TextStyle(
                          fontFamily: ".SF UI Display",
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,),),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      }
                  ),
                  SizedBox(height: 5),
                  ListTile(
                      leading: Icon(Icons.copyright, size: 30, color: Colors.deepOrangeAccent),
                      title: Text("B???n quy???n thu???c C??ng ty C??ng ngh??? th??ng tin ??i???n l???c mi???n B???c",
                        style: TextStyle(
                          fontFamily: ".SF UI Display",
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,),),
                  ),
                ],
              ),
            ),
          ),
          drawerEdgeDragWidth: MediaQuery.of(context).size.width,
          backgroundColor: Colors.deepOrangeAccent,
          body: Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  height: height/1.09,
                  width: width/0.9,
                  margin: EdgeInsets.only(top: 4, left: 2, right: 2, bottom: 2),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage("assets/images/background_main.png"),
                        fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                          color: Colors.deepOrangeAccent,
                          width: 2
                      )
                  ),
                  child: BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: height/25,),
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage('assets/images/logo_evn.png'),
                        ),
                        SizedBox(height: 15,),
                        Text("Trang Chu??",
                            style: TextStyle(
                              fontFamily: ".SF UI Display",
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        SizedBox(height: 15,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(
                                  color: Colors.blue,
                                  width: 0.5
                              )
                          ),
                          height: 170,
                          width: 360,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 15,),
                              Center(
                                child: Text("Ca??c ch????c n??ng chi??nh",
                                    style: TextStyle(
                                      fontFamily: ".SF UI Display",
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                      children: [
                                        InkWell(
                                          child: Icon(
                                              Icons.list_alt_outlined,
                                              color: Colors.deepOrangeAccent,
                                              size: 60),
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => DSThoaThuanKHPage()),
                                            );
                                          },
                                        ),
                                        SizedBox(height: 5,),
                                        Text("Danh Sa??ch Tho??a Thu????n",
                                            style: TextStyle(
                                              fontFamily: ".SF UI Display",
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            )
                                        )
                                      ]
                                  ),
                                  SizedBox(width: 30,),
                                  Column(
                                    children: [
                                      InkWell(
                                        child: Icon(
                                            Icons.assignment_rounded,
                                            color: Colors.deepOrangeAccent,
                                            size: 60),
                                        onTap: () {
                                          if (globalUserData.nHOMQUYEN == 3 || globalUserData.nHOMQUYEN == 2) {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => DanhSachKHPhanBoDaDuyetPage()),
                                            );
                                          } else if (globalUserData.nHOMQUYEN == 1 || globalUserData.nHOMQUYEN == 16) {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => QLKHPhanBoCap4DaDuyetGDPage()),
                                            );
                                          }
                                        },
                                      ),
                                      SizedBox(height: 5,),
                                      Text("Danh Sa??ch Ph??n B???? ??a?? Duy????t",
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontFamily: ".SF UI Display",
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          )
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
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
            Text('',
                style: TextStyle(
                  fontFamily: ".SF UI Display",
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,)),
            SizedBox(height: 10,),
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
                                  Text('??a?? Tham Gia',
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
                                  Text('Ch??a Tham Gia',
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
    return Scaffold(

      // appBar: AppBar(
      //   title: Text("H???? Th????ng Qua??n Ly?? K???? Hoa??ch S???? Du??ng ??i????n"),
      //   backgroundColor: Colors.deepOrangeAccent.shade200,
      //   elevation: 0,
      // ),
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
              label: "Trang Chu??",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Th??ng Tin T??i Kho???n",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}