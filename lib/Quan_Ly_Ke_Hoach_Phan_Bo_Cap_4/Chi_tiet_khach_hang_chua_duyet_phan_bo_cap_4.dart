import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:drappnpc/Data/Data.dart';
import 'dart:core';

import 'Quan_ly_ke_hoach_phan_bo_cap_4_gd.dart';

class ChiTietPhanBoCap4ChuaDuyetPage extends StatefulWidget {
  @override
  _ChiTietPhanBoCap4ChuaDuyetPageState createState() => _ChiTietPhanBoCap4ChuaDuyetPageState();
}

class _ChiTietPhanBoCap4ChuaDuyetPageState extends State<ChiTietPhanBoCap4ChuaDuyetPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChiTietKHANGChuaDuyet().then((datadChiTietchuaduyet) {
      setState(() {
        inforKHANGPBCap4 = datadChiTietchuaduyet;
      });
    });
  }

  List<TextEditingController> inputlydo = new List<TextEditingController>.empty(growable: true);
  String lydo = "";
  // ignore: non_constant_identifier_names
  List<ChiTietKHANGPhanBoCap4> inforKHANGPBCap4 = List<ChiTietKHANGPhanBoCap4>.empty(growable: true);
  // ignore: non_constant_identifier_names
  int iDKHPB = 0;
  bool isReview = false;
  bool isReviewChiTiet = false;
  double height = 300;
  void _toggleReview() {
    setState(() {
      isReview = !isReview;
    });
  }
  void _toggleReviewChiTiet() {
    setState(() {
      isReviewChiTiet = !isReviewChiTiet;
    });
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Chi Tiết Phân Bổ Theo Chu Kỳ"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SafeArea(
        child: Container(
          width: width,
          child: Center(
            child: Column(
              children: [
                Expanded(
                    child: inforKHANGPBCap4 == null ? Center(child: Text('Chưa có thỏa thuận')) : ListView.builder(
                        shrinkWrap: true,
                        itemCount: inforKHANGPBCap4.length,
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
                                            colors: [Colors.blue, Colors.deepOrangeAccent],
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
                                            Text("${inforKHANGPBCap4[index].nOIDUNG}",  //Text("${keHoachChuaThoaThuan[index].dsChuThoaThuan[0].tENKHACHHANG}")
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
                                        Column(
                                          children: [
                                            Visibility(
                                              visible: isReview,
                                              child: Container(
                                                height: 500,
                                                child: ListView.builder(
                                                    itemCount: inforKHANGPBCap4[index].infoChiTietKHANGChuaDuyet.length,
                                                    itemBuilder: (context, kHANG) {
                                                      return Card(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(30.0)
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 5),
                                                          child: Column(
                                                            children: [
                                                              Row(
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
                                                                        Text('${inforKHANGPBCap4[index].infoChiTietKHANGChuaDuyet[kHANG].mAKHANG}',
                                                                            style: TextStyle(
                                                                              fontFamily: ".SF UI Display",
                                                                              color: Colors.black,
                                                                              fontSize: 18.0,
                                                                              fontWeight: FontWeight.bold,)
                                                                        ),
                                                                        SizedBox(height: 6,),
                                                                        Text('${inforKHANGPBCap4[index].infoChiTietKHANGChuaDuyet[kHANG].tENKHACHHANG}',
                                                                          style: TextStyle(
                                                                            fontFamily: ".SF UI Display",
                                                                            color: Colors.black,
                                                                            fontSize: 16.0,
                                                                            fontWeight: FontWeight.w900,),
                                                                        ),
                                                                        SizedBox(height: 6,),
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
                                                                          onTap: _toggleReviewChiTiet
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(height: 10,),
                                                              Column(
                                                                children: [
                                                                  Visibility(
                                                                    visible: isReviewChiTiet,
                                                                    child: Container(
                                                                      height: 300,
                                                                      width: 340,
                                                                      child: ListView.builder(
                                                                          itemCount: inforKHANGPBCap4[index].infoChiTietKHANGChuaDuyet[kHANG].chitietKHANGChuaDuyet.length,
                                                                          itemBuilder: (context, chitiet) {
                                                                            inputlydo.add(new TextEditingController());
                                                                            return Card(
                                                                              color: Colors.blue,
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
                                                                                          Text('CHU KỲ: ${inforKHANGPBCap4[index].infoChiTietKHANGChuaDuyet[kHANG].chitietKHANGChuaDuyet[chitiet].cHUKY}',
                                                                                              style: TextStyle(
                                                                                                fontFamily: ".SF UI Display",
                                                                                                color: Colors.white,
                                                                                                fontSize: 18.0,
                                                                                                fontWeight: FontWeight.bold,)
                                                                                          ),
                                                                                          SizedBox(height: 6,),
                                                                                          Text('P Cơ Sở: ${inforKHANGPBCap4[index].infoChiTietKHANGChuaDuyet[kHANG].chitietKHANGChuaDuyet[chitiet].pCOSO}',
                                                                                            style: TextStyle(
                                                                                              fontFamily: ".SF UI Display",
                                                                                              color: Colors.white,
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w900,),
                                                                                          ),
                                                                                          SizedBox(height: 6,),
                                                                                          Text('P Thực Tế: ${inforKHANGPBCap4[index].infoChiTietKHANGChuaDuyet[kHANG].chitietKHANGChuaDuyet[chitiet].pTHUCTE}',
                                                                                            style: TextStyle(
                                                                                              fontFamily: ".SF UI Display",
                                                                                              color: Colors.white,
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w900,),
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
                                                                                              controller: inputlydo[chitiet],
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
                                                                                                Icons.check_box,
                                                                                                color: Colors.green,
                                                                                                size: 45),
                                                                                            onTap: () {
                                                                                              setState(() {
                                                                                                iDKHPB = inforKHANGPBCap4[index].infoChiTietKHANGChuaDuyet[kHANG].chitietKHANGChuaDuyet[chitiet].iDKHPB;
                                                                                              });
                                                                                              duyetKHANGPBCap4();
                                                                                            },
                                                                                          ),
                                                                                          SizedBox(height: 10,),
                                                                                          InkWell(
                                                                                            child: Icon(
                                                                                                Icons.cancel,
                                                                                                color: Colors.redAccent,
                                                                                                size: 45),
                                                                                            onTap: () {
                                                                                              setState(() {
                                                                                                lydo = inputlydo[chitiet].text;
                                                                                                iDKHPB = inforKHANGPBCap4[index].infoChiTietKHANGChuaDuyet[kHANG].chitietKHANGChuaDuyet[chitiet].iDKHPB;
                                                                                              });
                                                                                              koDuyetKHANGPBCap4();
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
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                ),
                                              ),
                                            ),
                                          ],
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
// Chi tiết khách hàng chưa duyệt
  Future<List<ChiTietKHANGPhanBoCap4>> getChiTietKHANGChuaDuyet() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": globalUserData.tOKEN,
    };
    final xacnhan = jsonEncode({
      "MA_KHANG": "$mA_KHANG_Dangky_PB",
      "MA_DVQLY": "${globalUserData.mADVIQLY}",
      "NHOMQUYEN": "${globalUserData.nHOMQUYEN}",
      "IDKH": "${globalDsPhanBoCap4ChuaDuyet.iDKH}"
    });
    var response = await http.post(Uri.parse(
        "http://10.21.50.104:8086/PhanBo/Mobile_ThongTinPhanBoKHang_ByIdKH_ChuaDuyet"),
        headers: headers,
        body: xacnhan
    );
    if (response.statusCode == 200) {
      var serverInfor = jsonDecode(response.body);
      var inforKHANGcap4 = serverInfor as List;
      List<ChiTietKHANGPhanBoCap4> inforKhangCap4 = inforKHANGcap4.map((e) => ChiTietKHANGPhanBoCap4.fromJson(e)).toList();
      inforKHANGPBCap4 = inforKhangCap4;
      return inforKhangCap4;
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
                  Text("Không có danh sách",
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
  Future<void> duyetKHANGPBCap4() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": globalUserData.tOKEN,
    };
    final xacnhan = jsonEncode({
      "UserId": "${globalUserData.iD}",
      "NHOMQUYEN": "${globalUserData.nHOMQUYEN}",
      "IDKHPB": "$iDKHPB"
    });
    var response = await http.post(Uri.parse(
        "http://10.21.50.104:8086/PhanBo/Mobile_DuyetPhanBoC4_byIDKHPB"),
        body: xacnhan,
        headers: headers
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
// // Không Xác Nhận 1 Khách Hàng
  Future<void> koDuyetKHANGPBCap4() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": globalUserData.tOKEN,
    };
    final koxacnhan = jsonEncode({
      "UserId": "${globalUserData.iD}",
      "NHOMQUYEN": "${globalUserData.nHOMQUYEN}",
      "IDKHPB": "$iDKHPB",
      "LyDo": "$lydo"
    });
    var response = await http.post(Uri.parse(
        "http://10.21.50.104:8086/PhanBo/Mobile_KhongDuyetPhanBoC4_byIDKHPB"),
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
}