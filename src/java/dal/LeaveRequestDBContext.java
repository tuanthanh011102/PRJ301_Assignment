/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import data.Agenda;
import data.Department;
import data.Employee;
import data.LeaveRequest;
import data.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sonnt-local
 */
public class LeaveRequestDBContext extends DBContext<LeaveRequest> {

    @Override
    public ArrayList<LeaveRequest> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public LeaveRequest get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(LeaveRequest model) {
        try {
            String sql = "INSERT INTO [LeaveRequest]\n"
                    + "           ([title]\n"
                    + "           ,[reason]\n"
                    + "           ,[from]\n"
                    + "           ,[to]\n"
                    + "           ,[createdby]\n"
                    + "           ,[status]\n"
                    + "		   ,[createddate]\n"
                    + "		   )\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,0,GETDATE())";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getTitle());
            stm.setString(2, model.getReason());
            stm.setDate(3, model.getFrom());
            stm.setDate(4, model.getTo());
            stm.setString(5, model.getCreatedby().getUsername());
            stm.executeUpdate();//update insert delete
        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null)
                try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public ArrayList<LeaveRequest> getByDept(Integer did) {
        ArrayList<LeaveRequest> requests = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "	r.rid,r.title,r.reason,r.[from],r.[to],u.username,u.displayname,\n"
                    + "	r.createddate,r.status,\n"
                    + "	d.did,d.dname,\n"
                    + "	e.eid,e.ename\n"
                    + "FROM LeaveRequest r INNER JOIN Users u ON u.username = r.createdby\n"
                    + "			INNER JOIN Employees e ON e.eid = u.eid\n"
                    + "			INNER JOIN Departments d ON d.did = e.did";

            if (did != null) {
                sql += " WHERE d.did = ? ";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            if (did != null) {
                stm.setInt(1, did);
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                LeaveRequest r = new LeaveRequest();
                r.setId(rs.getInt("rid"));
                r.setTitle(rs.getString("title"));
                r.setReason(rs.getString("reason"));
                r.setFrom(rs.getDate("from"));
                r.setTo(rs.getDate("to"));
                r.setCreateddate(rs.getTimestamp("createddate"));
                r.setStatus(rs.getInt("status"));

                User u = new User();
                u.setUsername(rs.getString("username"));
                u.setDisplayname(rs.getString("displayname"));
                r.setCreatedby(u);

                Employee e = new Employee();
                u.setE(e);
                e.setId(rs.getInt("eid"));
                e.setName(rs.getString("ename"));

                Department d = new Department();
                e.setDept(d);
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));

                requests.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null)
                try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return requests;
    }

    @Override
    public void update(LeaveRequest model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(LeaveRequest model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<LeaveRequest> list(String username) {
        ArrayList<LeaveRequest> list = new ArrayList<>();
        String sql = "SELECT lr.[rid]\n"
                + "      ,lr.[title]\n"
                + "      ,lr.[reason]\n"
                + "      ,lr.[from]\n"
                + "      ,lr.[to]\n"
                + "      ,lr.[createdby]\n"
                + "      ,lr.[status]\n"
                + "      ,lr.[createddate]\n"
                + "	  ,u.displayname\n"
                + "	  ,u.eid\n"
                + "	  ,e.ename\n"
                + "	  ,e.did\n"
                + "	  ,d.dname\n"
                + "  FROM [dbo].[LeaveRequest] lr\n"
                + "  inner join Users u on u.username = lr.createdby\n"
                + "  inner join Employees e on e.eid = u.eid\n"
                + "  inner join Departments d on d.did = e.did\n"
                + "  Where [createdby] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                LeaveRequest lr = new LeaveRequest();
                lr.setId(rs.getInt("rid"));
                lr.setTitle(rs.getString("title"));
                lr.setFrom(rs.getDate("from"));
                lr.setTo(rs.getDate("to"));
                lr.setReason(rs.getString("reason"));
                lr.setStatus(rs.getInt("status"));
                User u = new User();
                u.setUsername(username);
                u.setDisplayname(rs.getString("displayname"));
                lr.setCreatedby(u);
                lr.setCreateddate(rs.getDate("createddate"));
                list.add(lr);

            }

        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<LeaveRequest> getByManager(int managerId) {
        ArrayList<LeaveRequest> requests = new ArrayList<>();
        try {
            String sql = "WITH EmployeeHierarchy AS (\n"
                    + "    SELECT \n"
                    + "        eid,\n"
                    + "		ename,\n"
                    + "        managerid,\n"
                    + "		did,\n"
                    + "        0 AS [Level]\n"
                    + "    FROM Employees\n"
                    + "    WHERE eid = ? \n"
                    + "\n"
                    + "    UNION ALL\n"
                    + "\n"
                    + "    SELECT \n"
                    + "        e.eid,\n"
                    + "		e.ename,\n"
                    + "        e.managerid,\n"
                    + "		e.did,\n"
                    + "        eh.Level + 1\n"
                    + "    FROM Employees e\n"
                    + "    INNER JOIN EmployeeHierarchy eh ON eh.eid = e.managerid\n"
                    + ")\n"
                    + "\n"
                    + "SELECT \n"
                    + "    lr.rid,\n"
                    + "    lr.title,\n"
                    + "    lr.reason,\n"
                    + "    lr.[from],\n"
                    + "    lr.[to],\n"
                    + "    lr.status,\n"
                    + "lr.createddate,\n"
                    + "	u.username, u.displayname, eh.eid, eh.ename, d.did, d.dname\n"
                    + "FROM EmployeeHierarchy eh\n"
                    + "INNER JOIN Users u ON u.eid = eh.eid\n"
                    + "INNER JOIN LeaveRequest lr ON lr.createdby = u.username\n"
                    + "INNER JOIN Departments d ON d.did = eh.did\n"
                    + "WHERE eh.Level > 0;";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, managerId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                LeaveRequest r = new LeaveRequest();
                r.setId(rs.getInt("rid"));
                r.setTitle(rs.getString("title"));
                r.setReason(rs.getString("reason"));
                r.setFrom(rs.getDate("from"));
                r.setTo(rs.getDate("to"));
                r.setCreateddate(rs.getTimestamp("createddate"));
                r.setStatus(rs.getInt("status"));

                User u = new User();
                u.setUsername(rs.getString("username"));
                u.setDisplayname(rs.getString("displayname"));
                r.setCreatedby(u);

                Employee e = new Employee();
                u.setE(e);
                e.setId(rs.getInt("eid"));
                e.setName(rs.getString("ename"));

                EmployeeDBContext db = new EmployeeDBContext();

                e.setManager(db.get(managerId)); // Gán manager ID

                Department d = new Department();
                e.setDept(d);
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));

                requests.add(r);

            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestDBContext.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return requests;
    }

    public LeaveRequest getByID(int id) {
        LeaveRequest lr = new LeaveRequest();
        String sql = "SELECT lr.[rid]\n"
                + "      ,lr.[title]\n"
                + "      ,lr.[reason]\n"
                + "      ,lr.[from]\n"
                + "      ,lr.[to]\n"
                + "      ,lr.[createdby]\n"
                + "      ,lr.[status]\n"
                + "      ,lr.[createddate]\n"
                + "	  ,u.displayname\n"
                + "	  ,u.eid\n"
                + "	  ,e.ename\n"
                + "	  ,e.did\n"
                + "	  ,d.dname\n"
                + "  FROM [dbo].[LeaveRequest] lr\n"
                + "  inner join Users u on u.username = lr.createdby\n"
                + "  inner join Employees e on e.eid = u.eid\n"
                + "  inner join Departments d on d.did = e.did\n"
                + "  Where [rid] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {

                lr.setId(rs.getInt("rid"));
                lr.setTitle(rs.getString("title"));
                lr.setFrom(rs.getDate("from"));
                lr.setTo(rs.getDate("to"));
                lr.setReason(rs.getString("reason"));
                lr.setStatus(rs.getInt("status"));
                User u = new User();
                u.setUsername(rs.getString("createdby"));
                u.setDisplayname(rs.getString("displayname"));
                lr.setCreatedby(u);
                lr.setCreateddate(rs.getDate("createddate"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return lr;
    }

    public void update(int rid, int status) {
        String sql = "UPDATE LeaveRequest SET status = ? WHERE rid = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, rid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Agenda> agenda() {
        List<Agenda> alist = new ArrayList<>();
        String sql = "WITH DateRange AS ("
                + " SELECT lr.rid, lr.createdby, lr.[from], lr.[to],"
                + " DATEADD(DAY, number, lr.[from]) AS off_date"
                + " FROM [LeaveRequest] lr"
                + " CROSS APPLY ("
                + " SELECT TOP (DATEDIFF(DAY, lr.[from], lr.[to]) + 1)"
                + " number = ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1"
                + " FROM master.dbo.spt_values"
                + " ) AS Numbers"
                + " WHERE lr.status = 2"
                + " )"
                + " SELECT e.eid AS EmployeeID, e.ename AS EmployeeName,"
                + " e.managerid AS ManagerID, e.did AS DepartmentID,"
                + " dr.off_date AS OffWorkDate, dr.rid AS LeaveRequestID"
                + " FROM DateRange dr"
                + " JOIN Users u on u.username = dr.createdby"
                + " JOIN [Employees] e ON u.eid = e.eid"
                + " ORDER BY dr.rid;";

        try (PreparedStatement stm = connection.prepareStatement(sql); ResultSet rs = stm.executeQuery()) {

            Map<Integer, Agenda> agendaMap = new HashMap<>();

            while (rs.next()) {
                int empId = rs.getInt("EmployeeID");
                int leaveRequestId = rs.getInt("LeaveRequestID");
                Date offDate = new Date(rs.getDate("OffWorkDate").getTime());

                // Kiểm tra nếu nhân viên đã có trong map hay chưa
                Agenda a = agendaMap.get(empId);
                if (a == null) {
                    // Nếu chưa có, tạo mới
                    a = new Agenda();
                    Employee e = new Employee();
                    e.setId(empId);
                    e.setName(rs.getString("EmployeeName"));

                    Department d = new Department();
                    d.setId(rs.getInt("DepartmentID"));
                    e.setDept(d);

                    Employee manager = new Employee();
                    manager.setId(rs.getInt("ManagerID"));
                    e.setManager(manager);

                    a.setE(e);
                    a.setRid(leaveRequestId);
                    a.setD(new ArrayList<>()); // Khởi tạo danh sách ngày nghỉ

                    // Thêm vào map
                    agendaMap.put(empId, a);
                }

                // Thêm ngày nghỉ vào danh sách
                a.getD().add(offDate);
            }

            // Chuyển map thành list
            alist.addAll(agendaMap.values());

        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return alist;
    }
    
    
    
    public static void main(String[] args) {
        LeaveRequestDBContext l = new LeaveRequestDBContext();
        System.out.println(l.agenda());
    }
}
