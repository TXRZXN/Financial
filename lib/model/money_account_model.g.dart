// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoneyAccount _$MoneyAccountFromJson(Map<String, dynamic> json) => MoneyAccount(
      bankName: json['bankName'] as String?,
      money: (json['money'] as num?)?.toDouble(),
      type: json['type'] as String?,
      detail: json['detail'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$MoneyAccountToJson(MoneyAccount instance) =>
    <String, dynamic>{
      'bankName': instance.bankName,
      'money': instance.money,
      'type': instance.type,
      'icon': instance.icon,
      'detail': instance.detail,
    };
