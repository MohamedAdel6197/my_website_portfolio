import '../locale_keys.dart';

class PortfolioData {
  static String get name => LocaleKeys.name;
  static String get title => LocaleKeys.title;
  static const String email = "mohamedadel6197@gmail.com";
  static const String phone = "01201598815";
  static String get location => LocaleKeys.location;
  static const String linkedinUrl =
      "https://linkedin.com/in/mohamed-adel-6-jan1997";
  static const String githubUrl = "https://github.com/MohamedAdel6197";

  static String get objective => LocaleKeys.objective;

  static List<Education> get education => [
    Education(
      degree: LocaleKeys.educationDegree,
      institution: LocaleKeys.educationInstitution,
      grade: LocaleKeys.educationGrade,
      graduationProject: LocaleKeys.graduationProject,
      graduationProjectGrade: LocaleKeys.graduationProjectGrade,
    ),
  ];

  static List<Experience> get experience => [
    Experience(
      company: LocaleKeys.qabed,
      companyLink: "https://www.qabed.com/",
      companyImage: "assets/images/qabed.jpg",
      role: LocaleKeys.qabedRole,
      period: LocaleKeys.qabedPeriod,
      location: LocaleKeys.qabedLocation,
      description: LocaleKeys.qabedDesc,
    ),
    Experience(
      company: LocaleKeys.aqtar,
      companyLink: "https://aqtardesign.com/",
      companyImage: "assets/images/aqtar.png",
      role: LocaleKeys.aqtarRole,
      period: LocaleKeys.aqtarPeriod,
      location: LocaleKeys.aqtarLocation,
      description: LocaleKeys.aqtarDesc,
    ),
  ];

  static List<Project> get projects => [
    Project(
      name: LocaleKeys.anazaName,
      platforms: LocaleKeys.anazaPlatforms,
      period: LocaleKeys.anazaPeriod,
      description: LocaleKeys.anazaDesc,
      link: null,
      playStoreLink:
          "https://play.google.com/store/apps/details?id=com.qabed.anaza&pcampaignid=web_share",
      appStoreLink: "https://apps.apple.com/us/app/anaza/id6755936608",
    ),
    Project(
      name: LocaleKeys.suhufName,
      platforms: LocaleKeys.suhufPlatforms,
      period: LocaleKeys.suhufPeriod,
      description: LocaleKeys.suhufDesc,
      link: null,
      playStoreLink:
          "https://play.google.com/store/apps/details?id=com.aqtar.suhuf_app&pcampaignid=web_share",
      appStoreLink:
          "https://apps.apple.com/ca/app/suhuf-%D8%B5%D8%AD%D9%81/id6748069773",
    ),
    Project(
      name: LocaleKeys.insanName,
      platforms: LocaleKeys.insanPlatforms,
      period: LocaleKeys.insanPeriod,
      description: LocaleKeys.insanDesc,
      link: "https://aroni-app.web.app/",
      demoLink: "https://appetize.io/app/b_42byv7ujr46ri5ro32krhqu23y",
    ),
  ];

  static String get militaryService => LocaleKeys.militaryServiceStatus;

  static List<Course> get courses => [
    Course(
      title: LocaleKeys.flutterDartCourse,
      period: "Oct 2021 – Feb 2022",
      location: LocaleKeys.offline,
      instructor: LocaleKeys.abdallahMansour,
    ),
    Course(
      title: LocaleKeys.flutterAdvancedMvvm,
      period: "May 2024 – Sep 2024",
      location: LocaleKeys.offline,
      instructor: "${LocaleKeys.minaFarid} && ${LocaleKeys.ismailElmogy}",
    ),
    Course(
      title: LocaleKeys.solidPrinciples,
      period: "Jan 2025 – Mar 2025",
      location: LocaleKeys.offline,
      instructor: LocaleKeys.baselMoustafa,
    ),
    Course(
      title: LocaleKeys.paymentIntegration,
      period: "May 2025 – Jul 2025",
      location: LocaleKeys.offline,
      instructor: LocaleKeys.tharwatSamy,
    ),
    Course(
      title: LocaleKeys.cleanArchDeepDive,
      period: "Aug 2025 – Nov 2025",
      location: LocaleKeys.offline,
      instructor: LocaleKeys.tharwatSamy,
    ),
    Course(
      title: LocaleKeys.flutterMultiModular,
      period: "Nov 2025 – Jan 2026",
      location: LocaleKeys.offline,
      instructor: LocaleKeys.minaFaredAlt,
    ),
  ];

