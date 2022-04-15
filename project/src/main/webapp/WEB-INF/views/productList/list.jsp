<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="page">
	<h1 >상품리스트</h1>
	<div>
		<input type="text" placeholder="검색어" id="keyword">
		<input type="button" value="검색" id="search">
	</div>
	<table id="tbl" width="900"></table>
	<script id="temp" type="text/x-handlebars-template">
		
		{{#each list}}
			<tr >
				<td ><a onclick=location.href="/productList/read"><img src="/display?fileName={{pimage}}"></a></td>
				<td >{{pbrand}}</td>
				<td >{{pename}}</td>
				<td >{{pkname}}</td>
				<td >{{plprice}}</td>
			</tr>
		{{/each}}
	
	</script>
<div class="pagination"></div>
</div>

<script>
 	var page=1;
 	var keyword="";
 	
 	//검색어 엔터
	$("#keyword").on("keypress",function(e){
		if(e.keyCode==13) $("#search").click()
	});
	
	//검색클릭
	$("#search").on("click",function(){
		keyword=$("#keyword").val();
		page=1;
		getList();
	});
 	
	getList();
	function getList(){
		$.ajax({
			type:"get",
			url:"/productList/list.json",
			data:{page:page,keyword:keyword},
			dataType:"json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				$(".pagination").html(getPagination(data));
			}
			
		})
	}
	$(".pagination").on("click","a",function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getList();
	})
</script>