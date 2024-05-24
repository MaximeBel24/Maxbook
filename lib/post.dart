class Post {
  late String time;
  late String image;
  late String description;
  late int like;
  late int comment;

  Post({
    required this.time,
    required this.image,
    required this.description,
    required this.like,
    required this.comment,
  }){}

  String setTime() => "Il y a $time";

  String setLike() {
    return "$like j'aime";
  }

  String setComment() {
    if (comment > 1) {
      return "$comment commentaires";
    } else {
      return "$comment commentaire";
    }
  }
}

