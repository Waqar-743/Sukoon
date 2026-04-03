import 'package:flutter/material.dart';

class LocalizedText {
  const LocalizedText(this.en, this.ur);

  final String en;
  final String ur;

  String valueFor(String languageCode) => languageCode == 'ur' ? ur : en;
}

class ReflectionPrompt {
  const ReflectionPrompt({
    required this.id,
    required this.category,
    required this.title,
    required this.prompt,
  });

  final String id;
  final String category;
  final LocalizedText title;
  final LocalizedText prompt;
}

class CalmAffirmation {
  const CalmAffirmation({required this.id, required this.copy});

  final String id;
  final LocalizedText copy;
}

class DetoxChallengeTemplate {
  const DetoxChallengeTemplate({
    required this.id,
    required this.title,
    required this.summary,
    required this.days,
  });

  final String id;
  final LocalizedText title;
  final LocalizedText summary;
  final int days;
}

class CommunityArticle {
  const CommunityArticle({
    required this.title,
    required this.summary,
    required this.body,
  });

  final LocalizedText title;
  final LocalizedText summary;
  final LocalizedText body;
}

class BadgeSpec {
  const BadgeSpec({
    required this.id,
    required this.title,
    required this.description,
  });

  final String id;
  final LocalizedText title;
  final LocalizedText description;
}

class CommunityPreviewPost {
  const CommunityPreviewPost({
    required this.alias,
    required this.body,
    required this.createdAt,
    this.localOnly = true,
  });

  final String alias;
  final String body;
  final DateTime createdAt;
  final bool localOnly;

  Map<String, dynamic> toJson() => {
    'alias': alias,
    'body': body,
    'createdAt': createdAt.toIso8601String(),
    'localOnly': localOnly,
  };

  factory CommunityPreviewPost.fromJson(Map<String, dynamic> json) {
    return CommunityPreviewPost(
      alias: json['alias'] as String? ?? 'Anonymous',
      body: json['body'] as String? ?? '',
      createdAt:
          DateTime.tryParse(json['createdAt'] as String? ?? '') ??
          DateTime.now(),
      localOnly: json['localOnly'] as bool? ?? true,
    );
  }
}

abstract final class AppContent {
  static const emergencyContacts = LocalizedText(
    'If you feel unsafe or at risk, leave the app and contact a trusted person, guardian, teacher, or your local emergency support right now.',
    'Agar aap khud ko mehfooz mehsoos nahin kar rahe, to app band karein aur foran kisi bharosemand shakhs, ghar walay, teacher, ya local emergency support se rabta karein.',
  );

  static const educationLevels = [
    'Matric / O Levels',
    'FSc / A Levels',
    'University',
    'Competitive Exams',
  ];

  static const stressTriggers = [
    'Exams',
    'Family pressure',
    'Comparison',
    'Loneliness',
    'Social media',
    'Sleep issues',
    'Future uncertainty',
  ];

  static const emotionTags = [
    'Calm',
    'Hopeful',
    'Anxious',
    'Overwhelmed',
    'Lonely',
    'Tired',
    'Focused',
    'Numb',
    'Irritated',
    'Grateful',
  ];

  static const habitCategories = [
    'Study',
    'Health',
    'Sleep',
    'Mindfulness',
    'Social',
    'Digital detox',
  ];

  static const habitFrequencies = ['Daily', 'Weekdays', 'Weekly'];

  static const sessionDurations = {
    'quick': 10,
    'study': 25,
    'morning': 60,
    'day': 180,
  };

  static const sessionTitles = {
    'quick': LocalizedText('Quick detox', 'Quick detox'),
    'study': LocalizedText('Study zone', 'Study zone'),
    'morning': LocalizedText('Social-free morning', 'Social-free morning'),
    'day': LocalizedText('Social-free day', 'Social-free day'),
  };

