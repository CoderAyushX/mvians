import 'package:get/get.dart';
import 'package:mvians/model/home_page_models/qoutes_models.dart';
import 'package:mvians/services/remote_service.dart';

class QoutesController extends GetxController {
  var isLoding = true.obs;
  var qoutesList = <Qoutes>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoding(true);
      var data = await RemoteServices.fetchQoutes(
          "https://api.quotable.io/random?minLength=100&maxLength=140");

      qoutesList.value = data;
    } finally {
      isLoding(false);
    }
  }
}
