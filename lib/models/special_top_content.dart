class SpecialTopContentModel {
  int? contentId;
  int? contentType;
  String? imgBgPath;
  String? contentHeading;
  Null? contentSubHeading;
  String? contentDetails;
  String? bnCatName;
  String? catSlug;
  String? subcatSlug;
  String? createdAt;

  SpecialTopContentModel(
      {this.contentId,
        this.contentType,
        this.imgBgPath,
        this.contentHeading,
        this.contentSubHeading,
        this.contentDetails,
        this.bnCatName,
        this.catSlug,
        this.subcatSlug,
        this.createdAt});

  SpecialTopContentModel.fromJson(Map<String, dynamic> json) {
    contentId = json['content_id'];
    contentType = json['content_type'];
    imgBgPath = json['img_bg_path'];
    contentHeading = json['content_heading'];
    contentSubHeading = json['content_sub_heading'];
    contentDetails = json['content_details'];
    bnCatName = json['bn_cat_name'];
    catSlug = json['cat_slug'];
    subcatSlug = json['subcat_slug'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content_id'] = this.contentId;
    data['content_type'] = this.contentType;
    data['img_bg_path'] = this.imgBgPath;
    data['content_heading'] = this.contentHeading;
    data['content_sub_heading'] = this.contentSubHeading;
    data['content_details'] = this.contentDetails;
    data['bn_cat_name'] = this.bnCatName;
    data['cat_slug'] = this.catSlug;
    data['subcat_slug'] = this.subcatSlug;
    data['created_at'] = this.createdAt;
    return data;
  }
}
