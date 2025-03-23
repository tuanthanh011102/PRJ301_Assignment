/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class Agenda {
    private Employee e ;
    private List<Date> d;
    private int rid;

    public Employee getE() {
        return e;
    }

    public void setE(Employee e) {
        this.e = e;
    }

    public List<Date> getD() {
        return d;
    }

    public void setD(List<Date> d) {
        this.d = d;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public Agenda(Employee e, List<Date> d, int rid) {
        this.e = e;
        this.d = d;
        this.rid = rid;
    }

    public Agenda() {
    }

    @Override
    public String toString() {
        return "Agenda{" + "e=" + e + ", d=" + d + ", rid=" + rid + '}';
    }
    
}
