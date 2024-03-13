class FundModel {
  String? name;
  double? percent;
  double? expectreturn;
  double? risksd;

  FundModel({
    required this.name,
    required this.percent,
    required this.expectreturn,
    required this.risksd,
  });
  factory FundModel.fromJson(Map<String, dynamic> json) {
    return FundModel(
      name: json["name"],
      percent: json["percent"],
      expectreturn: json["expectreturn"],
      risksd: json["risksd"],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["percent"] = percent;
    data["expectreturn"] = expectreturn;
    data["risksd"] = risksd;

    return data;
  }
}
