package _05_User;

public class UserDTO {
	private String id;
	private String pw;
	private String name;
	private String reg_date;
	
	//생성자
	public UserDTO() {};
	
	public UserDTO(String id, String pw, String name, String reg_date) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.reg_date = reg_date;
	}
	
	//Getter/Setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	//toString
	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", reg_date=" + reg_date + "]";
	}	
	
	
}
