import 'dart:convert';
import 'dart:core';
import 'package:drappnpc/Main_chinh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'Data_and_config/Config.dart';
import 'Data_and_config/Data.dart';

bool customerAcc = false;
class LoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}
class _MyLoginPageState extends State<LoginPage> {
  bool isHiddenPassword = true;
  var usernamelogin = TextEditingController();
  var passwordlogin = TextEditingController();

  @override
  void initState() {
    super.initState();
    hideStatusBar();
  }

  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red;
      }
      return Colors.deepOrangeAccent;
    }
    return new WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                height: 1000,
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 60),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/logo_evn.png"),
                                    fit: BoxFit.cover
                                )
                            )
                          ),
                          SizedBox(height: 10),
                          Text("EVNNPC",
                            style: TextStyle(
                              fontFamily: ".SF UI Display",
                              color: Colors.white,
                              fontSize: 26.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("Quản Lý Kế Hoạch Sử Dụng Điện",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: ".SF UI Display",
                              fontSize: 24.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 60),
                          Text("Tên đăng nhập",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: ".SF UI Display",
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                              width: 350,
                              decoration: BoxDecoration(
                                color: Color(0XFFEFF3F6),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: TextField(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: ".SF UI Display",
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                controller: usernamelogin,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.fromLTRB(15, 12, 10, 10),
                                ),
                              )
                          ),
                          SizedBox(height: 30.0),
                          Text("Mật khẩu",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: ".SF UI Display",
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                              width: 350,
                              decoration: BoxDecoration(
                                color: Color(0XFFEFF3F6),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: TextField(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: ".SF UI Display",
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                controller: passwordlogin,
                                obscureText: isHiddenPassword,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.vpn_key_rounded),
                                  suffixIcon: InkWell(
                                      onTap: _togglePasswordView,
                                      child: Icon(isHiddenPassword ? Icons.visibility : Icons.visibility_off)),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.fromLTRB(15, 12, 10, 10),
                                ),
                              )
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text("Tài khoản khách hàng",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: ".SF UI Display",
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Checkbox(value: customerAcc,
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(getColor),
                                  onChanged:(bool value) {
                                    setState(() {
                                      customerAcc = value;
                                    });
                                  }),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  width: 200,
                                  padding: EdgeInsets.all(3.0),
                                  child: Center(
                                    // ignore: deprecated_member_use
                                    child: FlatButton(
                                        minWidth: 350,
                                        height: 55,
                                        color: Color(0XFFFF8A65),
                                        child: Text("ĐĂNG NHẬP",
                                          style: TextStyle(
                                              fontFamily: ".SF UI Display",
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 28.0),),
                                        onPressed: () async {
                                          await login();
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                        }
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0XFFFF8A65),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Text("© Phần mềm thuộc NPCIT",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: ".SF UI Display",
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
//=====================================================================================================================================================================================================================================
// API LOGIN
  // ignore: missing_return
  Future<UserData> login() async {
    if(passwordlogin.text.isNotEmpty && usernamelogin.text.isNotEmpty) {
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Accept": "application/json"
      };
      final user = jsonEncode({
        'USERNAME': usernamelogin.text, //'PA01NH0062883',
        'PASSWORD': passwordlogin.text, //'MA_KHANG',
        'Loai': customerAcc,
      });
      var response = await http.post(
        Uri.parse("$API_LOGIN"),
        body: user,
        headers: headers,
      );
      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        String serverToken = "${json.decode(response.body)['TOKEN']}";
        String serverMKH = "${json.decode(response.body)['USERNAME']}";
        String serverMADVIQLY = "${json.decode(response.body)['MA_DVIQLY']}";
        String serverName = "${json.decode(response.body)['HOTEN']}";
        String serverPhone = "${json.decode(response.body)['SDT']}";
        String serverEmail = "${json.decode(response.body)['EMAIL']}";
        String serverAddress = "${json.decode(response.body)['DIACHI']}";
        int serverUserID = int.parse("${json.decode(response.body)['ID']}");
        int serverNhomQuyen = int.parse("${json.decode(response.body)['NHOMQUYEN']}");
        final detail = await json.decode(response.body);
        globalUserData = new UserData();
        setState(() {
          globalUserData.tOKEN = serverToken;
          globalUserData.uSERNAME = serverMKH;
          globalUserData.mADVIQLY = serverMADVIQLY;
          globalUserData.hOTEN = serverName;
          globalUserData.sDT = serverPhone;
          globalUserData.eMAIL = serverEmail;
          globalUserData.dIACHI = serverAddress;
          globalUserData.nHOMQUYEN = serverNhomQuyen;
          globalUserData.iD = serverUserID;
        });
        print(detail);
      } else if (response.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: Duration(seconds: 1),
                content: Text("Kiểm tra lại tên đăng nhập hoặc password")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: Duration(seconds: 1),
                content: Text("Không thể đăng nhập")));
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
                  Text("Không được bỏ trống tên đăng nhập hoặc mật khẩu",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: ".SF UI Display",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )));
    }
  }
//===========================================================================================================================================================================================================================
  hideStatusBar() => SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}