package com.llk.vo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
@Entity
public class Menu implements Serializable , Comparable<Menu>{
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)//表示主键生成策略native
	private int id;
	private String menuName;
	private String menuUrl;
	private String menuKey;
	private String menuIcon;
	private int sequence;
	private String parent_id;
	/*@ManyToOne(cascade=CascadeType.ALL)@JoinColumn(name="parent_id")
	private Menu parent;*/
	 @ManyToMany(cascade=CascadeType.ALL,mappedBy="menus")
	private transient Set<User> students = new HashSet();
//	@Override
//	
//	public int compareTo(Menu o) {
//		// TODO Auto-generated method stub
//		 return this.getSequence() - o.getSequence();
//	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getMenuKey() {
		return menuKey;
	}
	public void setMenuKey(String menuKey) {
		this.menuKey = menuKey;
	}
	public String getMenuIcon() {
		return menuIcon;
	}
	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public Set<User> getStudents() {
		return students;
	}
	public void setStudents(Set<User> students) {
		this.students = students;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	/*public Menu getParent() {
		return parent;
	}
	public void setParent(Menu parent) {
		this.parent = parent;
	}*/
	@Override
	public int compareTo(Menu o) {
		return this.getSequence() - o.getSequence();
	}
}
