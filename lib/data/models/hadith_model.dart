class HadithModel {
  int? hadithId;
  int? bookId;
  String? bookName;
  int? sectionId;
  int? chapterId;
  String? narrator;
  String? bn;
  String? ar;
  String? arDiacless;
  String? note;
  int? gradeId;
  String? grade;
  String? gradeColor;

  HadithModel({
    this.hadithId,
    this.bookId,
    this.bookName,
    this.chapterId,
    this.sectionId,
    this.narrator,
    this.bn,
    this.ar,
    this.arDiacless,
    this.note,
    this.gradeId,
    this.grade,
    this.gradeColor,
  });

  factory HadithModel.fromMap(Map<dynamic, dynamic> hadith) => HadithModel(
    hadithId: hadith['hadith_id'],
    bookId: hadith['book_id'],
    bookName: hadith['book_name'],
    chapterId:hadith['chapter_id'] ,
    sectionId: hadith['section_id'] ,
    narrator: hadith['narrator'],
    bn: hadith['bn'],
    ar: hadith['ar'],
    arDiacless: hadith['ar_diacless'],
    note: hadith['note'],
    gradeId: hadith['grade_id'],
    grade: hadith['grade'],
    gradeColor: hadith['grade_color'],
  );
}
