class FormatTime {
  final Stopwatch stopwatch;

  FormatTime(this.stopwatch);

  void getTimeElapsedFormatted(String title) {
      var milli = this.stopwatch.elapsed.inMilliseconds;

      String milliseconds = (milli % 1000).toString().padLeft(3, "0"); // this one for the miliseconds

      String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0"); // this is for the second

      String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0"); // this is for the minute

      print("Title: $title");
      print("RAW: $milli");
      print("Formatted: $minutes:$seconds:$milliseconds");
      print("\n---\n");
  }
}