package cw.demo.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cw.demo.ssm.mapper.UsersMapper;
import cw.demo.ssm.po.PageUsersInfo;
import cw.demo.ssm.po.User;

@Service()
public class UsersServiceImp implements UsersService {

	@Autowired
	private UsersMapper usersMapper ;
	
	@Override
	public List<User> getUsers(User user) throws Exception {
		//System.out.println(users);
		return usersMapper.getUsers(user);
	}

	@Override
	@Transactional
	public PageUsersInfo getPageUsers(int page, int rows) throws Exception {
		PageUsersInfo pageUsersInfo = new PageUsersInfo();
		pageUsersInfo.setIndex((page-1)*5);
		pageUsersInfo.setLength(rows);
		
		List<User> listUsers = usersMapper.getPageUsers(pageUsersInfo);
		int total = getTotalUsers();
		
		pageUsersInfo.setListUsers(listUsers);
		pageUsersInfo.setTotal(total);
		return pageUsersInfo;
	}

	@Override
	public int getTotalUsers() throws Exception {
		return usersMapper.getTotalUsers();
	}

	@Override
	@Transactional
	public int insertUser(User user) throws Exception {
		return usersMapper.insertUser(user);
	}

	@Override
	@Transactional
	public int updateUser(User user) throws Exception {
		return usersMapper.updateUser(user);
	}

	@Override
	@Transactional
	public int removeUser(int id) throws Exception {
		return usersMapper.removeUser(id);
	}

	@Override
	@Transactional
	public User insertGetUsers(User user) throws Exception {
		usersMapper.insertUser(user);
		User userView = new User();
		userView.setId(user.getId());
		List<User> list = usersMapper.getUsers(userView);
		return usersMapper.getUsers(userView).get(0);
	}

	@Override
	@Transactional
	public User updateGetUser(User user) throws Exception {
		usersMapper.updateUser(user);
		User userView = new User();
		userView.setId(user.getId());
		List<User> list = usersMapper.getUsers(userView);
		return usersMapper.getUsers(userView).get(0);
	}

}
