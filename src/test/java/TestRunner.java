import com.intuit.karate.junit5.Karate;

class TestRunner {
    @Karate.Test
    Karate testTags() {
        return Karate.run("C:\\Pr\\TheCatApi\\src\\test\\java\\features")
                .tags("@wip");
           }

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}