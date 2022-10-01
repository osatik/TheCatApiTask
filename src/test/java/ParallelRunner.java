import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;


public class ParallelRunner {
    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:features").tags("~@ignore").parallel(5);
        assertTrue(results.getFailCount() == 0, results.getErrorMessages());
    }
}
