<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form name="frm" method="post">
	<table>
		<tr>
			<td width=100>아이디</td>
			<td width=300><input type="text" name="uid"></td>
		</tr>
		<tr>
			<td width=100>비밀번호</td>
			<td width=300><input type="password" name="upass"></td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">로그인</button></td>
		</tr>
	</table>
</form>
<script>
	$(frm).on("submit", function(e){
		e.preventDefault();
		var uid=$(frm.uid).val();
		var upass=$(frm.upass).val();
		
		$.ajax({
			type:"post",
			url: "/user/login",
			data:{uid:uid, upass:upass},
			success:function(data){
				if(data==0){
					alert("존재하지 않는 아이디입니다");
					$(frm.uid).focus();
					return;
				}else if(data==2){
					alert("비밀번호가 일치하지않습니다");
					$(frm.upass).focus();
					return;
				}else{
					var dest="${dest}";
					if(dest==null || dest==""){
						location.href="/";
					}else{
						location.href=dest;
					}
				}
			}
		});
	});
</script>