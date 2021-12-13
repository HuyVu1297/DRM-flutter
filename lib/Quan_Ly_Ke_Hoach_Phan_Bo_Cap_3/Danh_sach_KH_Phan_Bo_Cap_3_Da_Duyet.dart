import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:drappnpc/Data/Data.dart';

class DanhSachKHPhanBoDaDuyetPage extends StatefulWidget {
  @override
  _DanhSachKHPhanBoDaDuyetPageState createState() => _DanhSachKHPhanBoDaDuyetPageState();
}

class _DanhSachKHPhanBoDaDuyetPageState extends State<DanhSachKHPhanBoDaDuyetPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDsKHPhanBo().then((dataDsKHPhanBoDaDuyet) {
      setState(() {
        dsKHPhanBo = dataDsKHPhanBoDaDuyet;
      });
    });
  }


  List<DsPhanBoCap3DaDuyet> dsKHPhanBo = List<DsPhanBoCap3DaDuyet>.empty(growable: true);
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
        title: Text('Danh sách kế hoạch phân bổ đã duyệt',),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Expanded(
                    child: dsKHPhanBo == null ? Center(child: Text('Chưa có thỏa thuận')) : ListView.builder(
                        shrinkWrap: true,
                        itemCount: dsKHPhanBo.length,
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
                                            Text("${dsKHPhanBo[index].nOIDUNG}",  //Text("${keHoachChuaThoaThuan[index].dsChuThoaThuan[0].tENKHACHHANG}")
                                                style: TextStyle(
                                                  fontFamily: ".SF UI Display",
                                                  color: Colors.white,
                                                  fontSize: 19.0,
                                                  fontWeight: FontWeight.bold,)
                                            ),
                                            SizedBox(width: 50,),
                                          ],
                                        ),
                                        Visibility(
                                          visible: isReview,
                                          child: Container(
                                            height: 280,
                                            child: ListView.builder(
                                                itemCount: dsKHPhanBo[index].pbDaDuyet.length,
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
                                                                Text('Mã dịch vụ quản lý: ${dsKHPhanBo[index].pbDaDuyet[kHANG].mADVIQLY}',
                                                                    style: TextStyle(
                                                                      fontFamily: ".SF UI Display",
                                                                      color: Colors.black,
                                                                      fontSize: 18.0,
                                                                      fontWeight: FontWeight.bold,)
                                                                ),
                                                                SizedBox(height: 6,),
                                                                Text('P Max: ${dsKHPhanBo[index].pbDaDuyet[kHANG].pMAX}',
                                                                  style: TextStyle(
                                                                    fontFamily: ".SF UI Display",
                                                                    color: Colors.black,
                                                                    fontSize: 16.0,
                                                                    fontWeight: FontWeight.w600,),
                                                                ),
                                                                SizedBox(height: 6,),
                                                                Text('P Phân bổ: ${dsKHPhanBo[index].pbDaDuyet[kHANG].pPB}',
                                                                    overflow: TextOverflow.clip,
                                                                    style: TextStyle(
                                                                      fontFamily: ".SF UI Display",
                                                                      color: Colors.black,
                                                                      fontSize: 16.0,
                                                                      fontWeight: FontWeight.w600,)
                                                                ),
                                                                SizedBox(height: 6,),
                                                                Text('P Thực tế: ${dsKHPhanBo[index].pbDaDuyet[kHANG].pBTHUCTE}',
                                                                    overflow: TextOverflow.clip,
                                                                    style: TextStyle(
                                                                      fontFamily: ".SF UI Display",
                                                                      color: Colors.black,
                                                                      fontSize: 16.0,
                                                                      fontWeight: FontWeight.w600,)
                                                                ),
                                                                SizedBox(height: 6,),
                                                                Text('Trạng thái: ${dsKHPhanBo[index].pbDaDuyet[kHANG].trangThaiDuyet}',
                                                                    overflow: TextOverflow.clip,
                                                                    style: TextStyle(
                                                                      fontFamily: ".SF UI Display",
                                                                      color: Colors.black,
                                                                      fontSize: 16.0,
                                                                      fontWeight: FontWeight.w600,)
                                                                ),
                                                                SizedBox(height: 6,)
                                                              ],
                                                            ),
                                                          ),
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
// Danh Sách Khách Hàng Thoa Thuan
  // ignore: missing_return
  Future<List<DsPhanBoCap3DaDuyet>> getDsKHPhanBo() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": globalUserData.tOKEN,
    };
    final dsDaDuyet = jsonEncode({
      "NHOMQUYEN": "${globalUserData.nHOMQUYEN}",
      "MA_DVQLY": "${globalUserData.mADVIQLY}"
    });
    var response = await http.post(Uri.parse(
        "http://10.21.50.104:8086/PhanBo/Mobile_DanhSachPBC3_DaDuyet_byIDDonVi"),
        body: dsDaDuyet,
        headers: headers
    );
    if (response.statusCode == 200) {
      var listPBcap3 = jsonDecode(response.body);
      var listPBdaduyet = listPBcap3 as List;
      // DsChuaThoaThuan dsChuaThoaThuan = new DsChuaThoaThuan.fromJson(listKHANG);
      List<DsPhanBoCap3DaDuyet> dsKhangPbCap3 = listPBdaduyet.map((e) => DsPhanBoCap3DaDuyet.fromJson(e)).toList();
      dsKHPhanBo = dsKhangPbCap3;
      return dsKhangPbCap3;
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