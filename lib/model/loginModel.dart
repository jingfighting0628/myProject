/// userID : 2358
/// userName : "于海波"
/// password : null
/// deptName : "第三事业部"
/// deptID : 314
/// tel : "13303116100&"
/// depPath : "1,314,"
/// Encrypt : "T8NhYtComlbnDHyrOuoUbA=="
/// AppTicket : "e976ecd5-6c67-494e-8f15-effdea736df0"
/// IsLeader : true
/// zhiwuID : "326,448"
/// RoleIDs : [463,524,566,521,327,553,565]
/// city : "不属于"
/// province : "不属于"

class LoginModel {
  int userID;
  String userName;
  dynamic password;
  String deptName;
  int deptID;
  String tel;
  String depPath;
  String Encrypt;
  String AppTicket;
  bool IsLeader;
  String zhiwuID;
  List<int> RoleIDs;
  String city;
  String province;

  static LoginModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LoginModel loginModelBean = LoginModel();
    loginModelBean.userID = map['userID'];
    loginModelBean.userName = map['userName'];
    loginModelBean.password = map['password'];
    loginModelBean.deptName = map['deptName'];
    loginModelBean.deptID = map['deptID'];
    loginModelBean.tel = map['tel'];
    loginModelBean.depPath = map['depPath'];
    loginModelBean.Encrypt = map['Encrypt'];
    loginModelBean.AppTicket = map['AppTicket'];
    loginModelBean.IsLeader = map['IsLeader'];
    loginModelBean.zhiwuID = map['zhiwuID'];
    loginModelBean.RoleIDs = List()..addAll(
      (map['RoleIDs'] as List ?? []).map((o) => int.tryParse(o.toString()))
    );
    loginModelBean.city = map['city'];
    loginModelBean.province = map['province'];
    return loginModelBean;
  }

  Map toJson() => {
    "userID": userID,
    "userName": userName,
    "password": password,
    "deptName": deptName,
    "deptID": deptID,
    "tel": tel,
    "depPath": depPath,
    "Encrypt": Encrypt,
    "AppTicket": AppTicket,
    "IsLeader": IsLeader,
    "zhiwuID": zhiwuID,
    "RoleIDs": RoleIDs,
    "city": city,
    "province": province,
  };
}