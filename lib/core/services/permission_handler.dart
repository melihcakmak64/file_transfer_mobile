import 'dart:io';
import 'package:photo_manager/photo_manager.dart';

class PermissionService {
  /// Media (video / audio / image)
  static Future<bool> requestMediaPermissions() async {
    if (!Platform.isAndroid) return true;

    final PermissionState ps = await PhotoManager.requestPermissionExtend();

    if (ps.isAuth) {
      return true;
    }

    if (ps.hasAccess) {
      return true;
    }

    // Kullanıcı kalıcı reddettiyse
    await PhotoManager.openSetting();
    return false;
  }
}
