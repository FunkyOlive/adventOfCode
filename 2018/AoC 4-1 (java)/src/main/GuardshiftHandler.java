package main;

final class GuardshiftHandler {
	private int[][] fabric; //any coordinate of the 2d fabric belongs to:
							// [0] no one || [int] claim #int || [-1] more than one claim (conflicted)
	public GuardshiftHandler(int size) {
		fabric = new int[size][size];
	}

	public void addClaim(int[] claim) {
		for (int x = claim[1]; x < (claim[1] + claim[3]); x++) {
			for (int y = claim [2]; y < (claim[2] + claim[4]); y++) {
				if (fabric[x][y] > 0) {
					fabric[x][y] = -1;
				}
				if (fabric[x][y] == 0) {
					fabric[x][y] = claim[0];
				}
			}
		}
	}

	public int giveConflictedArea() {
		int conflictedArea = 0;
		for (int i=0; i < fabric.length; i++) {
			for (int j=0; j < fabric[0].length; j++) {
				if (fabric[i][j] == -1) {
					conflictedArea++;
				}
			}
		}
		return conflictedArea;
	}

	public boolean checkConflicted(int[] claim) {
		for (int x = claim[1]; x < (claim[1] + claim[3]); x++) {
			for (int y = claim [2]; y < (claim[2] + claim[4]); y++) {
				if (fabric[x][y] == -1) {
					return true;
				}
			}
		}
		return false;
	}
}
