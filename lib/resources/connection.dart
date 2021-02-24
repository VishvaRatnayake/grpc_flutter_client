import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:simple_grpc/resources/config.dart';

class Connection {
  //http
  Future<ClientChannel> getHttpConnection() async {
    return ClientChannel(Config.SERVER_URL,
        port: Config.PORT,
        options: ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ));
  }

  //https
  Future<ClientChannel> getHttpsConnection() async {
    ByteData byte = await rootBundle.load('resources/cert.pem');
    return ClientChannel(Config.SERVER_URL,
        port: Config.PORT,
        options: ChannelOptions(
          credentials: ChannelCredentials.secure(
              certificates: byte.buffer.asUint8List(),
              authority: "simple_grpc"),
          idleTimeout: Duration(minutes: 1),
        ));
  }
}
