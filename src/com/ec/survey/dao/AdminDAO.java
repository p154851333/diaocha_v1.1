package com.ec.survey.dao;

import java.util.List;

import com.ec.survey.dto.Admin;


public interface AdminDAO {
	public boolean addAdmin(Admin admin);
	public boolean updateAdmin(Admin admin);
	public boolean delAdmin(long a_id);
	public boolean checkPwd(String username,String pwd);
	public Admin findAdmin(long a_id);
	public List listAllAdmin();
	public Admin findAdmin(String username);
}
