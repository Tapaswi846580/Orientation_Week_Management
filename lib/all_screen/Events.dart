class Event{
  int _id;
  String _date,_grp,_batch,_startTime,_endTime,_activity,_description,_venue;

  factory Event.fromJson(Map<String, dynamic> json){
    return Event(int.parse(json['id'].toString()),json['date'].toString(),json['grp'].toString(),json['batch'].toString(),
        json['startTime'].toString(),json['endTime'].toString(),json['activity'].toString(),json['description'].toString(),json['venue'].toString());
  }


  Event(this._id, this._date, this._grp, this._batch, this._startTime, this._endTime,
      this._activity, this._description, this._venue);

  get venue => _venue;

  set venue(value) {
    _venue = value;
  }

  get description => _description;

  set description(value) {
    _description = value;
  }

  get activity => _activity;

  set activity(value) {
    _activity = value;
  }

  get endTime => _endTime;

  set endTime(value) {
    _endTime = value;
  }

  get startTime => _startTime;

  set startTime(value) {
    _startTime = value;
  }

  get grp => _grp;

  set grp(value) {
    _grp = value;
  }

  get batch => _batch;

  set batch(value) {
    _batch = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

}