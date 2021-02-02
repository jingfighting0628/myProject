/// TeamCity : ""
/// DicSign : [{"Key":"2-2","Value":"0"},{"Key":"2-1","Value":"0"},{"Key":"1-31","Value":"0"},{"Key":"1-30","Value":"0"},{"Key":"1-29","Value":"1"},{"Key":"1-28","Value":"1"},{"Key":"1-27","Value":"1"}]
/// DicWorkStation : [{"Key":"1","Value":"工作"}]
/// DicProject : []
/// DicLodging : [{"Key":"158","Value":"宿舍"},{"Key":"159","Value":"家"},{"Key":"160","Value":"宾馆"},{"Key":"161","Value":"在途"},{"Key":"17042","Value":"临时租赁宿舍"}]
/// DicTraffic : [{"Key":"131","Value":"火车"},{"Key":"132","Value":"长途汽车"},{"Key":"134","Value":"出租车"},{"Key":"135","Value":"公交车"},{"Key":"136","Value":"轮船"},{"Key":"138","Value":"飞机"},{"Key":"17043","Value":"地铁"},{"Key":"17044","Value":"路桥费"},{"Key":"17097","Value":"退/改手续费"}]
/// IsShow : false
/// DicProductLine : null
/// DicProjectProvince : null
/// UploadPath : "http://net.hebccc.com/Upload/UploadInvoice"

class AttendanceApplyModel {
  String TeamCity;
  List<DicSignBean> DicSign;
  List<DicWorkStationBean> DicWorkStation;
  List<dynamic> DicProject;
  List<DicLodgingBean> DicLodging;
  List<DicTrafficBean> DicTraffic;
  bool IsShow;
  dynamic DicProductLine;
  dynamic DicProjectProvince;
  String UploadPath;

  static AttendanceApplyModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AttendanceApplyModel attendanceApplyModelBean = AttendanceApplyModel();
    attendanceApplyModelBean.TeamCity = map['TeamCity'];
    attendanceApplyModelBean.DicSign = List()..addAll(
      (map['DicSign'] as List ?? []).map((o) => DicSignBean.fromMap(o))
    );
    attendanceApplyModelBean.DicWorkStation = List()..addAll(
      (map['DicWorkStation'] as List ?? []).map((o) => DicWorkStationBean.fromMap(o))
    );
    attendanceApplyModelBean.DicProject = map['DicProject'];
    attendanceApplyModelBean.DicLodging = List()..addAll(
      (map['DicLodging'] as List ?? []).map((o) => DicLodgingBean.fromMap(o))
    );
    attendanceApplyModelBean.DicTraffic = List()..addAll(
      (map['DicTraffic'] as List ?? []).map((o) => DicTrafficBean.fromMap(o))
    );
    attendanceApplyModelBean.IsShow = map['IsShow'];
    attendanceApplyModelBean.DicProductLine = map['DicProductLine'];
    attendanceApplyModelBean.DicProjectProvince = map['DicProjectProvince'];
    attendanceApplyModelBean.UploadPath = map['UploadPath'];
    return attendanceApplyModelBean;
  }

  Map toJson() => {
    "TeamCity": TeamCity,
    "DicSign": DicSign,
    "DicWorkStation": DicWorkStation,
    "DicProject": DicProject,
    "DicLodging": DicLodging,
    "DicTraffic": DicTraffic,
    "IsShow": IsShow,
    "DicProductLine": DicProductLine,
    "DicProjectProvince": DicProjectProvince,
    "UploadPath": UploadPath,
  };
}

/// Key : "131"
/// Value : "火车"

class DicTrafficBean {
  String Key;
  String Value;

  static DicTrafficBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DicTrafficBean dicTrafficBean = DicTrafficBean();
    dicTrafficBean.Key = map['Key'];
    dicTrafficBean.Value = map['Value'];
    return dicTrafficBean;
  }

  Map toJson() => {
    "Key": Key,
    "Value": Value,
  };
}

/// Key : "158"
/// Value : "宿舍"

class DicLodgingBean {
  String Key;
  String Value;

  static DicLodgingBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DicLodgingBean dicLodgingBean = DicLodgingBean();
    dicLodgingBean.Key = map['Key'];
    dicLodgingBean.Value = map['Value'];
    return dicLodgingBean;
  }

  Map toJson() => {
    "Key": Key,
    "Value": Value,
  };
}

/// Key : "1"
/// Value : "工作"

class DicWorkStationBean {
  String Key;
  String Value;

  static DicWorkStationBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DicWorkStationBean dicWorkStationBean = DicWorkStationBean();
    dicWorkStationBean.Key = map['Key'];
    dicWorkStationBean.Value = map['Value'];
    return dicWorkStationBean;
  }

  Map toJson() => {
    "Key": Key,
    "Value": Value,
  };
}

/// Key : "2-2"
/// Value : "0"

class DicSignBean {
  String Key;
  String Value;

  static DicSignBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DicSignBean dicSignBean = DicSignBean();
    dicSignBean.Key = map['Key'];
    dicSignBean.Value = map['Value'];
    return dicSignBean;
  }

  Map toJson() => {
    "Key": Key,
    "Value": Value,
  };
}