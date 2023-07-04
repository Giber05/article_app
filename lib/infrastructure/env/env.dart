enum ENV {
  dev(baseURL: "https://demo.treblle.com"),
  prod(baseURL: "https://demo.treblle.com");

  final String baseURL;

  const ENV({required this.baseURL});

  static ENV current = ENV.dev;

  static void setEnv(ENV env) => current = env;
}
