<%-- 
    Document   : Main_Triage
    Created on : Mar 27, 2021, 7:46:31 PM
    Author     : dell
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="60673623ffa7b6a6d14c83be" data-wf-site="606729d15837e87029637bf6">
<head>
  <meta charset="utf-8">
  <title>addPatientForm</title>
  <meta content="Incredible is a template, that combines a minimal modern design with the right amount of features to help you create an outstanding web for your business in no time." name="description">
  <meta content="addPatientForm" property="og:title">
  <meta content="addPatientForm" property="twitter:title">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="css/normalize.css" rel="stylesheet" type="text/css">
  <link href="css/webflow.css" rel="stylesheet" type="text/css">
  <link href="css/rinas-groovy-project.webflow.css" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
  <script type="text/javascript">WebFont.load({  google: {    families: ["Oswald:200,300,400,500,600,700","Droid Sans:400,700","Roboto:300,regular,500"]  }});</script>
  <!-- [if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif] -->
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
  <link href="images/webclip.png" rel="apple-touch-icon">
</head>
<body>
  <div data-collapse="medium" data-animation="default" data-duration="400" data-no-scroll="1" role="banner" class="left-navigation w-nav">
    <a href="#" class="logo-link w-nav-brand">
      <h1 class="brand-text">KAUH</h1><img src="images/Icon-awesome-hospital-symbol.png" loading="lazy" width="50" height="50" alt="" class="image-5">
    </a>
       <nav role="navigation" class="nav-menu w-nav-menu">
      <a href="viewPatients.jsp" class="nav-link w-nav-link w--current">Dashboard</a><img src="images/Icon-material-dashboard.png" width="17" alt="" class="image"><img src="images/Icon-metro-profile.png" width="17" alt="" class="image-2"><img src="images/Icon-open-account-logout.png" width="17" alt="" class="image-3">
      <a href="profile.jsp" class="nav-link w-nav-link">profile</a>
      <a href="Visual_Triage.jsp" class="nav-link w-nav-link">add patient</a><img src="images/Icon-ionic-md-person-add.png" width="17" alt="" class="image-4">
      <a href="#" class="nav-link w-nav-link">log out</a>
    </nav>
  </div>
  <div class="content">
    <h1 class="heading add">Main Triage Form</h1>
    <div class="form-block w-form">
      <form id="wf-form-patientAdded" name="Add New Patient" data-name="InsertM" action="InsertM.jsp" method="POST" >
        <div><label for="MainPatientID" class="field-label">Patient ID</label><input type="text" class="text-field w-input" maxlength="256" name="MainPatientID" data-name="MainPatientID" placeholder="" id="MainPatientID"></div>
        <div><label for="BloodPressure" class="field-label">Blood Pressure</label><input type="text" class="text-field w-input" maxlength="256" name="BloodPressure" data-name="BloodPressure" placeholder="" id="BloodPressure"></div>
        <div><label for="Oxygensaturation" class="field-label">Oxygen Saturation</label><input type="text" class="text-field w-input" maxlength="256" name="Oxygensaturation" data-name="Oxygensaturation" placeholder="" id="Oxygensaturation"></div>
        <div><label for="Heartrate" class="field-label">Heart Rate</label><input type="text" class="text-field w-input" maxlength="256" name="Heartrate" data-name="Heartrate" placeholder="" id="Heartrate"></div>
        <div><label for="Respiratoryrate" class="field-label">Respiratory Rate</label><input type="text" class="text-field w-input" maxlength="256" name="Respiratoryrate" data-name="Respiratoryrate" placeholder="" id="Respiratoryrate"></div>
        <div><label for="ECG" class="field-label">ECG</label><input type="text" class="text-field w-input" maxlength="256" name="ECG" data-name="ECG" placeholder="" id="ECG"></div>
        <div><label for="Glucose" class="field-label">Glucose</label><input type="text" class="text-field w-input" maxlength="256" name="Glucose" data-name="Glucose" placeholder="" id="Glucose"></div>
        <div><label for="PH" class="field-label">PH</label><input type="text" class="text-field w-input" maxlength="256" name="PH" data-name="PH" placeholder="" id="PH"></div>
        <div><label for="CO2" class="field-label">CO2</label><input type="text" class="text-field w-input" maxlength="256" name="CO2" data-name="CO2" placeholder="" id="CO2"></div>
        <div><label for="HCO2" class="field-label">HCO2</label><input type="text" class="text-field w-input" maxlength="256" name="HCO2" data-name="HCO2" placeholder="" id="HCO2"></div>
        <div><label for="pO2" class="field-label">pO2</label><input type="text" class="text-field w-input" maxlength="256" name="pO2" data-name="pO2" placeholder="" id="pO2"></div>
        <div><label for="SO2" class="field-label">SO2</label><input type="text" class="text-field w-input" maxlength="256" name="SO2" data-name="SO2" placeholder="" id="SO2"></div>
        <div><label for="Baseexcess" class="field-label">Base Excess</label><input type="text" class="text-field w-input" maxlength="256" name="Baseexcess" data-name="Baseexcess" placeholder="" id="Baseexcess"></div>
        <div><label for="Chiefcomplain" class="field-label">Chief Complain</label><input type="text" class="text-field w-input" maxlength="256" name="Chiefcomplain" data-name="Chiefcomplain" placeholder="" id="Chiefcomplain"></div>
        <div><label for="CTASscore" class="field-label">CTAS Score</label><input type="text" class="text-field w-input" maxlength="256" name="CTASscore" data-name="CTASscore" placeholder="" id="CTASscore"></div>
        <div><label for="Temperature" class="field-label">Temperature</label><input type="text" class="text-field w-input" maxlength="256" name="Temperature" data-name="Temperature" placeholder="" id="Temperature"></div>
  
       <input type="submit" value="Next" data-wait="Please wait..." class="submit-button w-button">
      </form>
    </div>
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=606729d15837e87029637bf6" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow.js" type="text/javascript"></script>
</body>
</html>