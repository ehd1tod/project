<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<Style>
	#new {width:900px; overflow:hidden; margin:0px auto;}
	.new {width:200px; float:left; margin-left:25px; margin-top:20px;}
	.pename, .pkname, .pbrand .plprice {width:150px; font-size:12px; font-weight:bold; padding:5px;}
</Style>
<div id="page">
	<div id="category">
		<div></div>
	</div>
	<h1>신상품</h1>
	<div id="new"></div>
	<jsp:include page="${category}"/>
	<script id="temp" type="text/x-handlebars-template">
	{{#each list}}
		<div class="new">
			<div><a href=""><img src="/display?fileName={{pimage}}" width=150></a></div>
			<div><p class="ellipsis pename">{{pename}}</p></div>
			<div><p class="ellipsis pkname">{{pkname}}</p></div>
			<div><p class="ellipsis pbrand">{{pbrand}}</p></div>
			<div><p class="ellipsis plprice">{{plprice}}</p></div>
		</div>
		{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("display", function(ssell){
		      return ssell.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		   });
	</script>
	<div class="pagination"></div>
</div>
<script>
	var page=1;
	var pcode='';
	
	getList();
	function getList(){
		$.ajax({
			type:"get",
			url:"/product/list3.json",
			data:{page:page},
			dataType:"json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#new").html(template(data));
				$(".pagination").html(getPagination(data));
			}
		});
	}
	
	$(".pagination").on("click", "a", function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getList();
	});
</script>