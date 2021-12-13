import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:drappnpc/Data/Data.dart';
import 'dart:core';

class QLThoaThuanKHPage extends StatefulWidget {
  @override
  _QLThoaThuanKHPageState createState() => _QLThoaThuanKHPageState();
}

class _QLThoaThuanKHPageState extends State<QLThoaThuanKHPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getThoaThuanChuaDuyet().then((datadschuaduyet) {
      setState(() {
        keHoachChuaThoaThuan = datadschuaduyet;
      });
    });
  }

  List<DsChuaThoaThuan> keHoachChuaThoaThuan = List<DsChuaThoaThuan>.empty(growable: true);
  // ignore: non_constant_identifier_names
  int iDKHANG_Dangky = 0;
  bool isReview = false;
  double height = 300;
  void _toggleReview() {
    setState(() {
      isReview = !isReview;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Danh sách thỏa thuận khách hàng"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Expanded(
                    child: keHoachChuaThoaThuan == null ? Center(child: Text('Chưa có thỏa thuận')) : ListView.builder(
                        shrinkWrap: true,
                        itemCount: keHoachChuaThoaThuan.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 15, left: 10, bottom: 15, right: 10),
                                    // height: isReview ? 350 : 80,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Colors.purple, Colors.red],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(30))
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: _toggleReview,
                                              child: Icon(
                                                Icons.list_alt_rounded,
                                                color: Colors.white,
                                                size: 45)
                                            ),
                                            SizedBox(width: 8,),
                                            Text("${keHoachChuaThoaThuan[index].nOIDUNG}",  //Text("${keHoachChuaThoaThuan[index].dsChuThoaThuan[0].tENKHACHHANG}")
                                                style: TextStyle(
                                                  fontFamily: ".SF UI Display",
                                                  color: Colors.white,
                                                  fontSize: 19.0,
                                                  fontWeight: FontWeight.bold,)
                                            ),
                                            SizedBox(width: 30,),
                                            InkWell(
                                              child: Icon(
                                                  Icons.playlist_add_check_rounded,
                                                  color: Colors.white,
                                                  size: 45),
                                              onTap: () {
                                                setState(() {
                                                  globalDsChuaThoaThuan = new DsChuaThoaThuan();
                                                  globalDsChuaThoaThuan.iDKH = keHoachChuaThoaThuan[index].iDKH;
                                                });
                                                xacNhanThoaThuanList();
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                        Visibility(
                                          visible: isReview,
                                          child: Container(
                                            height: 280,
                                            child: ListView.builder(
                                                itemCount: keHoachChuaThoaThuan[index].dsChuaThoaThuan.length,
                                                itemBuilder: (context, kHANG) {
                                                  return Card(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(30.0)
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 5),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: <Widget> [
                                                          Flexible(
                                                            flex: 2,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                SizedBox(height: 5,),
                                                                Text('${keHoachChuaThoaThuan[index].dsChuaThoaThuan[kHANG].tENKHACHHANG}',
                                                                    style: TextStyle(
                                                                      fontFamily: ".SF UI Display",
                                                                      color: Colors.black,
                                                                      fontSize: 18.0,
                                                                      fontWeight: FontWeight.bold,)
                                                                ),
                                                                SizedBox(height: 6,),
                                                                Text('${keHoachChuaThoaThuan[index].dsChuaThoaThuan[kHANG].mAKHANG}',
                                                                  style: TextStyle(
                                                                    fontFamily: ".SF UI Display",
                                                                    color: Colors.black,
                                                                    fontSize: 16.0,
                                                                    fontWeight: FontWeight.w900,),
                                                                ),
                                                                SizedBox(height: 6,),
                                                                Text('${keHoachChuaThoaThuan[index].dsChuaThoaThuan[kHANG].dIACHI}',
                                                                    overflow: TextOverflow.clip,
                                                                    style: TextStyle(
                                                                      fontFamily: ".SF UI Display",
                                                                      color: Colors.black,
                                                                      fontSize: 16.0,
                                                                      fontWeight: FontWeight.w400,)
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets.only(right: 10, left: 10),
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                InkWell(
                                                                  child: Icon(
                                                                        Icons.check,
                                                                        color: Colors.green,
                                                                        size: 35),
                                                                  onTap: () {
                                                                    setState(() {
                                                                      iDKHANG_Dangky = keHoachChuaThoaThuan[index].dsChuaThoaThuan[kHANG].iDDANGKY;
                                                                    });
                                                                    xacNhanThoaThuan();
                                                                    Navigator.pop(context);
                                                                  },
                                                                ),
                                                                SizedBox(height: 15,),
                                                                InkWell(
                                                                  child: Icon(
                                                                      Icons.cancel,
                                                                      color: Colors.red,
                                                                      size: 35),
                                                                  onTap: () {
                                                                    setState(() {
                                                                      iDKHANG_Dangky = keHoachChuaThoaThuan[index].dsChuaThoaThuan[kHANG].iDDANGKY;
                                                                    });
                                                                    khongXacNhanThoaThuan();
                                                                    Navigator.pop(context);
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                          );
                        }
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
//=====================================================================================================================================================================================================================================
// Danh Sách Khách Hàng Chưa Duyệt
  // ignore: missing_return
  Future<List<DsChuaThoaThuan>> getThoaThuanChuaDuyet() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": globalUserData.tOKEN,
    };
    var response = await http.get(Uri.parse(
        "http://10.21.50.104:8086/ThoaThuanKH/Mobile_DanhSachThoaThuanKhachHang_ChuaDuyet_byIDDonVi?MA_DVIQLY=${globalUserData
            .mADVIQLY}"),
        headers: headers
    );
    if (response.statusCode == 200) {
      var listKHANG = jsonDecode(response.body);
      var list1 = listKHANG as List;
      // DsChuaThoaThuan dsChuaThoaThuan = new DsChuaThoaThuan.fromJson(listKHANG);
      List<DsChuaThoaThuan> dsTT = list1.map((e) => DsChuaThoaThuan.fromJson(e)).toList();
      print(dsTT[0].dsChuaThoaThuan[0].tENKHACHHANG);
      keHoachChuaThoaThuan = dsTT;
      return dsTT;
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
                  Text("Không lấy được danh sách",
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
// Xác Nhận 1 Khách Hàng
  Future<void> xacNhanThoaThuan() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": globalUserData.tOKEN,
    };
    final xacnhan = jsonEncode({
      "IDDANGKY": "$iDKHANG_Dangky"
    });
    var response = await http.post(Uri.parse(
        "http://10.21.50.104:8086/ThoaThuanKH/Mobile_DuyetKHangThoaThuan_XacNhan"),
        headers: headers,
        body: xacnhan
    );
    if (response.statusCode == 200) {
      var serverXacNhan = jsonDecode(response.body);
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
                  Text("Đã duyệt khách hàng xác nhận tham gia",
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
      return serverXacNhan;
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
                  Text("Lỗi Hệ Thống Chưa Xác Nhận Duyệt",
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
// Không Xác Nhận 1 Khách Hàng
  Future<void> khongXacNhanThoaThuan() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": globalUserData.tOKEN,
    };
    final koxacnhan = jsonEncode({
      "IDDANGKY": "$iDKHANG_Dangky"
    });
    var response = await http.post(Uri.parse(
        "http://10.21.50.104:8086/ThoaThuanKH/Mobile_DuyetKHangThoaThuan_KhongXacNhan"),
        headers: headers,
        body: koxacnhan
    );
    if (response.statusCode == 200) {
      var serverKoXacNhan = jsonDecode(response.body);
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
                  Text("Đã duyệt khách hàng xác nhận không tham gia",
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
      return serverKoXacNhan;
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
                  Text("Lỗi Hệ Thống Chưa Xác Nhận Không Duyệt",
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
// Xác Nhận List Khách Hàng
  Future<void> xacNhanThoaThuanList() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": globalUserData.tOKEN,
    };
    final xacnhanlist = jsonEncode({
      "MA_DVQLY": "${globalUserData.mADVIQLY}",
      "IDKH": "${globalDsChuaThoaThuan.iDKH}"
    });
    var response = await http.post(Uri.parse(
        "http://10.21.50.104:8086/ThoaThuanKH/Mobile_DuyetKHangThoaThuan_XacNhan"),
        headers: headers,
        body: xacnhanlist
    );
    if (response.statusCode == 200) {
      var serverXacNhanList = jsonDecode(response.body);
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
                  Text("Đã duyệt tất cả khách hàng xác nhận tham gia",
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
      return serverXacNhanList;
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
                  Text("Lỗi Hệ Thống Chưa Xác Nhận Duyệt Danh Sách",
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
}