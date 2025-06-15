import 'package:flutter/cupertino.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/features/pages/home/ui/page/home_page.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('نبذة عنا'),
        enableBackgroundFilterBlur: true,
      ),

      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AppConstants.handPNG,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Text(
                  'قصة حرفيون سعوديون\n يبدعون المستقبل بعبق التراث وعراقة الأصالة.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.white,
                  ),
                ),
              ],
            ),
            ArticleSectionComponent(
              title: 'اهدافنا',
              description:
                  '''نمهد الطريق نحو مستقبل مزدهر ومشرق، يجمع بين إبداع الحرف اليدوية السعودية وعبق التراث الأصيل وعراقة الأصالة التي نفتخر بها.
            
تركيزنا لا يقتصر على تقديم منتجات حرفية ذات جودة عالية، بل يمتد ليشمل توثيق الثقافة السعودية والاحتفاء بتفاصيلها الغنية. نسعى إلى الارتقاء بالحرف اليدوية وجعلها جسراً يعبر بها الإرث الثقافي السعودي إلى العالم، من خلال تبنّي نموذج عمل مبتكر يدعم تطوير هذا القطاع ويعزز حضوره العالمي
            ''',
              useButton: false,
              color: AppConstants.primarySectionColor,
              onPressed: () {},
            ),
            ArticleSectionComponent(
              title: 'رؤيتنا',
              description:
                  'نسعى لأن نصبح الواجهة الأولى والرائدة للحرف اليدوية السعودية، التي تجمع بين الأصالة والجودة العالية، لتتألق في الأسواق المحلية وتصل إلى العالمية.',
              onPressed: () {},
            ),
            ArticleSectionComponent(
              title: 'رسالتنا',
              description:
                  'نهدف إلى تقديم أرقى الحرف اليدوية السعودية بجودة استثنائية، مع تعزيز مكانتها كجزء أصيل من التراث السعودي. كما نسعى لتحفيز قطاع الحرف اليدوية من خلال دعم أعمال الحرفيين بأسلوب عادل ومستدام يضمن استمرارية هذا الإرث الثقافي',
              onPressed: () {},
              color: AppConstants.primarySectionColor,
            ),
          ],
        ),
      ),
    );
  }
}
