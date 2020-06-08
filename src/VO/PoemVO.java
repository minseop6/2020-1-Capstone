package VO;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PoemVO {

	private int no;
	private String title;
	private String contents;
	private int like;
	private int uno;
	private Timestamp time;
	private int report;
	
	
}
