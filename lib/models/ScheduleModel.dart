// ignore_for_file: file_names
class Schedule {
  final String name;
  final String title;
  final String date;
  final String time;
  final int bgColorHex;

  const Schedule({
    required this.name,
    required this.title,
    required this.date,
    required this.time,
    required this.bgColorHex,
  });
}

// Data Dummy untuk 3 lapisan kartu dengan warna yang semakin gelap
final List<Schedule> dummySchedules = [
  const Schedule(
    name: 'Fulanah, S.Tr.Keb',
    title: 'Bidan',
    date: '24 Sept, Monday',
    time: '7.00 am - 7.30 am',
    bgColorHex: 0xFFFF3EA5, // Pink Terang (Paling Depan)
  ),
  const Schedule(
    name: 'Dr. Siti, Sp.OG',
    title: 'Dokter Kandungan',
    date: '25 Sept, Tuesday',
    time: '8.00 am - 9.00 am',
    bgColorHex: 0xFFE0308D, // Pink Sedang
  ),
  const Schedule(
    name: 'Bapak Budi, S.Psi',
    title: 'Psikolog',
    date: '26 Sept, Wednesday',
    time: '10.00 am - 11.00 am',
    bgColorHex: 0xFFC02070, // Pink Gelap (Paling Belakang)
  ),
];