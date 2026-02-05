import 'dart:io';

/// S&B ARENA - Console Demo (Replit Compatible)
/// Bu kod Flutter UI değil, arka plan mantığıdır.
/// Flutter'a birebir taşınabilir.

class User {
  String username;
  String password;
  User(this.username, this.password);
}

class Post {
  String author;
  String content;
  Post(this.author, this.content);
}

List<User> users = [];
List<Post> forumPosts = [];
List<String> chatMessages = [];

User? currentUser;

void main() {
  while (true) {
    print('\n=== S&B ARENA ===');
    print('1) Giriş Yap');
    print('2) Kayıt Ol');
    print('3) Çıkış');

    stdout.write('Seçim: ');
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      login();
    } else if (choice == '2') {
      register();
    } else if (choice == '3') {
      print('Çıkılıyor...');
      break;
    }
  }
}

void register() {
  stdout.write('Kullanıcı adı: ');
  String username = stdin.readLineSync()!;
  stdout.write('Şifre: ');
  String password = stdin.readLineSync()!;

  users.add(User(username, password));
  print('✅ Kayıt başarılı!');
}

void login() {
  stdout.write('Kullanıcı adı: ');
  String username = stdin.readLineSync()!;
  stdout.write('Şifre: ');
  String password = stdin.readLineSync()!;

  for (var user in users) {
    if (user.username == username && user.password == password) {
      currentUser = user;
      print('🎉 Hoşgeldin ${user.username}');
      dashboard();
      return;
    }
  }
  print('❌ Hatalı giriş');
}

void dashboard() {
  while (true) {
    print('\n--- ANA PANEL ---');
    print('1) Chat');
    print('2) Forum');
    print('3) Bildirim Göster');
    print('4) Çıkış Yap');

    stdout.write('Seçim: ');
    String? choice = stdin.readLineSync();

    if (choice == '1') chat();
    if (choice == '2') forum();
    if (choice == '3') notification();
    if (choice == '4') {
      currentUser = null;
      break;
    }
  }
}

void chat() {
  stdout.write('Mesaj yaz: ');
  String msg = stdin.readLineSync()!;
  chatMessages.add('${currentUser!.username}: $msg');
  print('💬 Chat:');
  chatMessages.forEach(print);
}

void forum() {
  stdout.write('Forum postu yaz: ');
  String post = stdin.readLineSync()!;
  forumPosts.add(Post(currentUser!.username, post));

  print('📢 Forum:');
  for (var p in forumPosts) {
    print('${p.author}: ${p.content}');
  }
}

void notification() {
  print('🔔 Bildirim: Yeni spor haberleri yayında!');
}
