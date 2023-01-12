package com.lcomputerstudy.example.domain;

import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class User implements UserDetails {
	

	private static final long serialVersionUID = 1L;
	
	private String username;	//u_id
	private String password;		//u_password
	private String uName;			//u_name
	private String uDateTime;	//u_datetime
	private String uAuth; //u_auth
	//security 관련
	private Collection<? extends GrantedAuthority> authorities; // toString은되는데 콜렉션 grantAuthoriy타입으로 세팅하려면 ?  
	
	private boolean isAccountNonExpired;
	private boolean isAccountNonLocked;
	private boolean isCredentialsNonExpired;
	private boolean isEnabled;
	
	

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuDateTime() {
		return uDateTime;
	}

	public void setuDateTime(String uDateTime) {
		this.uDateTime = uDateTime;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setAccountNonExpired(boolean isAccountNonExpired) {
		this.isAccountNonExpired = isAccountNonExpired;
	}

	public void setAccountNonLocked(boolean isAccountNonLocked) {
		this.isAccountNonLocked = isAccountNonLocked;
	}

	public void setCredentialsNonExpired(boolean isCredentialsNonExpired) {
		this.isCredentialsNonExpired = isCredentialsNonExpired;
	}

	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}
	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() { //?? 
		return authorities;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return username;
	}

	@Override
	public boolean isAccountNonExpired() {
		return isAccountNonExpired;
	}

	@Override
	public boolean isAccountNonLocked() {
		return isAccountNonLocked;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return isCredentialsNonExpired;
	}

	@Override
	public boolean isEnabled() {
		return isEnabled;
	}
	
	
	public String getuAuth() {
		return uAuth;
	}

	public void setuAuth(String uAuth) {
		this.uAuth = uAuth;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", uName=" + uName + ", uDateTime=" + uDateTime
				+ ", authorities=" + authorities + ", isAccountNonExpired=" + isAccountNonExpired
				+ ", isAccountNonLocked=" + isAccountNonLocked + ", isCredentialsNonExpired=" + isCredentialsNonExpired
				+ ", isEnabled=" + isEnabled + "]";
	}
}

