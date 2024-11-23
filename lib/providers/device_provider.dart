import 'package:genie101/Dtos/response_dto.dart';
import 'package:genie101/constants/api_endpoints.dart';
import 'package:genie101/models/device.dart';
import 'package:get/get.dart';

class DeviceProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => map;
    httpClient.baseUrl = ApiEndpoints.baseUrl + ApiEndpoints.devicesApi;
  }

  Future<Response<Device>> getDeviceById(String deviceId) => get('get-device/',
      query: {"id": deviceId}, decoder: (data) => Device.fromJson(data));

  Future<Response<List<Device>>> getDevices() =>
      get('', decoder: (data) => Device.jsonToList(data["devices"]));
  Future<Response<StatusResponse>> controlDevice(
          dynamic data, String deviceId) =>
      post('control/', data, query: {"id": deviceId}, decoder: (data) {
        print(deviceId);
        print(data);
        return StatusResponse.fromJson(data);
      });
}
