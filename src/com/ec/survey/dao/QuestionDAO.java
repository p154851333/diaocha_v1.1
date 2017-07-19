package com.ec.survey.dao;
import java.util.List;

import com.ec.survey.dto.Question;
import com.swufe.pager.PageListener;
public interface QuestionDAO extends PageListener {
	boolean addQuestion(Question question);
	boolean updateQuestion(Question question);
	boolean delQuestion(Long questionId);
	boolean delQuestions(Long surveyId);
	List<Question> listQuestions(String WhereClause);
	List<Question> listAllQuestion(Long surveyId);
	List<Question> listAllQuestion(Long surveyId,String ascORdesc);
	Question findQuestion(Long questionId);
}
