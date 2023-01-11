class UserModel {
  Doc? dDoc;
  bool? init;
  String? token;

  UserModel({this.dDoc, this.init, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    dDoc = json['_doc'] != null ? Doc.fromJson(json['_doc']) : null;
    init = json['$init'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dDoc != null) {
      data['_doc'] = dDoc!.toJson();
    }
    data['$init'] = init;
    data['token'] = token;
    return data;
  }
}

class Doc {
  Socials? socials;
  List<String>? role;
  String? passwordReset;
  bool? instructorStatus;
  String? phone;
  String? country;
  String? address;
  List<String>? bundles;
  String? status;
  String? sId;
  String? username;
  String? email;
  List<Courses>? courses;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Doc(
      {this.socials,
      this.role,
      this.passwordReset,
      this.instructorStatus,
      this.phone,
      this.country,
      this.address,
      this.bundles,
      this.status,
      this.sId,
      this.username,
      this.email,
      this.courses,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Doc.fromJson(Map<String, dynamic> json) {
    socials =
        json['socials'] != null ? Socials.fromJson(json['socials']) : null;
    role = json['role'].cast<String>();
    passwordReset = json['passwordReset'];
    instructorStatus = json['instructorStatus'];
    phone = json['phone'];
    country = json['country'];
    address = json['address'];
    bundles = json['bundles'] != null ? json['bundles'].cast<String>() : [];
    status = json['status'];
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (socials != null) {
      data['socials'] = socials!.toJson();
    }
    data['role'] = role;
    data['passwordReset'] = passwordReset;
    data['instructorStatus'] = instructorStatus;
    data['phone'] = phone;
    data['country'] = country;
    data['address'] = address;
    data['bundles'] = bundles;
    data['status'] = status;
    data['_id'] = sId;
    data['username'] = username;
    data['email'] = email;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Socials {
  String? facebook;
  String? twitter;
  String? inistagram;
  String? tiktok;
  String? youtube;
  String? whatsapp;
  String? telegram;
  String? github;

  Socials(
      {this.facebook,
      this.twitter,
      this.inistagram,
      this.tiktok,
      this.youtube,
      this.whatsapp,
      this.telegram,
      this.github});

  Socials.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    twitter = json['twitter'];
    inistagram = json['inistagram'];
    tiktok = json['tiktok'];
    youtube = json['youtube'];
    whatsapp = json['whatsapp'];
    telegram = json['telegram'];
    github = json['github'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['facebook'] = facebook;
    data['twitter'] = twitter;
    data['inistagram'] = inistagram;
    data['tiktok'] = tiktok;
    data['youtube'] = youtube;
    data['whatsapp'] = whatsapp;
    data['telegram'] = telegram;
    data['github'] = github;
    return data;
  }
}

class Courses {
  String? sId;
  String? userId;
  String? courseId;
  String? expireDate;

  Courses({this.sId, this.userId, this.courseId, this.expireDate});

  Courses.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    courseId = json['course_id'];
    expireDate = json['expire_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['user_id'] = userId;
    data['course_id'] = courseId;
    data['expire_date'] = expireDate;
    return data;
  }
}
