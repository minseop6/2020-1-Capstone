package VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LikesVO {

	private int no;
	private int pno;
	private int uno;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
}
