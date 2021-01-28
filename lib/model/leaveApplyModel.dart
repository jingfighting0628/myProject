

/// UploadServerUrl : "http://net.hebccc.com/Upload/image"
/// FlowType : 0
/// Approver : []
/// CopyFor : []
/// Selects : [{"Type":139,"Select":[{"key":142,"value":"年休假"},{"key":140,"value":"病假"},{"key":2144,"value":"丧假"},{"key":141,"value":"事假"},{"key":1760,"value":"陪产假"},{"key":2145,"value":"工伤假"},{"key":16989,"value":"疗养假"}]}]
/// LeaveDay : {"AnnualSurplus":10,"AnnualTotal":10,"AnnualUsed":0,"MonthleaveUsed":0,"YearleaveUsed":0}
/// LevelChild : [{"Type":2144,"Select":[{"key":20238,"value":"父亲"},{"key":20239,"value":"母亲"},{"key":20240,"value":"配偶父亲"},{"key":20241,"value":"配偶母亲"},{"key":20242,"value":"子女"},{"key":20332,"value":"其他"}]}]

class LeaveApplyModel {
  String UploadServerUrl;
  int FlowType;
  List<dynamic> Approver;
  List<dynamic> CopyFor;
  List<SelectsBean> Selects;
  LeaveDayBean LeaveDay;
  List<LevelChildBean> LevelChild;

  static LeaveApplyModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LeaveApplyModel leaveApplyModelBean = LeaveApplyModel();
    leaveApplyModelBean.UploadServerUrl = map['UploadServerUrl'];
    leaveApplyModelBean.FlowType = map['FlowType'];
    leaveApplyModelBean.Approver = map['Approver'];
    leaveApplyModelBean.CopyFor = map['CopyFor'];
    leaveApplyModelBean.Selects = List()..addAll(
      (map['Selects'] as List ?? []).map((o) => SelectsBean.fromMap(o))
    );
    leaveApplyModelBean.LeaveDay = LeaveDayBean.fromMap(map['LeaveDay']);
    leaveApplyModelBean.LevelChild = List()..addAll(
      (map['LevelChild'] as List ?? []).map((o) => LevelChildBean.fromMap(o))
    );
    return leaveApplyModelBean;
  }

  Map toJson() => {
    "UploadServerUrl": UploadServerUrl,
    "FlowType": FlowType,
    "Approver": Approver,
    "CopyFor": CopyFor,
    "Selects": Selects,
    "LeaveDay": LeaveDay,
    "LevelChild": LevelChild,
  };
}

/// Type : 2144
/// Select : [{"key":20238,"value":"父亲"},{"key":20239,"value":"母亲"},{"key":20240,"value":"配偶父亲"},{"key":20241,"value":"配偶母亲"},{"key":20242,"value":"子女"},{"key":20332,"value":"其他"}]

class LevelChildBean {
  int Type;
  List<SelectBean> Select;

  static LevelChildBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LevelChildBean levelChildBean = LevelChildBean();
    levelChildBean.Type = map['Type'];
    levelChildBean.Select = List()..addAll(
      (map['Select'] as List ?? []).map((o) => SelectBean.fromMap(o))
    );
    return levelChildBean;
  }

  Map toJson() => {
    "Type": Type,
    "Select": Select,
  };
}

/// key : 20238
/// value : "父亲"

class SelectBean {
  int key;
  String value;

  static SelectBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SelectBean selectBean = SelectBean();
    selectBean.key = map['key'];
    selectBean.value = map['value'];
    return selectBean;
  }

  Map toJson() => {
    "key": key,
    "value": value,
  };
}

/// AnnualSurplus : 10
/// AnnualTotal : 10
/// AnnualUsed : 0
/// MonthleaveUsed : 0
/// YearleaveUsed : 0

class LeaveDayBean {
  int AnnualSurplus;
  int AnnualTotal;
  int AnnualUsed;
  int MonthleaveUsed;
  int YearleaveUsed;

  static LeaveDayBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LeaveDayBean leaveDayBean = LeaveDayBean();
    leaveDayBean.AnnualSurplus = map['AnnualSurplus'];
    leaveDayBean.AnnualTotal = map['AnnualTotal'];
    leaveDayBean.AnnualUsed = map['AnnualUsed'];
    leaveDayBean.MonthleaveUsed = map['MonthleaveUsed'];
    leaveDayBean.YearleaveUsed = map['YearleaveUsed'];
    return leaveDayBean;
  }

  Map toJson() => {
    "AnnualSurplus": AnnualSurplus,
    "AnnualTotal": AnnualTotal,
    "AnnualUsed": AnnualUsed,
    "MonthleaveUsed": MonthleaveUsed,
    "YearleaveUsed": YearleaveUsed,
  };
}

/// Type : 139
/// Select : [{"key":142,"value":"年休假"},{"key":140,"value":"病假"},{"key":2144,"value":"丧假"},{"key":141,"value":"事假"},{"key":1760,"value":"陪产假"},{"key":2145,"value":"工伤假"},{"key":16989,"value":"疗养假"}]

class SelectsBean {
  int Type;
  List<SelectBean> Select;

  static SelectsBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SelectsBean selectsBean = SelectsBean();
    selectsBean.Type = map['Type'];
    selectsBean.Select = List()..addAll(
      (map['Select'] as List ?? []).map((o) => SelectBean.fromMap(o))
    );
    return selectsBean;
  }

  Map toJson() => {
    "Type": Type,
    "Select": Select,
  };
}






