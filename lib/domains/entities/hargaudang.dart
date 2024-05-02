class HargaUdang {
  dynamic id;
  dynamic speciesId;
  DateTime? date;
  dynamic size20;
  dynamic size30;
  dynamic size40;
  dynamic size50;
  dynamic size60;
  dynamic size70;
  dynamic size80;
  dynamic size90;
  dynamic size100;
  dynamic size110;
  dynamic size120;
  dynamic size130;
  dynamic size140;
  dynamic size150;
  dynamic size160;
  dynamic size170;
  dynamic size180;
  dynamic size190;
  dynamic size200;
  dynamic remark;
  dynamic regionId;
  dynamic countryId;
  dynamic currencyId;
  dynamic private;
  dynamic week;
  dynamic dateRegionFullName;
  dynamic provinceId;
  dynamic regencyId;
  dynamic districtId;
  dynamic villageId;
  Region? region;
  Creator? creator;
  dynamic question, answer;

  HargaUdang({
    this.id,
    this.speciesId,
    this.date,
    this.size20,
    this.size30,
    this.size40,
    this.size50,
    this.size60,
    this.size70,
    this.size80,
    this.size90,
    this.size100,
    this.size110,
    this.size120,
    this.size130,
    this.size140,
    this.size150,
    this.size160,
    this.size170,
    this.size180,
    this.size190,
    this.size200,
    this.remark,
    this.regionId,
    this.countryId,
    this.currencyId,
    this.private,
    this.week,
    this.dateRegionFullName,
    this.provinceId,
    this.regencyId,
    this.districtId,
    this.villageId,
    this.region,
    this.creator,
  });
}

class Creator {
  int id;
  dynamic roleId;
  dynamic name;
  dynamic email;
  dynamic avatar;
  dynamic subscriptionTypeId;
  Settings settings;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic phone;
  dynamic occupation;
  dynamic buyer;
  dynamic phoneCountry;
  dynamic country;
  dynamic interest;

  Creator({
    required this.id,
    this.roleId,
    required this.name,
    required this.email,
    required this.avatar,
    this.subscriptionTypeId,
    required this.settings,
    required this.createdAt,
    required this.updatedAt,
    required this.phone,
    required this.occupation,
    required this.buyer,
    required this.phoneCountry,
    required this.country,
    required this.interest,
  });
}

class Settings {
  String locale;

  Settings({
    required this.locale,
  });
}

class Region {
  String id;
  String name;
  dynamic type;
  dynamic latitude;
  dynamic longitude;
  dynamic countryId;
  dynamic countryName;
  dynamic countryNameUppercase;
  dynamic provinceId;
  dynamic provinceName;
  dynamic regencyId;
  dynamic regencyName;
  dynamic districtId;
  dynamic districtName;
  dynamic villageId;
  dynamic villageName;
  dynamic fullName;
  dynamic nameTranslated;
  dynamic countryNameTranslated;
  dynamic countryNameTranslatedUppercase;

  Region({
    required this.id,
    required this.name,
    this.type,
    this.latitude,
    this.longitude,
    this.countryId,
    this.countryName,
    this.countryNameUppercase,
    this.provinceId,
    this.provinceName,
    this.regencyId,
    this.regencyName,
    this.districtId,
    this.districtName,
    this.villageId,
    this.villageName,
    this.fullName,
    this.nameTranslated,
    this.countryNameTranslated,
    this.countryNameTranslatedUppercase,
  });
}
