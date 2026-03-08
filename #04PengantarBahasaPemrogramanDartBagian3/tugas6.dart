// Lexical Scope
// void main() {
//   var nama = "Diyah";
//   var nim = "244106070152";

//   void tampil() {
//     print(nama);
//     print(nim);
//   }

//   tampil();
// }

//Lexical closures
Function buatCounter() {
  int count = 0;

  return () {
    count++;
    return count;
  };
}

void main() {
  var counter = buatCounter();
  print(counter());
  print(counter());
}