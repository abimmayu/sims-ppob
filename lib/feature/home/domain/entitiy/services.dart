class Services {
  final String serviceCode;
  final String serviceName;
  final String serviceIcon;
  final int serviceTariff;

  Services({
    required this.serviceCode,
    required this.serviceName,
    required this.serviceIcon,
    required this.serviceTariff,
  });

  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
      serviceCode: json['service_code'],
      serviceName: json['service_name'],
      serviceIcon: json['service_icon'],
      serviceTariff: json['service_tariff'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'service_code': serviceCode,
      'service_name': serviceName,
      'service_icon': serviceIcon,
      'service_tariff': serviceTariff,
    };
  }
}
