package com.ec.survey.dao;

import java.util.List;

import com.ec.survey.dto.Answersheet;
import com.swufe.pager.PageListener;

public interface AnswersheetDAO extends PageListener {

	boolean addAnswersheet(Answersheet answersheet);
	boolean delAnswersheet(Long answersheetId);
	boolean delAnswersheets(Long sid);
	List<Answersheet> listAllAnswersheet(Long surveyId);
	Answersheet findAnswersheet(Long answersheetId);
}
