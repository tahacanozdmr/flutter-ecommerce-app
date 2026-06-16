# Mini Katalog Uygulaması

Fake Store API kullanan basit bir Flutter e-ticaret uygulaması.

## Kısa Açıklama

Calisma, bir REST API üzerinden ürün listesini çeken basit bir Flutter alışveriş
uygulamasıdır. Ana ekranda ürünler listelenir, ürün detayları görüntülenebilir ve
ürünler sepete eklenebilir. Ağ istekleri için `http` paketi kullanılır.

Ürün verileri [Fake Store API](https://fakestoreapi.com/products) üzerinden alınır.

Başlıca ekranlar:

- **Ana ekran** (`home_screen.dart`) — API'den gelen ürünlerin grid (kart) olarak
  listelendiği ekran; her kartta kategori etiketi, ürün adı, fiyat ve yıldız puanı yer alır
- **Ürün detay ekranı** (`product_detail_screen.dart`) — seçilen ürünün detayları
- **Sepet ekranı** (`cart_screen.dart`) — sepete eklenen ürünler

## Özellikler

- API'den dinamik ürün listeleme (`GridView`)
- Ürün detay sayfasına geçiş ve sepete ekleme (`Navigator` + basit state yönetimi)
- Kategori etiketi ve yıldız puanı (`rating`) gösterimi
- Mor/indigo tema ve `Poppins` özel fontu

## Kullanılan Flutter Sürümü

- **Flutter:** 3.38.4 (stable channel)
- **Dart:** 3.10.3
- **Dart SDK kısıtı:** `^3.10.3` (bkz. `pubspec.yaml`)

### Bağımlılıklar

- `http: ^1.6.0` — API istekleri için
- `cupertino_icons: ^1.0.8`
- `flutter_lints: ^6.0.0` (dev)

### Asset'ler

- `assets/fonts/` — `Poppins` font ailesi (Regular, Medium, SemiBold, Bold);
  `pubspec.yaml` içinde tanımlıdır ve uygulama temasında varsayılan font olarak kullanılır.

## Çalıştırma Adımları

1. Depoyu klonlayın ve proje dizinine girin:

   ```bash
   git clone <repo-url>
   cd flutter-ecommerce-app
   ```

2. Bağımlılıkları yükleyin:

   ```bash
   flutter pub get
   ```

3. Bağlı bir cihaz veya emülatör olduğundan emin olun:

   ```bash
   flutter devices
   ```

4. Uygulamayı çalıştırın:

   ```bash
   flutter run
   ```

   Belirli bir platformda çalıştırmak için:

   ```bash
   flutter run -d chrome     # Web
   flutter run -d windows    # Windows masaüstü
   ```

5. (İsteğe bağlı) Yayın için derleme:

   ```bash
   flutter build apk         # Android
   flutter build windows     # Windows
   ```
