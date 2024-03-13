import 'package:json_annotation/json_annotation.dart';
part 'money_account_model.g.dart';

@JsonSerializable()
class MoneyAccount {
  @JsonKey(name: "bankName")
  String? bankName;
  @JsonKey(name: "money")
  double? money;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "icon")
  String? icon;
  @JsonKey(name: "detail")
  String? detail;

  MoneyAccount({this.bankName, this.money, this.type, this.detail, this.icon});

  factory MoneyAccount.fromJson(Map<String, dynamic> json) =>
      _$MoneyAccountFromJson(json);

  Map<String, dynamic> toJson() => _$MoneyAccountToJson(this);

  @override
  String toString() {
    return 'MoneyAccount{money:$money,bankName:$bankName,type:$type,icon:$icon,detail:$detail},';
  }

  factory MoneyAccount.fromString(String string) {
    List<String> parts = string.split(',');

    String newDetail = parts[4].split(':')[1];
    if (newDetail.endsWith("}")) {
      newDetail = newDetail.substring(0, newDetail.length - 1);
    }

    MoneyAccount newAcc = MoneyAccount(
      money: double.parse(
        parts[0].split(':')[1],
      ),
      bankName: parts[1].split(':')[1].toString(),
      detail: newDetail,
      icon: parts[3].split(':')[1].toString(),
      type: parts[2].split(':')[1].toString(),
    );

    return newAcc;
  }
}
