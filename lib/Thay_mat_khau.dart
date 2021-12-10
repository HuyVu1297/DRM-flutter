import 'dart:convert';
import 'dart:core';
import 'package:drappnpc/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Data/Data.dart';

class PasswordChangePage extends StatefulWidget {
  @override
  _PasswordChangePageState createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {
  bool isHiddenPass = true;
  bool isHiddenPassNew = true;
  var passwordOld = TextEditingController();
  var passwordConfirm = TextEditingController();
  var passwordNew = TextEditingController();
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Thay đổi mật khẩu của khách hàng"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(top: 10, left: 10, right: 5, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                            color: Colors.grey,
                            width: 2
                        )
                    ),
                    child: Column(
                      children: [
                        Text('Thay đổi thông tin tài khoản:',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: ".SF UI Display",
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            Text('Tên công ty mới: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: ".SF UI Display",
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2,),
                            TextField(
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: ".SF UI Display",
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                              ),
                              cursorColor: Colors.deepOrangeAccent,
                              decoration: InputDecoration(
                                  hintText: 'Nhập tên công ty mới',
                                  contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2)
                                  )
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            Text('Số điện thoại mới: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: ".SF UI Display",
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3,),
                            TextField(
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: ".SF UI Display",
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                              ),
                              cursorColor: Colors.deepOrangeAccent,
                              decoration: InputDecoration(
                                  hintText: 'Nhập số điện thoại công ty mới',
                                  contentPadding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2)
                                  )
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            Text('Email mới: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: ".SF UI Display",
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3,),
                            TextField(
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: ".SF UI Display",
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                              ),
                              cursorColor: Colors.deepOrangeAccent,
                              decoration: InputDecoration(
                                  hintText: 'Nhập địa chỉ Email mới',
                                  contentPadding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2)
                                  )
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                      color: Colors.deepOrangeAccent,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent)
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      duration: Duration(seconds: 3),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25)
                                      ),
                                      backgroundColor: Colors.deepOrangeAccent,
                                      content: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Thông tin người dùng đã được thay đổi",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: ".SF UI Display",
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )));
                            },
                            child: Center(
                              child: Text('Thay Đổi Thông Tin Tài Khoản',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: ".SF UI Display",
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  ),
//==========================================================================================================================================================================================================================
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(top: 10, left: 10, right: 5, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                            color: Colors.grey,
                            width: 2
                        )
                    ),
                    child: Column(
                      children: [
                        Text('Thay đổi mật khẩu tài khoản:',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: ".SF UI Display",
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Theme(
                          data: Theme.of(context).copyWith(
                              primaryColor: Colors.deepOrangeAccent
                          ),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: ".SF UI Display",
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                            ),
                            obscureText: isHiddenPass,
                            controller: passwordOld,
                            cursorColor: Colors.deepOrangeAccent,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.vpn_key_rounded),
                                suffixIcon: InkWell(
                                    onTap: _togglePasswordView,
                                    child: Icon(isHiddenPass ? Icons.visibility : Icons.visibility_off)),
                                fillColor: Colors.deepOrangeAccent,
                                hintText: 'Mật khẩu cũ',
                                contentPadding: EdgeInsets.fromLTRB(0, 15, 10, 0),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2)
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: ".SF UI Display",
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300,
                          ),
                          obscureText: isHiddenPassNew,
                          controller: passwordNew,
                          cursorColor: Colors.deepOrangeAccent,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key_rounded),
                              suffixIcon: InkWell(
                                  onTap: _togglePasswordNewView,
                                  child: Icon(isHiddenPassNew ? Icons.visibility : Icons.visibility_off)),
                              fillColor: Colors.deepOrangeAccent,
                              hintText: 'Mật khẩu mới',
                              contentPadding: EdgeInsets.fromLTRB(0, 15, 10, 0),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2)
                              )
                          ),
                        ),
                        SizedBox(height: 5,),
                        TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: ".SF UI Display",
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300,
                          ),
                          obscureText: true,
                          controller: passwordConfirm,
                          cursorColor: Colors.deepOrangeAccent,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key_rounded),
                              fillColor: Colors.deepOrangeAccent,
                              hintText: 'Nhập lại mật khẩu mới',
                              contentPadding: EdgeInsets.fromLTRB(0, 15, 10, 0),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2)
                              )
                          ),
                        ),
                        SizedBox(height: 30,),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                      color: Colors.deepOrangeAccent,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent)
                            ),
                            onPressed: () {
                              changePass();
                            },
                            child: Center(
                              child: Text('Thay Đổi Mật Khẩu',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: ".SF UI Display",
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
//=====================================================================================================================================================================================================================================
// API ĐỔI MẬT KHẨU
  // ignore: missing_return
  Future<CPD> changePass() async {
    if (passwordNew.text.isNotEmpty && passwordOld.text.isNotEmpty && passwordConfirm.text.isNotEmpty) {
      if (passwordConfirm.text == passwordNew.text) {
        Map<String, String> headers = {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": globalUserData.tOKEN,
        };
        final detailPass = jsonEncode({
          "USERNAME": "${globalUserData.uSERNAME}",
          "PASSWORD_OLD": passwordOld.text,
          "PASSWORD_NEW": passwordNew.text,
          "Loai": customerAcc,
        });
        var response = await http.post(
          Uri.parse("http://10.21.50.104:8086/User/Mobile_Update_User"),
          body: detailPass,
          headers: headers,
        );
        if (response.statusCode == 200) {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),
          );
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  backgroundColor: Colors.deepOrangeAccent,
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.vpn_key_rounded, color: Colors.white,),
                      SizedBox(width: 10),
                      Text("Đăng nhập lại với mật khẩu mới",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: ".SF UI Display",
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
              )
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  backgroundColor: Colors.deepOrangeAccent,
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.vpn_key_rounded, color: Colors.white,),
                      SizedBox(width: 10),
                      Text("Không đổi được mật khẩu",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: ".SF UI Display",
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
              )
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                behavior: SnackBarBehavior.floating,
                duration: Duration(seconds: 3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
                backgroundColor: Colors.deepOrangeAccent,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.vpn_key_rounded, color: Colors.white,),
                    SizedBox(width: 10),
                    Text("Mật khẩu mới và xác nhận mật khẩu mới không trùng nhau",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: ".SF UI Display",
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
            )
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
              ),
              backgroundColor: Colors.deepOrangeAccent,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Không được bỏ trống mật khẩu",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: ".SF UI Display",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
          )
      );
    }
  }
//=====================================================================================================================================================================================================================================
  void _togglePasswordView() {
    setState(() {
      isHiddenPass = !isHiddenPass;
    });
  }
  void _togglePasswordNewView() {
    setState(() {
      isHiddenPassNew = !isHiddenPassNew;
    });
  }
}