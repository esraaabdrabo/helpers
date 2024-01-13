
class AuthTokensModel {
  late String refresh, access;
  AuthTokensModel({required this.access, required this.refresh});
  AuthTokensModel.fromJson(Map<String, dynamic> data) {
    access = data['access'];
    refresh = data['refresh'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["access"] = access;
    data["refresh"] = refresh;

    return data;
  }
}
