import 'package:simple_grpc/pb/hello.pbgrpc.dart';
import 'package:simple_grpc/resources/connection.dart';
import 'package:fixnum/fixnum.dart';

class Hello {
  Future<Person> getInfo(int clientId) async {
    HelloServiceClient chanel =
        HelloServiceClient(await Connection().getHttpConnection());
    final x = Int64(clientId);
    final response = await chanel.getInfo(GetInfoRequest()..id = x);
    if (response.statusCode == 200) {
      return response.person;
    } else {
      print ("Error");
      return Person();
    }
    
  }
}
