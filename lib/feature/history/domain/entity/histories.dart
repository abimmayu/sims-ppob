import 'package:sims_ppob_abim/feature/history/domain/entity/history.dart';

class Histories {
  final String offset;
  final String limit;
  final List<History> records;

  Histories({
    required this.offset,
    required this.limit,
    required this.records,
  });

  factory Histories.fromJson(Map<String, dynamic> json) {
    return Histories(
      offset: json["offset"],
      limit: json["limit"],
      records: List<History>.from(
        (json["records"] as List).map(
          (x) => History.fromJson(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "offset": offset,
      "limit": limit,
      "records": List<dynamic>.from(
        records.map(
          (x) => x.toJson(),
        ),
      )
    };
  }
}
