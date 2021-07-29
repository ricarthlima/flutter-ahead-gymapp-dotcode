class LoginModel {
  String? name;
  String? email;
  bool? keepOn;

  String? localId;
  String? idToken;

  LoginModel({
    this.name,
    this.email,
    this.keepOn,
    this.localId,
    this.idToken,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    keepOn = json['keepOn'];
    localId = json['localId'];
    idToken = json['idToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['keepOn'] = this.keepOn;
    data['localId'] = this.localId;
    data['idToken'] = this.idToken;
    return data;
  }

  String toString() {
    return "Name: " +
        this.name! +
        "\nE-mail: " +
        this.email! +
        "\nKeep on: " +
        this.keepOn!.toString() +
        "\nLocal Id: " +
        this.localId! +
        "\nId Token: " +
        this.idToken!;
  }
}
