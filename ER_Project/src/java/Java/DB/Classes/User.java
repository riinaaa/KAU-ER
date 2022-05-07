/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java.DB.Classes;

/**
 *
 * @author myonl
 */
public class User {

    private String fName;
    private String lName;
    private String phoneNumber;
    private String ID;
    private String password;
    private String Email;
    private String role;


    public User(String fName, String lName, String phoneNumber, String ID, String password, String Email, String role) {
        this.fName = fName;
        this.lName = lName;
        this.phoneNumber = phoneNumber;
        this.ID = ID;
        this.password = password;
        this.Email = Email;
        this.role = role;
    }

    public String getFullName() {
        return fName + " " + lName;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}
