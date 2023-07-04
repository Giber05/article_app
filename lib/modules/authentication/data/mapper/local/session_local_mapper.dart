import 'package:article_app/infrastructure/architecutre/local_mapper.dart';
import 'package:article_app/modules/authentication/domain/model/user_session.dart';
import 'package:article_app/modules/authentication/domain/model/created.dart';

class SessionLocalMapper extends LocalMapper<UserSession, dynamic> {
  SessionLocalMapper();

  @override
  UserSession toDomain(entity) {
    final created = entity["created"];
    return UserSession(
      name: entity['name'],
      email: entity['email'],
      phoneNumber: entity['phone_number'],
      uuid: entity['uuid'],
      created: Created(
        date: DateTime.parse(created['date']),
        timezoneType: created['timezone_type'],
        timezone: created['timezone'],
      ),
    );
  }

  @override
  toEntity(UserSession domain) {
    return {
      "name": domain.name,
      "email": domain.email,
      "phone_number": domain.phoneNumber,
      "uuid": domain.uuid,
      "created": {
        'date': domain.created.date.toString(),
        'timezone_type': domain.created.timezoneType,
        'timezone': domain.created.timezone,
      }
    };
  }
}
