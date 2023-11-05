import '../../configs/app_config.dart';
import '../utils/logger.dart';

toImageUrl(String id){
  printMe("image: ${AppConfig.BASE_URL}/files/$id");
  return "${AppConfig.BASE_URL}/files/$id";
}