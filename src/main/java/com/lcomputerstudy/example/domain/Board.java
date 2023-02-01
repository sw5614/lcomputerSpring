package com.lcomputerstudy.example.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int bId;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private String bDateTime;
	private int bGroup;
	private int bOrder;
	private int bDepth;
	private String tUpload;
	private List<MultipartFile> files;
	private List<Upload> uploadfiles;
	
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getbDateTime() {
		return bDateTime;
	}
	public void setbDateTime(String bDateTime) {
		this.bDateTime = bDateTime;
	}
	public int getbGroup() {
		return bGroup;
	}
	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}
	public int getbOrder() {
		return bOrder;
	}
	public void setbOrder(int bOder) {
		this.bOrder = bOder;
	}
	public int getbDepth() {
		return bDepth;
	}
	public void setbDepth(int bDepth) {
		this.bDepth = bDepth;
	}
	public String gettUpload() {
		return tUpload;
	}
	public void settUpload(String tUpload) {
		this.tUpload = tUpload;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public List<Upload> getUploadfiles() {
		return uploadfiles;
	}
	public void setUploadfiles(List<Upload> uploadfiles) {
		this.uploadfiles = uploadfiles;
	}
	
	
}
