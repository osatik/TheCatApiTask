import com.intuit.karate.junit5.Karate;
import cucumber.api.CucumberOptions;


@CucumberOptions(plugin = { "pretty", "json:target/cucumber.json" }, features = {
        "src/test/resources/features/" }, glue = { "classpath:" }, tags = { "@wip" })
class TestRunner {
    @Karate.Test
    Karate testTags() {
        return Karate.run("C:\\Pr\\TheCatApi\\src\\test\\java\\features")
                .tags("@wip");
    }
}