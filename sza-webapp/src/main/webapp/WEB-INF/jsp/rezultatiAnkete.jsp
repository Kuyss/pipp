<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <title>Rezultati: ${anketa.nazivAnketa}</title>
    <c:import url="/html/head.html" />
    <script type='text/javascript' src='/sza-webapp/js/jquery.canvasjs.min.js'></script>
</head>
<body>
    
    <jsp:include page="header.jsp" />
    
    <c:set var="ime" value="${anketa.idAnketa}-${anketa.nazivAnketa}"/>
    <c:set var="url" value="ankete/${fn:replace(ime, ' ', '-')}" />
    
    <div class="container">
        
        <div class="col-md-10">
            <h3>Rezultati ankete ${anketa.nazivAnketa}
                <c:if test="${!anketa.aktivna}">
                   <span class="glyphicon glyphicon-info-sign icon-info" 
                   data-toggle="popover" data-trigger="hover" title="Anketa nije aktivna!" 
                   data-content="Da biste mogli ispuniti anketu, anketa mora biti aktivna"></span>
                </c:if>
                <span class="pull-right">
                    <button id="rezultati" type="button" name="razultati" onclick="location.href='/sza-webapp/${url}/'" class="btn btn-info">Anketa</button>
                </span>
            </h3>
            <hr>
            <h3><small>${anketa.opisAnketa}</small>
                <span class="pull-right">
<!--                     <select class="form-control" onChange="grafikon(this.value)"> -->
<!-- 					    <option value="pie" selected="selected">Tortni grafikon</option> -->
<!-- 					    <option value="doughnut">Prstenasti grafikon</option> -->
<!-- 					    <option value="bar">Stupičasti grafikon</option> -->
<!--                     </select> -->
                    <div class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Izgled grafikona  <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
						    <li><a onclick="grafikon('pie')">Tortni grafikon</a></li>
						    <li><a onclick="grafikon('doughnut')">Prstenasti grafikon</a></li>
						    <li><a onclick="grafikon('bar')">Stupičasti grafikon</a></li>
                        </ul>
                   </div>
                </span>
            </h3>
        </div>
        
        <c:forEach var="pitanje" items="${anketa.pitanja}" varStatus="p">
	       <div id="pitanje${p.index + 1}" class="col-md-8 col-md-offset-1">
	           <h3><small>${pitanje.rbrPitanje}.</small>  ${pitanje.textPitanje}</h3>
	           <hr>
	           <c:forEach var="k" items="${data}" varStatus="i">
                <div id="chartContainer${i.index + 1}" style="height:400px" class="chartContainer"></div>
               </c:forEach>
	       </div>
        </c:forEach>
        <div class="col-md-10">
            <hr>
        </div>
    </div>
    
    <script type="text/javascript">
    
    $(document).ready(function(){
        $('[data-toggle="popover"]').popover({
            placement : 'right',
            trigger : 'hover'
        });
    });
    
    </script>
    
    <script type="text/javascript">
    
    <c:forEach var="d" items="${data}" varStatus="i">
    $(function () {
        $("#chartContainer${i.index + 1}").CanvasJSChart(${d});
    });
    </c:forEach>
    
    function grafikon(tip) {
    	var chart = $(".chartContainer").CanvasJSChart();
    	if (tip === 'bar') {
    		chart.options.data[0].showInLegend = false;
    		chart.options.zoomEnabled = true;
    		chart.options.zoomType = 'y';
    	} else {
    		chart.options.data[0].showInLegend = true;
    		chart.options.zoomEnabled = false;
    	}
    	chart.options.data[0].type = tip;
    	chart.render();
    }
    
    </script>
    
    </body>
</html>