package com.ec.survey.dao;
import java.util.List;
import com.ec.survey.dto.Survey;
import com.swufe.pager.PageListener;
public interface SurveyDAO extends PageListener{
	boolean addSurvey(Survey survey);
	boolean updateSurvey(Survey survey);
	boolean delSurvey(Long surveyId);
	List<Survey> listAllSurvey();
	List<Survey> listAllSurvey(String order);
	Survey findSurvey(Long surveyId); 
	List<Survey> listVisitableSurvey();
	List<Survey> listVisitableSurvey(String order);
}
