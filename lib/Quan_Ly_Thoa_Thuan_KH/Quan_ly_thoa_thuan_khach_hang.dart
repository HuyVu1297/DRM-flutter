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
    getThoaThuanChuaDuyet();
  }

  List<DsChuaThoaThuan> keHoachChuaThoaThuan = List<DsChuaThoaThuan>.empty(
      growable: true);
  List<void> dsKhachHang = List<void>.empty(growable: true);

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
                    child: keHoachChuaThoaThuan == null ? Center(
                        child: Text('Chưa có thỏa thuận')) : ListView
                        .builder(
                        padding: EdgeInsets.all(5),
                        itemCount: keHoachChuaThoaThuan.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Colors.purple, Colors.red],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24))
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: <Widget>[
                                            Icon(Icons.cases,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                            SizedBox(width: 8,),
                                            Text("${keHoachChuaThoaThuan
                                                .toList()}")
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
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
  Future<DsChuaThoaThuan> getThoaThuanChuaDuyet() async {
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
      var ds = listKHANG['ds'] as List;
      print(ds);
      return null;
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
  static List<DsChuaThoaThuan> parseds(String responseBodyDs) {
    var list = json.decode(responseBodyDs) as List<dynamic>;
    List<DsChuaThoaThuan> postDs = list.map((model) =>
        DsChuaThoaThuan.fromJson(model)).toList();
    return postDs;
  }
}