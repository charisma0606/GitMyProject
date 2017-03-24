<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
		
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
    <h2>LOTTO</h2>
	<form id="frm" name="frm">
		<table class="lotto_view">
			<colgroup>
				<col width="100%" />
			</colgroup>
			<thead>
				<tr>
					<th><span>TOTAL ( ${itemCnt} ) 개 중 상위 6번째 번호 </span></th>
				</tr>
			</thead>
			
			<tbody id="itemList">
				<tr>
					<td>
						<input type="button" class="btn" algin="left" value="REPLAY" onClick="fn_CloseEvent();" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="itemList" items="${itemList }" varStatus="var" begin="0" end="5">
								( ${itemList } ) 
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn" value="KEEP" onClick="fn_KeepEvent();" />
					</td>
				</tr>
			</tbody>
			
			<!-- 3. Add the container -->
		<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
	
		</table>
		
	</form>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    
    
    	$(document).ready(function(){
    		
    		var result = '<c:out value="${result}" />';
    		if(result == 'Y'){
    			alert("저장되었습니다.");
    			fn_CloseEvent();
    		}
    		
    	});
		
    	var clist = new Array(); // 카운트
    	var list = new Array();  // 중복수 
    	var keepList = new Array(); // keep list;
    		
    	<c:forEach items="${cntList}" var="cnt">
			clist.push(Number("${cnt}"));
		</c:forEach>
		
    	<c:forEach items="${itemList}" var="item">
			list.push("${item}");
		</c:forEach>
		
			$(document).ready(function() {	// 로또 하이차트 

				$(function () {
				    var chart = Highcharts.chart('container', {

				        title: {
				            text: '중복 번호 빈도'
				        },

				        xAxis: {
				            categories: list
				        },
				        
				        yAxis: {
				            title: {
				                text: 'Count'
				            }
				        },

				        series: [{
				        	name: '중복 횟수',
				        	type: 'column',
				            colorByPoint: true,
				            data: clist,
				            showInLegend: false
				        }]

				    });

			    $('#plain').click(function () {
				        chart.update({
				            chart: {
				                inverted: false,
				                polar: false
				            },
				            subtitle: {
				                text: 'Plain'
				            }
				        });
				    });

				    $('#inverted').click(function () {
				        chart.update({
				            chart: {
				                inverted: true,
				                polar: false
				            },
				            subtitle: {
				                text: 'Inverted'
				            }
				        });
				    });

				    $('#polar').click(function () {
				        chart.update({
				            chart: {
				                inverted: false,
				                polar: false
				            },
				            subtitle: {
				                text: 'Polar'
				            }
				        });
				    }); 
				});
			});
				
			
			function fn_CloseEvent(){	// 팝업창 종료
				window.close();
			}
			
			function fn_KeepEvent(){	// 로또 번호 저장 
				
				var comSubmit = new ComSubmit("frm");
				
				<c:forEach var="itemList" items="${itemList}" varStatus="status" begin="1" end="6">
					keepList.push("${itemList}");
					comSubmit.addParam("NUM_"+${status.index}+"",${itemList});
				</c:forEach>
				
				
				
				comSubmit.setUrl("<c:url value='/lotto/lottoKeep.do' />");
				comSubmit.addParam("NUM",keepList);
				comSubmit.submit();
					
			}
			
		</script>
</body>
</html>
