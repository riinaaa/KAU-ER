/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java.DB.Classes;

/**
 *
 * @author Razer
 */
public class Patient {
    
    private String ID;
    private String Result;

    public Patient(String ID, String Result) {
        this.ID = ID;
        this.Result = Result;
    }

    public String getResult() {
        return Result;
    }

    public void setResult(String Result) {
        this.Result = Result;
    }

    public Patient(String ID) {
        this.ID = ID;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }
    
    
    
}
