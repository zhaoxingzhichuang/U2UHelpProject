package com.megagao.production.ssm.domain.authority;

public class SysUserOption {
	
	private String id;

    private String text;

	public String getId() {
		return id;
	}

	public SysUserOption() {}
	
	public SysUserOption(String id,String text) {
		this.id = id;
		this.text = text;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
