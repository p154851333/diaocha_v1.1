package com.ec.survey.dto;
 
public class Config implements java.io.Serializable {

	private static final long serialVersionUID = 2557876183072176111L;
	//配置信息的id
	private Integer id;
	//网站的标题
	private String CSiteName;
	//网站的url
	private String CSiteUrl;
	//网站是否开启
	private Boolean CIsOpen;
	//网站的版权
	private String copyright;
	//错误信息
	private String CCloseWord;
	
	public String getCopyright() {
		return copyright;
	}

	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}


	 
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

 
	public String getCSiteName() {
		return this.CSiteName;
	}

	public void setCSiteName(String CSiteName) {
		this.CSiteName = CSiteName;
	}

	 
	public String getCSiteUrl() {
		return this.CSiteUrl;
	}

	public void setCSiteUrl(String CSiteUrl) {
		this.CSiteUrl = CSiteUrl;
	}

	 
	public Boolean getCIsOpen() {
		return this.CIsOpen;
	}

	public void setCIsOpen(Boolean CIsOpen) {
		this.CIsOpen = CIsOpen;
	}

	 
	public String getCCloseWord() {
		return this.CCloseWord;
	}

	public void setCCloseWord(String CCloseWord) {
		this.CCloseWord = CCloseWord;
	}

}