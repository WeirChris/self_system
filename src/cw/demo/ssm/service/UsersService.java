package cw.demo.ssm.service;

import java.util.List;

import cw.demo.ssm.po.PageUsersInfo;
import cw.demo.ssm.po.User;

public interface UsersService {
	List<User> getUsers(User user) throws Exception;

	PageUsersInfo getPageUsers(int page, int rows) throws Exception;

	int getTotalUsers() throws Exception;
	
	int insertUser(User user) throws Exception;

	int updateUser(User user)throws Exception;

	int removeUser(int id) throws Exception;

	User insertGetUsers(User user)throws Exception;

	User updateGetUser(User user)throws Exception;
}
