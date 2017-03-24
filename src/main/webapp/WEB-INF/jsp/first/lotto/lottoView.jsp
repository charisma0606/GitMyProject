<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
    <h2>LOTTO</h2>
	<form id="frm" name="frm">
		<table class="lotto_view">
			<colgroup>
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="20%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col"><input type='button' class='btn' value='LIST' onClick='fn_lottoList();'/></th>
					<th scope="col"><span>번</span></th>
					<th scope="col"><span>호</span></th>
					<th scope="col"><span>생</span></th>
					<th scope="col"><span>성</span></th>
					<th scope="col"><span>기</span></th>
					<th scope="col"><input type='button' class='btn' value='X 10'onClick='fn_NewEventAdd();' /></th>
					<th scope="col"><input type='button' class='btn' value='RESET' onClick='fn_ResetEvent();'/></th>
					<th scope="col"><span> 중복된 번호 선출 </span></th>
					<th scope="col"><input type='button' class='btn' value='선출하기' onClick='fn_PickEventNum();' /></th>
				</tr>
			</thead>

			<tbody id="lottoList"></tbody>

		</table>
		</form>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    
    				var obj = new Array();
    
					$(document).ready(function(e) {

						fn_NewEvent();

					});
	
					function fn_NewEvent() { // 동적 <tr> <td> 생성 

						var num = "";
						var str = "";
						
						

						str += "<tr>";
						for (var i = 0; i < 6; i++) {
							num = Math.floor(Math.random() * 45) + 1;
							str += "<td id='num' name='num'>" + num + "</td>";
							obj.push(num);
						}
						str += "<td><input type='button' class='btn' value='생성' onClick='fn_NewEvent();' /></td>";
						str += "</tr>";

						$("#lottoList").append(str);
					}

					function fn_NewEventAdd() { // 랜덤 번호 추첨 

						for (var i = 0; i < 10; i++) {
							fn_NewEvent();
						}
					}

					function fn_PickEventNum() {
						
						window.open("lottoPickNum_pop.do?obj="+obj+"", "","width=810,height=800,status=yes,resizable=no,scrollbars=yes");

					}
					
					function fn_ResetEvent(){ // reset 
						location.reload();
					}
					
					function fn_lottoList(){  // 로또 리스트 출력 
						var comSubmit = new ComSubmit();
						comSubmit.setUrl("<c:url value='/lotto/lottoListOpen.do' />");
						comSubmit.submit();
						
					}
					
					
				</script> 
</body>
</html>
