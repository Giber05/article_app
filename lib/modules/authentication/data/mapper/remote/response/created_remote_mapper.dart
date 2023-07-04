import 'package:article_app/infrastructure/types/mapper/json_mapper.dart';
import 'package:article_app/modules/authentication/domain/model/created.dart';

class CreatedRemoteMapper implements FromJSONMapper<Created> {
  @override
  Created toModel(json) {
    final createdJSON = json["created"];
    return Created(
      date: DateTime.parse(createdJSON['date']),
      timezoneType: createdJSON['timezone_type'],
      timezone: createdJSON['timezone'],
    );
  }
}
