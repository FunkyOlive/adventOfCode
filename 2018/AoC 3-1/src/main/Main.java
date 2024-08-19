package main;
import java.io.*;
import java.util.*;


public class Main {

	public static void main(String[] args) throws IOException {
		FabricHandler fh = new FabricHandler(1000);
		
		for (int[] claim : readClaimsFromFile("input.txt")) {
			fh.addClaim(claim);
		}
		System.out.println(fh.giveConflictedArea());
	}

	private static ArrayList<int[]> readClaimsFromFile(String file) throws IOException {
		FileReader in = null;
		int input;
		char cInput;
		ArrayList<int[]> claims = new ArrayList<int[]>();
		String value = new String();
		int[] claim = new int[5]; //0=ID, 1=x, 2=y, 3=width, 4=height
		
		try {
			in = new FileReader(file);

			
			while((input = in.read()) != -1) {
				cInput = (char) input;
				
				if (String.valueOf(cInput).equals("\n")) {
					claim[4] = Integer.valueOf(value); //recording height
					value = new String();
					
					claims.add(claim);
					claim = new int[5];
				} else {
					switch (cInput) {
					case '@':
						claim[0] = Integer.valueOf(value); //recording claimID
						value = new String();
						break;
					case ',':
						claim[1] = Integer.valueOf(value); //recording x
						value = new String();
						break;
					case ':':
						claim[2] = Integer.valueOf(value); //recording y
						value = new String();
						break;
					case 'x':
						claim[3] = Integer.valueOf(value); //recording width
						value = new String();
						break;
					}
					if (47 < input && input < 58) {
						value = value.concat(String.valueOf(cInput)); 
					}
				}
			}
			
			
		} finally {
			if(in != null) {
				in.close();
			}	
		}
		return claims;
	}
	
}
