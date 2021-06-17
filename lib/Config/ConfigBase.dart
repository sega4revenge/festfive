
class ConfigBase {
  static const String API_KEY = "c7e7fcd8-b829-472e-a533-a1dba5328f4a";
  static const String BASE_URL = "http://13.212.53.195:3000/";
  static const String FONT_FAMILY = "yoongothic";
}

extension NullSafeBlock<T> on T? {
  void let(Function(T it) runnable) {
    final instance = this;
    if (instance != null) {
      runnable(instance);
    }
  }
}