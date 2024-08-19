import java.io.*;
import java.util.ArrayList;
import java.util.HashSet;

public class Main
{
    public static void main(String args[]) throws IOException {  
        FileReader in = null;
        String fDiffBuffer = new String("");
        ArrayList<Integer> fDiffs = new ArrayList<Integer>();
        
        
        //Step 1: Write changes into Array:
        try {
            in = new FileReader("input.txt");
            int input;
            
            while((input = in.read()) != -1)
            {   
                if (String.valueOf((char)input).equals("\n"))
                {
                    fDiffs.add(Integer.valueOf(fDiffBuffer));
                    fDiffBuffer = "";
                } else
                {
                    fDiffBuffer = fDiffBuffer.concat(String.valueOf((char)input));
                }
                
            }
        } finally {
            if (in != null) {
                in.close();
           }
        }
        
        // Now we dealt with the input.
        // 
        // Step 2: run input on a looping starting frequency, gathering found frequencies in a set
        //                                                                     (to search for the first duplicate)
        int result = findDuplicateF(fDiffs);
        if (result == 0)
        {
            System.out.println("No Duplicate found");
        } else {
            System.out.println("Found Duplicate at " + result);
        }
        
    }
    
    public static int findDuplicateF(ArrayList<Integer> fDiffs)
    {
        HashSet<Integer> fsFound = new HashSet<Integer>(); //Set of found frequencies
        int fCurr = 0; //current frequency
        for (int retries=1000;retries!=0;retries--)
        {        
            for(Integer fDiff : fDiffs)
            {
                fCurr = fCurr + fDiff;
                if (fsFound.add(fCurr) == false)
                {
                    return fCurr;
                }
                System.out.println(fCurr);
            }
        }
        return 0; //default frequency 0. this is hacky
    }
}
