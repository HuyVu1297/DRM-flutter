//=====================================================================================================================================================================================================================================
// DATA NGƯỜI DÙNG
class UserData {
  String uSERNAME;
  int iD;
  String mADVIQLY;
  String hOTEN;
  String sDT;
  String eMAIL;
  String dIACHI;
  int nHOMQUYEN;
  String tOKEN;

  UserData(
      {this.uSERNAME,
        this.iD,
        this.mADVIQLY,
        this.hOTEN,
        this.sDT,
        this.eMAIL,
        this.dIACHI,
        this.nHOMQUYEN,
        this.tOKEN});

  UserData.fromJson(Map<String, dynamic> json) {
    uSERNAME = json['USERNAME'];
    iD = json['ID'];
    mADVIQLY = json['MA_DVIQLY'];
    hOTEN = json['HOTEN'];
    sDT = json['SDT'];
    eMAIL = json['EMAIL'];
    dIACHI = json['DIACHI'];
    nHOMQUYEN = json['NHOMQUYEN'];
    tOKEN = json['TOKEN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['USERNAME'] = this.uSERNAME;
    data['ID'] = this.iD;
    data['MA_DVIQLY'] = this.mADVIQLY;
    data['HOTEN'] = this.hOTEN;
    data['SDT'] = this.sDT;
    data['EMAIL'] = this.eMAIL;
    data['DIACHI'] = this.dIACHI;
    data['NHOMQUYEN'] = this.nHOMQUYEN;
    data['TOKEN'] = this.tOKEN;
    return data;
  }
}
UserData globalUserData;
//=====================================================================================================================================================================================================================================
// KẾT QUẢ ĐỔI PASS
class CPD {
  int rE;

  CPD({this.rE});

  CPD.fromJson(Map<String, dynamic> json) {
    rE = json['RE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RE'] = this.rE;
    return data;
  }
}
//=====================================================================================================================================================================================================================================
// Data Danh Sách Chưa Thỏa Thuận Với Khách Hàng
class DsChuaThoaThuan {
  String nOIDUNG;
  int iDKH;
  int iDDANGKY;
  List<Ds> dsChuThoaThuan;

  DsChuaThoaThuan({this.nOIDUNG, this.iDKH, this.iDDANGKY, this.dsChuThoaThuan});

  DsChuaThoaThuan.fromJson(Map<String, dynamic> json) {
    nOIDUNG = json['NOIDUNG'];
    iDKH = json['IDKH'];
    iDDANGKY = json['IDDANGKY'];
    if (json['ds'] != null) {
      dsChuThoaThuan = new List<Ds>.empty(growable: true);
      json['ds'].forEach((v) {
        dsChuThoaThuan.add(new Ds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NOIDUNG'] = this.nOIDUNG;
    data['IDKH'] = this.iDKH;
    data['IDDANGKY'] = this.iDDANGKY;
    if (this.dsChuThoaThuan != null) {
      data['ds'] = this.dsChuThoaThuan.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ds {
  String mAKHANG;
  String tENKHACHHANG;
  String dIACHI;

  Ds({this.mAKHANG, this.tENKHACHHANG, this.dIACHI});

  Ds.fromJson(Map<String, dynamic> json) {
    mAKHANG = json['MA_KHANG'];
    tENKHACHHANG = json['TENKHACHHANG'];
    dIACHI = json['DIACHI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MA_KHANG'] = this.mAKHANG;
    data['TENKHACHHANG'] = this.tENKHACHHANG;
    data['DIACHI'] = this.dIACHI;
    return data;
  }
}
DsChuaThoaThuan globalDsChuaThoaThuan;
