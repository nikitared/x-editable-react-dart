import 'dart:io';
import 'package:path/path.dart';
import 'package:http_server/http_server.dart';

main() async {
  VirtualDirectory staticFiles = new VirtualDirectory(new File(".").path);
  var serverRequests =
  await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 4048);
  await for (HttpRequest request in serverRequests) {
    var path = join(dirname(Platform.script.toFilePath()));
    var absolutePath = join(path, request.uri.path.substring(1));
    if (FileSystemEntity.isDirectorySync(absolutePath)) {
      staticFiles.serveFile(new File(join(absolutePath, "index.html")), request);
    } else {
      staticFiles.serveFile(new File(absolutePath), request);
    }
  }
}