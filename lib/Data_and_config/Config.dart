//===============================================================================================================================================================================================
//=================================================================KHAI BÁO URL LẤY DỮ LIỆU Ở ĐÂY ===============================================================================================
//===============================================================================================================================================================================================
//============ #1.API ADDRESS. ==================================================================================================================================================================
const SERVER_IP = "https://apidsm.npc.com.vn";
//============ #2.API ADDRESS. ==================================================================================================================================================================
const API_LOGIN = "$SERVER_IP/Login/Login";
//============ #3.API CHANGE PASSWORD ===========================================================================================================================================================
const API_CHANGE_PASSWORD = "$SERVER_IP/User/Mobile_Update_User";
//============ #4.API CHANGE INFOR USER =========================================================================================================================================================
const API_CHANGE_INFOR_USER = "$SERVER_IP/User/Mobile_Update_Infor_User";
//============ #5.API DANH SÁCH KHÁCH HÀNG THỎA THUẬN ===========================================================================================================================================
const API_GET_DSACH_KHACH_HANG_THOA_THUAN = "$SERVER_IP/PhanBo/Mobile_DanhSachPBC3_DaDuyet_byIDDonVi";
//============ #6.API DANH SÁCH KHÁCH HÀNG CHƯA DUYỆT ===========================================================================================================================================
const API_GET_DSACH_KHACH_HANG_CHUA_DUYET = "$SERVER_IP/ThoaThuanKH/Mobile_DanhSachThoaThuanKhachHang_ChuaDuyet_byIDDonVi";
//============ #7.API XÁC NHẬN 1 KHÁCH HÀNG =====================================================================================================================================================
const API_XAC_NHAN_1_KHANG = "$SERVER_IP/ThoaThuanKH/Mobile_DuyetKHangThoaThuan_XacNhan";
//============ #8.API KHÔNG XÁC NHẬN 1 KHÁCH HÀNG ===============================================================================================================================================
const API_KO_XAC_NHAN_1_KHANG = "$SERVER_IP/ThoaThuanKH/Mobile_DuyetKHangThoaThuan_KhongXacNhan";
//============ #9.API XÁC NHẬN LIST KHÁCH HÀNG ==================================================================================================================================================
const API_XAC_NHAN_LIST_KHANG = "$SERVER_IP/ThoaThuanKH/Mobile_DuyetKHangThoaThuan_XacNhan";
//============ #10.API DANH SÁCH KHÁCH HÀNG CHƯA DUYỆT PHÂN BỔ CẤP 4 GIÁM ĐỐC ===================================================================================================================
const API_GET_DSACH_KHACH_HANG_CHUA_DUYET_PHAN_BO_CAP4_GD = "$SERVER_IP/PhanBo/Mobile_DanhSachPBC4_ChuaDuyet_byIDDonVi";
//============ #11.API DANH SÁCH KHÁCH HÀNG ĐÃ DUYỆT PHÂN BỔ CẤP 4 ==============================================================================================================================
const API_GET_DSACH_KHACH_HANG_DA_DUYET_PHAN_BO_CAP4 = "$SERVER_IP/PhanBo/Mobile_DanhSachPBC4_DaDuyet_byIDDonVi";
//============ #12.API CHI TIẾT KHÁCH HÀNG CHƯA DUYỆT CẤP 4 =====================================================================================================================================
const API_GET_DETAIL_KHACH_HANG_CHUA_DUYET_PB_CAP4 = "$SERVER_IP/PhanBo/Mobile_ThongTinPhanBoKHang_ByIdKH_ChuaDuyet";
//============ #13.API XÁC NHẬN PHÂN BỔ 1 KHÁCH HÀNG CẤP 4 ======================================================================================================================================
const API_XAC_NHAN_1_KHANG_PB_CAP4 = "$SERVER_IP/PhanBo/Mobile_DuyetPhanBoC4_byIDKHPB";
//============ #14.API KHÔNG XÁC NHẬN PHÂN BỔ 1 KHÁCH HÀNG CẤP 4 ================================================================================================================================
const API_KO_XAC_NHAN_1_KHANG_PB_CAP4 = "$SERVER_IP/PhanBo/Mobile_KhongDuyetPhanBoC4_byIDKHPB";
//============ #15. API DANH SÁCH KHÁCH HÀNG CHƯA DUYỆT PHÂN BỔ CẤP 3 ===========================================================================================================================
const API_GET_DSACH_KHANG_HANG_CHUA_DUYET_PB_CAP3 = "$SERVER_IP/PhanBo/Mobile_DanhSachPBC3_ChuaDuyet_byIDDonVi";
//============ #16. API XÁC NHẬN PHÂN BỔ 1 KHÁCH HÀNG CẤP 3 =====================================================================================================================================
const API_XAC_NHAN_1_KHANG_PB_CAP3 = "$SERVER_IP/PhanBo/Mobile_DuyetPhanBoC3_byIDPB_DL";
//============ #17. API KHÔNG XÁC NHẬN PHÂN BỔ 1 KHÁCH HÀNG CẤP 3 ===============================================================================================================================
const API_KO_XAC_NHAN_1_KHANG_PB_CAP3 = "$SERVER_IP/ThoaThuanKH/Mobile_DuyetKHangThoaThuan_KhongXacNhan";
//============ #18. API CHI TIẾT KHÁCH HÀNG TỰ ĐĂNG KÝ SỐ =======================================================================================================================================
const API_GET_DETAIL_KHANG_TU_DANG_KY_SO = "$SERVER_IP/DangKyCS/Mobile_ThongTinPhanBoKHang_ByMA_KHANG";
//============ #19. API KHÁCH HÀNG TỰ ĐĂNG KÝ P_KHANG ===========================================================================================================================================
const API_KHANG_TU_DANG_KY_P_KHANG = "$SERVER_IP/PhanBo/Mobile_DuyetPhanBoC4_byIDKHPB";
