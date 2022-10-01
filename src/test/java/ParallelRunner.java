import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.testng.AssertJUnit.*;


public class ParallelRunner {
    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:features").tags("~@ignore").parallel(5);
        assertEquals(results.getErrorMessages(), 0, results.getFailCount());
    }


}