  static const dailyTips = [
    LocalizedText(
      'Rest is not laziness. It is how your brain returns to you.',
      'Aaraam susti nahin. Isi se dimagh wapas saans leta hai.',
    ),
    LocalizedText(
      'You do not need to win every hour. One intentional moment is enough to begin again.',
      'Har ghanta jeetna zaroori nahin. Aik hoshmand lamha dobara shuru karne ke liye kafi hai.',
    ),
    LocalizedText(
      'If comparison got loud today, come back to what your own body is asking for.',
      'Agar aaj muqabla bohat tez lag raha hai, to dekho tumhara apna jism tumse kya maang raha hai.',
    ),
    LocalizedText(
      'A calm five minutes before study can save an unfocused hour after it.',
      'Parhai se pehle paanch pur-sukoon minute, baad ke aik be-tawajju ghante ko bacha sakte hain.',
    ),
  ];

  static const affirmations = [
    CalmAffirmation(
      id: 'enough',
      copy: LocalizedText(
        'You are allowed to be a work in progress and still worthy today.',
        'Tum abhi safar mein ho aur phir bhi aaj qabil-e-izzat ho.',
      ),
    ),
    CalmAffirmation(
      id: 'comparison',
      copy: LocalizedText(
        'Someone else moving fast does not mean you are behind.',
        'Kisi aur ka tez chalna yeh nahin batata ke tum peeche ho.',
      ),
    ),
    CalmAffirmation(
      id: 'pressure',
      copy: LocalizedText(
        'Pressure is real. So is your right to pause before responding to it.',
        'Dabao haqeeqat hai. Magar rukna aur phir jawab dena bhi tumhara haq hai.',
      ),
    ),
    CalmAffirmation(
      id: 'focus',
      copy: LocalizedText(
        'A smaller, calmer step still counts as moving forward.',
        'Chhota aur pur-sukoon qadam bhi aage barhna hota hai.',
      ),
    ),
  ];

  static const prompts = [
    ReflectionPrompt(
      id: 'exam-stress',
      category: 'Exam stress',
      title: LocalizedText(
        'What is exam pressure trying to make you believe?',
        'Exam pressure tumhein kya manwane ki koshish kar raha hai?',
      ),
      prompt: LocalizedText(
        'Finish this gently: If I fail one test, I am afraid it means... Then answer: What would I say to a friend who felt this way?',
        'Narmi se mukammal karo: Agar mein aik test mein fail ho jaon to mujhe darr hota hai ke iska matlab... Phir jawab do: Agar dost aisa mehsoos karta to mein us se kya kehta?',
      ),
    ),
    ReflectionPrompt(
      id: 'family-pressure',
      category: 'Family pressure',
      title: LocalizedText(
        'What part of this pressure is yours, and what part is borrowed?',
        'Is dabao mein tumhara hissa kya hai aur udhaar ka hissa kya hai?',
      ),
      prompt: LocalizedText(
        'Write three things you truly care about, even if nobody praised them yet.',
        'Teen cheezein likho jo tum waqai chahtay ho, chahe abhi kisi ne unki tareef na ki ho.',
      ),
    ),
    ReflectionPrompt(
      id: 'fomo',
      category: 'Social media / FOMO',
      title: LocalizedText(
        'What were you hoping scrolling would save you from?',
        'Scroll karte waqt tum kis cheez se bachna chahtay thay?',
      ),
      prompt: LocalizedText(
        'Name the feeling under the urge. Then write one choice that would have cared for you more kindly.',
        'Us kasak ke neeche wali feeling ka naam likho. Phir aik aisa intekhab likho jo tumhara zyada narmi se khayal rakhta.',
      ),
    ),
    ReflectionPrompt(
      id: 'self-worth',
      category: 'Self-worth',
      title: LocalizedText(
        'If your worth was not being graded today, what would stay true?',
        'Agar aaj tumhari qeemat ko grade na kiya jaye to kya sach rahega?',
      ),
      prompt: LocalizedText(
        'List three qualities in you that do not depend on achievement.',
        'Apni teen khususiyaat likho jo kamyabi par munhasir nahin.',
      ),
    ),
    ReflectionPrompt(
      id: 'motivation',
      category: 'Motivation',
      title: LocalizedText(
        'What is the smallest honest step you can take next?',
        'Agla sab se chhota sachcha qadam kya ho sakta hai?',
      ),
      prompt: LocalizedText(
        'Forget the perfect comeback. What is one realistic action for the next 10 minutes?',
        'Perfect comeback bhool jao. Agle 10 minute ke liye aik haqeeqi qadam kya hai?',
      ),
    ),
    ReflectionPrompt(
      id: 'resilience',
      category: 'Failure and resilience',
      title: LocalizedText(
        'What hurts here, and what can still be learned without self-attack?',
        'Yahan dard kis baat ka hai, aur bina khud ko dantay kya seekha ja sakta hai?',
      ),
      prompt: LocalizedText(
        'Write about one setback with honesty, then rewrite it in kinder language.',
        'Aik setback ko sachchai se likho, phir usay zyada narm alfaaz mein dobara likho.',
      ),
    ),
  ];

