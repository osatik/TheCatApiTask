import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import org.junit.jupiter.api.Test;

import static org.testng.AssertJUnit.assertEquals;


public class ParallelRunner {
    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:features").tags("~@ignore").parallel(5);
        assertEquals(results.getErrorMessages(), 0, results.getFailCount());
    }


}
