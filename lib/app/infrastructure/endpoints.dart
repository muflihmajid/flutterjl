class Endpoints {
  String baseUrl;

  Endpoints(this.baseUrl);

  String hargaudang() {
    return '/api/shrimp_prices?per_page=15&page=1&with=region,creator&region_id=';
  }

}
