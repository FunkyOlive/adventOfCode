package main;

import java.util.*;

public class ShiftHandler {

	private int[][] schedule;//als Dictionary mit Daten als Key?
	
	public ShiftHandler(String[] shiftList) {
		readShifts(shiftList);
	}

//	private void addShiftsToSchedule(ArrayList<int[]> shiftListUnsorted) {
//		
//		ArrayList<int[]> shiftList = sortShifts(shiftListUnsorted);
//		for(int[] shift : shiftList) {
//			// schedule[shift[0]][shift[1]] = shift[2]; // TODO Setze an [Datum] [Minute] zu [ID]
//		}
//		
//	}

	private ArrayList<int[]> readShifts(String[] shifts) {
		ArrayList<int[]> shiftList = new ArrayList<int[]>();
		for(String shiftLine : shifts) {
			int[] shift = new int[5];
			shift[0] = Integer.valueOf(shiftLine.substring(1, 4)); //Jahr
			shift[1] = Integer.valueOf(shiftLine.substring(6, 7)); //Monat
			shift[2] = Integer.valueOf(shiftLine.substring(9, 10)); //Tag
			shift[3] = Integer.valueOf(shiftLine.substring(12, 13)); //Stunde
			shift[4] = Integer.valueOf(shiftLine.substring(15, 16)); //Minute
			if (shiftLine.charAt(26) == '#')
			{
				//String guardIDcontainingString = shiftLine.substring(27).
				//shift[5] = Integer.valueOf(guardIDcontainingString); //GuardID
			}
			
			System.out.println(shift);
			// String -> ints -> intArray -> shifts // TODO
			shiftList.add(shift);
		}
		//shiftList.sort
		return shiftList;
		
	}

	public static int getLongestSleeper() {
		
		getGuardSleepTimes();
		return 0;
		
	}

	private static void getGuardSleepTimes() {
		//schedule[1][].length();
		// TODO Auto-generated method stub
		
	}
	
}