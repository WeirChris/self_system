package cw.demo.ssm.mapper;

import java.util.List;
import cw.demo.ssm.po.PageUsersInfo;
import cw.demo.ssm.po.User;

public interface UsersMapper {
	List<User> getUsers(User user) throws Exception;

	List<User> getPageUsers(PageUsersInfo pageUsersInfo) throws Exception;

	int getTotalUsers() throws Exception;
	
	int insertUser(User user) throws Exception;

	int updateUser(User user)throws Exception;

	int removeUser(int id) throws Exception;
}
