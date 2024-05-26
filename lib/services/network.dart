import 'package:http/http.dart' as http;

class Network {
  postRequest(String url) {
    Uri endPoint = Uri.https('tkdevdesign.com', url);
    http.Request('POST', endPoint);
  }
}
