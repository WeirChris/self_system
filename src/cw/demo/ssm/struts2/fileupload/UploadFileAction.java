package cw.demo.ssm.struts2.fileupload;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class UploadFileAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private String filename;
	// 对应表单的file1 <input type="file" name="file1"/>
	private File file1;
	// 当前上传的文件名
	private String file1FileName;
	// 文件类型(MIME)
	private String file1ContentType;

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public void setFile1(File file1) {
		this.file1 = file1;
	}

	public void setFile1FileName(String file1FileName) {
		this.file1FileName = file1FileName;
	}

	public void setFile1ContentType(String file1ContentType) {
		this.file1ContentType = file1ContentType;
	}

	@Override
	public String execute() throws Exception {
		/*System.out.println(file1FileName);
		System.out.println(file1ContentType);
		System.out.println(filename);
		
		
		// 开始拿到上传的文件，进行处理,上传之前，要创建一个upload目录
		System.out.println("测试上传的文件");*/
		// 把文件上传到upload目录，获取上传的目录路径
		String path = ServletActionContext.getServletContext().getRealPath("/WEB-INF/upload");
		// 创建目标文件对象,文件名file1FileName，格式_FileName
		File destFile = new File(path, file1FileName);
		// 把上传的文件，拷贝到目标文件中
		FileUtils.copyFile(file1, destFile);

		return SUCCESS;
	}

}