  static const groundingSteps = [
    LocalizedText(
      'Notice 5 things you can see.',
      '5 cheezein dekho jo tum dekh sakte ho.',
    ),
    LocalizedText(
      'Touch 4 things around you.',
      '4 cheezein choo kar mehsoos karo.',
    ),
    LocalizedText('Listen for 3 sounds.', '3 awaazon ko dhyan se suno.'),
    LocalizedText(
      'Name 2 things you can smell.',
      '2 cheezein batao jo tum soongh sakte ho.',
    ),
    LocalizedText(
      'Take 1 slow breath and unclench your jaw.',
      '1 gehri saans lo aur jabra dheela karo.',
    ),
  ];

  static const bodyScanSteps = [
    LocalizedText(
      'Relax your forehead and eyes.',
      'Peshani aur aankhon ko dheela karo.',
    ),
    LocalizedText(
      'Drop your shoulders away from your ears.',
      'Kandhon ko kaanon se neeche gira do.',
    ),
    LocalizedText(
      'Unclench your hands and jaw.',
      'Haathon aur jabray ko dheela karo.',
    ),
    LocalizedText(
      'Let your breath reach your stomach.',
      'Saans ko pet tak pohanchne do.',
    ),
  ];

  static const replacementActivities = [
    LocalizedText(
      'Walk for 5 minutes without your phone.',
      '5 minute bina phone ke chalna.',
    ),
    LocalizedText(
      'Fill one page with rough study notes.',
      'Aik safha rough study notes se bhar do.',
    ),
    LocalizedText(
      'Make chai or water and sit with it slowly.',
      'Chai ya pani banao aur araam se baith kar piyo.',
    ),
    LocalizedText(
      'Message one real friend instead of scrolling strangers.',
      'Ajnabi posts dekhne ke bajaye kisi asal dost ko message karo.',
    ),
    LocalizedText(
      'Do one tiny room reset: desk, bed, or bag.',
      'Kamre ki aik chhoti si reset karo: desk, bed, ya bag.',
    ),
  ];

  static const detoxChallenges = [
    DetoxChallengeTemplate(
      id: 'reset-3',
      title: LocalizedText('3-day reset', '3-day reset'),
      summary: LocalizedText(
        'One intentional detox session each day.',
        'Har din aik hoshmand detox session.',
      ),
      days: 3,
    ),
    DetoxChallengeTemplate(
      id: 'morning-5',
      title: LocalizedText('5 quiet mornings', '5 quiet mornings'),
      summary: LocalizedText(
        'Protect your first hour from social apps.',
        'Apne pehle ghante ko social apps se bachao.',
      ),
      days: 5,
    ),
  ];

