import 'package:article_app/infrastructure/types/mapper/json_mapper.dart';
import 'package:article_app/modules/authentication/data/mapper/remote/response/created_remote_mapper.dart';
import 'package:article_app/modules/authentication/domain/model/user_session.dart';

class UserSessionRemoteResMapper implements FromJSONMapper<UserSession> {
  @override
  UserSession toModel(json) {
    final CreatedRemoteMapper createdRemoteMapper = CreatedRemoteMapper();
    final userJSON = json["user"];
    return UserSession(
      name: userJSON['name'],
      email: userJSON['email'],
      phoneNumber: userJSON['phone_number'],
      uuid: userJSON['uuid'],
      created: createdRemoteMapper.toModel(userJSON),
    );
  }
}
