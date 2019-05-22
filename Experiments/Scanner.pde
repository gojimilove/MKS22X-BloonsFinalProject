void setup() {
  //
}

void draw() {
  // 

  string filename= "nouns.txt";
  string words = "apple bear cat dog";
  fileAppend(String filename, String words);
}

void fileAppend() {
  // first try to read from file
  //
  String filestuff = loadStrings(filename);
  // then, depending on what was found, do either ...
  if (filestuff == null) {
    // file is empty, just write words out, one per line
    String[] list = split(words, ' ');
    saveStrings(filename, list);
  }
  // or ...
  else {
    // file has stuff in it, append words to filestuff, and write all of it out

    // ... more code later
    println("Pretend writing ...");
  }
}