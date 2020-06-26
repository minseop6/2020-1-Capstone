package VO;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	
	private int no;
	private String id;
	private String pw;
	private int contents_count;
	private int like_count;
	private int comment_count;
	private int power;
}
