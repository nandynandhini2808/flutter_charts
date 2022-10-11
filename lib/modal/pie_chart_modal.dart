class PieChartModalClass {
  bool? _status;
  String? _message;
  List<ResponseData>? _responseData;

  PieChartModalClass(
      {bool? status, String? message, List<ResponseData>? responseData}) {
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
    if (responseData != null) {
      this._responseData = responseData;
    }
  }

  bool? get status => _status;
  set status(bool? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;
  List<ResponseData>? get responseData => _responseData;
  set responseData(List<ResponseData>? responseData) =>
      _responseData = responseData;

  PieChartModalClass.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    if (json['responseData'] != null) {
      _responseData = <ResponseData>[];
      json['responseData'].forEach((v) {
        _responseData!.add(new ResponseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._responseData != null) {
      data['responseData'] =
          this._responseData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResponseData {
  int? _customerExpenseId;
  int? _customerId;
  int? _categoryId;
  int? _subCategoryId;
  int? _amountSpent;
  String? _expenseDate;
  int? _isDeleted;
  String? _name;
  String? _phone;
  String? _email;
  String? _categoryName;
  String? _subCategoryName;

  ResponseData(
      {int? customerExpenseId,
        int? customerId,
        int? categoryId,
        int? subCategoryId,
        int? amountSpent,
        String? expenseDate,
        int? isDeleted,
        String? name,
        String? phone,
        String? email,
        String? categoryName,
        String? subCategoryName}) {
    if (customerExpenseId != null) {
      this._customerExpenseId = customerExpenseId;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (categoryId != null) {
      this._categoryId = categoryId;
    }
    if (subCategoryId != null) {
      this._subCategoryId = subCategoryId;
    }
    if (amountSpent != null) {
      this._amountSpent = amountSpent;
    }
    if (expenseDate != null) {
      this._expenseDate = expenseDate;
    }
    if (isDeleted != null) {
      this._isDeleted = isDeleted;
    }
    if (name != null) {
      this._name = name;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (email != null) {
      this._email = email;
    }
    if (categoryName != null) {
      this._categoryName = categoryName;
    }
    if (subCategoryName != null) {
      this._subCategoryName = subCategoryName;
    }
  }

  int? get customerExpenseId => _customerExpenseId;
  set customerExpenseId(int? customerExpenseId) =>
      _customerExpenseId = customerExpenseId;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  int? get categoryId => _categoryId;
  set categoryId(int? categoryId) => _categoryId = categoryId;
  int? get subCategoryId => _subCategoryId;
  set subCategoryId(int? subCategoryId) => _subCategoryId = subCategoryId;
  int? get amountSpent => _amountSpent;
  set amountSpent(int? amountSpent) => _amountSpent = amountSpent;
  String? get expenseDate => _expenseDate;
  set expenseDate(String? expenseDate) => _expenseDate = expenseDate;
  int? get isDeleted => _isDeleted;
  set isDeleted(int? isDeleted) => _isDeleted = isDeleted;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get categoryName => _categoryName;
  set categoryName(String? categoryName) => _categoryName = categoryName;
  String? get subCategoryName => _subCategoryName;
  set subCategoryName(String? subCategoryName) =>
      _subCategoryName = subCategoryName;

  ResponseData.fromJson(Map<String, dynamic> json) {
    _customerExpenseId = json['CustomerExpenseId'];
    _customerId = json['CustomerId'];
    _categoryId = json['CategoryId'];
    _subCategoryId = json['SubCategoryId'];
    _amountSpent = json['AmountSpent'];
    _expenseDate = json['ExpenseDate'];
    _isDeleted = json['IsDeleted'];
    _name = json['Name'];
    _phone = json['Phone'];
    _email = json['Email'];
    _categoryName = json['CategoryName'];
    _subCategoryName = json['SubCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustomerExpenseId'] = this._customerExpenseId;
    data['CustomerId'] = this._customerId;
    data['CategoryId'] = this._categoryId;
    data['SubCategoryId'] = this._subCategoryId;
    data['AmountSpent'] = this._amountSpent;
    data['ExpenseDate'] = this._expenseDate;
    data['IsDeleted'] = this._isDeleted;
    data['Name'] = this._name;
    data['Phone'] = this._phone;
    data['Email'] = this._email;
    data['CategoryName'] = this._categoryName;
    data['SubCategoryName'] = this._subCategoryName;
    return data;
  }
}
