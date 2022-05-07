<%-- 
    Document   : InsertM
    Created on : Mar 27, 2021, 8:33:48 PM
    Author     : dell
--%>

<%@page import="Java.DB.Classes.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Information</title>
    </head>
    <body>
        <%
          String PatientIDm = request.getParameter("MainPatientID");
          String BloodPressure = request.getParameter("BloodPressure");
          String OxygenSaturation = request.getParameter("Oxygensaturation");
          String Heartrate = request.getParameter("Heartrate");
          String Respiratoryrate = request.getParameter("Respiratoryrate");
          String ECG = request.getParameter("ECG");
          String Glucose = request.getParameter("Glucose");
          String PH = request.getParameter("PH");
          String CO2 = request.getParameter("CO2");
          String HCO3 = request.getParameter("HCO2");
          String pO2 = request.getParameter("pO2");
          String SO2 = request.getParameter("SO2");
          String Baseexcess = request.getParameter("Baseexcess");
          String Chiefcomplain = request.getParameter("Chiefcomplain");
          String CTASscore = request.getParameter("CTASscore");
          String Temperature = request.getParameter("Temperature");
            
          int BloodPressureINT= Integer.parseInt(BloodPressure);
          int OxygenSaturationINT= Integer.parseInt(OxygenSaturation);
          int HeartrateINT= Integer.parseInt(Heartrate);
          int RespiratoryrateINT= Integer.parseInt(Respiratoryrate);
          int GlucoseINT= Integer.parseInt(Glucose);
          int PHINT= Integer.parseInt(PH);
          int CO2INT= Integer.parseInt(CO2);
          int HCO3INT= Integer.parseInt(HCO3);
          int pO2INT= Integer.parseInt(pO2);
          int SO2INT= Integer.parseInt(SO2);
          int BaseexcessINT= Integer.parseInt(Baseexcess);
          int CTASscoreINT= Integer.parseInt(CTASscore);
       //   double TemperatureD= Double.parseDouble(Temperature);
          int TemperatureD= Integer.parseInt(Temperature);
            
        Java.DB.DB_ConnectionM connM = new Java.DB.DB_ConnectionM();
                    Patient pt = new Patient(PatientIDm);
  
        int isAddedm = connM.addmaintriage(PatientIDm,BloodPressureINT, OxygenSaturationINT, HeartrateINT,
                  RespiratoryrateINT, ECG, GlucoseINT, PHINT, CO2INT, HCO3INT,pO2INT, SO2INT, BaseexcessINT,Chiefcomplain, CTASscoreINT, TemperatureD );

           if(isAddedm>0){
               request.getSession().setAttribute("patient", pt);
               response.sendRedirect("addPatientForm.jsp");
            } else {
        %>
        <script>
            window.location = "mainTriage.jsp";
            window.alert("smthn went wrong");
        </script>
        <% }%>
    </body>
</html>
