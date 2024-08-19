import java.io.*;
import java.util.*;

/** Here We're building a simple checksum algorithm:
 * checksum = [count input strings with doubled letters] * [..with tripled letters]
 * 
 * @author Leo
 *
 */
public class Main
{
    // TODO 624 is not the right answer. write test cases.
    
    
    public static void main(String[] args) throws IOException
    {
        FileReader in = null;
        int input;
        char cInput;
        HashSet<Character> uniqueChars = new HashSet<Character>(); //		unique Chars per Word
        HashSet<Character> doubledChars = new HashSet<Character>(); // 		possible Alternative:
        HashSet<Character> tripledChars = new HashSet<Character>();  // 		instead of named Hash sets
        HashSet<Character> abundantChars = new HashSet<Character>(); //         anonymous ones in an Array 
        int wordsWithDoubledChar = 0;
        int wordsWithTripledChar = 0;
        
        try
        {
            in = new FileReader("input.txt");
             
            while ((input = in.read()) != -1)
            {
                cInput = (char)input;
                if (String.valueOf(cInput).equals("\n"))
                {
                    if (doubledChars.size() > 0)
                    {
                        wordsWithDoubledChar++;
                    }
                    if (tripledChars.size() > 0)
                    {
                        wordsWithTripledChar++;
                    }
                    
                    uniqueChars.clear();
                    doubledChars.clear();
                    tripledChars.clear();
                    abundantChars.clear();
                } else {
                    if (uniqueChars.contains(cInput))
                    {
                        if (doubledChars.contains(cInput))
                        {
                        	doubledChars.remove(cInput);
                            tripledChars.add(cInput);
                        } else {
                            if (tripledChars.contains(cInput))
                            {
                                tripledChars.remove(cInput);
                                abundantChars.add(cInput);
                            } else {
                                if (!abundantChars.contains(cInput))
                                {
                                    doubledChars.add(cInput);
                                }
                            }
                        }
                    } else {
                    uniqueChars.add(cInput);
                    }
                }
            }
            int result = wordsWithDoubledChar * wordsWithTripledChar;
            System.out.println("Checksum is "+ result);
        } finally {
            if (in != null)
            {
                in.close();
            }
        }

    }

}
