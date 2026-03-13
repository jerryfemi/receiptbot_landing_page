import 'dart:io';
import 'package:image/image.dart' as img;

void main() async {
  final dir = Directory('web/images');
  final files = dir.listSync().whereType<File>().where((f) => f.path.endsWith('.png')).toList();
  
  for (var file in files) {
    print('Compressing \${file.path}...');
    final bytes = await file.readAsBytes();
    var image = img.decodeImage(bytes);
    
    if (image != null) {
      if (image.width > 1200) {
        print('Resizing \${file.path} from \${image.width}px to 1200px wide...');
        image = img.copyResize(image, width: 1200);
      }
      
      // Encode as highly compressed PNG
      final compressedBytes = img.encodePng(image, level: 9);
      await file.writeAsBytes(compressedBytes);
      print('Saved compressed \${file.path}');
    }
  }
}
