package com.ec.survey.ctrl;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

public class ShowSurveyActionTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testMatch() {
		String s = "21:as=<&>主观题测试主观题测试<&>;";
		String[] split = s.split("<&>");
		boolean contains = s.contains("<&>");
		/*List<String> match = ShowSurveyAction.match(s);*/
		System.out.println(contains);
		System.out.println(split[0]);
		System.out.println(split[1]);
		System.out.println(split[2]);
	}

}
