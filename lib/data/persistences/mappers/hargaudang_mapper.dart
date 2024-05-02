import 'package:skeleton_mobileapps/domains/entities/hargaudang.dart';

class HargaUdangMapper {

  hargaudangMapper() {
    //
  }
  
  List<HargaUdang> gethargaudangApiConverter(Map<String, dynamic> response) {

    List<HargaUdang> hargaudangs = [];
    var data = response['data'];
    for (var hargaudang in data) {
      hargaudangs.add(HargaUdang(
        id: hargaudang['id'],
        speciesId: hargaudang['species_id'],
        date: DateTime.parse(hargaudang['date']),
        size20: hargaudang['size_20'],
        size30: hargaudang['size_30'],
        size40: hargaudang['size_40'],
        size50: hargaudang['size_50'],
        size60: hargaudang['size_60'],
        size70: hargaudang['size_70'],
        size80: hargaudang['size_80'],
        size90: hargaudang['size_90'],
        size100: hargaudang['size_100'],
        size110: hargaudang['size_110'],
        size120: hargaudang['size_120'],
        size130: hargaudang['size_130'],
        size140: hargaudang['size_140'],
        size150: hargaudang['size_150'],
        size160: hargaudang['size_160'],
        size170: hargaudang['size_170'],
        size180: hargaudang['size_180'],
        size190: hargaudang['size_190'],
        size200: hargaudang['size_200'],
        remark: hargaudang['remark'],
        regionId: hargaudang['region_id'],
        countryId: hargaudang['country_id'],
        currencyId: hargaudang['currency_id'],
        private: hargaudang['private'],
        week: hargaudang['week'],
        dateRegionFullName: hargaudang['date_region_full_name'],
        provinceId: hargaudang['province_id'],
        regencyId: hargaudang['regency_id'],
        districtId: hargaudang['district_id'],
        villageId: hargaudang['village_id'],
        region: Region(
          id: hargaudang['region']['id'],
          name: hargaudang['region']['name'],
          type: hargaudang['region']['type'],
          latitude: hargaudang['region']['latitude'],
          longitude: hargaudang['region']['longitude'],
          countryId: hargaudang['region']['country_id'],
          countryName: hargaudang['region']['country_name'],
          countryNameUppercase: hargaudang['region']['country_name_uppercase'],
          provinceId: hargaudang['region']['province_id'],
          provinceName: hargaudang['region']['province_name'],
          regencyId: hargaudang['region']['regency_id'],
          regencyName: hargaudang['region']['regency_name'],
          districtId: hargaudang['region']['district_id'],
          districtName: hargaudang['region']['district_name'],
          villageId: hargaudang['region']['village_id'],
          villageName: hargaudang['region']['village_name'],
          fullName: hargaudang['region']['full_name'],
          nameTranslated: hargaudang['region']['name_translated'],
          countryNameTranslated: hargaudang['region']['country_name_translated'],
          countryNameTranslatedUppercase: hargaudang['region']['country_name_translated_uppercase'],
        ),
        creator: Creator(
          id: hargaudang['creator']['id'],
          roleId: hargaudang['creator']['role_id'],
          name: hargaudang['creator']['name'],
          email: hargaudang['creator']['email'],
          avatar: hargaudang['creator']['avatar'],
          subscriptionTypeId: hargaudang['creator']['subscription_type_id'],
          settings: Settings(
            locale: hargaudang['creator']['settings']['locale'],
          ),
          createdAt: DateTime.parse(hargaudang['creator']['created_at']),
          updatedAt: DateTime.parse(hargaudang['creator']['updated_at']),
          phone: hargaudang['creator']['phone'],
          occupation: hargaudang['creator']['occupation'],
          buyer: hargaudang['creator']['buyer'],
          phoneCountry: hargaudang['creator']['phone_country'],
          country: hargaudang['creator']['country'],
          interest: hargaudang['creator']['interest'],
        ),
      ));
    }

    return hargaudangs;
  }
}