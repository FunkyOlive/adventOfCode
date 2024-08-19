package main;
import java.io.*;
import java.util.*;


public class Main {

	public static void main(String[] args) throws IOException {
		GuardshiftHandler fh = new GuardshiftHandler(1000);
		
		
		ArrayList<int[]> shiftEvents = readShiftEventsFromFile("testInput");
		for (int[] claim : shiftEvents) {
			fh.addClaim(claim);
		}
		System.out.println(fh.giveConflictedArea());
		for (int[] claim : shiftEvents) {
			if (!fh.checkConflicted(claim)) {
				System.out.println(claim[0]);
			}
		}
	}

	private static ArrayList<int[]> readShiftEventsFromFile(String file) throws IOException {
		FileReader in = null;
		int input;
		char cInput;
		ArrayList<int[]> shiftEvents = new ArrayList<int[]>();
		String lineContent = new String();
		int[] shiftEvent = new int[5]; //0=ID, 1=x, 2=y, 3=width, 4=height
		
		try {
			in = new FileReader(file);

			
			while((input = in.read()) != -1) {
				cInput = (char) input;
				
				if (String.valueOf(cInput).equals("\n")) {
//					shiftEvent[4] = Integer.valueOf(lineContent); //recording guardID/minutes TODO
					lineContent = new String();
					
					shiftEvents.add(shiftEvent);
					shiftEvent = new int[5];
				} else {
					lineContent = lineContent.concat(String.valueOf(cInput));
					
//					switch (cInput) {
//					case 'g':
//						shiftEvent[0] = Integer.valueOf(lineContent); //recording claimID
//						lineContent = new String();
//						break;
//					case 'f':
//						shiftEvent[1] = Integer.valueOf(lineContent); //recording x
//						lineContent = new String();
//						break;
//					case 'w':
//						shiftEvent[2] = Integer.valueOf(lineContent); //recording y
//						lineContent = new String();
//						break;
//					case ':':
//						shiftEvent[3] = Integer.valueOf(lineContent); //recording width
//						lineContent = new String();
//						break;
//					}
//					if (47 < input && input < 58) {
//						lineContent = lineContent.concat(String.valueOf(cInput)); 
//					}
				}
			}
			
			
		} finally {
			if(in != null) {
				in.close();
			}	
		}
		return shiftEvents;
	}
	
}
