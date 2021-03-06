<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Registracija</title>
    <c:import url="/html/head.html" />
</head>

<body>
<jsp:include page="header.jsp" />

<div class="container">
	    <form class="form-horizontal" method="post" action="/sza-webapp/registracija/">
        <fieldset>
          <!-- Form Name -->
  		  <div class="col-md-9">
  		    <h2>Registracija</h2>
  		    <hr>
  		  </div>
          <!-- First Name input-->
          <div class="form-group">
            <label id="usernamelabel" class="col-md-4 control-label" for="firstnameinput">Ime</label>
            <div class="col-md-4 <c:if test="${greska.ime != null}">has-error has-feedback</c:if>">
              <input id="firstnameinput" name="ime" type="text" class="form-control input-md" value="${forma.ime}" placeholder="Unesite ime" aria-describedby="errorstatus" autofocus>
              <c:if test="${greska.ime != null}">
                <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                <label class="control-label" for="firstnameinput">${greska.ime}</label>
                <span id="errorstatus" class="sr-only">(error)</span>
              </c:if>
            </div>
          </div>
          <!-- Last Name input-->
          <div class="form-group">
            <label id="lastnamelabel" class="col-md-4 control-label" for="lastnameinput">Prezime</label>
            <div class="col-md-4 <c:if test="${greska.prezime != null}">has-error has-feedback</c:if>">
              <input id="lastnameinput" name="prezime" type="text" class="form-control input-md" value="${forma.prezime}" placeholder="Unesite prezime" aria-describedby="errorstatus">
              <c:if test="${greska.prezime != null}">
                <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                <label class="control-label" for="lastnameinput">${greska.prezime}</label>
                <span id="errorstatus" class="sr-only">(error)</span>
              </c:if>
            </div>
          </div>
          <!-- Email Address input-->
          <div class="form-group">
            <label id="emaillabel" class="col-md-4 control-label" for="emailinput">Email adresa</label>
            <div class="col-md-4 <c:if test="${greska.email != null}">has-error has-feedback</c:if>">
              <input id="emailinput" name="email" type="text" class="form-control input-md" value="${forma.email}" placeholder="Unesite email adresu" aria-describedby="errorstatus">
              <c:if test="${greska.email != null}">
                <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                <label class="control-label" for="emailinput">${greska.email}</label>
                <span id="errorstatus" class="sr-only">(error)</span>
              </c:if>
            </div>
          </div>
          
          <div class="form-group">
            <label id="pravalabel" class="col-md-4 control-label" for="pravainput">Želim</label>
            <div class="col-md-4 <c:if test="${greska.prava != null}">has-error has-feedback</c:if>">
		<div class="input-group">
	      	    <input id="narucAnkete" name="prava" class="input-md" type="radio" value="1" <c:if test="${forma.prava eq '1'}">checked</c:if> >&nbsp;Sastavljati ankete
	      	    <br>
	      	    <input name="prava" class="input-md" type="radio" value="2" <c:if test="${forma.prava eq '2'}">checked</c:if> >&nbsp;Samo anketirati
 		</div>
 		<c:if test="${greska.prava != null}">
                    <label class="control-label" for="pravainput">${greska.prava}</label>
                    <span id="errorstatus" class="sr-only">(error)</span>
              </c:if>            
	    </div>
          </div>
          
          
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
          <!-- Confirm Password input-->
          <div class="form-group">
            <label id="confirmpasswordlabel" class="col-md-4 control-label" for="confirmpasswordinput">Potvrdite lozinku</label>
            <div class="col-md-4 <c:if test="${greska.lozinkapotvrda != null}">has-error has-feedback</c:if>">
              <input id="confirmpasswordinput" name="lozinkapotvrda" type="password" class="form-control input-md" placeholder="Potvrdite lozinku">
              <c:if test="${greska.lozinkapotvrda != null}">
                <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                <label class="control-label" for="confirmpasswordinput">${greska.lozinkapotvrda}</label>
                <span id="errorstatus" class="sr-only">(error)</span>
              </c:if>
            </div>
          </div>
          <!-- Buttons -->
 			<div class="form-group">
 			  <label class="col-md-4 control-label" for="signup"></label>
 			  <div class="col-md-4">
<!--  			    <button id="register" type="submit" name="register" onclick="location.href='/sza-webapp/registracija/'" class="btn btn-success">Registrirajte se</button> -->
 			    <button id="register" type="submit" name="register" value="register" onclick="showAlert()" class="btn btn-success">Registrirajte se</button>
 			    <button id="reset" type="reset" name="reset" class="btn btn-warning">Poništi</button>
 			    <button id="odustani" name="register" value="odustani" class="btn ">Odustani</button>
 			  </div>
 			</div>
		  </fieldset>
		</form>
	  </div>
	  
<script type="text/javascript">
function showAlert() {
	if ($('input[id=narucAnkete]:checked').length > 0) {
	    alert("Nakon registracije morate pričekati da Vam administrator aktivira račun.");
	}
}
</script>
</body>
</html>