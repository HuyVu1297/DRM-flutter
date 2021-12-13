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
  List<DsChuaXacNhan> dsChuaThoaThuan;

  DsChuaThoaThuan({this.nOIDUNG, this.iDKH, this.dsChuaThoaThuan});

  DsChuaThoaThuan.fromJson(Map<String, dynamic> json) {
    nOIDUNG = json['NOIDUNG'];
    iDKH = json['IDKH'];
    if (json['ds'] != null) {
      dsChuaThoaThuan = new List<DsChuaXacNhan>.empty(growable: true);
      json['ds'].forEach((v) {
        dsChuaThoaThuan.add(new DsChuaXacNhan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NOIDUNG'] = this.nOIDUNG;
    data['IDKH'] = this.iDKH;
    if (this.dsChuaThoaThuan != null) {
      data['ds'] = this.dsChuaThoaThuan.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DsChuaXacNhan {
  int iDDANGKY;
  String mAKHANG;
  String tENKHACHHANG;
  String dIACHI;

  DsChuaXacNhan({this.iDDANGKY, this.mAKHANG, this.tENKHACHHANG, this.dIACHI});

  DsChuaXacNhan.fromJson(Map<String, dynamic> json) {
    iDDANGKY = json['IDDANGKY'];
    mAKHANG = json['MA_KHANG'];
    tENKHACHHANG = json['TENKHACHHANG'];
    dIACHI = json['DIACHI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDDANGKY'] = this.iDDANGKY;
    data['MA_KHANG'] = this.mAKHANG;
    data['TENKHACHHANG'] = this.tENKHACHHANG;
    data['DIACHI'] = this.dIACHI;
    return data;
  }
}
DsChuaThoaThuan globalDsChuaThoaThuan;
//=====================================================================================================================================================================================================================================
// Data Danh Sách Thỏa Thuận Với Khách Hàng
class DsKHANGThoaThuan {
  String nOIDUNG;
  int iDKH;
  List<DsDaXacNhan> dsKhangThoaThuan;

  DsKHANGThoaThuan({this.nOIDUNG, this.iDKH, this.dsKhangThoaThuan});

  DsKHANGThoaThuan.fromJson(Map<String, dynamic> json) {
    nOIDUNG = json['NOIDUNG'];
    iDKH = json['IDKH'];
    if (json['ds'] != null) {
      dsKhangThoaThuan = new List<DsDaXacNhan>.empty(growable: true);
      json['ds'].forEach((v) {
        dsKhangThoaThuan.add(new DsDaXacNhan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NOIDUNG'] = this.nOIDUNG;
    data['IDKH'] = this.iDKH;
    if (this.dsKhangThoaThuan != null) {
      data['ds'] = this.dsKhangThoaThuan.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DsDaXacNhan {
  int iDDANGKY;
  String mAKHANG;
  String tENKHACHHANG;
  String dIACHI;

  DsDaXacNhan({this.iDDANGKY, this.mAKHANG, this.tENKHACHHANG, this.dIACHI});

  DsDaXacNhan.fromJson(Map<String, dynamic> json) {
    iDDANGKY = json['IDDANGKY'];
    mAKHANG = json['MA_KHANG'];
    tENKHACHHANG = json['TENKHACHHANG'];
    dIACHI = json['DIACHI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDDANGKY'] = this.iDDANGKY;
    data['MA_KHANG'] = this.mAKHANG;
    data['TENKHACHHANG'] = this.tENKHACHHANG;
    data['DIACHI'] = this.dIACHI;
    return data;
  }
}
DsKHANGThoaThuan globalDsKHANGThoaThuan;
//=====================================================================================================================================================================================================================================
// Data Danh Sách Kế Hoạch Phân Bổ Cấp 3 Chưa Duyệt

class DsPhanBoCap3ChuaDuyet {
  String mAKEHOACH;
  String nOIDUNG;
  List<PbChuaDuyet> pbChuaDuyet;

  DsPhanBoCap3ChuaDuyet({this.mAKEHOACH, this.nOIDUNG, this.pbChuaDuyet});

  DsPhanBoCap3ChuaDuyet.fromJson(Map<String, dynamic> json) {
    mAKEHOACH = json['MAKEHOACH'];
    nOIDUNG = json['NOIDUNG'];
    if (json['pb'] != null) {
      pbChuaDuyet = new List<PbChuaDuyet>.empty(growable: true);
      json['pb'].forEach((v) {
        pbChuaDuyet.add(new PbChuaDuyet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MAKEHOACH'] = this.mAKEHOACH;
    data['NOIDUNG'] = this.nOIDUNG;
    if (this.pbChuaDuyet != null) {
      data['pb'] = this.pbChuaDuyet.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PbChuaDuyet {
  int iDPBDL;
  String mADVIQLY;
  double pMAX;
  double pPB;
  int pBTHUCTE;

  PbChuaDuyet({this.iDPBDL, this.mADVIQLY, this.pMAX, this.pPB, this.pBTHUCTE});

  PbChuaDuyet.fromJson(Map<String, dynamic> json) {
    iDPBDL = json['IDPB_DL'];
    mADVIQLY = json['MA_DVIQLY'];
    pMAX = json['P_MAX'];
    pPB = json['P_PB'];
    pBTHUCTE = json['PB_THUCTE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDPB_DL'] = this.iDPBDL;
    data['MA_DVIQLY'] = this.mADVIQLY;
    data['P_MAX'] = this.pMAX;
    data['P_PB'] = this.pPB;
    data['PB_THUCTE'] = this.pBTHUCTE;
    return data;
  }
}
DsPhanBoCap3ChuaDuyet globalDsPhanBoCap3ChuaDuyet;
//=====================================================================================================================================================================================================================================
// Data Danh Sách Kế Hoạch Phân Bổ Cấp 3 Đã Duyệt
class DsPhanBoCap3DaDuyet {
  String mAKEHOACH;
  String nOIDUNG;
  List<PbDaDuyet> pbDaDuyet;

  DsPhanBoCap3DaDuyet({this.mAKEHOACH, this.nOIDUNG, this.pbDaDuyet});

  DsPhanBoCap3DaDuyet.fromJson(Map<String, dynamic> json) {
    mAKEHOACH = json['MAKEHOACH'];
    nOIDUNG = json['NOIDUNG'];
    if (json['pb'] != null) {
      pbDaDuyet = new List<PbDaDuyet>.empty(growable: true);
      json['pb'].forEach((v) {
        pbDaDuyet.add(new PbDaDuyet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MAKEHOACH'] = this.mAKEHOACH;
    data['NOIDUNG'] = this.nOIDUNG;
    if (this.pbDaDuyet != null) {
      data['pb'] = this.pbDaDuyet.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PbDaDuyet {
  int iDPBDL;
  String mADVIQLY;
  double pMAX;
  double pPB;
  int pBTHUCTE;
  String trangThaiDuyet;

  PbDaDuyet({this.iDPBDL,
    this.mADVIQLY,
    this.pMAX,
    this.pPB,
    this.pBTHUCTE,
    this.trangThaiDuyet});

  PbDaDuyet.fromJson(Map<String, dynamic> json) {
    iDPBDL = json['IDPB_DL'];
    mADVIQLY = json['MA_DVIQLY'];
    pMAX = json['P_MAX'];
    pPB = json['P_PB'];
    pBTHUCTE = json['PB_THUCTE'];
    trangThaiDuyet = json['TrangThaiDuyet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDPB_DL'] = this.iDPBDL;
    data['MA_DVIQLY'] = this.mADVIQLY;
    data['P_MAX'] = this.pMAX;
    data['P_PB'] = this.pPB;
    data['PB_THUCTE'] = this.pBTHUCTE;
    data['TrangThaiDuyet'] = this.trangThaiDuyet;
    return data;
  }
}
DsPhanBoCap3DaDuyet globalDsPhanBoCap3DaDuyet;
//=====================================================================================================================================================================================================================================
// Data Danh Sách Kế Hoạch Phân Bổ Cấp 4 Chưa Duyệt Giám Đốc
class DsPhanBoCap4ChuaDuyet {
  String nOIDUNG;
  int iDKH;
  List<InfoChuaDuyet> infoChuaDuyet;

  DsPhanBoCap4ChuaDuyet({this.nOIDUNG, this.iDKH, this.infoChuaDuyet});

  DsPhanBoCap4ChuaDuyet.fromJson(Map<String, dynamic> json) {
    nOIDUNG = json['NOIDUNG'];
    iDKH = json['IDKH'];
    if (json['info'] != null) {
      infoChuaDuyet = new List<InfoChuaDuyet>.empty(growable: true);
      json['info'].forEach((v) {
        infoChuaDuyet.add(new InfoChuaDuyet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NOIDUNG'] = this.nOIDUNG;
    data['IDKH'] = this.iDKH;
    if (this.infoChuaDuyet != null) {
      data['info'] = this.infoChuaDuyet.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InfoChuaDuyet {
  String mAKHANG;
  String tENKHACHHANG;
  String dIACHI;

  InfoChuaDuyet({this.mAKHANG, this.tENKHACHHANG, this.dIACHI});

  InfoChuaDuyet.fromJson(Map<String, dynamic> json) {
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
DsPhanBoCap4ChuaDuyet globalDsPhanBoCap4ChuaDuyet;
//=====================================================================================================================================================================================================================================
// Chi Tiết Khách Hàng Phân Bổ Cấp 4
class ChiTietKHANGPhanBoCap4 {
  int iDKH;
  String nOIDUNG;
  List<InfoChiTietKHANGChuaDuyet> infoChiTietKHANGChuaDuyet;

  ChiTietKHANGPhanBoCap4({this.iDKH, this.nOIDUNG, this.infoChiTietKHANGChuaDuyet});

  ChiTietKHANGPhanBoCap4.fromJson(Map<String, dynamic> json) {
    iDKH = json['IDKH'];
    nOIDUNG = json['NOIDUNG'];
    if (json['info'] != null) {
      infoChiTietKHANGChuaDuyet = new List<InfoChiTietKHANGChuaDuyet>.empty(growable: true);
      json['info'].forEach((v) {
        infoChiTietKHANGChuaDuyet.add(new InfoChiTietKHANGChuaDuyet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDKH'] = this.iDKH;
    data['NOIDUNG'] = this.nOIDUNG;
    if (this.infoChiTietKHANGChuaDuyet != null) {
      data['info'] = this.infoChiTietKHANGChuaDuyet.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InfoChiTietKHANGChuaDuyet {
  String mAKHANG;
  String tENKHACHHANG;
  List<ChitietKHANGChuaDuyet> chitietKHANGChuaDuyet;

  InfoChiTietKHANGChuaDuyet({this.mAKHANG, this.tENKHACHHANG, this.chitietKHANGChuaDuyet});

  InfoChiTietKHANGChuaDuyet.fromJson(Map<String, dynamic> json) {
    mAKHANG = json['MA_KHANG'];
    tENKHACHHANG = json['TENKHACHHANG'];
    if (json['chitiet'] != null) {
      chitietKHANGChuaDuyet = new List<ChitietKHANGChuaDuyet>.empty(growable: true);
      json['chitiet'].forEach((v) {
        chitietKHANGChuaDuyet.add(new ChitietKHANGChuaDuyet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MA_KHANG'] = this.mAKHANG;
    data['TENKHACHHANG'] = this.tENKHACHHANG;
    if (this.chitietKHANGChuaDuyet != null) {
      data['chitiet'] = this.chitietKHANGChuaDuyet.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChitietKHANGChuaDuyet {
  int iDKHPB;
  double pCOSO;
  double pTHUCTE;
  String cHUKY;

  ChitietKHANGChuaDuyet({this.iDKHPB, this.pCOSO, this.pTHUCTE, this.cHUKY});

  ChitietKHANGChuaDuyet.fromJson(Map<String, dynamic> json) {
    iDKHPB = json['IDKHPB'];
    pCOSO = json['P_COSO'];
    pTHUCTE = json['P_THUCTE'];
    cHUKY = json['CHUKY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDKHPB'] = this.iDKHPB;
    data['P_COSO'] = this.pCOSO;
    data['P_THUCTE'] = this.pTHUCTE;
    data['CHUKY'] = this.cHUKY;
    return data;
  }
}