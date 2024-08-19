import java.io.*;

public class Main
{
    public static void main(String args[]) throws IOException {  
        FileInputStream in = null;
        int out = 0;
        try {
            in = new FileInputStream("input.txt");
            int input;
            char cInput;
            String bufferedInput = new String("+0");
           
            while ((input = in.read()) != -1) {
                cInput = (char)input;
              
                //if new +/- : write to out and clear bufferedInput
                if (cInput == '+' || cInput == '-'){
                    

                    //buffer->out has to be at the start of while, because we want to read only 1 input-char at a time
                    out = out + Integer.parseInt(bufferedInput);
                    bufferedInput = "";
                }
           
                //buffer input exept linebreaks
                if (!String.valueOf(cInput).equals("\n")) {
                    bufferedInput = bufferedInput.concat(String.valueOf(cInput));
                }
                //debug info
                System.out.println("[" + cInput + "/" + bufferedInput + "/" + out + "]");
            }
         
            //Compensation for beginning instead of ending the while with buffer->out
            bufferedInput.replace("\n", "");
            out = out + Integer.parseInt(bufferedInput); 
            bufferedInput = "";
          
            // Final Output
            System.out.println("Final Out: " + out); 
        } finally {
            if (in != null) {
                in.close();
           }
        }
     }
}
