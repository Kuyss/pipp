<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Prijava</title>
    <c:import url="/html/head.html" />
</head>

<body>
<div class="container">
	    <form class="form-horizontal" method="post">
	    <div class="btn-toolbar">
          <button type="button" onclick="location.href='/sza-webapp/registracija/'" class="btn btn-default pull-right">Registracija</button>
          <button type="button" onclick="location.href='/sza-webapp/'" class="btn btn-default pull-right">Početna</button>
        </div>
        <fieldset>
          <!-- Form Name -->
  		  <div class="col-md-9">
  		    <legend><h2>Prijava</h2></legend>
  		  </div>
          <!-- First Name input-->
                     
          <!-- Username input-->
          <div class="form-group">
            <label id="usernamelabel" class="col-md-4 control-label" for="usernameinput">Korisničko ime</label>
            <div class="col-md-4 <c:if test="${greska.korisnickoime != null}">has-error has-feedback</c:if>">
              <input id="usernameinput" name="korisnickoime" type="text" class="form-control input-md" value="${forma.korisnickoime}" placeholder="Unesite korisničko ime" aria-describedby="errorstatus">
              <c:if test="${greska.korisnickoime != null}">
                <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                <label class="control-label" for="usernameinput">${greska.korisnickoime}</label>
                <span id="errorstatus" class="sr-only">(error)</span>
              </c:if>
            </div>
          </div>
          <!-- Password input-->
          <div class="form-group">
            <label id="passwordlabel" class="col-md-4 control-label" for="passwordinput">Lozinka</label>
            <div class="col-md-4 <c:if test="${greska.lozinka != null || greska.lozinkapotvrda != null}">has-error has-feedback</c:if>">
              <input id="passwordinput" name="lozinka" type="password" class="form-control input-md" placeholder="Unesite lozinku" aria-describedby="errorstatus">
              <c:if test="${greska.lozinka != null || greska.lozinkapotvrda != null}">
                <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                <label class="control-label" for="passwordinput">${greska.lozinka}${greska.lozinkapotvrda}</label>
                <span id="errorstatus" class="sr-only">(error)</span>
              </c:if>
            </div>
          </div>
        
          <!-- Buttons -->
 			<div class="form-group">
 			  <label class="col-md-4 control-label" for="signup"></label>
 			  <div class="col-md-4">
 			    <button id="register" type="submit" name="register" onclick="location.href='/sza-webapp/registracija/'" class="btn btn-success">Prijavite se</button>
 			    <button id="reset" type="reset" name="reset" class="btn btn-warning">Poništi</button>
 			  </div>
 			</div>
		  </fieldset>
		  <!-- Form Name -->
  		  <div class="col-md-9">
  		    <legend></legend>Ako niste registrirani korisnik, besplatna registracija je dostupna <a href="/sza-webapp/registracija/">ovdje</a>.
  		    
  		  </div>
		</form>
	  </div>
</body>
</html>