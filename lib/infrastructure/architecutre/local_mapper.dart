import 'package:article_app/infrastructure/types/mapper/json_mapper.dart';

abstract class LocalMapper<Domain, Entity> {
  LocalMapper();

  Domain toDomain(Entity entity);

  Entity toEntity(Domain domain);
}