  static List<SkillCategory> get skills => [
    SkillCategory(
      title: LocaleKeys.mobileDevelopment,
      skills: [
        LocaleKeys.flutterCoreWidgets,
        LocaleKeys.responsiveAdaptiveUi,
        LocaleKeys.materialCupertinoDesign,
        LocaleKeys.customWidgetsAnimations,
        LocaleKeys.rtlLocalization,
      ],
    ),
    SkillCategory(
      title: LocaleKeys.paymentMonetization,
      skills: [
        LocaleKeys.stripeIntegration,
        LocaleKeys.paypalIntegration,
        LocaleKeys.revenuecatIap,
        LocaleKeys.runtimeSubscriptionPayments,
        LocaleKeys.purchaseValidation,
      ],
    ),
    SkillCategory(
      title: LocaleKeys.stateManagement,
      skills: [LocaleKeys.blocCubit, LocaleKeys.providerRiverpod],
    ),
    SkillCategory(
      title: LocaleKeys.architectureDesign,
      skills: [
        LocaleKeys.solidDesignPrinciples,
        LocaleKeys.mvvmCleanArchitecture,
        LocaleKeys.featureBasedStructure,
      ],
    ),

    SkillCategory(
      title: LocaleKeys.backendApiServices,
      skills: [
        LocaleKeys.restfulApiIntegration,
        LocaleKeys.postmanExperience,
        LocaleKeys.paginationFilteringSearch,
      ],
    ),
    SkillCategory(
      title: LocaleKeys.backgroundTasksNotifications,
      skills: [
        LocaleKeys.localNotifications,
        LocaleKeys.scheduledDailyNotifications,
        LocaleKeys.workmanagerBackgroundServices,
      ],
    ),
    SkillCategory(
      title: LocaleKeys.mediaFileHandling,
      skills: [
        LocaleKeys.advancedPdfHandling,
        LocaleKeys.audioPlaybackManagement,
        LocaleKeys.backgroundMediaHandling,
        LocaleKeys.offlineContentCaching,
      ],
    ),
    SkillCategory(
      title: LocaleKeys.appDeployment,
      skills: [
        LocaleKeys.googlePlayDeployment,
        LocaleKeys.appleAppStoreDeployment,
        LocaleKeys.webHostingDeployment,
      ],
    ),
  ];
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
  final String companyLink;
  final String companyImage;
  final String role;
  final String period;
  final String location;
  final String description;

  const Experience({
    required this.company,
    required this.companyImage,
    required this.role,
    required this.period,
    required this.location,
    required this.description,
    required this.companyLink,
  });
}

class Project {
  final String name;
  final String platforms;
  final String period;
  final String description;
  final String? link;
  final String? playStoreLink;
  final String? appStoreLink;
  final String? demoLink;

  const Project({
    required this.name,
    required this.platforms,
    required this.period,
    required this.description,
    this.link,
    this.playStoreLink,
    this.appStoreLink,
    this.demoLink,
  });
}

class Course {
  final String title;
  final String period;
  final String location;
  final String instructor;

  const Course({
    required this.title,
    required this.period,
    required this.location,
    required this.instructor,
  });
}

class SkillCategory {
  final String title;
  final List<String> skills;

  const SkillCategory({required this.title, required this.skills});
}
