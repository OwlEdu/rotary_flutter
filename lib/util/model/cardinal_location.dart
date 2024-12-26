enum CardinalLocation {
  global(name: "전체", id: null),
  first(name: "1지역", id: 3),
  second(name: "2지역", id: 4),
  third(name: "3지역", id: 5),
  forth(name: "4지역", id: 6),
  fifth(name: "5지역", id: 7),
  sixth(name: "6지역", id: 8),
  seventh(name: "7지역", id: 9),
  eighth(name: "8지역", id: 10),
  ninth(name: "9지역", id: 11),
  tenth(name: "10지역", id: 12),
  eleventh(name: "11지역", id: 12),
  twelfth(name: "12지역", id: 14),
  head(name: "지구지도부", id: 15);

  const CardinalLocation({required this.name, required this.id});

  final String name;
  final int? id;

  static List<CardinalLocation> all =[
    CardinalLocation.global,
      CardinalLocation.head,
      CardinalLocation.first,
      CardinalLocation.second,
      CardinalLocation.third,
      CardinalLocation.forth,
      CardinalLocation.fifth,
      CardinalLocation.sixth,
      CardinalLocation.seventh,
      CardinalLocation.eighth,
      CardinalLocation.ninth,
      CardinalLocation.tenth,
      CardinalLocation.eleventh,
      CardinalLocation.twelfth,
    ];

  static CardinalLocation getByIndex(int index){
    return all[index];
  }
}
