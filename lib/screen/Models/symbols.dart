class FetchData {
  late String id;
  late String logoUrl;
  late String name;

  FetchData({required this.id, required this.logoUrl, required this.name});

  FetchData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoUrl = json['logo_url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_url'] = this.logoUrl;
    data['name'] = this.name;
    return data;
  }
}
