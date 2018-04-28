package cw.demo.ssm.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping("fuc")
public class FileUploadController {
	
	@RequestMapping("/importExcel")
	@ResponseBody
	public Map<String, Object> importExcel(@RequestParam("file") CommonsMultipartFile file) {
		 try {
			 
			 Map<String, Object> map = new HashMap<String, Object>();
			//判断文件是否存在  
			if(null == file) {  
				map.put("msg", "文件不存在！");  
				return map;
			} 
			//获得文件名  
			String fileName = file.getOriginalFilename();  
			//判断文件是否是excel文件  
			if(!fileName.endsWith("jpg")) {  
				map.put("msg", fileName + "不是excel文件"); 
				return map;
			}else {  
			     map.put("msg", "售电量导入成功");
			     return map;
			}
	     } catch (Exception e) {
	         e.printStackTrace();
	     }
		return null;
	}
}
