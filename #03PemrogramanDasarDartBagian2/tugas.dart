void main() {
  String nama = "Diyah Ramadhani Putri";
  String nim = "244107060152";

  for (int i = 0; i <= 201; i++) {
    print("Angka: $i");

    int pembagi = 0;

    if (i > 1) {
      for (int j = 1; j <= i; j++) {
        if (i % j == 0) {
          pembagi++;
        }
      }

      if (pembagi == 2) {
        print("Bilangan prima ditemukan!");
        print("Nama: $nama");
        print("NIM: $nim");
      }
    }

    print("---------------------");
  }
}