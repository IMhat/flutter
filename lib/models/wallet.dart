import 'dart:convert';

class Wallet {
  late dynamic balance;
  late dynamic username;
  late dynamic updateAt;
  late dynamic createdAt;
  late dynamic _id;

  Wallet(
    this.balance,
    this.username,
    this.updateAt,
    this.createdAt,
    this._id,
  );
  factory Wallet.fromJson(String str) => Wallet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  Wallet.fromMap(Map<String, dynamic> map) {
    balance = map['balance'];
    username = map['username'];
    updateAt = map['updateAt'];
    createdAt = map['createdAt'];
    _id = map['id'];
  }

  Map<String, dynamic> toMap() => {
        "balance": balance,
        "username": username,
        "updateAt": updateAt,
        "createdAt": createdAt,
        "id": _id,
      };

  Wallet copy() => Wallet(
        balance,
        username,
        updateAt,
        createdAt,
        _id,
      );

  then(Null Function(dynamic value) param0) {}
}