  static const badgeSpecs = [
    BadgeSpec(
      id: 'first_checkin',
      title: LocalizedText('Started gently', 'Narmi se shuru kiya'),
      description: LocalizedText(
        'Logged your first mood check-in.',
        'Apna pehla mood check-in record kiya.',
      ),
    ),
    BadgeSpec(
      id: 'journal_three',
      title: LocalizedText('Private honesty', 'Khamosh sachchai'),
      description: LocalizedText(
        'Wrote three journal entries.',
        'Teen journal entries likhein.',
      ),
    ),
    BadgeSpec(
      id: 'habit_five',
      title: LocalizedText('Routine builder', 'Routine builder'),
      description: LocalizedText(
        'Completed five habits.',
        'Paanch habit completions ki.',
      ),
    ),
    BadgeSpec(
      id: 'detox_three',
      title: LocalizedText('Attention reclaimed', 'Tawajju wapas li'),
      description: LocalizedText(
        'Finished three detox sessions.',
        'Teen detox sessions mukammal kiye.',
      ),
    ),
  ];

  static const communityArticles = [
    CommunityArticle(
      title: LocalizedText(
        'FOMO is not just jealousy',
        'FOMO sirf hasad nahin',
      ),
      summary: LocalizedText(
        'It often behaves like a threat response.',
        'Yeh aksar threat response ki tarah kaam karta hai.',
      ),
      body: LocalizedText(
        'When you feel pulled back to the feed, ask what you were trying not to feel. The goal is not shame. The goal is noticing sooner.',
        'Jab tum dobara feed ki taraf kheenchay jao, yeh poochho ke tum kis ehsaas se bachna chahtay thay. Maqsad sharminda karna nahin. Maqsad jaldi notice karna hai.',
      ),
    ),
    CommunityArticle(
      title: LocalizedText('JOMO can be trained', 'JOMO seekha ja sakta hai'),
      summary: LocalizedText(
        'Missing out can become relief instead of panic.',
        'Kisi cheez ko miss karna ghabrahat ke bajaye sukoon ban sakta hai.',
      ),
      body: LocalizedText(
        'Every small moment away from reflexive scrolling teaches your body that silence is survivable.',
        'Har chhota lamha jo reflexive scrolling se door guzarta hai, tumhare jism ko sikhata hai ke khamoshi qabil-e-bardasht hai.',
      ),
    ),
  ];

  static final previewCommunityPosts = [
    CommunityPreviewPost(
      alias: 'Anonymous Student',
      body:
          'Took a 10 minute break before study today. It was small but it helped.',
      createdAt: DateTime(2026, 4, 1, 20, 15),
      localOnly: false,
    ),
    CommunityPreviewPost(
      alias: 'Quiet Voice',
      body:
          'Family comparison was loud today. Writing it out made it feel less absolute.',
      createdAt: DateTime(2026, 4, 1, 18, 10),
      localOnly: false,
    ),
  ];

  static const crisisKeywords = [
    'suicide',
    'kill myself',
    'self harm',
    'end my life',
    'mar jana',
    'khudkushi',
    'harm myself',
  ];

  static ReflectionPrompt? promptById(String? id) {
    if (id == null) return null;
    for (final prompt in prompts) {
      if (prompt.id == id) return prompt;
    }
    return null;
  }

  static CalmAffirmation? affirmationById(String? id) {
    if (id == null) return null;
    for (final affirmation in affirmations) {
      if (affirmation.id == id) return affirmation;
    }
    return null;
  }

  static BadgeSpec? badgeById(String badgeId) {
    for (final badge in badgeSpecs) {
      if (badge.id == badgeId) return badge;
    }
    return null;
  }

  static Color moodColor(int score) {
    switch (score) {
      case 1:
        return const Color(0xFFBC4B51);
      case 2:
        return const Color(0xFFD17B49);
      case 3:
        return const Color(0xFFD8B15A);
      case 4:
        return const Color(0xFF7BA05B);
      default:
        return const Color(0xFF3D7B72);
    }
  }
}
