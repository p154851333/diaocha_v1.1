package com.ec.survey.dao;

import com.ec.survey.dto.User;

public interface UserDAO {
	void addUser(User user) throws Exception;

	User findOneUserByEmail(String email) throws Exception;
	User findOneUserByNickname(String nickname) throws Exception;

	void delUser(int id) throws Exception;

}
