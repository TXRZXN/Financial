class SqlModel {
  int? id;
  String? idShop;
  String? nameShop;

  SqlModel({this.id, this.idShop, this.nameShop});

  SqlModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idShop = json['idShop'];
    nameShop = json['nameShop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idShop'] = idShop;
    data['nameShop'] = nameShop;
    return data;
  }
}
