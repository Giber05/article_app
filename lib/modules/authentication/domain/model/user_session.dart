import 'package:equatable/equatable.dart';

import 'package:article_app/modules/authentication/domain/model/created.dart';

class UserSession extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String uuid;
  final Created created;
  const UserSession({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.uuid,
    required this.created,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [name, email,phoneNumber,uuid, created];



}
