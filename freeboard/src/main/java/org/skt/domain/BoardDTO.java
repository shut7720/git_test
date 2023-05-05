package org.skt.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BoardDTO {
	//DTO 변수가 중간에 대문자가 되면 바인딩할 때 오류가 날수도 있어서 그냥 소문자로 하는게 좋음.
	private long 	bno;
	private String  title;
	private String  content;
	private String  writer;
	
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date    regdate;
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date    updatedate;

}
