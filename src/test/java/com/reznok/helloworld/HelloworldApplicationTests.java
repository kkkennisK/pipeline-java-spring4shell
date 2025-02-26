package com.reznok.helloworld;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class HelloworldApplicationTests {

	@Test
	void contextLoads() {
		String apiKey = "12345-ABCDE";
		System.out.println(apiKey);

		String name = "John";
        int age = 30;
        System.out.printf("Name: %s, Age: %d%n", name, age);

	}

}

