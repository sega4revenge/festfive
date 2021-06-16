
class ConfigBase {
  static const String API_KEY = "c7e7fcd8-b829-472e-a533-a1dba5328f4a";
  static const String BASE_URL = "https://pro-api.coinmarketcap.com/";
  static Map<String, String> headerApi()  {
    return {"X-CMC_PRO_API_KEY" : ConfigBase.API_KEY };
  }
}

extension NullSafeBlock<T> on T? {
  void let(Function(T it) runnable) {
    final instance = this;
    if (instance != null) {
      runnable(instance);
    }
  }
}