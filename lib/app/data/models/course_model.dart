class CourseModel {
  String? category;
  List<String>? whatYouWillLearn;
  String? price;
  bool? published;
  bool? paid;
  List<Planes>? planes;
  String? sId;
  String? slug;
  Instructor? instructor;
  String? name;
  String? shortDescription;
  Image? image;
  List<Sections>? sections;
  String? createdAt;
  String? updatedAt;
  int? iV;
  late bool isAppleReview;

  CourseModel({
    this.category,
    this.whatYouWillLearn,
    this.price,
    this.published,
    this.paid,
    this.planes,
    this.sId,
    this.slug,
    this.instructor,
    this.name,
    this.shortDescription,
    this.image,
    this.sections,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.isAppleReview=true
  });

  CourseModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    whatYouWillLearn = json['what_you_will_learn'].cast<String>();
    price = json['price'].toString();
    published = json['published'];
    paid = json['paid'];
    if (json['planes'] != null) {
      planes = <Planes>[];
      json['planes'].forEach((v) {
        planes!.add(Planes.fromJson(v));
      });
    }
    sId = json['_id'];
    slug = json['slug'];
    instructor = json['instructor'] != null
        ? Instructor.fromJson(json['instructor'])
        : null;
    name = json['name'];
    shortDescription = json['short_description'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;

    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(Sections.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    isAppleReview=true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['what_you_will_learn'] = whatYouWillLearn;
    data['price'] = price;
    data['published'] = published;
    data['paid'] = paid;
    if (planes != null) {
      data['planes'] = planes!.map((v) => v.toJson()).toList();
    }
    data['_id'] = sId;
    data['slug'] = slug;
    if (instructor != null) {
      data['instructor'] = instructor!.toJson();
    }
    data['name'] = name;
    data['short_description'] = shortDescription;
    if (image != null) {
      data['image'] = image!.toJson();
    }

    if (sections != null) {
      data['sections'] = sections!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Planes {
  String? sId;
  String? name;
  String? price;
  String? duration;
  int? iV;

  Planes({this.sId, this.name, this.price, this.duration, this.iV});

  Planes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    duration = json['duration'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['_id'] = sId;
    data['name'] = name;
    data['price'] = price;
    data['duration'] = duration;
    data['__v'] = iV;
    return data;
  }
}

class Instructor {
  String? sId;
  String? username;

  Instructor({this.sId, this.username});

  Instructor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['username'] = username;
    return data;
  }
}

class Image {
  String? eTag;
  String? location;
  String? key;

  String? bucket;

  Image({this.eTag, this.location, this.key, this.bucket});

  Image.fromJson(Map<String, dynamic> json) {
    eTag = json['ETag'];
    location = json['Location'];
    key = json['key'];
    key = json['Key'];
    bucket = json['Bucket'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ETag'] = eTag;
    data['Location'] = location;
    data['key'] = key;
    data['Key'] = key;
    data['Bucket'] = bucket;
    return data;
  }
}

class Sections {
  String? sId;
  String? name;
  String? slug;
  String? course;
  String? updatedAt;
  String? createdAt;
  List<Lessons>? lessons;

  Sections(
      {this.sId,
      this.name,
      this.slug,
      this.course,
      this.updatedAt,
      this.createdAt,
      this.lessons});

  Sections.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    course = json['course'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(Lessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['course'] = course;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    if (lessons != null) {
      data['lessons'] = lessons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lessons {
  bool? freePreview;
  String? sId;
  String? title;
  String? slug;
  String? content;
  String? videoLink;
  String? duration;
  String? totalDuration;
  String? resources;
  String? updatedAt;
  String? createdAt;

  Lessons(
      {this.freePreview,
      this.sId,
      this.title,
      this.slug,
      this.content,
      this.videoLink,
      this.duration,
      this.totalDuration,
      this.resources,
      this.updatedAt,
      this.createdAt});

  Lessons.fromJson(Map<String, dynamic> json) {
    freePreview = json['free_preview'];
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    content = json['content'];
    videoLink = json['video_link'];
    duration = json['duration'];
    totalDuration = json['total_duration'];
    resources = json['resources'].toString();
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['free_preview'] = freePreview;
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    data['content'] = content;
    data['video_link'] = videoLink;
    data['duration'] = duration;
    data['total_duration'] = totalDuration;
    data['resources'] = resources;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    return data;
  }
}
