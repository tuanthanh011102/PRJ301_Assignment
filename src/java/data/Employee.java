/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import java.util.ArrayList;

/**
 *
 * @author sonnt-local
 */
public class Employee {
    private int id;
    private String name;
    private Department dept;
    private User activeuser;
    private Employee manager;
    private ArrayList<Employee> directstaffs = new ArrayList<>();
    private ArrayList<Employee> staffs = new ArrayList<>();

    public ArrayList<Employee> getDirectstaffs() {
        return directstaffs;
    }

    public void setDirectstaffs(ArrayList<Employee> directstaffs) {
        this.directstaffs = directstaffs;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Department getDept() {
        return dept;
    }

    public void setDept(Department dept) {
        this.dept = dept;
    }

    public User getActiveuser() {
        return activeuser;
    }

    public void setActiveuser(User activeuser) {
        this.activeuser = activeuser;
    }

    public Employee getManager() {
        return manager;
    }

    public void setManager(Employee manager) {
        this.manager = manager;
    }

    public ArrayList<Employee> getStaffs() {
        return staffs;
    }

    public void setStaffs(ArrayList<Employee> staffs) {
        this.staffs = staffs;
    }
    
    
}
