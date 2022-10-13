//package examples;
//
//import com.intuit.karate.Results;
//import com.intuit.karate.Runner;
//import static org.junit.jupiter.api.Assertions.*;
//import org.junit.jupiter.api.Test;
//
//class ExamplesTest {
//
//    @Test
//    void testParallel() {
//        Results results = Runner.path("classpath:examples")
//                //.outputCucumberJson(true)
//                .parallel(5);
//        assertEquals(0, results.getFailCount(), results.getErrorMessages());
//    }
//
//}
//


import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit5.Karate;

//@KarateOptions(tags = {"@debug"})
//@KarateOptions(tags = {"@account"})
// How to Run it - mvn clean test "-Dkarate.options=--tags @debug"
class ExamplesTest {

    // this will run all *.feature files that exist in sub-directories
    // see https://¬github.com/intuit/karate#naming-conventions
    @Karate.Test
    Karate testSample() {
        return Karate.run().relativeTo(getClass());
    }
}

