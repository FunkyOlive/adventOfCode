package main;
import java.io.*;

public class Main {

	public static void main(String[] args) throws IOException {
		FileReader in = null;
		int input;
		char cInput;
		String ID = new String();
		IDhandler IDhandler = new IDhandler();
		
		try {
			in = new FileReader("input.txt");
			
			
			while((input = in.read()) != -1) {
				cInput = (char)input;
				if (String.valueOf(cInput).equals("\n")) {
					String output;
					if (!(output = IDhandler.findSimilarCharsOfAlmostSimilarIDs(ID)).contentEquals("")) {
						System.out.println(output);
					}
					ID = "";
				} else {
					ID = ID.concat(String.valueOf(cInput));
				}
			}
			
			
		}
		finally {
			if (in != null) {
				in.close();
			}
		}
	}

}
