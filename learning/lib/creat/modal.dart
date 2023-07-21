class busListModal {
  int? count;
  List<Entries>? entries;
  int? entriesperpage;
  int? page;

  busListModal({this.count, this.entries, this.entriesperpage, this.page});

  busListModal.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['entries'] != null) {
      entries = <Entries>[];
      json['entries'].forEach((v) {
        entries!.add(new Entries.fromJson(v));
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

class Entries {
  String? assignedRoute;
  String? created;
  String? createdBy;
  String? registerednumber;
  String? seating;
  String? status;
  String? trackingDeviceIdentifier;
  String? updated;
  String? updatedBy;

  Entries(
      {this.assignedRoute,
      this.created,
      this.createdBy,
      this.registerednumber,
      this.seating,
      this.status,
      this.trackingDeviceIdentifier,
      this.updated,
      this.updatedBy});

  Entries.fromJson(Map<String, dynamic> json) {
    assignedRoute = json['assigned_route'];
    created = json['created'];
    createdBy = json['created_by'];
    registerednumber = json['registerednumber'];
    seating = json['seating'].toString();
    status = json['status'];
    trackingDeviceIdentifier = json['tracking_device_identifier'];
    updated = json['updated'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assigned_route'] = this.assignedRoute;
    data['created'] = this.created;
    data['created_by'] = this.createdBy;
    data['registerednumber'] = this.registerednumber;
    data['seating'] = this.seating;
    data['status'] = this.status;
    data['tracking_device_identifier'] = this.trackingDeviceIdentifier;
    data['updated'] = this.updated;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}
