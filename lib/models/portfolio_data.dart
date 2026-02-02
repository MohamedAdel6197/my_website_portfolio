class PortfolioData {
  static const String name = "Mohamed Adel Abdelwahab";
  static const String title = "Flutter Developer";
  static const String email = "mohamedadel6197@gmail.com";
  static const String phone = "01201598815";
  static const String location = "Alexandria, Egypt";
  static const String linkedinUrl =
      "https://linkedin.com/in/mohamed-adel-6-jan1997";
  static const String githubUrl = "https://github.com/MohamedAdel6197";

  static const String objective =
      "Dedicated Flutter developer with 2 years of experience in building high-performance, user-friendly mobile "
      "apps. Skilled in writing clean, maintainable code, collaborating effectively within teams, and using AI tools to "
      "enhance development workflows and optimize user experience.";

  static const List<Education> education = [
    Education(
      degree: "BSc Computer Science",
      institution: "Arab Academy for Science, Technology & Maritime Transport",
      grade: "Very Good (GPA: 3.2)",
      graduationProject: "Peer To Peer Tutoring on University Campus App",
      graduationProjectGrade: "Excellent (A+)",
    ),
  ];

  static const List<Experience> experience = [
    Experience(
      company: "Qabed Company",
      role: "Flutter Developer",
      period: "Jul 2025 – Present",
      location: "Remotely",
      description:
          "Write clean, maintainable, and well-documented code following best practices and design patterns.",
    ),
    Experience(
      company: "Aqtar Company",
      role: "Flutter Developer",
      period: "Jun 2024 – Jun 2025",
      location: "Alexandria",
      description:
          "Develop and maintain high-performance, user-friendly mobile applications for Android and iOS using Flutter.",
    ),
  ];

  static const List<Project> projects = [
    Project(
      name: "Ana-Za",
      platforms: "App Store - Play Store",
      period: "Aug 2025 – Jan 2026",
      description:
          "Ana-Za is designed to replace traditional paper business cards with dynamic, interactive digital profiles.",
      link: null,
    ),
    Project(
      name: "Suhuf - ﺼﺤﻒ",
      platforms: "App Store - Play Store",
      period: "Oct 2024 – Apr 2025",
      description:
          "Suhuf is an Islamic application designed to facilitate the reading, listening, and memorizing of the Holy Quran.",
      link: null,
    ),
    Project(
      name: "Insan App & Dashboard (Aroni)",
      platforms: "Appetize / Web",
      period: "Jun 2024 – Sep 2024",
      description:
          "Insan (Aroni) is a Flutter app for selling religious books, featuring PDFs and videos using in app-purchase (Revenue-cat). "
          "The dashboard shows num of users and num of books, adding new books and show statistics.",
      link: "https://aroni-app.web.app/",
    ),
  ];

  static const String militaryService = "Completed (Mar 2021 – Mar 2022)";
}

class Education {
  final String degree;
  final String institution;
  final String grade;
  final String graduationProject;
  final String graduationProjectGrade;

  const Education({
    required this.degree,
    required this.institution,
    required this.grade,
    required this.graduationProject,
    required this.graduationProjectGrade,
  });
}

class Experience {
  final String company;
  final String role;
  final String period;
  final String location;
  final String description;

  const Experience({
    required this.company,
    required this.role,
    required this.period,
    required this.location,
    required this.description,
  });
}

class Project {
  final String name;
  final String platforms;
  final String period;
  final String description;
  final String? link;

  const Project({
    required this.name,
    required this.platforms,
    required this.period,
    required this.description,
    this.link,
  });
}
