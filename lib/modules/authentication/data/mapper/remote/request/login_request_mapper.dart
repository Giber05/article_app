import 'package:article_app/infrastructure/types/mapper/json_mapper.dart';

class LoginRemoteReqMapper
    extends ToJSONMapper<({String email, String password})> {
  LoginRemoteReqMapper(super.data);

  @override
  toJSON() {
    return {
      "password": data.password,
      "email": data.email,
    };
  }
}
