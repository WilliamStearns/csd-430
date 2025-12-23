/**
 * William Stearns
 * CSD430 Module 11
 * Description: Example of standardized Java code following 
 * industry-standard naming and documentation conventions.
 */
public class ScoreCalculator {

    // Constant naming convention (UPPER_CASE)
    private static final int MAX_SCORE = 100;

    /**
     * Calculates a combined score and ensures it does not exceed the maximum.
     * @param initialScore The starting point value
     * @param bonusPoints The points to be added
     * @return The capped total score
     */
    public int calculateCappedTotal(int initialScore, int bonusPoints) {
        int total = initialScore + bonusPoints;

        if (total > MAX_SCORE) {
            return MAX_SCORE;
        }

        return total;
    }
}