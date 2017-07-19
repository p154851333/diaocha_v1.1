package com.ec.survey.dao;

import com.ec.survey.dao.mssqlimpl.AdminDAOimpl;
import com.ec.survey.dao.mssqlimpl.AnswersheetDAOimpl;
import com.ec.survey.dao.mssqlimpl.ConfigDAOimpl;
import com.ec.survey.dao.mssqlimpl.LinkDAOimpl;
import com.ec.survey.dao.mssqlimpl.QuestionDAOimpl;
import com.ec.survey.dao.mssqlimpl.SurveyDAOimpl;
import com.ec.survey.dao.mssqlimpl.UserDAOImpl;

public class DAOFactory {

	private DAOFactory() {
	}
	public static SurveyDAO getSurveyDAO() {
		return new SurveyDAOimpl();
	}

	public static QuestionDAO getQuestionDAO() {
		return new QuestionDAOimpl();
	}

	public static ConfigDAO getConfigDAO() {
		return new ConfigDAOimpl();
	}

	public static AnswersheetDAO getAnswersheetDAO() {
		return new AnswersheetDAOimpl();
	}

	public static AdminDAO getAdminDAO() {
		return new AdminDAOimpl();
	}

	public static LinkDAO getLinkDAO() {
		return new LinkDAOimpl();
	}

	public static UserDAO getUserDAO() {
		return new UserDAOImpl();
	}
}
