import 'package:flutter/foundation.dart';

class database {
  static List category = [
    '2 Wheeler'
        '3 wheelar'
        '4 wheeler'
        'Heavy vechicle'
  ];

  static List<Map<String, dynamic>> mechanic = [
    {
      'name': 'Saju',
      'location': 'Kozhikode, Mananchira',
      'age': '35',
      'image': 'assets/images/images (5).jpg',
      'contact number': '9946353610',
      'whatsapp nbr': '8756372819',
      'description':
          'I am ambitious and determined. I always have something to work towards and love a good challenge. I have never been one to accept mediocrity and will jump at any chance to improve myself and prove others wrong. My prior position saw me promoted three times in under two years.',
      // reviews
      'reviews': [
        {
          'name': 'ragav',
          'datetime': '25 days ago',
          'content':
              'Great service provided by the team with fair pricing. Every order I made for my car was fulfilled either on time or beforehand. All accessories on the app are also great. User interface and customer support are also great'
        },
      ],
      // rating
      'rating': '4.5'
    },
    {
      'name': 'Kishan kumar',
      'location': 'Ernakulam, Aluva',
      'age': '40',
      'image': 'assets/images/images (5).jpg',
      'contact number': '9590372956',
      'whatsapp nbr': '8974568329',
      'description':
          'I have always been a leader. Ive always had a knack for leading others, and as a result, Ive quickly risen through the ranks at every company where Ive worked. Even when Im not in a leadership position, my coworkers still come to me with questions and concerns. They know that even if I dont have the solution, Ill know where to find it. Less than a year into my last two positions, I was promoted to a managerial position.',
      // reviews
      'reviews': [
        {
          'name': 'Sunil',
          'datetime': '5 days ago',
          'content':
              'I am very much disappointed with Quick mech service buddy and their staff. I gave my car to Gomechanic for the standard service and front and rear paint. Everything was done good but half tank fuel has been theft my car, and I was wondering how this happened. The workshop location is just 4-5 kms from my place, and the same has been escatlated to the customer service, and they promised to resolve the issue within 48 hrs but till nothing happened. '
        },
      ],
      // rating
      'rating': '3.9'
    }
  ];

  static List<Map<String, dynamic>> user = [
    {
      'name': 'Arun',
      'email': 'Arunkumar@gmail.com',
      'mobile': "9879564817",
      'image':
          'https://i.pinimg.com/originals/d6/30/8a/d6308a0357b762ee72b49b482f125ef7.jpg'
    }
  ];
  static List saved = [];
  static List history = [];
}
