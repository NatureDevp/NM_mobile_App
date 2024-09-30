class PlantBasicInfo {
  final int plantid;
  final String plantName;
  final String scientificName;
  final String plantImage;
  final String description;
  final String create_at;
  final String update_at;

  PlantBasicInfo({
    required this.plantid,
    required this.plantName,
    required this.scientificName,
    required this.plantImage,
    required this.description,
    required this.update_at,
    required this.create_at,
  });
}

class RemedyInfo {
  final int remid;
  final int plantid;
  final String remedyName;
  final String remedyType;
  final String description;
  final String remedyImage;
  final List<String> treatments;
  final String create_at;
  final String update_at;

  RemedyInfo({
    required this.remid,
    required this.plantid,
    required this.remedyName,
    required this.remedyType,
    required this.description,
    required this.remedyImage,
    required this.treatments,
    required this.create_at,
    required this.update_at,
  });
}
