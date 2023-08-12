package _01_servlet;

public class MemberBean {
  private String id;
  private String pw;
  private String name;
  private String email;
  private String hobby;
  
public MemberBean() {}
public MemberBean(String id, String pw, String name, String email, String hobby) {
	super();
	this.id = id;
	this.pw = pw;
	this.name = name;
	this.email = email;
	this.hobby = hobby;
}

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

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getHobby() {
	return hobby;
}

public void setHobby(String hobby) {
	this.hobby = hobby;
}

@Override
public String toString() {
	return "MemberBean [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", hobby=" + hobby + "]";
}


  
  
}
