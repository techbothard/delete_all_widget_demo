import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class ZoomScreen extends StatefulWidget {
  const ZoomScreen({super.key});

  @override
  State<ZoomScreen> createState() => _ZoomScreenState();
}

class _ZoomScreenState extends State<ZoomScreen> {
  double _scale = 1.0;
  double _previousScale = 1;
  Matrix4 matrix = Matrix4.identity();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zoom Screen"),
      ),
      body: Container(
        color: Colors.white,
        child: PhotoView.customChild(
          initialScale: 1.0,
          minScale: 1.0,
          maxScale: 3.0,
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Text('''Title: "Whispers of Eternity"

In the quaint town of Willowbrook, where time seemed to move at a leisurely pace, lived two souls destined to intertwine their fates. Amelia, a spirited artist with a heart full of dreams, and Ethan, a reserved writer who found solace in the quiet corners of the town's library.

Their paths crossed one fateful afternoon when a gust of wind carried Amelia's sketches across the park. As pages fluttered in the air, Ethan rushed to help gather the scattered pieces of art. That day marked the beginning of a connection that would weave a tale of love through the seasons.

Amelia's studio, tucked away in the attic of a charming cottage, became a sanctuary where she poured her emotions onto canvases. Each stroke of her brush echoed the melodies of her heart, and little did she know, her art whispered secrets that only Ethan's soul could decipher.

Ethan, an avid reader, found solace in the worn-out leather chairs of Willowbrook's library. Amidst the shelves of timeless classics, he discovered a peculiar book—one that seemed to hold the echoes of a love story written in another era. As he delved into its pages, the characters came to life, echoing the sentiments he dared not express.

As the seasons changed, so did the dynamics of their connection. Spring brought blossoming friendship, summer ignited a spark that neither could ignore, autumn unveiled the depth of their emotions, and winter saw them wrapped in a cocoon of love.

One magical evening, beneath the twinkling stars of Willowbrook's night sky, Ethan took Amelia to a secret garden he had discovered in his wanderings. There, surrounded by the fragrance of blooming flowers, he confessed the feelings that had taken root in his heart. Amelia, in turn, revealed the secrets hidden within her artwork, expressing the emotions that words could not capture.

Their love story became a cherished legend in Willowbrook, whispered by the wind and woven into the fabric of the town's history. The quaint streets, the library's hushed corridors, and the attic studio bore witness to a love that transcended time.

In the quiet town of Willowbrook, where love stories were etched into the very soul of the landscape, Amelia and Ethan found their forever—a love that echoed through the ages, leaving behind whispers of eternity'''),
          ),
        ),
      ),
    );

    /*  Zoom(
          maxZoomWidth: 1800,
          maxZoomHeight: 1800,
          canvasColor: Colors.grey,
          backgroundColor: Colors.orange,
          colorScrollBars: Colors.purple,
          opacityScrollBars: 0.9,
          scrollWeight: 10.0,
          centerOnScale: true,
          enableScroll: true,
          doubleTapZoom: true,
          zoomSensibility: 0.05,
          onScaleUpdate: (scale, zoom) {},
          child: Text('''Title: "Whispers of Eternity"

In the quaint town of Willowbrook, where time seemed to move at a leisurely pace, lived two souls destined to intertwine their fates. Amelia, a spirited artist with a heart full of dreams, and Ethan, a reserved writer who found solace in the quiet corners of the town's library.

Their paths crossed one fateful afternoon when a gust of wind carried Amelia's sketches across the park. As pages fluttered in the air, Ethan rushed to help gather the scattered pieces of art. That day marked the beginning of a connection that would weave a tale of love through the seasons.

Amelia's studio, tucked away in the attic of a charming cottage, became a sanctuary where she poured her emotions onto canvases. Each stroke of her brush echoed the melodies of her heart, and little did she know, her art whispered secrets that only Ethan's soul could decipher.

Ethan, an avid reader, found solace in the worn-out leather chairs of Willowbrook's library. Amidst the shelves of timeless classics, he discovered a peculiar book—one that seemed to hold the echoes of a love story written in another era. As he delved into its pages, the characters came to life, echoing the sentiments he dared not express.

As the seasons changed, so did the dynamics of their connection. Spring brought blossoming friendship, summer ignited a spark that neither could ignore, autumn unveiled the depth of their emotions, and winter saw them wrapped in a cocoon of love.

One magical evening, beneath the twinkling stars of Willowbrook's night sky, Ethan took Amelia to a secret garden he had discovered in his wanderings. There, surrounded by the fragrance of blooming flowers, he confessed the feelings that had taken root in his heart. Amelia, in turn, revealed the secrets hidden within her artwork, expressing the emotions that words could not capture.

Their love story became a cherished legend in Willowbrook, whispered by the wind and woven into the fabric of the town's history. The quaint streets, the library's hushed corridors, and the attic studio bore witness to a love that transcended time.

In the quiet town of Willowbrook, where love stories were etched into the very soul of the landscape, Amelia and Ethan found their forever—a love that echoed through the ages, leaving behind whispers of eternity'''),
        )*/
  }
}
