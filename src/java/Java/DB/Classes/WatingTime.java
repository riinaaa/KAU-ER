/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java.DB.Classes;

import java.util.LinkedList;
import java.util.Queue;

public class WatingTime {

    Queue Urgent;
    Queue lessUrgent;
    Queue nonUrgent;
    String priority;

    public WatingTime() {
        this.Urgent = new LinkedList();
        this.lessUrgent = new LinkedList();
        this.nonUrgent = new LinkedList();
    }

    public String addPatient(int patientID, String priority) {

        if (priority.equalsIgnoreCase("Urgent")) {

            int urgentSize = Urgent.size();
            Urgent.add(patientID);
            int time = 30 * urgentSize;

            return calcTime(time);

        } else if (priority.equalsIgnoreCase("Less-urgent")) {

            int urgentSize = lessUrgent.size();
            lessUrgent.add(patientID);
            int time = 60 * urgentSize;

            return calcTime(time);

        } else if (priority.equalsIgnoreCase("Non-urgent")) {

            int urgentSize = nonUrgent.size();
            nonUrgent.add(patientID);
            int time = 120 * urgentSize;

            return calcTime(time);
        } else {

            return calcTime(0);

        }

    }

    public String calcTime(int time) {

        int hr = time / 60;
        int min = time % 60;

        String wait = hr + " houres and " + min + " minutes";
        return wait;
    }

}
