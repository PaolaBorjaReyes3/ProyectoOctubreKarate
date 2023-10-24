package com.karate;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit5.Karate;


@KarateOptions(features = "classpath:api", tags = "@Prueba1")
public class ExamplesTest {
    @Karate.Test
    Karate karateTest() {
        return Karate.run().relativeTo(getClass());
    }
}