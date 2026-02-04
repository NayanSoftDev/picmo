class AccountModel {
  final String name;
  final String title;
  final String account;
  final String picmoId;

  AccountModel({
    required this.name,
    required this.title,
    required this.account,
    required this.picmoId,
  });

  factory AccountModel.empty() {
    return AccountModel(
      name: '',
      title: '',
      account: '',
      picmoId: '',
    );
  }

  AccountModel copyWith({
    String? name,
    String? title,
    String? account,
    String? picmoId,
  }) {
    return AccountModel(
      name: name ?? this.name,
      title: title ?? this.title,
      account: account ?? this.account,
      picmoId: picmoId ?? this.picmoId,
    );
  }
}
