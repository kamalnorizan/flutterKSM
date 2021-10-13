class Todo {
  int _id;
  String _title;
  String _content;
  String _duedate;

  Todo(
    this._id,
    this._title,
    this._content,
    this._duedate,
  );

  int get id => _id;
  String get title => _title;
  String get content => _content;
  String get duedate => _duedate;

  set id(int newid) {
    this._id = newid;
  }

  set title(String newtitle) {
    this._title = newtitle;
  }

  set content(String newcontent) {
    this._content = newcontent;
  }

  set duedate(String newduedate) {
    this._duedate = newduedate;
  }
}
