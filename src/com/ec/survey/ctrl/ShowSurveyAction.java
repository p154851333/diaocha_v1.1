package com.ec.survey.ctrl;

import java.util.Enumeration;
import java.util.Set;
import java.util.TreeSet;

import com.ec.survey.dao.AnswersheetDAO;
import com.ec.survey.dao.DAOFactory;
import com.ec.survey.dao.QuestionDAO;
import com.ec.survey.dao.SurveyDAO;
import com.ec.survey.dto.Answersheet;
import com.ec.survey.dto.Question;
import com.ec.survey.dto.Survey;

public class ShowSurveyAction extends BaseAction {
	private String sid;

	public String ShowSurvey() {
		String sid = request.getParameter("sid");
		// 得到问卷的持久层
		SurveyDAO sdao1 = DAOFactory.getSurveyDAO();
		// 通过sid查询问卷
		Survey s = sdao1.findSurvey(Long.valueOf(sid));
		// 得到答题板的持久层
		AnswersheetDAO adao1 = DAOFactory.getAnswersheetDAO();
		// 查询得到答题板
		QuestionDAO dao = DAOFactory.getQuestionDAO();

		// 得到页面传来的所有带有name属性的参数返回为枚举类型
		Enumeration params = request.getParameterNames();
		// 创建set集合，用于存放问卷的题目。
		Set<Long> qidSet = new TreeSet<Long>();
		// 遍历参数，并将参数内的题目放入set中
		while (params.hasMoreElements()) {
			String para = (String) params.nextElement();
			if (para.startsWith("answer")) {
				Long qid = Long.valueOf(para.substring(6));
				qidSet.add(qid);
			}
		}

		boolean success = true;
		String answersheet = "";
		synchronized (this) {
			for (Long qid : qidSet) {
				// 将set内的qid查询出所有的题目。
				Question q = dao.findQuestion(qid);
				String result = q.getQResult();
				//题目选项的字符串集合
				String[] results = result.split(",");
				if (q.getQType() == 1) {//单选题
					//answer：第几个选项。
					int answer = Integer.parseInt(request.getParameter("answer"	+ qid));
					//给一个题目的选项+1访问次数，赋值给自己
					results[answer] = String.valueOf(Integer
							.parseInt(results[answer]) + 1);
					//答题纸做好记录
					answersheet = answersheet + "&@@&" + qid + ":as=" + answer
							+ ";";
				} else if (q.getQType() == 2) {
					String[] answers = request.getParameterValues("answer" + qid);
					String as = "";
					for (int i = 0; i < answers.length; i++) {
						results[Integer.parseInt(answers[i])] = String
								.valueOf(Integer.parseInt(results[Integer
										.parseInt(answers[i])]) + 1);
						as = as + "," + answers[i];
					}
					as = as.substring(1, as.length());
					answersheet = answersheet + "&@@&" + qid + ":as=" + as
							+ ";";
				}else if (q.getQType() == 5) {
					//answer：第几个选项。
					String answer = request.getParameter("answer" + qid);
					//给一个题目的选项+1，赋值给自己
					results[0] = String.valueOf(Integer.parseInt(results[0]) + 1);
					//答题纸做好记录
					answersheet = answersheet + "&@@&" + qid + ":text=" + answer + ";";
				}

				String newresult = "";
				for (int i = 0; i < results.length; i++) {
					if (i == 0)
						newresult = results[i];
					else
						newresult = newresult + "," + results[i];
				}
				//更新题目选项的访问次数
				q.setQResult(newresult);
				boolean ret = dao.updateQuestion(q);
				if (ret == false) {
					success = false;
				}
			}
			
			//答题纸的持久层
			AnswersheetDAO adao = DAOFactory.getAnswersheetDAO();
			Answersheet sheet = new Answersheet();
			sheet.setSurvey(Long.valueOf(sid));

			//答题纸内容的字符判断。
			if (answersheet.equals("")) {
				return "fail";
			}
			answersheet = answersheet.substring(4);
			sheet.setAsResult(answersheet);
			sheet.setAsPostdate(new java.util.Date());
			sheet.setAsUserIp(request.getRemoteAddr());
			boolean ret = adao.addAnswersheet(sheet);
			if (ret == false) {
				success = false;
			}
			if (success == true) {
				SurveyDAO sdao = DAOFactory.getSurveyDAO();
				Survey survey = sdao.findSurvey(Long.valueOf(sid));

				survey.setSUsehits(survey.getSUsehits() + 1);
				sdao.updateSurvey(survey);

				// response.sendRedirect("../OpResult.jsp?ret=true&op=ShowSurvey");}
				return "success";
			} else {
				// response.sendRedirect("../OpResult.jsp?ret=false&op=ShowSurvey");
				return "fail";
			}
		}
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

}
