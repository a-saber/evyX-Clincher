class GetLawyerResponseModel {
  int? status;
  String? msg;
  Data? data;

  GetLawyerResponseModel({this.status, this.msg, this.data});

  GetLawyerResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? jobTitle;
  String? lang;
  String? country;
  double? rating;
  int? questionNo;
  List<String>? services;
  String? file;
  List<Reviews>? reviews;
  int? callRequests;
  int? messageRequests;
  int? publicQuestions;
  List<String>? lastAnswers;

  Data(
      {this.id,
        this.name,
        this.jobTitle,
        this.lang,
        this.country,
        this.rating,
        this.questionNo,
        this.services,
        this.file,
        this.reviews,
        this.callRequests,
        this.messageRequests,
        this.publicQuestions,
        this.lastAnswers});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? 'Not Available';
    jobTitle = json['job_title'] ?? 'Not Available';
    lang = json['lang'] ?? 'Not Available';
    country = json['country'] ?? 'Not Available';

    rating = json['rating'] !=null ?
    double.tryParse(json['rating'].toString()) ?? 0.0 : 0.0;

    questionNo = json['question_no'] !=null ?
    int.tryParse(json['question_no'].toString()) ?? 0 : 0;

    callRequests = json['call_requests'] !=null ?
    int.tryParse(json['call_requests'].toString()) ?? 0 : 0;

    messageRequests = json['message_requests'] !=null ?
    int.tryParse(json['message_requests'].toString()) ?? 0 : 0;

    publicQuestions = json['public_questions'] !=null ?
    int.tryParse(json['public_questions'].toString()) ?? 0 : 0;

    services = json['services'].cast<String>();
    file = json['file'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }

    lastAnswers = json['last_answers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['job_title'] = jobTitle;
    data['lang'] = lang;
    data['country'] = country;
    data['rating'] = rating;
    data['question_no'] = questionNo;
    data['services'] = services;
    data['file'] = file;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['call_requests'] = callRequests;
    data['message_requests'] = messageRequests;
    data['public_questions'] = publicQuestions;
    data['last_answers'] = lastAnswers;
    return data;
  }
}

class Reviews {
  String? name;
  double? rate;
  String? comment;

  Reviews({this.name, this.rate, this.comment});

  Reviews.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rate = json['rate'] !=null ?
    double.tryParse(json['rate'].toString()) ?? 0.0 : 0.0;
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['rate'] = rate;
    data['comment'] = comment;
    return data;
  }
}
