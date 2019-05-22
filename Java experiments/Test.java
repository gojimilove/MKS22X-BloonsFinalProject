import java.*;
import java.util.*;
import java.io.*;
public class Test{
 public static void main(String[] args) {
   String x,y,z;
   try{
     File text = new File("map.txt");
     Scanner s = new Scanner(text);
     String line = "";
     int r = 0;
     while(r < 53 && s.hasNextLine()){
       String lineS = s.nextLine();
       String[] parts = lineS.split(",");
       x = parts[0];
       y = parts[1];
       z = parts[2];
       System.out.print(" ");
       System.out.print(x + y + z);
     }
     r++;
   }catch (Exception e) {
      System.out.println("An exception has occured") ;
  }
}
// public static void main(String[] args) {
//    try {
//      File f = new File("map.txt") ;
//      Scanner s = new Scanner(f) ;
//      while (s.hasNextLine()) {
//        String line = s.nextLine() ;
//        System.out.println(line) ;
//      }
//    } catch (FileNotFoundException e) {
//      System.out.println("The file was not found!") ;
//    }
//    catch (Exception e) {
//      System.out.println("An exception has occured") ;
//    }
//
//  }
}
