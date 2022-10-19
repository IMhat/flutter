import 'dart:convert';

class buyProduct {
  final String fromUsername;
  final double amount;
  final String summary;

  buyProduct({
    required this.fromUsername,
    required this.amount,
    required this.summary,
  });

  Map<String, dynamic> toMap() {
    return {
      'fromUsername': fromUsername,
      'amount': amount,
      'summary': summary,
    };
  }

  factory buyProduct.fromMap(Map<String, dynamic> map) {
    return buyProduct(
      fromUsername: map['fromUsername'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      summary: map['summary'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory buyProduct.fromJson(String source) =>
      buyProduct.fromMap(json.decode(source));
}
