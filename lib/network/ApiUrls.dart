class ApiUrls {
  static const PROD_BASE_URL = "https://newsapi.org";
  static const POPULAR_NEWS =
      "/v2/everything?q=apple&from=2021-05-06&to=2021-05-06&sortBy=popularity&apiKey=fbc1189b168b41e9b2d0e1b7d41cf9ca";
  static const RECENT_NEWS =
      "/v2/everything?q=tesla&from=2021-04-08&sortBy=publishedAt&apiKey=fbc1189b168b41e9b2d0e1b7d41cf9ca";
  static const BUSINESS_NEWS =
      "/v2/top-headlines?country=us&category=business&apiKey=fbc1189b168b41e9b2d0e1b7d41cf9ca";
  static const TECHCRUNCH_NEWS =
      "/v2/top-headlines?sources=techcrunch&apiKey=fbc1189b168b41e9b2d0e1b7d41cf9ca";
}
