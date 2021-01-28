/// banner : [{"id":33,"title":"企业文化-企业精神","url":"http://net.hebccc.com//Upload/UploadFiles/3736/2020-05-29/企业精神-app.jpeg","linkage":"","type":1},{"id":32,"title":"企业文化-核心价值观","url":"http://net.hebccc.com//Upload/UploadFiles/3736/2020-05-29/核心价值观-app.jpeg","linkage":"","type":1},{"id":31,"title":"企业文化-服务宗旨","url":"http://net.hebccc.com//Upload/UploadFiles/3736/2020-05-29/服务宗旨-app.jpeg","linkage":"","type":1},{"id":34,"title":"企业文化--企业愿景","url":"http://net.hebccc.com//Upload/UploadFiles/3736/2020-05-29/企业愿景-app.jpeg","linkage":"","type":1},{"id":27,"title":"门户网站","url":"http://net.hebccc.com//Upload/UploadFiles/6574/2020-03-05/menhu-APP.png","linkage":"http://inet.hebccc.com","type":1},{"id":19,"title":"急救小常识","url":"http://net.hebccc.com//Upload/UploadFiles/6322/2020-09-21/875612.jpg","linkage":"http://net.hebccc.com/Upload/UploadFiles/3736/2019-06-27/急救常识.mp4","type":3},{"id":58,"title":"积分商城","url":"http://net.hebccc.com//Upload/UploadFiles/6322/2020-09-10/shou.jpg","linkage":"","type":1}]
/// notice : [{"id":2630,"title":"关于公司第二事业部疫情期间违反规定的临时奖惩","content":null,"type":11,"announer":"刘浩3","publishTime":"2021-01-20","expireTime":"2021-02-20","job":null,"approver":null,"approveTime":null,"attachment":null},{"id":2629,"title":"网络分公司2020年12月奖惩","content":null,"type":4,"announer":"刘浩3","publishTime":"2021-01-15","expireTime":"2021-02-15","job":null,"approver":null,"approveTime":null,"attachment":null},{"id":2628,"title":"关于对第二事业部冯少光辞退的处罚","content":null,"type":11,"announer":"刘浩3","publishTime":"2021-01-06","expireTime":"2021-02-06","job":null,"approver":null,"approveTime":null,"attachment":null},{"id":2627,"title":"关于加强公司疫情防控工作的通知","content":null,"type":1,"announer":"刘浩3","publishTime":"2021-01-05","expireTime":"2021-01-20","job":null,"approver":null,"approveTime":null,"attachment":null},{"id":2626,"title":"关于转发省、市疫情防控最新要求暨加强公司疫情防控工作的通知","content":null,"type":1,"announer":"刘浩3","publishTime":"2021-01-04","expireTime":"2021-01-30","job":null,"approver":null,"approveTime":null,"attachment":null},{"id":2625,"title":"第一事业部关于中兴产品线安全生产检查临时处罚","content":null,"type":11,"announer":"刘浩3","publishTime":"2021-01-01","expireTime":"2021-02-01","job":null,"approver":null,"approveTime":null,"attachment":null}]
/// navigate : [{"MenuID":919,"SonMenu":null,"Mname":"考勤申报","FlowID":null,"url":null,"Remainder":0,"Sort":1,"MenuCode":"296"},{"MenuID":918,"SonMenu":null,"Mname":"填写周报","FlowID":"323f41ef-114b-465c-91ee-dc0bad0f1bea","url":null,"Remainder":0,"Sort":1,"MenuCode":"294"},{"MenuID":927,"SonMenu":null,"Mname":"会议室列表","FlowID":null,"url":null,"Remainder":0,"Sort":2,"MenuCode":"363"},{"MenuID":911,"SonMenu":null,"Mname":"请假记录","FlowID":"81d7bbfe-5b1e-423b-8c81-a4425ce66bf5","url":null,"Remainder":0,"Sort":1,"MenuCode":"274"},{"MenuID":912,"SonMenu":null,"Mname":"请假审批","FlowID":"81d7bbfe-5b1e-423b-8c81-a4425ce66bf5","url":null,"Remainder":0,"Sort":1,"MenuCode":"275"},{"MenuID":920,"SonMenu":null,"Mname":"请假申请","FlowID":"81d7bbfe-5b1e-423b-8c81-a4425ce66bf5","url":null,"Remainder":0,"Sort":1,"MenuCode":"300"},{"MenuID":922,"SonMenu":null,"Mname":"申报周期","FlowID":"323f41ef-114b-465c-91ee-dc0bad0f1bea","url":null,"Remainder":0,"Sort":1,"MenuCode":"344"}]
/// waitTaskCount : 0

