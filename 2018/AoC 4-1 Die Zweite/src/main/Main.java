package main;
import java.io.*;
import java.util.*;


public class Main {

	public static void main(String[] args) throws IOException {
		readShiftsFromTxt("testInput.txt");
		//ShiftHandler sh = new ShiftHandler((String[]) readLinesFromTxt("testInput.txt").toArray());
		//System.out.println(ShiftHandler.getLongestSleeper());
	}

	private static ArrayList<String> readLinesFromTxt(String file) throws IOException {
		FileReader in = null;
		int input;
		char cInput;
		ArrayList<String> lines = new ArrayList<String>();
		String lineContent = new String();
		
		try {
			in = new FileReader(file);
			
			while((input = in.read()) != -1) {
				cInput = (char) input;
				if (String.valueOf(cInput).equals("\n")) {
					lines.add(lineContent);
					lineContent = new String();
				} else {
					lineContent = lineContent.concat(String.valueOf(cInput));
				}
			}
			
			
		} finally {
			if(in != null) {
				in.close();
			}	
		}
		return lines;
	}
	
	private static ArrayList<Integer[]> readShiftsFromTxt(String file) throws IOException {
		Scanner in = null;
		int input;
		ArrayList<Integer[]> shifts = new ArrayList<Integer[]>();
		try {
			in = new Scanner(file);
			in.useDelimiter("\\D{1,}");
			while ((input = in.nextInt()) != -1) {
				System.out.println(input);
			}
		} finally {
			if (in != null) {
				in.close();
			}
		}
		return shifts;
	}
	
}