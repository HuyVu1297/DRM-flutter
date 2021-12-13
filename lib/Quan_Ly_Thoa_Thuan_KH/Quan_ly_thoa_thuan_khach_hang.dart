import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
                                              onTap: () {},
                                            ),
                                          ],
                                        ),
                                        Visibility(
                                          visible: isReview,
                                          child: Container(
                                            height: 280,
                                            child: ListView.builder(
                                                itemCount: keHoachChuaThoaThuan[index].dsChuThoaThuan.length,
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
                                                                Text('${keHoachChuaThoaThuan[index].dsChuThoaThuan[kHANG].tENKHACHHANG}',
                                                                    style: TextStyle(
                                                                      fontFamily: ".SF UI Display",
                                                                      color: Colors.black,
                                                                      fontSize: 18.0,
                                                                      fontWeight: FontWeight.bold,)
                                                                ),
                                                                SizedBox(height: 6,),
                                                                Text('${keHoachChuaThoaThuan[index].dsChuThoaThuan[kHANG].mAKHANG}',
                                                                  style: TextStyle(
                                                                    fontFamily: ".SF UI Display",
                                                                    color: Colors.black,
                                                                    fontSize: 16.0,
                                                                    fontWeight: FontWeight.w900,),
                                                                ),
                                                                SizedBox(height: 6,),
                                                                Text('${keHoachChuaThoaThuan[index].dsChuThoaThuan[kHANG].dIACHI}',
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
                                                                  onTap: () {},
                                                                ),
                                                                SizedBox(height: 15,),
                                                                InkWell(
                                                                  child: Icon(
                                                                      Icons.cancel,
                                                                      color: Colors.red,
                                                                      size: 35),
                                                                  onTap: () {},
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
      print(dsTT[0].dsChuThoaThuan[0].tENKHACHHANG);
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
}