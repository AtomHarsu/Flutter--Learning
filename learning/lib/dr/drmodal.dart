class dr {
  int? count;
  List<Entries1>? entries;
  int? entriesperpage;
  int? page;

  dr({this.count, this.entries, this.entriesperpage, this.page});

  dr.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['entries'] != null) {
      entries = <Entries1>[];
      json['entries'].forEach((v) {
        entries!.add(new Entries1.fromJson(v));
      });
    }
    entriesperpage = json['entriesperpage'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.entries != null) {
      data['entries'] = this.entries!.map((v) => v.toJson()).toList();
    }
    data['entriesperpage'] = this.entriesperpage;
    data['page'] = this.page;
    return data;
  }
}

class Entries1 {
  String? assignedBusDisplayName;
  String? assignedBusRef;
  String? assignedRouteDisplayName;
  String? assignedRouteRef;
  String? email;
  String? identifier;
  String? licenseBackUrl;
  String? licenseFrontUrl;
  String? name;
  String? phone;
  String? profileUrl;
  String? status;

  Entries1(
      {this.assignedBusDisplayName,
      this.assignedBusRef,
      this.assignedRouteDisplayName,
      this.assignedRouteRef,
      this.email,
      this.identifier,
      this.licenseBackUrl,
      this.licenseFrontUrl,
      this.name,
      this.phone,
      this.profileUrl,
      this.status});

  Entries1.fromJson(Map<String, dynamic> json) {
    assignedBusDisplayName = json['assigned_bus_display_name'];
    assignedBusRef = json['assigned_bus_ref'];
    assignedRouteDisplayName = json['assigned_route_display_name'];
    assignedRouteRef = json['assigned_route_ref'];
    email = json['email'];
    identifier = json['identifier'];
    licenseBackUrl = json['license_back_url'];
    licenseFrontUrl = json['license_front_url'];
    name = json['name'];
    phone = json['phone'];
    profileUrl = json['profile_url'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assigned_bus_display_name'] = this.assignedBusDisplayName;
    data['assigned_bus_ref'] = this.assignedBusRef;
    data['assigned_route_display_name'] = this.assignedRouteDisplayName;
    data['assigned_route_ref'] = this.assignedRouteRef;
    data['email'] = this.email;
    data['identifier'] = this.identifier;
    data['license_back_url'] = this.licenseBackUrl;
    data['license_front_url'] = this.licenseFrontUrl;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['profile_url'] = this.profileUrl;
    data['status'] = this.status;
    return data;
  }
}
