import 'dart:convert';

class negativeTransaction {
  late dynamic amount;
  late dynamic purpose;
  late dynamic reference;
  late dynamic balanceBefore;
  late dynamic balanceAfter;
  late dynamic summary;
  late dynamic trnxSummary;
  late dynamic createdAt;
  late dynamic updatedAt;
  late dynamic _id;

  negativeTransaction(
    this.amount,
    this.purpose,
    this.reference,
    this.balanceBefore,
    this.balanceAfter,
    this.summary,
    this.trnxSummary,
    this.createdAt,
    this.updatedAt,
    this._id,
  );

  factory negativeTransaction.fromJson(String str) =>
      negativeTransaction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  negativeTransaction.fromMap(Map<String, dynamic> map) {
    amount = map['amount'];
    purpose = map['purpose'];
    reference = map['reference'];
    balanceBefore = map['balanceBefore'];
    balanceAfter = map['balanceAfter'];
    summary = map['summary'];
    trnxSummary = map['trnxSummary'];
    createdAt = map['createdAt'];
    updatedAt = map['updatedAt'];
    _id = map['_id'];
  }

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "purpose": purpose,
        "reference": reference,
        "balanceBefore": balanceBefore,
        "balanceAfter": balanceAfter,
        "summary": summary,
        "trnxSummary": trnxSummary,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "_id": _id,
      };

  negativeTransaction copy() => negativeTransaction(
        amount,
        purpose,
        reference,
        balanceBefore,
        balanceAfter,
        summary,
        trnxSummary,
        updatedAt,
        createdAt,
        _id,
      );

  then(Null Function(dynamic value) param0) {}
}
