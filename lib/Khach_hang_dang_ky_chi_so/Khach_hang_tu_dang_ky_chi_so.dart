import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:drappnpc/Data_and_config/Data.dart';
import 'dart:core';

import '../Data_and_config/Config.dart';

class KhachHangDKChiSoPage extends StatefulWidget {
  @override
  _KhachHangDKChiSoPageState createState() => _KhachHangDKChiSoPageState();
}

class _KhachHangDKChiSoPageState extends State<KhachHangDKChiSoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChiTietKHANGtuDK().then((datadChiTietchuaduyet) {
      setState(() {
        inforKHANGtuDK = datadChiTietchuaduyet;
      });
    });
  }

  List<TextEditingController> inputPKHANG = new List<TextEditingController>.empty(growable: true);
  String pKHANG = "";
  // ignore: non_constant_identifier_names
  List<InforKHANGtuDK> inforKHANGtuDK = List<InforKHANGtuDK>.empty(growable: true);
  // ignore: non_constant_identifier_names
  int iDKHPBtuDK = 0;
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
        title: Text("Khách Hàng Đăng Ký Chỉ Số"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SafeArea(
        child: Container(
          width: width,
          child: Center(
            child: Column(
              children: [
                Expanded(
                    child: inforKHANGtuDK == null ? Center(child: Text('Chưa có thỏa thuận')) : ListView.builder(
                        shrinkWrap: true,
                        itemCount: inforKHANGtuDK.length,
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
                                            Text("${inforKHANGtuDK[index].nOIDUNG}",  //Text("${keHoachChuaThoaThuan[index].dsChuThoaThuan[0].tENKHACHHANG}")
                                                style: TextStyle(
                                                  fontFamily: ".SF UI Display",
                                                  color: Colors.white,
                                                  fontSize: 19.0,
                                                  fontWeight: FontWeight.bold,)
                                            ),
                                            SizedBox(width: 30,),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Visibility(
                                              visible: isReview,
                                              child: Container(
                                                height: 500,
                                                child: ListView.builder(
                                                    itemCount: inforKHANGtuDK[index].infoTuDK.length,
                                                    itemBuilder: (context, infoDK) {
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
                                                                        Text('${inforKHANGtuDK[index].infoTuDK[infoDK].mAKHANG}',
                                                                            style: TextStyle(
                                                                              fontFamily: ".SF UI Display",
                                                                              color: Colors.black,
                                                                              fontSize: 18.0,
                                                                              fontWeight: FontWeight.bold,)
                                                                        ),
                                                                        SizedBox(height: 6,),
                                                                        Text('${inforKHANGtuDK[index].infoTuDK[infoDK].tENKHACHHANG}',
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
                                                                                size: 45),
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
                                                                          itemCount: inforKHANGtuDK[index].infoTuDK[infoDK].chitietTuDK.length,
                                                                          itemBuilder: (context, chitiet) {
                                                                            inputPKHANG.add(new TextEditingController());
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
                                                                                          Text('CHU KỲ: ${inforKHANGtuDK[index].infoTuDK[index].chitietTuDK[chitiet].cHUKY}',
                                                                                              style: TextStyle(
                                                                                                fontFamily: ".SF UI Display",
                                                                                                color: Colors.white,
                                                                                                fontSize: 18.0,
                                                                                                fontWeight: FontWeight.bold,)
                                                                                          ),
                                                                                          SizedBox(height: 6,),
                                                                                          Text('P Cơ Sở: ${inforKHANGtuDK[index].infoTuDK[index].chitietTuDK[chitiet].pCOSO}',
                                                                                            style: TextStyle(
                                                                                              fontFamily: ".SF UI Display",
                                                                                              color: Colors.white,
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w900,),
                                                                                          ),
                                                                                          SizedBox(height: 6,),
                                                                                          Text('P Thực Tế: ${inforKHANGtuDK[index].infoTuDK[index].chitietTuDK[chitiet].pTHUCTE}',
                                                                                            style: TextStyle(
                                                                                              fontFamily: ".SF UI Display",
                                                                                              color: Colors.white,
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w900,),
                                                                                          ),
                                                                                          SizedBox(height: 6),
                                                                                          Text('Nhập công suất mong muốn:',
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
                                                                                              controller: inputPKHANG[chitiet],
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
                                                                                                Icons.send_rounded,
                                                                                                color: Colors.redAccent,
                                                                                                size: 45),
                                                                                            onTap: () {
                                                                                              setState(() {
                                                                                                pKHANG = inputPKHANG[chitiet].text;
                                                                                                iDKHPBtuDK = inforKHANGtuDK[index].infoTuDK[index].chitietTuDK[chitiet].iDKHPB;
                                                                                              });
                                                                                              kHANGtuDK();
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
// Chi tiết khách hàng tự đăng ký chỉ số
  Future<List<InforKHANGtuDK>> getChiTietKHANGtuDK() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": globalUserData.tOKEN,
    };
    final xacnhan = jsonEncode({
      "MA_DVQLY": "${globalUserData.mADVIQLY}",
      "MA_KHANG": "${globalUserData.uSERNAME}"
    });
    var response = await http.post(Uri.parse(
        "$API_GET_DETAIL_KHANG_TU_DANG_KY_SO"),
        headers: headers,
        body: xacnhan
    );
    if (response.statusCode == 200) {
      var serverInfor = jsonDecode(response.body);
      var inforKHANGtuDK = serverInfor as List;
      List<InforKHANGtuDK> inforKhangTuDK = inforKHANGtuDK.map((e) => InforKHANGtuDK.fromJson(e)).toList();
      inforKHANGtuDK = inforKhangTuDK;
      return inforKhangTuDK;
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
// Khách Hàng tự đăng ký P_KHANG
  Future<void> kHANGtuDK() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": globalUserData.tOKEN,
    };
    final xacnhan = jsonEncode({
      "IDKHPB": "$iDKHPBtuDK",
      "P_KHANG": "$pKHANG"
    });
    var response = await http.post(Uri.parse(
        "$API_KHANG_TU_DANG_KY_P_KHANG"),
        body: xacnhan,
        headers: headers
    );
    if (response.statusCode == 200) {
      var serverXacNhan = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
              ),
              backgroundColor: Colors.deepOrangeAccent,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Nhập Chỉ Số Thành Công",
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
              duration: Duration(seconds: 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
              ),
              backgroundColor: Colors.deepOrangeAccent,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Lỗi Hệ Thống Không Nhập Được Chỉ Số",
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
// // //=====================================================================================================================================================================================================================================
}