class HomeModel {
  List<BannerBean> banner;
  List<NoticeBean> notice;
  List<NavigateBean> navigate;
  int waitTaskCount;

  static HomeModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    HomeModel homeModelBean = HomeModel();
    homeModelBean.banner = List()..addAll(
      (map['banner'] as List ?? []).map((o) => BannerBean.fromMap(o))
    );
    homeModelBean.notice = List()..addAll(
      (map['notice'] as List ?? []).map((o) => NoticeBean.fromMap(o))
    );
    homeModelBean.navigate = List()..addAll(
      (map['navigate'] as List ?? []).map((o) => NavigateBean.fromMap(o))
    );
    homeModelBean.waitTaskCount = map['waitTaskCount'];
    return homeModelBean;
  }

  Map toJson() => {
    "banner": banner,
    "notice": notice,
    "navigate": navigate,
    "waitTaskCount": waitTaskCount,
  };
}

/// MenuID : 919
/// SonMenu : null
/// Mname : "考勤申报"
/// FlowID : null
/// url : null
/// Remainder : 0
/// Sort : 1
/// MenuCode : "296"

class NavigateBean {
  int MenuID;
  dynamic SonMenu;
  String Mname;
  dynamic FlowID;
  dynamic url;
  int Remainder;
  int Sort;
  String MenuCode;

  static NavigateBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    NavigateBean navigateBean = NavigateBean();
    navigateBean.MenuID = map['MenuID'];
    navigateBean.SonMenu = map['SonMenu'];
    navigateBean.Mname = map['Mname'];
    navigateBean.FlowID = map['FlowID'];
    navigateBean.url = map['url'];
    navigateBean.Remainder = map['Remainder'];
    navigateBean.Sort = map['Sort'];
    navigateBean.MenuCode = map['MenuCode'];
    return navigateBean;
  }

  Map toJson() => {
    "MenuID": MenuID,
    "SonMenu": SonMenu,
    "Mname": Mname,
    "FlowID": FlowID,
    "url": url,
    "Remainder": Remainder,
    "Sort": Sort,
    "MenuCode": MenuCode,
  };
}

/// id : 2630
/// title : "关于公司第二事业部疫情期间违反规定的临时奖惩"
/// content : null
/// type : 11
/// announer : "刘浩3"
/// publishTime : "2021-01-20"
/// expireTime : "2021-02-20"
/// job : null
/// approver : null
/// approveTime : null
/// attachment : null

class NoticeBean {
  int id;
  String title;
  dynamic content;
  int type;
  String announer;
  String publishTime;
  String expireTime;
  dynamic job;
  dynamic approver;
  dynamic approveTime;
  dynamic attachment;

  static NoticeBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    NoticeBean noticeBean = NoticeBean();
    noticeBean.id = map['id'];
    noticeBean.title = map['title'];
    noticeBean.content = map['content'];
    noticeBean.type = map['type'];
    noticeBean.announer = map['announer'];
    noticeBean.publishTime = map['publishTime'];
    noticeBean.expireTime = map['expireTime'];
    noticeBean.job = map['job'];
    noticeBean.approver = map['approver'];
    noticeBean.approveTime = map['approveTime'];
    noticeBean.attachment = map['attachment'];
    return noticeBean;
  }

  Map toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "type": type,
    "announer": announer,
    "publishTime": publishTime,
    "expireTime": expireTime,
    "job": job,
    "approver": approver,
    "approveTime": approveTime,
    "attachment": attachment,
  };
}

/// id : 33
/// title : "企业文化-企业精神"
/// url : "http://net.hebccc.com//Upload/UploadFiles/3736/2020-05-29/企业精神-app.jpeg"
/// linkage : ""
/// type : 1

class BannerBean {
  int id;
  String title;
  String url;
  String linkage;
  int type;

  static BannerBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    BannerBean bannerBean = BannerBean();
    bannerBean.id = map['id'];
    bannerBean.title = map['title'];
    bannerBean.url = map['url'];
    bannerBean.linkage = map['linkage'];
    bannerBean.type = map['type'];
    return bannerBean;
  }

  Map toJson() => {
    "id": id,
    "title": title,
    "url": url,
    "linkage": linkage,
    "type": type,
  };
}