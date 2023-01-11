class BundleModel {
  String? status;
  List<String>? courses;
  String? sId;
  String? name;
  double? price;
  Image? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BundleModel(
      {this.status,
      this.courses,
      this.sId,
      this.name,
      this.price,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.iV});

  BundleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    courses = json['courses'].cast<String>();
    sId = json['_id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['courses'] = courses;
    data['_id'] = sId;
    data['name'] = name;
    data['price'] = price;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
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

    bucket = json['Bucket'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ETag'] = eTag;
    data['Location'] = location;
    data['key'] = key;

    data['Bucket'] = bucket;
    return data;
  }
}
