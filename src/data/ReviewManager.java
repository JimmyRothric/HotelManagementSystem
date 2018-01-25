package data;

public class ReviewManager {
	
	private ReviewManager() {}
	private static final ReviewManager instance = new ReviewManager();
	public ReviewManager getReviewManager() {
		return instance;
	}
	
	
}
