import 'package:provider_example/data/models/colors_model.dart';

class UsersCardsModel {
  num id;
  String card_type;
  String card_number;
  String bank_name;
  num money_amount;
  String card_currency;
  String expire_date;
  String icon_image;
  ColorsModel colors;

  UsersCardsModel({
    required this.id,
    required this.card_type,
    required this.card_number,
    required this.bank_name,
    required this.money_amount,
    required this.card_currency,
    required this.expire_date,
    required this.icon_image,
    required this.colors,
  });

  factory UsersCardsModel.fromJson(Map<String, dynamic> jsonData) {
    return UsersCardsModel(
      id: jsonData['id'] as num? ?? 0,
      card_type: jsonData['card_type'] as String? ?? '',
      card_number: jsonData['card_number'] as String? ?? '',
      bank_name: jsonData['bank_name'] as String? ?? '',
      money_amount: jsonData['money_amount'] as num? ?? 0,
      card_currency: jsonData['card_currency'] as String? ?? '',
      expire_date: jsonData['expire_date'] as String? ?? '',
      icon_image: jsonData['icon_image'] as String? ?? '',
      colors: ColorsModel.fromJson(jsonData['colors']),
    );
  }

  @override
  String toString() {
    return '''
    id: $id,
    card_type: $card_type
    card_number: $card_number
    bank_name: $bank_name
    money_amount: $money_amount
    card_currency: $card_currency
    expire_date: $expire_date
    icon_image: $icon_image
    colors: $colors
    ''';
  }
}