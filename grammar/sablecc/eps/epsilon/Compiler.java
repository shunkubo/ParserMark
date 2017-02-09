package epsilon;
import epsilon.parser.*;
import epsilon.lexer.*;
import epsilon.node.*;
import java.io.*;

public class Compiler
{
 public static void main(String[] arguments)
 {
  try
  { long fastest = 0;
     for (int i = 0; i < 10; i++) {
   // Create a Parser instance.
   Parser p =new Parser(new Lexer(new PushbackReader(new FileReader(new File(arguments[0])))));

   long start = System.nanoTime();
   // Parse the input.
   Start tree = p.parse();

   long end = System.nanoTime();
   if ((end - start) < fastest || fastest == 0) {
      fastest = (end - start);
    }
//   int errors = parser.getNumberOfSyntaxErrors();
//    if (errors >= 1) {
//      System.out.println(String.format("%s ERROR",filePath));
//      failed = true;
//      break;
//    }
  }
//  BigDecimal ft = new BigDecimal(fastest/1000000.0);
   System.out.print("parsetime:");
   System.out.print((double)fastest/1000000);
   System.out.println("ms");


   // Apply the translation.
   new Translation();
  //  tree.apply(new Translation());
  }
  catch(Exception e)
  {
   System.out.println(e.getMessage());
  }
 }
}
