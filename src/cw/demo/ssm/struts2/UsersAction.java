package cw.demo.ssm.struts2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cw.demo.ssm.po.PageUsersInfo;
import cw.demo.ssm.po.User;
import cw.demo.ssm.service.UsersService;
import cw.demo.ssm.struts2.vo.InsertUserVo;

public class UsersAction extends ActionSupport {

	@Autowired
	private UsersService userservice;

	// 接收值
	private int page;
	private int rows;
	private InsertUserVo insertUserVo;

	public InsertUserVo getInsertUserVo() {
		return insertUserVo;
	}

	public void setInsertUserVo(InsertUserVo insertUserVo) {
		this.insertUserVo = insertUserVo;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	// 返回值json
	private JSONObject resultObj;

	// 对于struts2来说，ACTION类是多实例的，所以可以直接使用 上面的resultObj。
	private JSONObject resultId;

	public JSONObject getResultId() {
		return resultId;
	}

	public void setResultId(JSONObject resultId) {
		this.resultId = resultId;
	}

	public JSONObject getResultObj() {
		return resultObj;
	}

	public void setResultObj(JSONObject resultObj) {
		this.resultObj = resultObj;
	}

	/**
	 * 获取所有用户信息
	 */
	public String getUsers() {
		List<User> users;
		try {
			// System.out.println(userservice);
			users = userservice.getUsers(new User());
			Map<String, Object> json = new HashMap<String, Object>();

			json.put("total", 2);
			json.put("rows", users);

			resultObj = JSONObject.fromObject(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String getPageUsers() {
		try {
			// System.out.println(userservice);
			PageUsersInfo pageUsersInfo = userservice.getPageUsers(page, rows);

			int total = pageUsersInfo.getTotal();
			List<User> users = pageUsersInfo.getListUsers();

			Map<String, Object> json = new HashMap<String, Object>();
			json.put("total", total);
			json.put("rows", users);

			resultObj = JSONObject.fromObject(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String insertUser() {
		User user = new User();
		// System.out.println(insertUserVo);
		user.setEmail(insertUserVo.getEmail());
		user.setFirstname(insertUserVo.getFirstname());
		user.setLastname(insertUserVo.getLastname());
		user.setPhone(insertUserVo.getPhone());

		Map<String, Object> json = new HashMap<String, Object>();
		try {
			int id = userservice.insertUser(user);
			json.put("success", true);
			resultId = JSONObject.fromObject(json);
			return SUCCESS;
		} catch (Exception e) {
			json.put("msg", "发生错误");
			resultId = JSONObject.fromObject(json);
			return ERROR;
		}
	}

	public String insertUserdatagrid() {
		User user = new User();
		HttpServletRequest request = ServletActionContext.getRequest();
		user.setEmail(request.getParameter("email"));
		user.setFirstname(request.getParameter("firstname"));
		user.setLastname(request.getParameter("lastname"));
		user.setPhone(request.getParameter("phone"));

		Map<String, Object> json = new HashMap<String, Object>();
		try {
			int id = userservice.insertUser(user);
			json.put("success", true);
			resultId = JSONObject.fromObject(json);
			return SUCCESS;
		} catch (Exception e) {
			json.put("msg", "发生错误");
			resultId = JSONObject.fromObject(json);
			return ERROR;
		}
	}
	
	public String insertUserView() {
		User user = new User();
		HttpServletRequest request = ServletActionContext.getRequest();
		user.setEmail(request.getParameter("email"));
		user.setFirstname(request.getParameter("firstname"));
		user.setLastname(request.getParameter("lastname"));
		user.setPhone(request.getParameter("phone"));

		Map<String, Object> json = new HashMap<String, Object>();
		try {
			User userView = userservice.insertGetUsers(user);
			
			//{"id":36,"phone":"123","email":"12","lastname":"bady","firstname":"bady"}
			json.put("id", userView.getId());
			json.put("phone", userView.getPhone());
			json.put("email", userView.getEmail());
			json.put("lastname", userView.getLastname());
			json.put("firstname", userView.getFirstname());
			
			resultId = JSONObject.fromObject(json);
			return SUCCESS;
		} catch (Exception e) {
			json.put("msg", "发生错误");
			resultId = JSONObject.fromObject(json);
			return ERROR;
		}
	}

	public String editUser() {

		User user = new User();
		user.setId(insertUserVo.getId());
		user.setEmail(insertUserVo.getEmail());
		user.setFirstname(insertUserVo.getFirstname());
		user.setLastname(insertUserVo.getLastname());
		user.setPhone(insertUserVo.getPhone());

		Map<String, Object> json = new HashMap<String, Object>();
		try {
			int id = userservice.updateUser(user);
			json.put("success", true);
			resultObj = JSONObject.fromObject(json);
			return SUCCESS;
		} catch (Exception e) {
			json.put("msg", "发生错误");
			resultObj = JSONObject.fromObject(json);
			return ERROR;
		}
	}

	public String editUserdatagrid() {

		User user = new User();
		HttpServletRequest request = ServletActionContext.getRequest();
		user.setEmail(request.getParameter("email"));
		user.setFirstname(request.getParameter("firstname"));
		user.setLastname(request.getParameter("lastname"));
		user.setPhone(request.getParameter("phone"));
		user.setId(Integer.parseInt(request.getParameter("id")));

		Map<String, Object> json = new HashMap<String, Object>();
		try {
			int id = userservice.updateUser(user);
			json.put("success", true);
			resultObj = JSONObject.fromObject(json);
			return SUCCESS;
		} catch (Exception e) {
			json.put("msg", "发生错误");
			resultObj = JSONObject.fromObject(json);
			return ERROR;
		}
	}
	
	public String editUserView() {

		User user = new User();
		HttpServletRequest request = ServletActionContext.getRequest();
		user.setEmail(request.getParameter("email"));
		user.setFirstname(request.getParameter("firstname"));
		user.setLastname(request.getParameter("lastname"));
		user.setPhone(request.getParameter("phone"));
		user.setId(Integer.parseInt(request.getParameter("id")));

		Map<String, Object> json = new HashMap<String, Object>();
		try {
			User userView = userservice.updateGetUser(user);
			
			json.put("id", userView.getId());
			json.put("phone", userView.getPhone());
			json.put("email", userView.getEmail());
			json.put("lastname", userView.getLastname());
			json.put("firstname", userView.getFirstname());
			
			resultObj = JSONObject.fromObject(json);
			return SUCCESS;
		} catch (Exception e) {
			json.put("msg", "发生错误");
			resultObj = JSONObject.fromObject(json);
			return ERROR;
		}
	}

	public String removeUser() {
		int id = insertUserVo.getId();
		Map<String, Object> json = new HashMap<String, Object>();

		try {
			int del = userservice.removeUser(id);
			json.put("success", true);
			resultObj = JSONObject.fromObject(json);
			return SUCCESS;
		} catch (Exception e) {
			json.put("msg", "发生错误");
			resultObj = JSONObject.fromObject(json);
			return ERROR;
		}
	}
	
	public String removeUserdatagrid() {
		HttpServletRequest request = ServletActionContext.getRequest();
		int id = Integer.parseInt(request.getParameter("id"));
		Map<String, Object> json = new HashMap<String, Object>();

		try {
			int del = userservice.removeUser(id);
			json.put("success", true);
			resultObj = JSONObject.fromObject(json);
			return SUCCESS;
		} catch (Exception e) {
			json.put("msg", "发生错误");
			resultObj = JSONObject.fromObject(json);
			return ERROR;
		}
	}
}
