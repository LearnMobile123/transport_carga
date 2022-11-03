class User {
  var _name;
  var _email;
  var _password;
  var _genre;
  var _favoritesGenres;
  var _bornDate;


  // +++++++++++++++++ Constructor ++++++++++++++++++++++++++++++++++++
  User(this._name, this._email, this._password, this._genre,
      this._favoritesGenres, this._bornDate);

  //++++++++++ Getters and Setters ++++++++++++++++++++++++++++++++++++

  get bornDate => _bornDate;

  set bornDate(value) {
    _bornDate = value;
  }

  get favoritesGenres => _favoritesGenres;

  set favoritesGenres(value) {
    _favoritesGenres = value;
  }

  get genre => _genre;

  set genre(value) {
    _genre = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }














}