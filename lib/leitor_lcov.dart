import 'dart:io';

import 'package:study_unit_test/line_report.dart';

void main(List<String> args) {
  final result = coverage(args[0]);
  print(result);
}

String coverage(String lcovPath) {
  final file = File(lcovPath);
  final content = file.readAsLinesSync();
  final reports = contentToLineReports(content);

  final percent = calculatePercent(reports);

  return '${percent.toString()}%';
}

int calculatePercent(List<LineReport> reports) {
  int totalLf = 0;
  int totalLh = 0;

  for (var report in reports) {
    var lf = report.lineFound;
    var lh = report.lineHit;

    if (lf < 0) lf = 0;
    if (lh < 0) lh = 0;

    if (lh > lf) lh = lf;

    totalLf += lf;
    totalLh += lh;
  }

  if (totalLf == 0) return 0;

  final percent = (totalLh / totalLf) * 100;
  return percent.round();
}

List<LineReport> contentToLineReports(List<String> content) {
  final reports = <LineReport>[];
  var sf = '';
  var lf = 0;
  var lh = 0;

  for (var text in content) {
    if (text == 'end_of_record') {
      final report = LineReport(sourceFile: sf, lineFound: lf, lineHit: lh);
      reports.add(report);
      continue;
    }
    final line = text.split(':');

    if (line[0] == 'SF') {
      sf = line[1];
    } else if (line[0] == 'LF') {
      lf = int.parse(line[1]);
    } else if (line[0] == 'LH') {
      lh = int.parse(line[1]);
    }
  }

  return reports;
}
