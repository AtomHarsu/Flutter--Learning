class routes {
  int? count;
  List<Entries3>? Entries;
  int? Entriesperpage;
  int? page;

  routes({this.count, this.Entries, this.Entriesperpage, this.page});

  routes.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['Entries'] != null) {
      Entries = <Entries3>[];
      json['Entries'].forEach((v) {
        Entries!.add(new Entries3.fromJson(v));
      });
    }
    Entriesperpage = json['Entriesperpage'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.Entries != null) {
      data['Entries'] = this.Entries!.map((v) => v.toJson()).toList();
    }
    data['Entriesperpage'] = this.Entriesperpage;
    data['page'] = this.page;
    return data;
  }
}

class Entries3 {
  String? identifier;
  Metadata? metadata;
  String? name;
  String? status;
  List<Stops>? stops;
  bool? isparentroute;
  String? parentroute;

  Entries3(
      {this.identifier,
      this.metadata,
      this.name,
      this.status,
      this.stops,
      this.isparentroute,
      this.parentroute});

  Entries3.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    name = json['name'];
    status = json['status'];
    if (json['stops'] != null) {
      stops = <Stops>[];
      json['stops'].forEach((v) {
        stops!.add(new Stops.fromJson(v));
      });
    }
    isparentroute = json['isparentroute'];
    parentroute = json['parentroute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['name'] = this.name;
    data['status'] = this.status;
    if (this.stops != null) {
      data['stops'] = this.stops!.map((v) => v.toJson()).toList();
    }
    data['isparentroute'] = this.isparentroute;
    data['parentroute'] = this.parentroute;
    return data;
  }
}

class Metadata {
  String? comments;
  String? manager;
  String? nameassinged;
  String? scheduleddowntime;
  String? scheduleduptime;

  Metadata(
      {this.comments,
      this.manager,
      this.nameassinged,
      this.scheduleddowntime,
      this.scheduleduptime});

  Metadata.fromJson(Map<String, dynamic> json) {
    comments = json['comments'];
    manager = json['manager'];
    nameassinged = json['nameassinged'];
    scheduleddowntime = json['scheduleddowntime'];
    scheduleduptime = json['scheduleduptime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comments'] = this.comments;
    data['manager'] = this.manager;
    data['nameassinged'] = this.nameassinged;
    data['scheduleddowntime'] = this.scheduleddowntime;
    data['scheduleduptime'] = this.scheduleduptime;
    return data;
  }
}

class Stops {
  List<String>? geolocation;
  String? identifier;
  String? name;
  String? status;

  Stops({this.geolocation, this.identifier, this.name, this.status});

  Stops.fromJson(Map<String, dynamic> json) {
    geolocation = json['geolocation'].cast<String>();
    identifier = json['identifier'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['geolocation'] = this.geolocation;
    data['identifier'] = this.identifier;
    data['name'] = this.name;
    data['status'] = this.status;
    return data;
  }
}