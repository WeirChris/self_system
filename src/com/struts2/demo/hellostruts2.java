package com.struts2.demo;

import com.opensymphony.xwork2.ActionSupport;

public class hellostruts2 extends ActionSupport {
	@Override
	public String execute() throws Exception {
		System.out.println("demo");
		return "demo";
	}
}
