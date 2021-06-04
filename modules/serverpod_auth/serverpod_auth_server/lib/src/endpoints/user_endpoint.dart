// Add your modules' endpoints to the `endpoints` directory. Run
// `serverpod generate` to produce the modules server and client code. Refer to
// the documentation on how to add endpoints to your server.

import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class UserEndpoint extends Endpoint {
  Future<UserInfo?> getAuthenticatedUserInfo(Session session) async {
    var userId = await session.authenticatedUserId;
    if (userId == null)
      return null;

    return (await session.db.findById(tUserInfo, userId)) as UserInfo;
  }

  Future<bool> updateUserInfo(Session session, UserInfo userInfo) async {
    return false;
  }
}