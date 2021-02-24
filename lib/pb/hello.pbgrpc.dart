///
//  Generated code. Do not modify.
//  source: hello.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'hello.pb.dart' as $0;
export 'hello.pb.dart';

class HelloServiceClient extends $grpc.Client {
  static final _$getInfo =
      $grpc.ClientMethod<$0.GetInfoRequest, $0.GetInfoResponse>(
          '/simple.grpc.v1.HelloService/getInfo',
          ($0.GetInfoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetInfoResponse.fromBuffer(value));

  HelloServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetInfoResponse> getInfo($0.GetInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getInfo, request, options: options);
  }
}

abstract class HelloServiceBase extends $grpc.Service {
  $core.String get $name => 'simple.grpc.v1.HelloService';

  HelloServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetInfoRequest, $0.GetInfoResponse>(
        'getInfo',
        getInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetInfoRequest.fromBuffer(value),
        ($0.GetInfoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetInfoResponse> getInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetInfoRequest> request) async {
    return getInfo(call, await request);
  }

  $async.Future<$0.GetInfoResponse> getInfo(
      $grpc.ServiceCall call, $0.GetInfoRequest request);
}
