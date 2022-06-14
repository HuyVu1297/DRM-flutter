import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:drappnpc/Data_and_config/Data.dart';
import 'dart:core';
import '../Data_and_config/Config.dart';
import 'Chi_tiet_khach_hang_chua_duyet_phan_bo_cap_4.dart';

// ignore: non_constant_identifier_names
String mA_KHANG_Dangky_PB = "";
class QLKHPhanBoCap4ChuaDuyetGDPage extends StatefulWidget {
  @override
  _QLKHPhanBoCap4ChuaDuyetGDPageState createState() => _QLKHPhanBoCap4ChuaDuyetGDPageState();
}

class _QLKHPhanBoCap4ChuaDuyetGDPageState extends State<QLKHPhanBoCap4ChuaDuyetGDPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDanhSachPBChuaDuyetcap4().then((datadschuaduyetgdcap4) {
      setState(() {
        dsPBcap4ChuaDuyet = datadschuaduyetgdcap4;
      });
    });
  }

  List<DsPhanBoCap4ChuaDuyet> dsPBcap4ChuaDuyet = List<DsPhanBoCap4ChuaDuyet>.empty(growable: true);
  // ignore: non_constant_identifier_names
  int iDKeHoach = 0;
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
        title: Text("Danh sách kế hoạch phân bổ"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Expanded(
                    child: dsPBcap4ChuaDuyet == null ? Center(child: Text('Chưa có thỏa thuận')) : ListView.builder(
                        shrinkWrap: true,
                        itemCount: dsPBcap4ChuaDuyet.length,
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
                                            Text("${dsPBcap4ChuaDuyet[index].nOIDUNG}",  //Text("${keHoachChuaThoaThuan[index].dsChuThoaThuan[0].tENKHACHHANG}")
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
                                                //   globalDsPhanBoCap4ChuaDuyetGD = new DsPhanBoCap4ChuaDuyetGD();
                                                //   globalDsPhanBoCap4ChuaDuyetGD.iDKH = dsPBcap4ChuaDuyetGD[index].iDKH;
                                                // });
                                                // xacNhanThoaThuanList();
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                        Visibility(
                                          visible: isReview,
                                          child: Container(
                                            height: 400,
                                            child: ListView.builder(
                                                itemCount: dsPBcap4ChuaDuyet[index].infoChuaDuyet.length,
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
                                                                Text('${dsPBcap4ChuaDuyet[index].infoChuaDuyet[kHANG].tENKHACHHANG}',
                                                                    style: TextStyle(
                                                                      fontFamily: ".SF UI Display",
                                                                      color: Colors.black,
                                                                      fontSize: 18.0,
                                                                      fontWeight: FontWeight.bold,)
                                                                ),
                                                                SizedBox(height: 6,),
                                                                Text('${dsPBcap4ChuaDuyet[index].infoChuaDuyet[kHANG].mAKHANG}',
                                                                  style: TextStyle(
                                                                    fontFamily: ".SF UI Display",
                                                                    color: Colors.black,
                                                                    fontSize: 16.0,
                                                                    fontWeight: FontWeight.w900,),
                                                                ),
                                                                SizedBox(height: 6,),
                                                                Text('${dsPBcap4ChuaDuyet[index].infoChuaDuyet[kHANG].dIACHI}',
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
                                                                      Icons.menu_open_outlined,
                                                                      color: Colors.redAccent,
                                                                      size: 35),
                                                                  onTap: () {
                                                                    setState(() {
                                                                      globalDsPhanBoCap4ChuaDuyet = new DsPhanBoCap4ChuaDuyet();
                                                                      iDKeHoach = dsPBcap4ChuaDuyet[index].iDKH;
                                                                      mA_KHANG_Dangky_PB = dsPBcap4ChuaDuyet[index].infoChuaDuyet[kHANG].mAKHANG;
                                                                      globalDsPhanBoCap4ChuaDuyet.iDKH = iDKeHoach;
                                                                    });
                                                                    print(globalDsPhanBoCap4ChuaDuyet.iDKH);
                                                                    print(mA_KHANG_Dangky_PB);
                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChiTietPhanBoCap4ChuaDuyetPage()));
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
  Future<List<DsPhanBoCap4ChuaDuyet>> getDanhSachPBChuaDuyetcap4() async {
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
        "$API_GET_DSACH_KHACH_HANG_CHUA_DUYET_PHAN_BO_CAP4_GD"),
        body: danhsachphanbo,
        headers: headers
    );
    if (response.statusCode == 200) {
      var listpbcap4 = jsonDecode(response.body);
      var listPBCap4 = listpbcap4 as List;
      // DsChuaThoaThuan dsChuaThoaThuan = new DsChuaThoaThuan.fromJson(listKHANG);
      List<DsPhanBoCap4ChuaDuyet> dsTT = listPBCap4.map((e) => DsPhanBoCap4ChuaDuyet.fromJson(e)).toList();
      dsPBcap4ChuaDuyet = dsTT;
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
// //=====================================================================================================================================================================================================================================
}