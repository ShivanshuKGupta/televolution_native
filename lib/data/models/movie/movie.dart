import 'genre.dart';

class Movie {
  String title;
  String description;
  String image;
  Duration duration;
  double? rating;
  List<Genre> genre;
  String streamUrl;
  DateTime createdAt;

  Movie({
    required this.title,
    required this.description,
    required this.image,
    required this.duration,
    this.rating,
    required this.genre,
    required this.streamUrl,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'duration': duration.inSeconds,
      'rating': rating,
      'genre': genre.map((e) => e.toString().split('.').last).toList(),
      'streamUrl': streamUrl,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        image = json['image'],
        duration = Duration(seconds: json['duration']),
        rating = json['rating'],
        genre = (json['genre'] as List<String>)
            .map((e) => Genre.values.firstWhere(
                (element) => element.toString().split('.').last == e))
            .toList(),
        streamUrl = json['streamUrl'],
        createdAt = DateTime.parse(json['createdAt']);

  static List<Movie> allMovies = [
    Movie(
      streamUrl: 'https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8',
      title: 'Big Buck Bunny',
      description:
          'Three rodents amuse themselves by harassing creatures of the forest. However, when they mess with a bunny, he decides to teach them a lesson.',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Big_buck_bunny_poster_big.jpg/1200px-Big_buck_bunny_poster_big.jpg',
      duration: const Duration(hours: 1, minutes: 5),
      rating: 9.3,
      genre: [Genre.comedy, Genre.animation],
      createdAt: DateTime(2008, 4, 10),
    ),
    Movie(
      streamUrl: 'https://rtmp.api.rt.com/hls/rtdru.m3u8',
      title: 'RT Documentary',
      description: '',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ39t7b-mL4Xg-DSJueQPCb_fOsJswngVr0yjMc6qoVuqACzS2',
      duration: const Duration(hours: 1, minutes: 5),
      rating: 9.3,
      genre: [Genre.comedy, Genre.animation],
      createdAt: DateTime(2008, 4, 10),
    ),
    Movie(
      streamUrl:
          'https://bitcdn-kronehit.bitmovin.com/v2/hls/chunklist_b3128000.m3u8',
      title: 'Kronehit TV',
      description: '',
      image:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRsecqDOr1OstfK2xWreNH1JkJry7S0eLVuVklAEzkogjBxNQlp',
      duration: const Duration(hours: 1, minutes: 5),
      rating: 9.3,
      genre: [Genre.comedy, Genre.animation],
      createdAt: DateTime(2008, 4, 10),
    ),
    Movie(
      streamUrl:
          'https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8',
      title: '9',
      description: '',
      image:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRsecqDOr1OstfK2xWreNH1JkJry7S0eLVuVklAEzkogjBxNQlp',
      duration: const Duration(hours: 1, minutes: 5),
      rating: 9.3,
      genre: [Genre.comedy, Genre.animation],
      createdAt: DateTime(2008, 4, 10),
    ),
    Movie(
      streamUrl:
          'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8',
      title: '10',
      description: '',
      image:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRsecqDOr1OstfK2xWreNH1JkJry7S0eLVuVklAEzkogjBxNQlp',
      duration: const Duration(hours: 1, minutes: 5),
      rating: 9.3,
      genre: [Genre.comedy, Genre.animation],
      createdAt: DateTime(2008, 4, 10),
    ),
    Movie(
      streamUrl:
          'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8',
      title: '10',
      description: '',
      image:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRsecqDOr1OstfK2xWreNH1JkJry7S0eLVuVklAEzkogjBxNQlp',
      duration: const Duration(hours: 1, minutes: 5),
      rating: 9.3,
      genre: [Genre.comedy, Genre.animation],
      createdAt: DateTime(2008, 4, 10),
    ),
    Movie(
      streamUrl:
          'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8',
      title: '10',
      description: '',
      image:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRsecqDOr1OstfK2xWreNH1JkJry7S0eLVuVklAEzkogjBxNQlp',
      duration: const Duration(hours: 1, minutes: 5),
      rating: 9.3,
      genre: [Genre.comedy, Genre.animation],
      createdAt: DateTime(2008, 4, 10),
    ),
    Movie(
      streamUrl:
          'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8',
      title: '10',
      description: '',
      image:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRsecqDOr1OstfK2xWreNH1JkJry7S0eLVuVklAEzkogjBxNQlp',
      duration: const Duration(hours: 1, minutes: 5),
      rating: 9.3,
      genre: [Genre.comedy, Genre.animation],
      createdAt: DateTime(2008, 4, 10),
    ),
    Movie(
      streamUrl:
          'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8',
      title: '10',
      description: '',
      image:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRsecqDOr1OstfK2xWreNH1JkJry7S0eLVuVklAEzkogjBxNQlp',
      duration: const Duration(hours: 1, minutes: 5),
      rating: 9.3,
      genre: [Genre.comedy, Genre.animation],
      createdAt: DateTime(2008, 4, 10),
    ),
    Movie(
      streamUrl:
          'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8',
      title: '10',
      description: '',
      image:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRsecqDOr1OstfK2xWreNH1JkJry7S0eLVuVklAEzkogjBxNQlp',
      duration: const Duration(hours: 1, minutes: 5),
      rating: 9.3,
      genre: [Genre.comedy, Genre.animation],
      createdAt: DateTime(2008, 4, 10),
    ),
    Movie(
      streamUrl:
          'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8',
      title: '10',
      description: '',
      image:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRsecqDOr1OstfK2xWreNH1JkJry7S0eLVuVklAEzkogjBxNQlp',
      duration: const Duration(hours: 1, minutes: 5),
      rating: 9.3,
      genre: [Genre.comedy, Genre.animation],
      createdAt: DateTime(2008, 4, 10),
    ),
    Movie(
      streamUrl:
          'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8',
      title: '10',
      description: '',
      image:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRsecqDOr1OstfK2xWreNH1JkJry7S0eLVuVklAEzkogjBxNQlp',
      duration: const Duration(hours: 1, minutes: 5),
      rating: 9.3,
      genre: [Genre.comedy, Genre.animation],
      createdAt: DateTime(2008, 4, 10),
    ),
  ];
}
