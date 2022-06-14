import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:drappnpc/Data_and_config/Data.dart';
import 'dart:core';

import '../Data_and_config/Config.dart';

class QLKHPhanBoCap3ChuaDuyetPage extends StatefulWidget {
  @override
  _QLKHPhanBoCap3ChuaDuyetPageState createState() => _QLKHPhanBoCap3ChuaDuyetPageState();
}

class _QLKHPhanBoCap3ChuaDuyetPageState extends State<QLKHPhanBoCap3ChuaDuyetPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDsPhanBoCap3ChuaDuyet().then((dataKHPhanBoCap3ChuaDuyet) {
      setState(() {
        keHoachPhanBoCap3ChuaDuyet = dataKHPhanBoCap3ChuaDuyet;
      });
    });
  }

  List<TextEditingController> inputlydo = new List<TextEditingController>.empty(growable: true);
  String lydo = "";
  List<DsPhanBoCap3ChuaDuyet> keHoachPhanBoCap3ChuaDuyet = List<DsPhanBoCap3ChuaDuyet>.empty(growable: true);
  // ignore: non_constant_identifier_names
  int idPB_Cap3 = 0;
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
        title: Text("Danh sách kế hoạch phân bổ chưa duyệt"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Expanded(
                    child: keHoachPhanBoCap3ChuaDuyet == null ? Center(child: Text('Chưa có thỏa thuận')) : ListView.builder(
                        shrinkWrap: true,
                        itemCount: keHoachPhanBoCap3ChuaDuyet.length,
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
                                            Text("${keHoachPhanBoCap3ChuaDuyet[index].nOIDUNG}",  //Text("${keHoachChuaThoaThuan[index].dsChuThoaThuan[0].tENKHACHHANG}")
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
                                                // setState(() {
                                                //   globalDsChuaThoaThuan = new DsChuaThoaThuan();
                                                //   globalDsChuaThoaThuan.iDKH = keHoachPhanBoCap3ChuaDuyet[index].iDKH;
                                                // });
                                                // xacNhanThoaThuanList();
                                                // Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                        Visibility(
                                          visible: isReview,
                                          child: Container(
                                            height: 280,
                                            child: ListView.builder(
                                                itemCount: keHoachPhanBoCap3ChuaDuyet[index].pbChuaDuyet.length,
                                                itemBuilder: (context, kHANG) {
                                                  inputlydo.add(new TextEditingController());
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
                                                                Text('Mã dịch vụ quản lý: ${keHoachPhanBoCap3ChuaDuyet[index].pbChuaDuyet[kHANG].mADVIQLY}',
                                                                    style: TextStyle(
                                                                      fontFamily: ".SF UI Display",
                                                                      color: Colors.black,
                                                                      fontSize: 18.0,
                                                                      fontWeight: FontWeight.bold,)
                                                                ),
                                                                SizedBox(height: 6,),
                                                                Text('P Max: ${keHoachPhanBoCap3ChuaDuyet[index].pbChuaDuyet[kHANG].pMAX}',
                                                                  style: TextStyle(
                                                                    fontFamily: ".SF UI Display",
                                                                    color: Colors.black,
                                                                    fontSize: 16.0,
                                                                    fontWeight: FontWeight.w600,),
                                                                ),
                                                                SizedBox(height: 6,),
                                                                Text('P Phân bổ: ${keHoachPhanBoCap3ChuaDuyet[index].pbChuaDuyet[kHANG].pPB}',
                                                                    overflow: TextOverflow.clip,
                                                                    style: TextStyle(
                                                                      fontFamily: ".SF UI Display",
                                                                      color: Colors.black,
                                                                      fontSize: 16.0,
                                                                      fontWeight: FontWeight.w600,)
                                                                ),
                                                                SizedBox(height: 6,),
                                                                Text('P Thực tế: ${keHoachPhanBoCap3ChuaDuyet[index].pbChuaDuyet[kHANG].pBTHUCTE}',
                                                                    overflow: TextOverflow.clip,
                                                                    style: TextStyle(
                                                                      fontFamily: ".SF UI Display",
                                                                      color: Colors.black,
                                                                      fontSize: 16.0,
                                                                      fontWeight: FontWeight.w600,)
                                                                ),
                                                                SizedBox(height: 6),
                                                                Text('Nhập lý do nếu không duyệt:',
                                                                    overflow: TextOverflow.clip,
                                                                    style: TextStyle(
                                                                      fontFamily: ".SF UI Display",
                                                                      color: Colors.black,
                                                                      fontSize: 16.0,
                                                                      fontWeight: FontWeight.w600,)
                                                                ),
                                                                SizedBox(height: 6),
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                    color: Color(0XFFEFF3F6),
                                                                    borderRadius: BorderRadius.circular(100.0),
                                                                  ),
                                                                  child: TextField(
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                      fontFamily: ".SF UI Display",
                                                                      fontSize: 20.0,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                    controller: inputlydo[kHANG],
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                      contentPadding: EdgeInsets.fromLTRB(15, 2, 2, 5),
                                                                    ),
                                                                  ),
                                                                )
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
                                                                      idPB_Cap3 = keHoachPhanBoCap3ChuaDuyet[index].pbChuaDuyet[kHANG].iDPBDL;
                                                                    });
                                                                    xacNhanPB();
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
                                                                      lydo = inputlydo[kHANG].text;
                                                                      idPB_Cap3 = keHoachPhanBoCap3ChuaDuyet[index].pbChuaDuyet[kHANG].iDPBDL;
                                                                    });
                                                                    khongXacNhanPB();
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
  Future<List<DsPhanBoCap3ChuaDuyet>> getDsPhanBoCap3ChuaDuyet() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": globalUserData.tOKEN,
    };
    final danhsachphanbo = jsonEncode({
      "NHOMQUYEN": "${globalUserData.nHOMQUYEN}",
      "MA_DVQLY": "${globalUserData.mADVIQLY}"
    });
    var response = await http.post(Uri.parse(
        "$API_GET_DSACH_KHANG_HANG_CHUA_DUYET_PB_CAP3"),
        headers: headers,
        body: danhsachphanbo
    );
    if (response.statusCode == 200) {
      var listPBcap3 = jsonDecode(response.body);
      var listpbcap3 = listPBcap3 as List;
      // DsChuaThoaThuan dsChuaThoaThuan = new DsChuaThoaThuan.fromJson(listKHANG);
      List<DsPhanBoCap3ChuaDuyet> dsPBcap3 = listpbcap3.map((e) => DsPhanBoCap3ChuaDuyet.fromJson(e)).toList();
      keHoachPhanBoCap3ChuaDuyet = dsPBcap3;
      return dsPBcap3;
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
  Future<void> xacNhanPB() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": globalUserData.tOKEN,
    };
    final xacnhanPB = jsonEncode({
      "UserId": "${globalUserData.iD}",
      "NHOMQUYEN": "${globalUserData.nHOMQUYEN}",
      "IDPB_DL": "$idPB_Cap3"
    });
    var response = await http.post(Uri.parse(
        "$API_XAC_NHAN_1_KHANG_PB_CAP3"),
        headers: headers,
        body: xacnhanPB
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
                  Text("Đã duyệt kế hoạch phân bổ",
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
// //=====================================================================================================================================================================================================================================
// // Không Xác Nhận 1 Khách Hàng
  Future<void> khongXacNhanPB() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": globalUserData.tOKEN,
    };
    final koxacnhan = jsonEncode({
      "UserId": "${globalUserData.iD}",
      "NHOMQUYEN": "${globalUserData.nHOMQUYEN}",
      "IDPB_DL": "$idPB_Cap3",
      "LyDo": "$lydo"
    });
    var response = await http.post(Uri.parse(
        "$API_KO_XAC_NHAN_1_KHANG_PB_CAP3"),
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
                  Text("Không duyệt kế hoạch phân bổ thành công",
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
// //=====================================================================================================================================================================================================================================
// // Xác Nhận List Khách Hàng
//   Future<void> xacNhanThoaThuanList() async {
//     Map<String, String> headers = {
//       "Content-type": "application/json",
//       "Accept": "application/json",
//       "Authorization": globalUserData.tOKEN,
//     };
//     final xacnhanlist = jsonEncode({
//       "MA_DVQLY": "${globalUserData.mADVIQLY}",
//       "IDKH": "${globalDsChuaThoaThuan.iDKH}"
//     });
//     var response = await http.post(Uri.parse(
//         "http://10.21.50.104:8086/ThoaThuanKH/Mobile_DuyetKHangThoaThuan_XacNhan"),
//         headers: headers,
//         body: xacnhanlist
//     );
//     if (response.statusCode == 200) {
//       var serverXacNhanList = jsonDecode(response.body);
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               behavior: SnackBarBehavior.floating,
//               duration: Duration(seconds: 3),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25)
//               ),
//               backgroundColor: Colors.deepOrangeAccent,
//               content: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Đã duyệt tất cả khách hàng xác nhận tham gia",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: ".SF UI Display",
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               )
//           )
//       );
//       return serverXacNhanList;
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               behavior: SnackBarBehavior.floating,
//               duration: Duration(seconds: 2),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25)
//               ),
//               backgroundColor: Colors.deepOrangeAccent,
//               content: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Lỗi Hệ Thống Chưa Xác Nhận Duyệt Danh Sách",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: ".SF UI Display",
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               )
//           )
//       );
//     }
//   }
}