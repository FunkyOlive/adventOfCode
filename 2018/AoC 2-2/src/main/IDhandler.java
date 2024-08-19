package main;
import java.util.*;

final class IDhandler {
	private HashSet<String> gatheredIDs = new HashSet<String>();
	
	public String findSimilarCharsOfAlmostSimilarIDs(String newID) {
		HashSet<String> tempIDs = gatheredIDs;
		String foundIDsChars = new String();
		
		if (gatheredIDs != null) {
			for (String ID : tempIDs) {
				String tempID = new String(); 
				for (int i = 0; i < newID.length(); i++) {
					if(ID.charAt(i) == newID.charAt(i)) {
						tempID = tempID.concat(String.valueOf(newID.charAt(i)));
					} //else: treat differing char
				}
				if (tempID.length() == newID.length() - 1) {
					foundIDsChars = tempID;
				}
			}
		}
		gatheredIDs.add(newID);
		return foundIDsChars;
	}
}